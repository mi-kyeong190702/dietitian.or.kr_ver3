package kda.admin.job;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.job.data.TBLJOB;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;


@Controller
public class AdminJobController extends KdaAbstractController{
	
	@Autowired
	AdminJobService adminJobService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/job/job.do")
	public String job(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/job/jobList.do";
	}
	
	@RequestMapping("djemals/job/jobList.do")
	public String jobList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminJobService.getJobListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "jobList.do");
		model.addAttribute("title", "취업설명회 예약신청");
		return "tiles:admin/job/job_list";
	}
	
	@RequestMapping("djemals/job/jobAction.do")
	public View jobAction(TBLJOB vo, HttpSession session, Model model ) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			//javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			//javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminJobService.deleteJob(vo.getTb_idx());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("jobList.do");
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/job/jobExcel.do")
	public View jobExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("jobExcel", userid, "취업설명회예약신청");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"tb_name","member_flag","tb_birth","tb_hp","tb_zip","tb_addr","tb_email","tb_date"}; //헤더 영문
		String header_k[]={"신청자","	회원구분","생년월일","연락처","우편번호","주소","이메일","신청일"}; //헤더 국문			
		list = adminJobService.excelJob();
		
		return new ExcelDown("jobExcel", header_k, header_e, list);
	}

}
