package kda.admin.fund;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.admin.fund.data.TBLFURN;
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
public class AdminFundController extends KdaAbstractController{
	
	@Autowired
	AdminFundService adminFundService;
	
	
	
	@RequestMapping("djemals/fund/fund.do")
	public String fund(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/fund/fundList.do";
	}
	
	@RequestMapping("djemals/fund/fundList.do")
	public String fundList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminFundService.getFundListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "fundList.do");
		model.addAttribute("title", "회관 건립기금");
		return "tiles:admin/fund/fund_list";
	}
	
	@RequestMapping("djemals/fund/fundAction.do")
	public View fundAction(TBLFURN vo, HttpSession session, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminFundService.deleteFund(vo.getFund_key());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("fundList.do");
		return new JavaScriptView(javaScript);
		
	}
	
	@RequestMapping("djemals/fund/fundraising.do")
	public String fundraising(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/fund/fundraisingList.do";
	}
	
	@RequestMapping("djemals/fund/fundraisingList.do")
	public String fundraisingList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminFundService.getFundraisingListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "fundraisingList.do");
		model.addAttribute("title", "출연금 모금");
		return "tiles:admin/fund/fundraising_list";
	}
	
	@RequestMapping("djemals/fund/fundraisingAction.do")
	public View fundraisingAction(TBLFURN vo, HttpSession session, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminFundService.deleteFundraising(vo.getFund_key());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("fundraisingList.do");
		return new JavaScriptView(javaScript);
		
	}
	
	@RequestMapping("djemals/fund/fundPrint.do")
	public String fundraisingPrint(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int fund_key,
			@RequestParam (required=false, defaultValue="") String fund_cd) throws Exception {

		if("fund".equals(fund_cd)){
			
			if(fund_key == 0){
				
			}else {
				TBLFURN vo = adminFundService.getFund(fund_key);
				model.addAttribute("fund", vo);
			}
			
			return "/djemals/fund/fund_print";
		}else{
			
			if(fund_key == 0){
				
			}else {
				TBLFURN vo = adminFundService.getFundraising(fund_key);
				model.addAttribute("fund", vo);
			}
			
			return "/djemals/fund/fundraising_print";
		}
		
	}

}
