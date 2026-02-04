package kda.admin.stat;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.CommonService;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.ExcelDown;
import kda.utils.KdaStringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
public class AdminStatController extends KdaAbstractController {

	@Autowired
	private AdminStatService adminStatService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/stat/site.do")
	public String statSite(
			@RequestParam(required=false, defaultValue="1") String kind,
			@RequestParam(required=false, defaultValue="") String stDate,
			@RequestParam(required=false, defaultValue="") String endDate,
			Model model) throws Exception {

		if( KdaStringUtil.isEmpty(stDate) )
			stDate = KdaStringUtil.getTodayString("-");
		if( KdaStringUtil.isEmpty(endDate) )
			endDate = KdaStringUtil.getTodayString("-");
	
		if( endDate.compareTo(stDate) < 0 ) {
			endDate = stDate;
		}
		
		int toalHit = adminStatService.getTotalStat(kind, stDate, endDate);
		List<Map> logList = adminStatService.getStat(kind, stDate, endDate);
		
		model.addAttribute("logs", 		logList);
		model.addAttribute("total", 	toalHit);
		model.addAttribute("kind", 		kind);
		model.addAttribute("stDate", 	stDate);
		model.addAttribute("endDate", 	endDate);
		
		return "tiles:admin/stat/site";
	}
	
	@RequestMapping("djemals/stat/banner.do")
	public String statBanner(@RequestParam(required=false, defaultValue="1") String kind,
			@RequestParam(required=false, defaultValue="") String stDate,
			@RequestParam(required=false, defaultValue="") String endDate,
			@RequestParam(required=false, defaultValue="") String srch,
			Model model) throws Exception {
		if( KdaStringUtil.isEmpty(stDate) )
			stDate = KdaStringUtil.getTodayString("-");
		if( KdaStringUtil.isEmpty(endDate) )
			endDate = KdaStringUtil.getTodayString("-");
	
		if( endDate.compareTo(stDate) < 0 ) {
			endDate = stDate;
		}
		
		int toalHit = adminStatService.getTotalBannerStat(kind, stDate, endDate, srch);
		List<Map> logList = adminStatService.getBannerStat(kind, stDate, endDate, srch);
		
		model.addAttribute("logs", 		logList);
		model.addAttribute("total", 	toalHit);
		model.addAttribute("kind", 		kind);
		model.addAttribute("stDate", 	stDate);
		model.addAttribute("endDate", 	endDate);
		
		return "tiles:admin/stat/banner";
	}
	
	@RequestMapping("djemals/stat/member.do")
	public String statMember(@RequestParam(required=false, defaultValue="1") String kind,
			@RequestParam(required=false, defaultValue="") String stDate,
			@RequestParam(required=false, defaultValue="") String endDate,
			@RequestParam(required=false, defaultValue="") String srch,
			Model model) throws Exception {
		
		if( KdaStringUtil.isEmpty(stDate) )
			stDate = KdaStringUtil.getTodayString("-");
		if( KdaStringUtil.isEmpty(endDate) )
			endDate = KdaStringUtil.getTodayString("-");
	
		if( endDate.compareTo(stDate) < 0 ) {
			endDate = stDate;
		}
		if( !KdaStringUtil.isEmpty(srch) ) {
			int toalHit = adminStatService.getTotalMemberStat(kind, stDate, endDate, srch);
			List<Map> logList = adminStatService.getMemberStat(kind, stDate, endDate, srch);
			
			model.addAttribute("logs", 		logList);
			model.addAttribute("total", 	toalHit);
		}
		
		model.addAttribute("kind", 		kind);
		model.addAttribute("stDate", 	stDate);
		model.addAttribute("endDate", 	endDate);
		
		return "tiles:admin/stat/member";
	}
	
	@RequestMapping("djemals/stat/search_member_ajax")
	public @ResponseBody Map searchMemberAjax(@RequestParam String id) {
		Map member = null;
		try {
			member = adminStatService.searchMember(id, null);
		} catch(Exception e) {}
		return member;
	}
	
	@RequestMapping("djemals/stat/sinmungo.do")
	public String statSinmungo(@RequestParam(required=false, defaultValue="1") String kind,
			@RequestParam(required=false, defaultValue="") String stDate,
			@RequestParam(required=false, defaultValue="") String endDate,
			@RequestParam(required=false, defaultValue="") String srch,
			Model model) throws Exception {
		
		if( KdaStringUtil.isEmpty(stDate) )
			stDate = KdaStringUtil.getTodayString("-");
		if( KdaStringUtil.isEmpty(endDate) )
			endDate = KdaStringUtil.getTodayString("-");
	
		if( endDate.compareTo(stDate) < 0 ) {
			endDate = stDate;
		}
		System.out.println(stDate + " / " + endDate);
		int totalHit = adminStatService.getTotalSinmungoStat(kind, stDate, endDate, srch);
		List<Map> logList = adminStatService.getSinmungoStat(kind, stDate, endDate, srch);
		
		model.addAttribute("logs", 		logList);
		model.addAttribute("total", 	totalHit);
		model.addAttribute("kind", 		kind);
		model.addAttribute("stDate", 	stDate);
		model.addAttribute("endDate", 	endDate);
		
		return "tiles:admin/stat/sinmungo";
	}
	
	@RequestMapping("djemals/stat/sinmungoExcel.do")
	public View sinmungoExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("sinmungoExcel", userid, "신문고통계리스트");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={"num", "board_reg_date", "board_dept_com", "code_bran", "company_name", "detcodename", "board_dept", "board_handling"}; //헤더 영문
		String header_k[]={"번호", "날짜", "부서", "지역", "근무처", "근무처분류", "문의유형", "처리현황"}; //헤더 국문
		list = adminStatService.excelSinmungo();
	
		return new ExcelDown("sinmungoExcel", header_k, header_e, list);
		
	}
}

