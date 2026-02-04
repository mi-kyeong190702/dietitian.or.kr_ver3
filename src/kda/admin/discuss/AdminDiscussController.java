package kda.admin.discuss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.admin.discuss.data.PTBDEBATE;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;


@Controller
public class AdminDiscussController extends KdaAbstractController{
	
	@Autowired
	private AdminDiscussService adminDiscussService;
	
	@RequestMapping("djemals/discuss/discuss.do")
	public String discuss(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/discuss/discussList.do";
	}
	
	@RequestMapping("djemals/discuss/discussList.do")
	public String discussList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminDiscussService.getDiscussListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "discussList.do");
		model.addAttribute("title", "토론장 관리");		
		return "tiles:admin/discuss/discuss_list";
	}
	
	@RequestMapping("djemals/discuss/discussForm.do")
	public String discussForm(@RequestParam (required=false, defaultValue="0") int bateIndex
			,HttpServletRequest request, Model model) throws Exception { 
		
		PTBDEBATE discuss = null;
		
		if(bateIndex == 0){
			discuss = new PTBDEBATE();
			discuss.setCrud(CRUDValue.C);
		}else {
			discuss = adminDiscussService.getDiscuss(bateIndex);
			discuss.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("discuss", discuss);
		
		model.addAttribute("url", "discussList.do");
		model.addAttribute("title", "토론장 관리");
		return "tiles:admin/discuss/discuss_form";
		
	}
	
	@RequestMapping("djemals/discuss/discussAction.do")
	public View discussAction(PTBDEBATE vo, HttpSession session, Model model ) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			adminDiscussService.insertDiscuss(vo.getBateSubject());
			javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			adminDiscussService.updateDiscuss(vo.getBateIndex(), vo.getBateSubject());
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminDiscussService.deleteDiscuss(vo.getBateIndex());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("discussList.do");
		return new JavaScriptView(javaScript);
	}

}
