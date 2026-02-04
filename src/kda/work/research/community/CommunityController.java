package kda.work.research.community;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.WorkData;
import kda.board.PaperBoardService;
import kda.board.data.BOARDFILE;
import kda.board.data.PAPERBOARD;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaUtil;
import kda.utils.MailBean;
import kda.work.research.community.data.ACTULPAPERBOARD;
import kda.work.research.community.data.RESEARCHPAGE;
import kda.work.research.report.ReportService;
import kda.work.research.report.data.ACTULPERSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;


@Controller
public class CommunityController {
	
	private Log log = LogFactory.getLog(CommunityController.class);
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	PaperBoardService paserBoardService;
	
	@Autowired
	ReportService reportService;
	
	
	
	@RequestMapping("research_board_list")
	public String research_board_list(
			@RequestParam(required = true, defaultValue = "001") String bbs_cd,
			@RequestParam(required = false, defaultValue = "0") int board_search,
			@RequestParam(required = false) String board_keyword,
			@RequestParam(required = false, defaultValue = "1") int board_page,
			@RequestParam(required = false, defaultValue = "10") int board_cnt,
			Model model,
			HttpSession session) throws Exception{
		
		log.info("================================ CommunityController [research_board_list]");

		String redirect = "";
		RESEARCHPAGE researchpage = null;

		try {
			
			model.addAttribute("loginVo", session.getAttribute("loginVo"));

			int boardCount = communityService.getBoardCount(bbs_cd,
					board_search, board_keyword);

			log.info("================================ boardCount :"	+ boardCount);

			researchpage = new RESEARCHPAGE(board_page, boardCount, board_cnt);

			model.addAttribute("bbs_cd", bbs_cd);
			model.addAttribute("board_cnt", board_cnt);
			model.addAttribute("boardSearch", board_search);
			model.addAttribute("boardKeyword", board_keyword);
			model.addAttribute("boardCount", boardCount);
			model.addAttribute("boardList", communityService.boardList(bbs_cd,
					board_search, board_keyword, researchpage.getCurPage(),board_cnt));

			model.addAttribute("boardPage", researchpage);
			
			if("001".equals(bbs_cd)){
				model.addAttribute("imptCount", communityService.getImptCount(bbs_cd));
				model.addAttribute("imptList", communityService.imptList(bbs_cd));
			}

			redirect = "research_board_list";

		} catch (Exception e) {
			log.info(e);
			throw e;
		}

		return redirect;
	}
	
	
	@RequestMapping("research_board_view")
	public String research_board_view(	@RequestParam(required=true, defaultValue="0") String bbs_cd
								  , @RequestParam(required=false) int atc_sno
								  , @RequestParam(required=false) String bcd
								  , Model model
								  , HttpSession session
								  , HttpServletRequest request) throws Exception
	{	
		
		log.info("================================ CommunityController [research_board_view]");
		
		if(!"001".equals(bbs_cd) && !"002".equals(bbs_cd)){
			
			if(request.getMethod().equals("POST")){
				bbs_cd = bcd;
			}else{
				
				ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
				
				if(vo==null) return "/work/research/community/research_board_error";
				
				if(!"00".equals(vo.getPers_state()) && !"01".equals(vo.getPers_state())){
					return "/work/research/community/research_board_error";
				}
				
			}
			
		}
		
		String redirect = "";
		
		model.addAttribute("loginVo", session.getAttribute("loginVo"));
		
		List<ACTULPAPERBOARD> list = communityService.boardSelect(atc_sno,bbs_cd);
		List<ACTULPAPERBOARD> reply = communityService.replyList(atc_sno);
		
		model.addAttribute("replyRow",  reply);
		model.addAttribute("bbs_cd", bbs_cd);
		
		for(int i = 0; i < list.size(); i++){
			ACTULPAPERBOARD board = list.get(i);
			
			int atc_sno_temp = board.getAtc_sno();
			if( atc_sno_temp < atc_sno ){
				model.addAttribute("boardRowPrev",  board);
			}else if( atc_sno_temp == atc_sno ){
				if( board.getAtc_cn().indexOf("&lt;") >= 0 ){
					board.setAtc_cn( board.getAtc_cn().replaceAll("&lt;", "<") );
				}
				
				if( board.getAtc_cn().indexOf("<") == 0 ){
						board.setAtc_cn( board.getAtc_cn().replaceAll("\r\n", "<br>") );
				}
					
				model.addAttribute("boardRow",  board);
				
			}else{
				model.addAttribute("boardRowNext",  board);
			}
		}
		
		redirect = "research_board_view";
		
		return redirect;		
	}
	
