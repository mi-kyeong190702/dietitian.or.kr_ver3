package kda.admin.contest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.contest.data.SCIENCEMEETINGDELLIST;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class AdminContestController extends KdaAbstractController{
	
	@Autowired
	AdminContestService adminContestService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/contest/contest.do")
	public String contest(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/contest/contestList.do";
	}
	
	@RequestMapping("djemals/contest/contestList.do")
	public String contestList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminContestService.getContestListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "contestList.do");
		model.addAttribute("title", "전국영양사 학술대회2");
		return "tiles:admin/contest/contest_list";
	}
	
	@RequestMapping("djemals/contest/contestForm.do")
	public String contestForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="") String idx) throws Exception {
		
		SCIENCEMEETINGACTIVE contest = null;
		
		if("".equals(idx)) {
			contest = new SCIENCEMEETINGACTIVE();
			contest.setCrud(CRUDValue.C);
		}else {
			contest = adminContestService.getContest(idx);
			contest.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("contest", contest);
		
		model.addAttribute("url", "contestList.do");
		model.addAttribute("title", "전국영양사 학술대회");
		return "tiles:admin/contest/contest_form";
	}
	
	@RequestMapping("djemals/contest/contestAction.do")
	public View contestAction(HttpServletRequest request, Model model) throws Exception {
		String checkIdx = request.getParameter("checkIdx");
		
		List<String> idxList = new ArrayList<String>();
		
		String [] idx = checkIdx.split(",");
		
		for(int i=0;i<idx.length;i++){
			idxList.add(idx[i]);
		}
		
		adminContestService.deleteContest(idxList);
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("삭제 되었습니다.");
		javaScript.setLocation("contestList.do");
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/contest/contestCancel.do")
	public String contestCancel(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/contest/contestCancelList.do";
	}
	
	@RequestMapping("djemals/contest/contestCancelList.do")
	public String contestCancelList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminContestService.getContestCancelListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "contestCancelList.do");
		model.addAttribute("title", "학술대회 취소 신청");
		return "tiles:admin/contest/contest_cancel_list";
	}
	
	@RequestMapping("djemals/contest/contestCancelForm.do")
	public String contestCancelForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int idx) throws Exception {
		
		SCIENCEMEETINGDELLIST contest = null;
		
		if(idx == 0) {
			contest = new SCIENCEMEETINGDELLIST();
			contest.setCrud(CRUDValue.C);
		}else {
			contest = adminContestService.getContestCancel(idx);
			contest.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("contest", contest);
		
		model.addAttribute("url", "contestCancelList.do");
		model.addAttribute("title", "학술대회 취소 신청");
		return "tiles:admin/contest/contest_cancel_form";
	}
	
	@RequestMapping("djemals/contest/contestCancelAction.do")
	public View contestCancelAction(SCIENCEMEETINGDELLIST vo,HttpServletRequest request, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			
			//javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			adminContestService.updateContestCancel(vo.getIdx());
			javaScript.setMessage("완료처리 되었습니다.");
			break;
		case D:
			String checkIdx = request.getParameter("checkIdx");
			
			List<Integer> idxList = new ArrayList<Integer>();
			
			String [] idx = checkIdx.split(",");
			int id = 0;
			
			for(int i=0;i<idx.length;i++){
				id = Integer.parseInt(idx[i]);
				idxList.add(id);
			}
			
			adminContestService.deleteContestCancel(idxList);
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("contestCancelList.do");
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/contest/contestExcel.do")
	public View contestExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("contestExcel", userid, "학술대회신청");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"name","member_flag","lic_no","birth","office_name","branch_name","big_name","sect_name","gtype","email","tel","tel_hp","zip","addr","join_flag","online_yn","online_yn2","ebook_yn","pay_flag","baccname","pay_amount","pay_date","reg_date","agree_yn","nice_agree_yn","nice_no","trainingName_no"}; //헤더 영문
		String header_k[]={"신청자	","회원구분","면허번호","생년월일","근무처명","소속지부","소속분과","센터구분","운영형태","이메일","전화번호","핸드폰","우편번호","주소","참가일자","Day1 참여방식", "Day2 참여방식", "학술대회 자료집", "결제방법","입금자명","입금액","입금예정일","신청일","개인정보동의","연수신청여부","NEIS개인번호","연수지명번호"}; //헤더 국문			
		list = adminContestService.excelContest();
		
		return new ExcelDown("contestExcel", header_k, header_e, list);
	}

	@RequestMapping("djemals/contest/contestCancelExcel.do")
	public View contestCancelExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("contestCancelExcel", userid, "학술대회취소신청");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"name","lic_no","office_name","tel_hp","ipgum_bambup","in_payDate","in_payPrice","del_date","del_price","bank_name","bank_num","bank_userName","c_Flag"}; //헤더 영문
		String header_k[]={"신청자	","면허번호","근무처명","연락처(핸드폰)","입금방법","입금일","입금액","취소일자","취소금액","환불계좌 은행명","환불계좌번호","예금주","처리여부"}; //헤더 국문			
		list = adminContestService.excelContestCancel();
		
		return new ExcelDown("contestCancelExcel", header_k, header_e, list);
	}

}
