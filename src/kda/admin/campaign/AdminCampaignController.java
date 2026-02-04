package kda.admin.campaign;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.campaign.data.CAMPAIGN;
import kda.common.CommonService;
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
public class AdminCampaignController extends KdaAbstractController {
	
	public static final HashMap<String, String> HANDON_TY = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = -6545709996424734278L;
		{
			put("", "전체");
			put("2014-05", "2014년 5월");
			put("2014-06", "2014년 6월");
			put("2014-07", "2014년 7월");
			put("2014-08", "2014년 8월");
			put("2014-09", "2014년 9월");
		}
	};
	
	@Autowired
	AdminCampaignService adminCampaignService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/campaign/handon.do")
	public String plusOne(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/campaign/handonList.do";
	}
	
	@RequestMapping("djemals/campaign/handonList.do")
	public String plusOneList(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="") String srchTy) throws Exception {
	
		String startm = "";
		String endm = "";
		
		if(!"".equals(srchTy)){
			
			String [] mm = srchTy.split("-");
			int mm2 = Integer.parseInt(mm[1]);
			
			Calendar cal = Calendar.getInstance();
			
			cal.set(Calendar.YEAR, 2014);
			cal.set(Calendar.MONTH, mm2-1);
			cal.set(Calendar.DATE, 1);
			
			int last_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			startm = srchTy +"-" +"01";
			endm = srchTy +"-" + last_day;
			
		}
		
		List<CAMPAIGN> list = adminCampaignService.getHandonList(startm, endm);
		
		model.addAttribute("list", list);
		model.addAttribute("handonTy", HANDON_TY);
		
		model.addAttribute("url", "handonList.do");
		model.addAttribute("title", "한돈 릴레이 캠페인관 댓글 관리");
		return "tiles:admin/campaign/handon_list";
	}
	
	@RequestMapping("djemals/campaign/handonAlert.do")
	public void handonAlert(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam (required=false, defaultValue="") String id) throws Exception {
		
		String msg = "";
		
		CAMPAIGN vo = adminCampaignService.getHandonUser(id);
		
		if(vo !=null){
			msg += "이름 : " + vo.getPers_name() +"\n"; 
			msg += "이메일 : " + vo.getEmail() +"\n"; 
			msg += "우편번호 : " + vo.getCode_post() +"\n"; 
			msg += "주소 : " + vo.getPers_add() + vo.getPers_add_detail() +"\n"; 
			msg += "전화번호 : " + vo.getPers_tel() +"\n"; 
			msg += "핸드폰 : " + vo.getPers_hp() +"\n"; 
			msg += "소속 : " + vo.getCompany_name() +"\n"; 
		}else{
			msg = "회원 정보가 없습니다.";
		}
		
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(msg); 
		
	}
	
	@RequestMapping("djemals/campaign/handonForm.do")
	public String handonForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int bbs_idx) throws Exception {
		
		CAMPAIGN handon = null;
		
		if(bbs_idx == 0) {
			handon = new CAMPAIGN();
			handon.setCrud(CRUDValue.C);
		}else {
			handon = adminCampaignService.getHandonContent(bbs_idx);
			handon.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("handon", handon);
		
		model.addAttribute("url", "handonList.do");
		model.addAttribute("title", "한돈 릴레이 캠페인관 댓글 관리");
		return "tiles:admin/campaign/handon_form";
	}
	
	@RequestMapping("djemals/campaign/handonExcel.do")
	public View handonExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam (required=false, defaultValue="") String srchTy, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("handonExcel", userid, "한돈릴레이캠페인관댓글");
		
		String startm = "";
		String endm = "";
		
		if(!"".equals(srchTy)){
			
			String [] mm = srchTy.split("-");
			int mm2 = Integer.parseInt(mm[1]);
			
			Calendar cal = Calendar.getInstance();
			
			cal.set(Calendar.YEAR, 2014);
			cal.set(Calendar.MONTH, mm2-1);
			cal.set(Calendar.DATE, 1);
			
			int last_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			startm = srchTy +"-" +"01";
			endm = srchTy +"-" + last_day;
			
		}
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"bbs_subject","bbs_user_id","bbs_name","cnt2","bbc_user_id","bbc_name","bbc_contents"}; //헤더 영문
		String header_k[]={"게시물 제목","작성자 ID","작성자 이름","댓글 개수","댓글작성자 ID","댓글작성자 이름","댓글 내용"}; //헤더 국문			
		list = adminCampaignService.excelHandon(startm, endm);
		
		return new ExcelDown("handonExcel", header_k, header_e, list);
	}
	

}
