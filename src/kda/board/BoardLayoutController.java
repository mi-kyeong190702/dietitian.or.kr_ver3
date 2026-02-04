package kda.board;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.board.data.BOARDPAGE;
import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDSETTINGS;
import kda.common.data.LIST_HELPER;
import kda.login.data.LOGININFO;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

@Controller
public class BoardLayoutController extends KdaAbstractController {
	
	private Log log = LogFactory.getLog(BoardLayoutController.class);
	
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	PaperBoardService paserBoardService;
	
	@Autowired
	BoardController boardController;
	
	@RequestMapping("{menu}/paper_board/{kind}.do")
	public String list( 
				@PathVariable String menu, @PathVariable String kind,
				@RequestParam(required=true, defaultValue="0") String bbs_board_code
								  , @RequestParam(required=false, defaultValue="0") String bbs_category
			  					  , @RequestParam(required=false, defaultValue="0") int board_search
			  					  , @RequestParam(required=false) String board_keyword			  														
			  					  , @RequestParam(required=false, defaultValue="1") int curPage
			  					  , @RequestParam(required=false) String g_userid
			  					  , HttpServletRequest request
			  					  , HttpSession session
			  					  , Model model) throws Exception {

		String order = null;
		// 국민영양 목차 검색시
		if( bbs_board_code.equals("13") )
			order = "bbs_option DESC";
				
		int boardCount = paserBoardService.count(bbs_board_code , bbs_category , board_search, board_keyword, g_userid);
		BOARDPAGE boardPage = new BOARDPAGE(curPage, boardCount);

		model.addAttribute("bbs_board_code", bbs_board_code);
		model.addAttribute("boardSearch"	, board_search);
		model.addAttribute("boardKeyword"	, board_keyword);
		model.addAttribute("boardCount"		, boardCount);
		model.addAttribute("boardList"		, paserBoardService.list(bbs_board_code 
															 , bbs_category
															 , order
															 , board_search
															 , board_keyword
															 , boardPage.getCurPage()
															 , g_userid));
		model.addAttribute("boardPage"		, boardPage);
		model.addAttribute("boardSettings"	, paserBoardService.settings(bbs_board_code));
		model.addAttribute("bbs_category"	, bbs_category);
	
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper.setTotalCount(boardCount);

		String temp_bbs_board_code = "";
		if ( bbs_board_code.split(",").length > 1  ){
			if( bbs_board_code.indexOf("69") >= 0 ){ //시도영양사회 공지사항 69~81 번호, 분류..
				temp_bbs_board_code = "69";
				model.addAttribute("bbs_board_code", 99999);
				
			} else if( bbs_board_code.indexOf("36") >= 0 ){ //시도영양사회 게시판 36~48 번호, 제목..
				temp_bbs_board_code = "36";
				model.addAttribute("bbs_board_code", 88888);
				//model.addAttribute("bbs_board_code", bbs_board_code);
			}
		} else { 
			temp_bbs_board_code = bbs_board_code;
			model.addAttribute("bbs_board_code", bbs_board_code);
		}
		
		
		model.addAttribute("kind", kind);
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("boardSettings"	, paserBoardService.settings(temp_bbs_board_code));
		model.addAttribute("g_isLogin", isAdmin(session));
		model.addAttribute("g_user_level", getUserLevel(session) );
		
		return "tiles:board/" + menu + "/" +  kind + "/list" ;
	}
	
