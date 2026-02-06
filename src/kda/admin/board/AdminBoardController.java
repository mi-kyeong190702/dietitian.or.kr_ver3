package kda.admin.board;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class AdminBoardController extends KdaAbstractController{
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	
	@RequestMapping("djemals/board/board.do")
	public String board(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/board/boardList.do";
	}
	
	@RequestMapping("djemals/board/boardList.do")
	public String boardList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminBoardService.getBoardListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		String[] levelName = { "","최고관리자", "중간관리자", "회원▲▲", "회원▲","회원","비회원" };
		String[] truefalse = { "False","True"};
		model.addAttribute("levelName", levelName);
		model.addAttribute("truefalse", truefalse);		
		
		model.addAttribute("url", "boardList.do");
		model.addAttribute("title", "게시판 관리");
		return "tiles:admin/board/board_list";
	}
	
	@RequestMapping("djemals/board/boardForm.do")
	public String boardForm(@RequestParam (required=false, defaultValue="") String bs_code
			,HttpServletRequest request, Model model) throws Exception {
		
		ADMINPAPERBOARDSETTINGS board = null;
		
		if("".equals(bs_code)) {
			board = new ADMINPAPERBOARDSETTINGS();
			board.setCrud(CRUDValue.C);
		}else {
			board = adminBoardService.getBoard(bs_code);
			board.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("board", board);
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("1","최고관리자");
		map.put("2","중간관리자");
		map.put("3","회원▲▲");
		map.put("4","회원▲");
		map.put("5","회원");
		map.put("6","비회원");
		
		LinkedHashMap<String, Object> map2 = new LinkedHashMap<String, Object>();
		
		for(int i=0;i<13;i++){
			map2.put(""+i, i);
		}
		
		model.addAttribute("levelName", map);
		model.addAttribute("menuIndex", map2);
		
		model.addAttribute("url", "boardList.do");
		model.addAttribute("title", "게시판 관리");
		return "tiles:admin/board/board_form";
	}
	
	@RequestMapping("djemals/board/boardAction.do")
	public View boardAction(ADMINPAPERBOARDSETTINGS vo, HttpSession session, Model model ) throws Exception {
		
			
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			adminBoardService.insertBoard(vo);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			adminBoardService.updateBoard(vo);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			
			//javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("boardList.do");
		return new JavaScriptView(javaScript);
	}
	

}
