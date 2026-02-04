package kda.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import kda.board.data.FAQ;
import kda.login.data.LOGININFO;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class FaqController extends KdaAbstractController {

	@Autowired
	private Faqservice faqService;
	

	@RequestMapping("{menu}/faq/faq_list.do")
	public String faqList(@PathVariable("menu") String menu, @RequestParam (required=true, defaultValue="1") int faq_category,
			HttpSession session, Model model ) throws Exception {
		
		
		List<FAQ> faqList = faqService.getFaqList(faq_category);
		
	
		model.addAttribute("faqList", faqList);
		model.addAttribute("faq_category", faq_category);
		model.addAttribute("isAdmin",  isAdmin(session) );
		
		return "tiles:faq/" + menu + "/faq_list";
	}
	
	
	
	@RequestMapping("{menu}/faq/faq_form.do")
	public String faqForm(@PathVariable("menu") String menu,
			@RequestParam (required=false, defaultValue="1") int faq_category,
			@RequestParam (required=false, defaultValue="0" ) int idx, 
			HttpSession session, Model model ) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackPage("잘못된 접근입니다.", model);
		}
		
		LOGININFO admin = getUserInfo(session);
		
		if( admin == null ) {
			return getHistoryBackPage("관리자만 사용 가능합니다.", model);
		}
		
		FAQ faq = null;
		if( idx == 0  ) {
			faq = new FAQ();
			faq.setCrud(CRUDValue.C);
		} else {
			faq = faqService.getFaq(idx);
			faq.setCrud(CRUDValue.U);
		}
		faq.setFaq_category(faq_category);

		model.addAttribute("faq_category", faq_category);
		model.addAttribute("faq", faq);
		return "tiles:faq/" + menu + "/faq_form";
	}
	
	
	
	@RequestMapping("{menu}/faq/action.do")
	public View faqAction( FAQ faq, Model model, HttpSession session ) 
			throws Exception {
		JavaScript javaScript = new JavaScript();
		if( !isAdmin(session) ) {
			return getHistoryBackView("잘못된 접근입니다.");
		}
 		
		LOGININFO admin = getUserInfo(session);
		faq.setUser_id(admin.getUser_id());
		
		switch(faq.getCrud()) {
		case C:
			faqService.insertFaq(faq);
			javaScript.setMessage("저장 되었습니다");
			break;
		case U:
			faqService.updateFaq(faq);
			javaScript.setMessage("저장 되었습니다");
			break;
		case D:
			faqService.deleteFaq(faq.getIdx());
			javaScript.setMessage("삭제 되었습니다");
			
			break;
		}
		javaScript.setLocation("faq_list.do?faq_category=" + faq.getFaq_category());
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("work/{menu}/faq/faq_list.do")
	public String workFaqList(@PathVariable("menu") String menu, @RequestParam (required=true, defaultValue="1") int faq_category,
			HttpSession session, Model model) throws Exception {
		faqList(menu, faq_category, session, model);	
		return "tiles:faq/work/" + menu + "/faq_list";
	}
	
	@RequestMapping("work/{menu}/faq/faq_form.do")
	public String  worFaqForm(@PathVariable("menu") String menu,
			@RequestParam (required=false, defaultValue="1") int faq_category,
			@RequestParam (required=false, defaultValue="0" ) int idx, 
			HttpSession session, Model model ) throws Exception {
		faqForm(menu, faq_category, idx, session, model);
		return "tiles:faq/work/" + menu + "/faq_form";
	}
	
	@RequestMapping("work/{menu}/faq/action.do")
	public View workFaqAction( FAQ faq, Model model, HttpSession session ) 
			throws Exception {
		return faqAction(faq, model, session);
	}

}

