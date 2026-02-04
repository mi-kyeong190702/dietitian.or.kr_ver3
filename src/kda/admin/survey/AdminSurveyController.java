package kda.admin.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kda.admin.survey.data.SURVEY_MAIN;
import kda.admin.survey.data.SURVEY_RESPONSE;
import kda.admin.survey.data.SURVEY_SUBJECT;
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
public class AdminSurveyController extends KdaAbstractController {
	
	@Autowired
	private AdminSurveyService adminSurveyService;
	
	@RequestMapping("djemals/survey/list.do")
	public String surveyList(HttpServletRequest request, Model model) throws Exception { 
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = adminSurveyService.getSurveySubjectList(listHelper);
		
		List<SURVEY_MAIN> mainList = adminSurveyService.getSurveyMain(null);
		
		model.addAttribute("mainList", mainList);
		model.addAttribute("listHelper", listHelper);
		return "tiles:admin/survey/list";
	}
	
	@RequestMapping("djemals/survey/result.do")
	public String surveyResult(@RequestParam int tms_idx, Model model) throws Exception {
		Map paramMap = new HashMap();
		paramMap.put("tms_idx",tms_idx);
		
		SURVEY_SUBJECT subject = adminSurveyService.getSurveySubject(paramMap);
		
		int resTotalCount = adminSurveyService.getSurveyResCount(paramMap);
		List<SURVEY_RESPONSE> resList = adminSurveyService.getSurveyResList(paramMap);
		List<SURVEY_RESPONSE> resEtcList = adminSurveyService.getSurveyResEtcList(paramMap);
		
		model.addAttribute("subject", subject);
		model.addAttribute("resTotalCount", resTotalCount);
		model.addAttribute("resList", resList);
		model.addAttribute("resEtcList", resEtcList);
		
		return "tiles:admin/survey/result";
		
	}
	
	@RequestMapping("djemals/survey/form.do")
	public String surveyForm(SURVEY_SUBJECT subject, Model model) throws Exception {
		List<SURVEY_MAIN> mainList = adminSurveyService.getSurveyMain(null);
		if( subject == null ) {
			subject = new SURVEY_SUBJECT();
		}
		subject.setCrud(CRUDValue.C);
		subject.setTmc_titles(null);
		
		model.addAttribute("mainList", mainList);
		model.addAttribute("subject", subject);
		return "tiles:admin/survey/form";
	}
	
	@RequestMapping("djemals/survey/action.do")
	public View surveyAction(SURVEY_SUBJECT subject, Model model) throws Exception {
		
		switch(subject.getCrud()) {	
		case C:
			adminSurveyService.insertSubject(subject);
			break;
		case D:
			adminSurveyService.deleteSubject(subject);
			break;
		}
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("처리되었습니다");
		javaScript.setLocation("list.do?mainTmsCnt=" + subject.getTms_cnt());
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/survey/mainAction.do")
	public View surveyMainAction(SURVEY_SUBJECT subject, Model model) throws Exception {
		
		
		adminSurveyService.insertMain(subject);
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("저장 되었습니다");
		javaScript.setLocation("form.do");
		return new JavaScriptView(javaScript);
	}

}
