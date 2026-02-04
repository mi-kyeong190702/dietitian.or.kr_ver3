package kda.admin.hunt;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.hunt.data.JOBHUNT;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown;
import kda.work.research.community.data.ACTULPAPERBOARD;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class AdminHuntController extends KdaAbstractController{
	
	@Autowired
	AdminHuntService adminHuntService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/hunt/hunt.do")
	public String hunt(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/hunt/huntList.do";
	}
	
	@RequestMapping("djemals/hunt/huntList.do")
	public String huntList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminHuntService.getHuntListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "huntList.do");
		model.addAttribute("title", "구직 정보 관리");
		return "tiles:admin/hunt/job_hunt_list";
	}
	
	@RequestMapping("djemals/hunt/offer.do")
	public String offer(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/hunt/offerList.do";
	}
	
	@RequestMapping("djemals/hunt/offerList.do")
	public String offerList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminHuntService.getOfferListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "offerList.do");
		model.addAttribute("title", "구인 정보 관리");
		return "tiles:admin/hunt/job_offer_list";
	}
	
	@RequestMapping("djemals/hunt/huntDown.do")
	public View research_file_download( HttpServletRequest request, HttpServletResponse response
								   ,@RequestParam(required = true, defaultValue = "0") int idx, Model model
								   ) throws Exception
	{
		
		JavaScript javaScript = new JavaScript();
		
		if(idx == 0){
			javaScript.setMessage("올바른 첨부파일 번호가 아닙니다");
			javaScript.setLocation("");
			return new JavaScriptView(javaScript);
		}else{
			JOBHUNT vo = adminHuntService.getFileUrl(idx);
			
			String fileUrl = "";
			String fileName = "";
			
			fileUrl = vo.getBbs_file_url();
			fileName = vo.getBbs_file_name();
			
			return new DownLoadView( fileUrl, fileName );
			
		}
		
	}
	
	@RequestMapping("djemals/hunt/huntExcel.do")
	public View huntExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("huntExcel", userid, "구직정보관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"strName","strLicenseNum","bitSex","strPhone","strHP","strEmail","bitMarriage","strZipcode","strLastSchool","strLastScholarly","strCareer1","strCareer_year1","strLicense1","strLicense_year1","intHopePrice","strHopeRealm","strHopeLocation","bitState","etc","regdate"}; //헤더 영문
		String header_k[]={"성명","면허번호","성별","전화번호","휴대전화","이메일","혼인여부","주소	","최종학교","최종학력","경력","경력일","자격증","취득년도","희망급여","희망분야","희망근무지","상태","기타","날짜"}; //헤더 국문			
		list = adminHuntService.excelHunt();
		
		return new ExcelDown("huntExcel", header_k, header_e, list);
	}
	
	@RequestMapping("djemals/hunt/offerExcel.do")
	public View offerExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("offerExcel", userid, "구인정보관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"ecName","ecPName","ecTel","ecFax","ecEmail","ecHome","ecAddress","ecPart","ecLimitDate","ecNumber","ecRType","erHistory","erMarry","erSex","erFamily","etTime","etLocation","etPrice","etsPrice","etContents","etWel","pstr","epPaper","epReport","epETC","bbs_file_name"}; //헤더 영문
		String header_k[]={"회사명","담당자","전화번호","팩스번호","이메일","홈페이지","주소","모집분야","모집기한","모집인원","접수방법","경력","혼인여부","성별","식수인원","근무시간","근무지역","급여","상여금","업무내용","복리후생","입사절차","제출서류","합격통보","기타","첨부파일"}; //헤더 국문			
		list = adminHuntService.excelOffer();
		
		return new ExcelDown("offerExcel", header_k, header_e, list);
	}

}