	@RequestMapping("research_board_view_contents")
	public String research_board_view_contents(  @RequestParam(required=false) int atc_sno,@RequestParam(required=false) String bbs_cd																	
								  			, Model model ) throws Exception
	{	
		
		try{
			log.info("================================ CommunityController [research_board_view_contents]");
			
			ACTULPAPERBOARD board = communityService.getBoardSelect(atc_sno, bbs_cd);

			boolean isHTML = false;
			if( board.getAtc_cn().indexOf("&lt;") >= 0 ){
				board.setAtc_cn( board.getAtc_cn().replaceAll("&lt;", "<") );
				isHTML = true;
			}
			
			if ( board.getAtc_cn().indexOf("<X-") >= 0 ) {
				board.setAtc_cn( board.getAtc_cn().replaceAll("<X-", "<") );
				isHTML = true;
			}
			
			if ( KdaUtil.isHTML(board.getAtc_cn()))
				isHTML = true;
			
			if ( !isHTML )
				board.setAtc_cn( board.getAtc_cn().replaceAll("\r\n", "<br>") );
			
			model.addAttribute("boardRow",  board);

		} catch(Exception e){
			log.error("research_board_view_contents e :"+ e);
		}
	
		return "research_board_view_contents";		
	}
	
	@RequestMapping("research_board_delete")
	public String research_board_delete( @RequestParam(required=false) String bbs_cd
	  								, @RequestParam(required=false) int atc_sno
							  		, @RequestParam(required=false) int board_page
							  		, @RequestParam(required = false, defaultValue = "10") int board_cnt
				  					, Model model ) throws Exception
	{	
		log.info("================================ CommunityController [research_board_delete]");
		
		communityService.boardDelete(atc_sno);
		
		RESEARCHPAGE researchpage = null;
		
		int boardCount = communityService.getBoardCount(bbs_cd, 0, "");
		
		researchpage = new RESEARCHPAGE(board_page, boardCount, board_cnt);
		
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("boardList", communityService.boardList(bbs_cd,
				0, "", researchpage.getCurPage(),board_cnt));		
		model.addAttribute("boardPage", researchpage);
		model.addAttribute("bbs_cd", bbs_cd);
		model.addAttribute("board_cnt", board_cnt);
		
		return "research_board_list";
	}
	
	
	@RequestMapping("research_board_write")
	public String research_board_write(
			@RequestParam(required = true, defaultValue = "0") String bbs_cd,
			@RequestParam(required = false) int atc_sno,
			@RequestParam(required = false, defaultValue = "write") String board_form,
			Model model,
			HttpSession session) throws Exception{

		log.info("================================ CommunityController [research_board_write]");

		String redirect = "";

		try {
			
			model.addAttribute("loginVo", session.getAttribute("loginVo"));

			if ("modify".equals(board_form)) {
				
				ACTULPAPERBOARD vo = communityService.boardModify(atc_sno,bbs_cd);
				
				model.addAttribute("boardRow",vo);
				model.addAttribute("act", "modify");
			} else if("write".equals(board_form)){
				model.addAttribute("boardRow", new ACTULPAPERBOARD());
				model.addAttribute("act", "write");
			} else if("reply".equals(board_form)){
				model.addAttribute("boardRow", new ACTULPAPERBOARD());
				model.addAttribute("act", "reply");
			}
			
			model.addAttribute("bbs_cd", bbs_cd);
			model.addAttribute("board_form", board_form);
			model.addAttribute("getEmail", reportService.getEmail());

			redirect = "research_board_write";

		} catch (Exception e) {
			log.info(e);
			throw e;
		}

		return redirect;
	}
	