	@RequestMapping("{menu}/paper_board/{kind}_view.do")
	public String paper_board_view(	
			@PathVariable String menu, @PathVariable String kind,
			@RequestParam(required=true, defaultValue="0") String bbs_board_code
								  , @RequestParam(required=false) int bbs_idx	
								  , HttpSession session
								  , Model model ) throws Exception {	
		
		setDefaultModel(session, model);
		
		PAPERBOARDSETTINGS  paperBoardSettings = paserBoardService.settings(bbs_board_code);
		if( getUserLevel(session) > paperBoardSettings.getBs_ViewLevel()  ) {
			return goLocation("조회 권한이 없습니다.", "/", model);
		}
	
		paserBoardService.update_view_count(bbs_idx);
		List<PAPERBOARD> list =  paserBoardService.select(bbs_idx, bbs_board_code);
		PAPERBOARD curBoard = null;
		for(PAPERBOARD board : list ) {
			if( board.getBbs_idx() == bbs_idx ) {
				if( board.getBbs_subject().indexOf("&lt;") >= 0 ||
					board.getBbs_subject().indexOf("<X-") >= 0	||
					KdaUtil.isHTML(board.getBbs_subject())) {
					board.setBbs_contents( board.getBbs_subject().replaceAll("&lt;", "<") );
					board.setBbs_contents( board.getBbs_subject().replaceAll("<X-", "<") );
					board.setBbs_html("on");
				}			
				// -- contents
				if( board.getBbs_contents().indexOf("&lt;") >= 0||
					board.getBbs_contents().indexOf("<X-") >= 0	||
					KdaUtil.isHTML(board.getBbs_contents())) {
					board.setBbs_contents( board.getBbs_contents().replaceAll("&lt;", "<") );
					board.setBbs_contents( board.getBbs_contents().replaceAll("<X-", "<") );
					board.setBbs_html("on");
				} else {
					board.setBbs_contents( board.getBbs_contents().replaceAll("\r\n", "<br>") );
				}
				curBoard = board;
				model.addAttribute("board",  board);
				model.addAttribute("boardComments",  paserBoardService.list_comments(board.getBbs_idx()));
			}
		}
		
		// BBS_M_NUMBER를 이용한 체크
		float curMNumber = curBoard.getBbs_m_number();
		for ( int i = 0; i < list.size(); i++ ) {
			PAPERBOARD tempBoard = list.get(i); 
			if( curMNumber != tempBoard.getBbs_m_number() )  {
				if( curMNumber < tempBoard.getBbs_m_number() ) {
					model.addAttribute("boardNext",  tempBoard);
				} else{
					model.addAttribute("boardPrev",  tempBoard);	
				}
			}
		}
		model.addAttribute("kind", kind);
		model.addAttribute("bbs_board_code", bbs_board_code);
		model.addAttribute("boardSettings" , paperBoardSettings );

		return "tiles:board/" + menu + "/" +  kind + "/view" ;
	}

	@RequestMapping("{menu}/paper_board/{kind}_form.do")	
	public String paper_board_form(
			@PathVariable String menu, @PathVariable String kind,
			@RequestParam String bbs_board_code,
			@RequestParam(required=false, defaultValue="0") int bbs_idx,
			HttpSession session, Model model ) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackPage("잘못된 접근입니다.", model);
		}
		LOGININFO admin = getUserInfo(session);
		PAPERBOARD paper = null;
		if( bbs_idx == 0  ) {
			paper = new PAPERBOARD();
			paper.setBoard_form("write");
			paper.setBbs_user_id( admin.getUser_id() );
			paper.setBbs_board_code(bbs_board_code);
		} else {
			paper = paserBoardService.selectIdx(bbs_idx);
			paper.setBbs_user_id(admin.getUser_id());
			paper.setBoard_form("update");
		}
	
		String listUrl = "/" + menu + "/paper_board/" + kind + ".do";
		model.addAttribute("listUrl", listUrl  );
		model.addAttribute("kind", kind);
		model.addAttribute("paper", paper);
		return "tiles:board/" + menu + "/" +  kind + "/form" ;
	}
	
	@RequestMapping("{menu}/paper_board/{kind}_action.do")	
	public View paper_board_write(  
			 @PathVariable String menu, @PathVariable String kind
			, @ModelAttribute("paperBoard") PAPERBOARD paperBoard
			, Model model , HttpServletRequest request) throws Exception {
		JavaScript javaScript = new JavaScript();
		
		String boardForm = KdaStringUtil.nullToString(paperBoard.getBoard_form());
		if( boardForm.equals("write") ) {
			javaScript.setMessage("입력 되었습니다.");
			boardController.paper_board_insert(paperBoard, model, (MultipartHttpServletRequest) request);
			
		} else if( boardForm.equals("update") ) {
			javaScript.setMessage("수정 되었습니다.");
			boardController.paper_board_update(paperBoard, model, (MultipartHttpServletRequest) request);
		} else if( boardForm.equals("delete") ) {
			javaScript.setMessage("삭제 되었습니다.");
			paserBoardService.delete(paperBoard.getBbs_idx());
		}
		javaScript.setLocation("/" + menu + "/paper_board/" + kind + ".do?bbs_board_code=" + paperBoard.getBbs_board_code() + "&g_userid=ekdldjxm_" );
		return new JavaScriptView(javaScript);
	}
	
}
