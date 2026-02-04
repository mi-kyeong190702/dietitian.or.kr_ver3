package kda.board;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.board.data.QNABOARD;
import kda.common.data.LIST_HELPER;
import kda.login.data.LOGININFO;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class QNABoardController extends KdaAbstractController {

	private Log log = LogFactory.getLog(QNABoardController.class);

	@Autowired
	private QNAService qnaService;
	
	@RequestMapping("{menu}/qna_board/{kind}.do")
	public String list( @PathVariable String menu, @PathVariable String kind, 
			HttpServletRequest request, Model model, HttpSession session) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = qnaService.getQNAListHelper(listHelper);
		
		
		model.addAttribute("listHelper", listHelper);		
		model.addAttribute("kind", kind);
		
		return "tiles:board/" + menu + "/" +  kind + "/list" ;
	}
	
	@RequestMapping("{menu}/qna_board/{kind}_view.do")
	public String view( @PathVariable String menu, @PathVariable String kind,
			@RequestParam ( required=true, defaultValue="") String passwd,
			@RequestParam int bbs_idx, HttpSession session , Model model ) throws Exception {
		
		setDefaultModel(session, model);
		
		QNABOARD qna = qnaService.getQNA(bbs_idx);
		if( "0".equals(qna.getBbs_pub()) ) {
			if( !isAdmin(session) ) {
				if( !passwd.equals(qna.getBbs_pwd()) ) {
					return getHistoryBackPage("비밀번호가 올바르지 않습니다", model);
				}
			}
		}
		qnaService.updateBbsView(bbs_idx);
		
		model.addAttribute("kind", kind);
		model.addAttribute("qna", qna);
		return  "tiles:board/" + menu + "/" +  kind + "/view" ;
	}
	
	@RequestMapping("{menu}/qna_board/{kind}_form.do")
	public String form( @PathVariable String menu, @PathVariable String kind,
			@RequestParam (required=true, defaultValue="") String bbs_pwd,
			@RequestParam (required=false, defaultValue="0") int bbs_idx, 
			HttpSession session , Model model ) throws Exception {
		QNABOARD qna = null;
		if( bbs_idx == 0 ) {
			qna = new QNABOARD();
			qna.setCrud(CRUDValue.C);
		} else {
			
			qna = qnaService.getQNA(bbs_idx);
			if( !isAdmin(session) ) {
				if( !bbs_pwd.equals(qna.getBbs_pwd()) ) {
					return getHistoryBackPage("비밀번호가 올바르지 않습니다", model);
				}
			}
				
			qna.setCrud(CRUDValue.U);
		} 
		model.addAttribute("kind", kind);
		model.addAttribute("qna", qna);
		return  "tiles:board/" + menu + "/" +  kind + "/form" ;
	}
	
	@RequestMapping("{menu}/qna_board/{kind}_answer.do")
	public String answer( @PathVariable String menu, @PathVariable String kind, QNABOARD qnaboard,
			Model model, HttpSession session) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackPage("답변할 권한이 없습니다.", model);
		}
		qnaboard = qnaService.getQNA(qnaboard.getBbs_idx());
		qnaboard.setCrud(CRUDValue.A);
		model.addAttribute("qna", qnaboard);
		model.addAttribute("kind", kind);
		
		return  "tiles:board/" + menu + "/" +  kind + "/answer" ;
	}
	
	@RequestMapping("{menu}/qna_board/{kind}_action.do")
	public View action(@PathVariable String menu, @PathVariable String kind, 
			QNABOARD qnaboard, Model model, HttpSession session) throws Exception {
		if( checkLogin(session) ) {
			LOGININFO logininfo = getUserInfo(session);
			qnaboard.setBbs_user_id( logininfo.getUser_id() );
		} else {
			qnaboard.setBbs_user_id("");
		}
		
		JavaScript javaScript = new JavaScript();
		switch(qnaboard.getCrud()) {
		case C:
			qnaService.insertQNA(qnaboard);
			javaScript.setMessage("입력되었습니다");
			javaScript.setLocation("./" + kind + ".do");
			break;
		case U:
			qnaService.updateQNA(qnaboard);
			javaScript.setMessage("수정되었습니다");
			javaScript.setLocation("./" + kind + ".do");
			break;
		case A:
			qnaService.updateReplyQNA(qnaboard);
			javaScript.setMessage("답변되었습니다");
			javaScript.setLocation("./" + kind + ".do");
			break;
		case D:
			QNABOARD qna = qnaService.getQNA(qnaboard.getBbs_idx());
			if( !isAdmin(session) ) {
				if( !qnaboard.getBbs_pwd().equals(qna.getBbs_pwd()) ) {
					return getHistoryBackView("비밀번호가 올바르지 않습니다");
				}
			}
			qnaService.deleteQNA(qnaboard.getBbs_idx());
			javaScript.setMessage("삭제되었습니다");
			javaScript.setLocation("./" + kind + ".do");
			break;
		}
		return new JavaScriptView(javaScript);
	}
}

