package kda.admin.monitor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.monitor.data.TBLNUTRITIONMONITOR;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.ExcelDown;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class AdminMonitorController extends KdaAbstractController{

	@Autowired
	private AdminMonitorService adminMonitorService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/monitor/monitor.do")
	public String monitor(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/monitor/monitorList.do";
	}
	
	@RequestMapping("djemals/monitor/monitorList.do")
	public String monitorList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminMonitorService.getMonitorListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "monitorList.do");
		model.addAttribute("title", "국민영양 모니터 관리");
		return "tiles:admin/monitor/monitor_list";
	}
	
	@RequestMapping("djemals/monitor/monitorForm.do")
	public String monitorForm(@RequestParam (required=false, defaultValue="") String mcode
			,HttpServletRequest request, Model model) throws Exception {
		
		TBLNUTRITIONMONITOR monitor = null;
		List<Map<String, Object>> list = null;
		
		if("".equals(mcode)) {
			monitor = new TBLNUTRITIONMONITOR();
			monitor.setCrud(CRUDValue.C);
		}else {
			monitor = adminMonitorService.getMonitor(mcode);
			monitor.setCrud(CRUDValue.U);
			
			list = adminMonitorService.excelMonitor(mcode);
			monitor.setM_tel(list.get(0).get("m_tel").toString());
			model.addAttribute("monitor", monitor);
		}
		
		model.addAttribute("url", "monitorList.do");
		model.addAttribute("title", "국민영양 모니터 관리");
		return "tiles:admin/monitor/monitor_form";
	}
	
	@RequestMapping("djemals/monitor/monitorPrint.do")
	public String monitorPrint(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="") String mcode) throws Exception {
		TBLNUTRITIONMONITOR monitor = null;
		
		monitor = adminMonitorService.getMonitor(mcode);
		model.addAttribute("monitor", monitor);
		
		return "/djemals/monitor/monitor_print";
	}
	
	@RequestMapping("djemals/monitor/monitorExcel.do")
	public View monitorExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam (required=false, defaultValue="") String mcode) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("monitorExcel", userid, "국민영양 모니터 관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"m_name","m_post","m_addr","m_tel","indate","s_gubun01_01","s_text01_01","s_gubun01_02","s_text01_02","s_gubun01_03","s_text01_03","s_gubun02_01","s_text02_01","s_gubun02_02","s_text02_02","s_gubun02_03","s_text02_03","s_text03_01"}; //헤더 영문
		String header_k[]={"성명","우편번호","주소","연락처","등록일","유익컬럼 선택1","유익컬럼 이유1","유익컬럼 선택2","유익컬럼 이유2","유익컬럼 선택3","유익컬럼 이유3","아쉬운컬럼 선택1","아쉬운컬럼 이유1","아쉬운컬럼 선택2","아쉬운컬럼 이유2","아쉬운컬럼 선택3","아쉬운컬럼 이유3","다루었으면 하는 내용"}; //헤더 국문			
		list = adminMonitorService.excelMonitor(mcode);
		
		return new ExcelDown("monitorExcel", header_k, header_e, list);
	}
	
	
}