	@RequestMapping("research_board_update")
	public String research_board_update( @ModelAttribute("actulpaperboard") ACTULPAPERBOARD actulpaperboard
									, @RequestParam(required = true, defaultValue = "0") String bbs_cd
									, Model model
									, HttpServletRequest request) throws Exception 
	{
		
		log.info("================================ CommunityController [research_board_update]");
		
		String tel = "";		
		
		tel = actulpaperboard.getTel1()+"-"+actulpaperboard.getTel2()+"-"+actulpaperboard.getTel3();
		
		actulpaperboard.setAtc_wrtr_cttno(tel);
		actulpaperboard.setAtc_wrtr_eml(actulpaperboard.getMail1());
		actulpaperboard.setAtc_wrtr_eml2(actulpaperboard.getMail2());
		
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		String filePath = WorkData.ROOT;		
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);
		
		BOARDFILE bbs_file1 = this.getBoardFile( multipartRequest, "bbs_file1", 1 ,bbs_cd);
		
		if(bbs_file1!=null){
			this.delBoardFiles(actulpaperboard, bbs_file1,  realPath);
			this.setBoardFiles(actulpaperboard, bbs_file1);
			
			communityService.fileUpdate(actulpaperboard);
			
		}else{
			
			if("Y".equals(actulpaperboard.getFile_yn())){
				
				this.delBoardFiles(actulpaperboard, bbs_file1,  realPath);
				actulpaperboard.setBbs_file_name("");
				actulpaperboard.setBbs_file_url("");
				actulpaperboard.setBbs_file_type("");
				actulpaperboard.setBbs_file_size(0);
				
				communityService.fileUpdate(actulpaperboard);
			}
		}
		
		communityService.boardUpdate(actulpaperboard);
		
