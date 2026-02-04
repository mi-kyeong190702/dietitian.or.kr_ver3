package kda.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.data.GROUPCODE;
import kda.edu.data.CertPrint;
import kda.member.MemberDao;
import kda.member.data.MEMBER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;


import kda.utils.KdaStringUtil;
import kda.work.education.data.KE_EDU_OPERATOR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;



@Controller
public class CertPrintController extends KdaAbstractController{
		
	@Autowired
	CertPrintService service;
	
	@Autowired
	CertPrintDao dao;
	
	
	@RequestMapping("/edu/cert_print")
	public String certprintview(@RequestParam(required = false) String pers_name,
			                    @RequestParam(required = false) String pers_birth,
			                    @RequestParam(required = false) String pers_license,
			                    HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		System.out.println("+++++++++++++++++++++++");
		System.out.println("+++++++++++++++++++++++pers_name="+pers_name+";");
		System.out.println("+++++++++++++++++++++++pers_birth="+pers_birth+";");
		System.out.println("+++++++++++++++++++++++pers_license="+pers_license+";");
		System.out.println("+++++++++++++++++++++++");
		
		if(pers_name != null && !pers_name.equals("")){
			//수료증 출력을 위한 목록 조회  서비스 호출
			System.out.println("+++++++++++수료증 출력을 위한 목록 조회  서비스 호출++++++++++++");
			
			Map paramMap = new HashMap();
			paramMap.put("pers_name", pers_name);
			paramMap.put("pers_birth",pers_birth);
			paramMap.put("pers_license", pers_license);
				
			List<Map> CertPrint = service.getCertPrinttview(paramMap);
			
			model.addAttribute("CertPrint" , CertPrint);
			
			System.out.println("-----------수료증 출력을 위한 목록 조회  서비스 호출 끝 -----------"+CertPrint);
			
			
			
		}
		return "edu/cert_print";
	}
	
	
	@RequestMapping("/edu/docu_print_user")
	public String certprintuserview(@RequestParam(required = false) String gubun,
			                    @RequestParam(required = false) String print_kind,
			                    @RequestParam(required = false) String code_kind,
			                    @RequestParam(required = false) String detcode,
			                    @RequestParam(required = false) String doc_seq,
			                    HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		System.out.println("+++++++++++++++++++++++detcode =" + detcode);
		
		model.addAttribute("gubun"      , gubun);
		model.addAttribute("print_kind" , print_kind);
		model.addAttribute("code_kind"  , code_kind);
		model.addAttribute("detcode"    , detcode);
		model.addAttribute("doc_seq"    , doc_seq);
		
		return "edu/cert_print_user";
	}

}