package kda.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.event.data.EventView;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;



@Controller
public class EventController extends KdaAbstractController{
		
	@Autowired
	EventService service;
	
	/**
	 * 회원정보 수정 Form
	 * (url : /kmp_member_info.do )
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	//@RequestMapping("event")	
	/*public String event(HttpSession session, Model model) throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );
		model.addAttribute("event" , dao.event(paramMap));
		return "event";
	}*/
	
	
	
	@RequestMapping("eventview")
	public String eventview(HttpSession session, Model model, HttpServletRequest request) throws Exception{
	/*public String event(HttpSession session, Model model) throws Exception {*/
		
		System.out.println("+++++++++++++++++++++++");
		//조회
		/*Object obj = service.get();
		
		model.addAttribute("obj", obj);*/
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		/*HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );*/
		String code_pers = getCodePers(session);
		
		System.out.println("code_pers  ---------------------->"+code_pers);
		
		EventView eventview = service.getMyEventview(code_pers);
		
		System.out.println("eventview  ---------------------->"+eventview);
		
		/*List<Map> certifiList = service.getMyCerifiList(code_pers);*/
		model.addAttribute("eventview" , eventview);
		
		
		return "eventview";
	}
	
	@RequestMapping("eventJobView")
	public String eventJobView(HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		String code_pers = getCodePers(session);
		EventView eventview = service.getMyEventview(code_pers);
		model.addAttribute("eventview" , eventview);
		
		return "eventJobView";
	}
	
	@RequestMapping("eventinsert")
	public View eventinsert( @ModelAttribute("eventview") EventView eventview
									, HttpServletResponse response
									, Model model) throws Exception {
		
		
		int result = 0;
		
		
		/*System.out.println("code_pers  ---------------------->"+eventview.getCode_pers());
		System.out.println("getCode_event  ---------------------->"+eventview.getCode_event());
		System.out.println("new_compname  ---------------------->"+eventview.getNew_compname());
		System.out.println("sns_domain  ---------------------->"+eventview.getSns_domain());*/
		
		//1:회원이 비회원 영양사를 신규 회원가입 추천하기, 2:SNS를 통한 우리 협회 회원가입 전파하기, 3:취업설명회 알리기 이벤트
		if ("1".equals(eventview.getCode_event())){
			result= service.eventinsert(eventview);
		
		}
		else{ 
			
			result = service.eventinsert_sns(eventview);
		}
		
		JavaScript javaScript = new JavaScript();
		if (result > 0){
			javaScript.setMessage("참여해 주셔서 감사합니다.");
			if("3".equals(eventview.getCode_event())) {
				javaScript.setLocation("eventJobView.do");
			}
			else {
				javaScript.setLocation("eventview.do");
			}
			
		} else {
			javaScript.setMessage("처리 중 오류가 발생하였습니다.");
			javaScript.setMethod("window.history.back()");
		}
		return new JavaScriptView(javaScript);
	}
		
	
	
	
}