		return "research_board_write_ok";
	}
	
	@RequestMapping("research_board_insert")
	public String research_board_insert( @ModelAttribute("actulpaperboard") ACTULPAPERBOARD actulpaperboard
									, @RequestParam(required = false, defaultValue = "write") String board_form
									, @RequestParam(required = true, defaultValue = "0") String bbs_cd
									, Model model
									, HttpServletRequest request) throws Exception
	{	
		log.info("================================ CommunityController [research_board_insert]");
		
		if("write".equals(board_form)){
			actulpaperboard.setAtc_rgt_se("OR");
			if("001".equals(bbs_cd) || "002".equals(bbs_cd)){
				actulpaperboard.setAtc_ans_stt_se("NA");
			}else if("003".equals(bbs_cd) || "004".equals(bbs_cd) || "005".equals(bbs_cd)){
				actulpaperboard.setAtc_ans_stt_se("AN");
			}
		}else if("reply".equals(board_form)){
			actulpaperboard.setAtc_rgt_se("RP");
			actulpaperboard.setAtc_ans_stt_se("AD");
		}
		
		if(actulpaperboard.getLic_no()==null || actulpaperboard.getLic_no()==""){
			actulpaperboard.setLic_no("000000");
			actulpaperboard.setLic_print_dt("00000000");
		}
		
		String tel = "";		
		
		tel = actulpaperboard.getTel1()+"-"+actulpaperboard.getTel2()+"-"+actulpaperboard.getTel3();
		
		actulpaperboard.setAtc_wrtr_cttno(tel);
		actulpaperboard.setAtc_wrtr_eml(actulpaperboard.getMail1());
		actulpaperboard.setAtc_wrtr_eml2(actulpaperboard.getMail2());
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		BOARDFILE bbs_file1 = this.getBoardFile( multipartRequest, "bbs_file1", 1 , bbs_cd);		
		
		this.setBoardFiles(actulpaperboard, bbs_file1);
		
		actulpaperboard.setAtc_wrtr_ip(request.getRemoteAddr());
		
		communityService.boardInsert(actulpaperboard);
		
		if("reply".equals(board_form)){
			ACTULPAPERBOARD vo = communityService.getMail(actulpaperboard.getRlt_atc_sno());
			
			String toEmail = vo.getAtc_wrtr_eml()+"@"+vo.getAtc_wrtr_eml2();
			
			MailBean mailBean = new MailBean();
			
			String title = "";
			String toName = vo.getAtc_wrtr_nm();
			
			if("003".equals(bbs_cd)){
				title = "문의하기 건";
			}else if("004".equals(bbs_cd)){
				title = "면허정보등록 건";
			}else if("005".equals(bbs_cd)){
				title = "보수교육 미대상자 건";
			}
			
			String from		 = "center@dietitian.or.kr";
			String fromName	 = "대한영양사협회";
			
			String mailTitle = "대한영양사협회 영양사 실태신고센터입니다.";
			String mailBody  =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>";
			mailBody +=	"안녕하십니까<br/>대한영양사협회 영양사 실태신고센터입니다.<br/><br/>";
			mailBody +=	toName+" 님의  "+title+ "에 대한 답변이 완료되었습니다.<br/><br/>";
			mailBody +=	"감사합니다.<br/>";
			mailBody +=	"안녕히 계십시오.<br/>";
			
			mailBean.sendMail(from,fromName,toEmail, mailTitle, mailBody);
			
		}
		
		return "research_board_write_ok";
	}
	
	
	private BOARDFILE getBoardFile( MultipartHttpServletRequest multipartRequest, String name, int index, String bbs_code ) throws Exception
	{
		log.info("getBoardFile-------------------------------- : " + name);
		
		SimpleDateFormat formatter  = new SimpleDateFormat("yyyyMMddHHmm");
		Date date = new Date();
		
		String filePath = WorkData.UPLOAD;
		
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);		
		String bbs_barod_code = multipartRequest.getParameter("bbs_cd");
		
		// board_cod set real path
		filePath += bbs_barod_code;
		realPath += "/" + bbs_barod_code;		
		
		FileOutputStream fos = null;		
		BOARDFILE boardFile = null;	
		String fileName = "";
		
		if(realPath.indexOf("../") >=0){
			return boardFile;
		}
		File dir = new File(realPath); 
		if ( !dir.isDirectory() )
			dir.mkdir();
						
		
		try
		{		
			MultipartFile multipartFile = multipartRequest.getFile (name);
			
			if(!multipartFile.getOriginalFilename().equals(""))
			{
				String orgFileName = multipartFile.getOriginalFilename();
				if(orgFileName.endsWith(".wmv")){
					return boardFile;
				}
				boardFile = new BOARDFILE();
				
				// -- 해당 파일은 확장자를 붙여 준다 as-is 기준
				fileName = multipartRequest.getSession().getId() + "_" +  formatter.format(date) + "_" + index;					
				
				String ext = "";
				String [] exts = multipartFile.getOriginalFilename().split("\\.");
				
				if ( exts.length > 0 )
				{
					ext = exts[ exts.length - 1].toLowerCase();
					
					String check = "jpg,jpeg,gif,bmp,png,swf,tiff,tif,mpg,mpeg,avi,asf,wma,wmv,rm,ra,mp3,xls,xlsx,hwp,pdf";
					if ( check.indexOf(ext) >= 0 )
						fileName += "." + ext;
				}
				
				// file name [ session_noewdate ]
				boardFile.setBbs_file_name(orgFileName);
				boardFile.setBbs_file_size(multipartFile.getSize());
				boardFile.setBbs_file_url(filePath + "/" + fileName); 
				boardFile.setBbs_file_type(ext);
				
				
				byte[] fileData = multipartFile.getBytes();
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				fos = new FileOutputStream(realPath + "/" + fileName);					
				fos.write(fileData);
				
				log.info("********************** [FILE][" + name + "]");
				log.info("FILE_NAME      : " + fileName);
				log.info("FILE_NAME_ORG  : " + orgFileName);
				log.info("FILE_SIZE      : " + boardFile.getBbs_file_size());
				log.info("FILE_URL       : " + boardFile.getBbs_file_url());					
				log.info("FILE_SAVE_PATH : " + realPath);
				log.info("********************** [FILE][" + name + "]");					
			}
	
		} catch(FileNotFoundException fe) {
			log.info("file upload error!",fe);
		} catch(Exception e) {
			
			log.info("file upload error!",e);
					
			if ( boardFile != null )
			{
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				File uploadFile = new File(realPath+"/"+fileName);
				if(uploadFile != null)
					uploadFile.delete();
			}
			throw e;
			
		}finally{
			try{
				if(fos != null) fos.close();
			}catch(Exception e){
				log.info("file upload error!",e);					
			}
		}		
		return boardFile;
	}
	
	private void delBoardFiles(ACTULPAPERBOARD actulpaperboard,
			BOARDFILE boardFile1, String realPath) throws Exception{
		
		// -- update file delete
		File deleteFile = null;

		String bbs_file_url = actulpaperboard.getBbs_file_url();
		
		if (bbs_file_url != null && !bbs_file_url.equals("")) {
			deleteFile = new File(realPath + "/" + bbs_file_url);
			if (deleteFile.isFile())
				deleteFile.delete();
		}

	}

	private void setBoardFiles(ACTULPAPERBOARD actulpaperboard,
			BOARDFILE boardFile1) throws Exception{

		if (boardFile1 != null) {
			actulpaperboard.setBbs_file_name(boardFile1.getBbs_file_name());
			actulpaperboard.setBbs_file_url(boardFile1.getBbs_file_url());
			actulpaperboard.setBbs_file_type(boardFile1.getBbs_file_type());
			actulpaperboard.setBbs_file_size(boardFile1.getBbs_file_size());
		}

	}
	
	@RequestMapping("research_file_download")
	public View research_file_download( HttpServletRequest request
								   , HttpServletResponse response
								   , Model model
								   ) throws Exception
	{
		
		log.info("================================ CommunityController [research_file_download]");
		
		String sno = request.getParameter("atc_sno");
		int atc_sno = Integer.parseInt(sno);
		String bbs_cd = request.getParameter("bbs_cd");
		
		log.info("================================ "+bbs_cd);
		log.info("================================ "+atc_sno);
		
		JavaScript javaScript = new JavaScript();
		if( atc_sno == 0  ) {
			javaScript.setMessage("올바른 첨부파일 번호가 아닙니다");
			javaScript.setLocation("");
			return new JavaScriptView(javaScript);
		}
		
		ACTULPAPERBOARD board = communityService.getBoardSelect(atc_sno, bbs_cd);
		String fileUrl = "";
		String fileName = "";
		
		fileUrl = board.getBbs_file_url();
		fileName = board.getBbs_file_name();
		
		return new DownLoadView( fileUrl, fileName );

	}
	
	
	@RequestMapping("authCheck")
	public void authCheck( HttpServletResponse response
			,@RequestParam(required = false) String pass,@RequestParam(required = false) int atc_sno
			,@RequestParam(required = false) String btn_cd
								, Model model) throws UnsupportedEncodingException, Exception
	{
	
		try {
		String result ="fail";
		ACTULPAPERBOARD vo = communityService.authCheck(pass, atc_sno);
		
		
		if("Y".equals(vo.getPwchk())){
			result = "success="+atc_sno+"="+btn_cd;
		}
		
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(result);
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    	throw e;
	    }
	}
	
	@RequestMapping(value="mainBoard" , method = RequestMethod.GET)
	public void mainBoard(HttpServletResponse response, Model model) throws Exception{
		
		log.info("================================ mainBoard");
		
		try {
			
			List<ACTULPAPERBOARD> list= communityService.mainBoard();
			
			String list1 = "<ul id='list1'>";
			String list2 = "<ul id='list2' style='display:none'>";
			String list3 = "<ul id='list3' style='display:none'>";
			
			for(ACTULPAPERBOARD row:list){
				int atc_sno = row.getAtc_sno();
				String bbs_cd = row.getBbs_cd();
				
				String func = "javascript:doClickBoard(" + atc_sno + ",\"" + bbs_cd +"\")";
				
				if("001".equals(bbs_cd)){
					list1 +="<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" + row.getAtc_sbj() + "</nobr></div></a></li>";
				}else if("002".equals(bbs_cd)){
					list2 +="<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" + row.getAtc_sbj() + "</nobr></div></a></li>";
				}else if("003".equals(bbs_cd)){
					list3 +="<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" + row.getAtc_sbj() + "</nobr></div></a></li>";
				}
			}
			
			list1 += "</ul>";		
			list2 += "</ul>";		
			list3 += "</ul>";	
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(list1 + list2 + list3);
			
		} catch (Exception e) {
			log.info("Exception : " + e.toString());
			throw e;
		}
		
	}
	
}
