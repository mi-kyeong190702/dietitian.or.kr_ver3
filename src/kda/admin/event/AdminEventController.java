package kda.admin.event;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.ExcelDown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;


@Controller
public class AdminEventController extends KdaAbstractController{
	
	@Autowired
	AdminEventService adminEventService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/event/plusOne.do")
	public String plusOne(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/event/plusOneList.do";
	}
	
	@RequestMapping("djemals/event/plusOneList.do")
	public String plusOneList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminEventService.getPlusOneListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "plusOneList.do");
		model.addAttribute("title", "협회 인(IN) 이벤트 관리");
		return "tiles:admin/event/plus_one_list";
	}
	
	@RequestMapping("djemals/event/sns.do")
	public String sns(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/event/snsList.do";
	}
	
	@RequestMapping("djemals/event/snsList.do")
	public String snsList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminEventService.getSnsListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "snsList.do");
		model.addAttribute("title", "협회 인(人) 이벤트 관리");
		return "tiles:admin/event/sns_list";
	}
	
	@RequestMapping("djemals/event/plusOneExcel.do")
	public View plusOneExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("plusOneExcel", userid, "협회 인(IN) 이벤트 관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"reg_date","detcodename","pers_name","lic_no","pers_hp","email","code_post","pers_add","company_name","new_name","new_tel","new_compname"}; //헤더 영문
		String header_k[]={"신청일","	회원구분","이름","면허번호","연락처","이메일","우편번호","주소","근무처명","신규가입자","신규연락처","신규근무처"}; //헤더 국문			
		list = adminEventService.excelPlusOne();
		
		return new ExcelDown("plusOneExcel", header_k, header_e, list);
	}
	
	@RequestMapping("djemals/event/snsExcel.do")
	public View snsExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("snsExcel", userid, "협회 인(人) 이벤트 관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"reg_date","detcodename","pers_name","lic_no","pers_hp","email","code_post","pers_add","company_name","sns_domain"}; //헤더 영문
		String header_k[]={"신청일","회원구분","이름","면허번호","연락처","이메일","우편번호","주소","근무처명","홍보도메인"}; //헤더 국문			
		list = adminEventService.excelSns();
		
		return new ExcelDown("snsExcel", header_k, header_e, list);
	}

}
