package kda.admin.consult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.admin.consult.data.PTBCONSULTUSERID;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;


@Controller
public class AdminConsultController extends KdaAbstractController{
	
	@Autowired
	AdminConsultService adminConsultService;

	@RequestMapping("djemals/consult/consult.do")
	public String consult(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/consult/consultList.do";
	}
	
	@RequestMapping("djemals/consult/consultList.do")
	public String consultList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminConsultService.getConsultListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "consultList.do");
		model.addAttribute("title", "Q&A 게시판상담원관리");
		return "tiles:admin/consult/consult_list";
	}
	
	@RequestMapping("djemals/consult/consultAction.do")
	public View consultAction(PTBCONSULTUSERID vo, HttpSession session, Model model ) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			String msg = ""; 
			msg = adminConsultService.insertConsult(vo.getCuserId(),vo.getCuserName());
			javaScript.setMessage(msg);
			break;
		case U:
			//javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminConsultService.deleteConsult(vo.getCuserId());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("consultList.do");
		return new JavaScriptView(javaScript);
	}
	
}
