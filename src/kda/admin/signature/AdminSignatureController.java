package kda.admin.signature;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.admin.discuss.data.PTBDEBATE;
import kda.admin.signature.data.TBLKNOU;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class AdminSignatureController extends KdaAbstractController{
	
	@Autowired
	AdminSignatureService adminSignatureService;
	
	@RequestMapping("djemals/signature/signature.do")
	public String signature(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/signature/signatureList.do";
	}
	
	@RequestMapping("djemals/signature/signatureList.do")
	public String signatureList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request,5);
		
		listHelper = adminSignatureService.getSignatureListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "signatureList.do");
		model.addAttribute("title", "방통대연대서명");
		return "tiles:admin/signature/signature_list";
	}
	
	@RequestMapping("djemals/signature/signatureAction.do")
	public View signatureAction(TBLKNOU vo, HttpSession session, Model model ) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminSignatureService.deleteSignature(vo.getKn_Code());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("signatureList.do");
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/signature/signaturePrint.do")
	public String signaturePrint(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int cPage) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request,5,cPage);
		
		listHelper = adminSignatureService.getSignatureListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		return "/djemals/signature/signature_print";
	}

}
