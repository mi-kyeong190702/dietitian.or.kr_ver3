package kda.admin.payment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.main.AdminMainService;
import kda.admin.payment.data.ADMINTBL;
import kda.admin.payment.data.TBLORDERLIST;
import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.member.data.PERSON_M_TBL;
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
public class AdminPaymentController extends KdaAbstractController{
	
	@Autowired
	AdminPaymentService adminPaymentService;
	
	@Autowired
	private AdminMainService adminMainService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/payment/confirm.do")
	public String payment(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/payment/confirmList.do";
	}
	
	@RequestMapping("djemals/payment/confirmList.do")
	public String confirmList(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String progid = (String) user.get("progid");
		if(progid.indexOf("906") > -1){
			
			LIST_HELPER listHelper = new LIST_HELPER(request);
			
			String startm = request.getParameter("startm");
			
			if(!"".equals(startm) && startm != null){
				listHelper = adminPaymentService.getConfirmListHelper(listHelper);
			}
			
			model.addAttribute("listHelper", listHelper);
			model.addAttribute("user", user);
			
			model.addAttribute("url", "confirmList.do");
			model.addAttribute("title", "날짜별 승인 내역");
			return "tiles:admin-payment/confirm_list";
			
		}else{
			return "redirect:/djemals/login.do";
		}
	}
	
	@RequestMapping("djemals/payment/confirmForm.do")
	public String confirmForm(HttpServletRequest request, Model model, HttpSession session,
			TBLORDERLIST vo,
			@RequestParam (required=false, defaultValue="0") String cd) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String progid = (String) user.get("progid");
		if(progid.indexOf("906") > -1){
		
			String url = "/djemals/payment/";
			
			if("member".equals(cd)){
				List<PERSON_M_TBL> member = adminPaymentService.getMember(vo.getBuyr_name(),vo.getPers_birth());
				
				model.addAttribute("member", member);
				if(member.size()==1){
					String code_pers = member.get(0).getCode_pers();
					
					model.addAttribute("id", vo.getId());
					model.addAttribute("company", adminPaymentService.getCompany(code_pers));
					model.addAttribute("money", adminPaymentService.getMoney(code_pers));
				}
				
				url += "member_form";
			}else if("card".equals(cd)){
				int bidx = Integer.parseInt(vo.getGoods_code_num());
				PTBBUYADDRESS card = adminPaymentService.getCard(bidx);
				if(card !=null){
					List<PTBBUYGOODS> goods = adminPaymentService.getGoods(bidx);
					model.addAttribute("goods", goods);
				}
				model.addAttribute("card", card);
				
				url += "card_form";
			}else if("tech".equals(cd)){
				SCIENCEMEETINGACTIVE tech = adminPaymentService.getTech(vo.getGoods_code_num());
				model.addAttribute("tech", tech);
				url += "tech_form";
			}else if("edu".equals(cd)){
				url += "";
			}else {
				model.addAttribute("view", adminPaymentService.getConfirm(vo.getO_code()));
				model.addAttribute("srch", vo);
				
				model.addAttribute("url", "confirmList.do");
				model.addAttribute("title", "날짜별 승인 내역");
				url = "tiles:admin-payment/confirm_form";
			}
			
			return url;
		
		}else{
			return "redirect:/djemals/main.do";
		}
	}
	
	@RequestMapping("djemals/payment/confirmPop.do")
	public String confirmPop(HttpServletRequest request, Model model, HttpSession session,
			@RequestParam (required=false, defaultValue="0") int o_cd) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String progid = (String) user.get("progid");
		if(progid.indexOf("906") > -1){
		
			if(o_cd ==0){
				
			}else{
				model.addAttribute("view", adminPaymentService.getConfirm(o_cd));
			}
			
			return "/djemals/payment/confirm_pop";
			
		}else{
			return "redirect:/djemals/main.do";
		}
	}
	
	@RequestMapping("djemals/payment/confirmAction.do")
	public String confirmAction(HttpServletRequest request, Model model, HttpSession session,
			@RequestParam (required=false, defaultValue="0") String flag,
			@RequestParam (required=false, defaultValue="0") String site_cd,
			@RequestParam (required=false, defaultValue="0") String site_key,
			@RequestParam (required=false, defaultValue="0") String order_Cancel_Name,
			@RequestParam (required=false, defaultValue="0") String order_Cancel_Msg,
			@RequestParam (required=false, defaultValue="0") int o_code) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String progid = (String) user.get("progid");
		if(progid.indexOf("906") > -1){
		
			String reMsg="";
			
			if(o_code ==0){
				reMsg="상품을 다시 확인해 주세요.";
			}else{
				if("00".equals(flag))  reMsg="결제상태를 취소에서 승인으로 변경 하였습니다.";
				else reMsg = "결제를 취소로  변경 하였습니다.";
				
				adminPaymentService.updateConfirm(o_code, order_Cancel_Name, order_Cancel_Msg);
			}
			
			model.addAttribute("msg", reMsg);
			return "/djemals/payment/confirm_pop";
		
		}else{
			return "redirect:/djemals/main.do";
		}
			
	}
	
	
	/**
	 * 사용안함 확인
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("djemals/payment/division.do")
	public String division(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/payment/divisionList.do";
	}
	
	@RequestMapping("djemals/payment/divisionList.do")
	public String divisionList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		String startm = request.getParameter("startm");
		
		if(!"".equals(startm) && startm != null){
			listHelper = adminPaymentService.getConfirmListHelper(listHelper);
		}
		
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "divisionList.do");
		model.addAttribute("title", "결제구분별 통계");
		return "tiles:admin-payment/division_list";
	}
	
	
	/**
	 * 사용안함 확인
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("djemals/payment/user.do")
	public String user(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/payment/userList.do";
	}
	
	@RequestMapping("djemals/payment/userList.do")
	public String userList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminPaymentService.getUserListHelper(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "userList.do");
		model.addAttribute("title", "사용자 관리");
		return "tiles:admin-payment/user_list";
	}
	
	@RequestMapping("djemals/payment/userForm.do")
	public String userForm(@RequestParam (required=false, defaultValue="0") int inx
			,HttpServletRequest request, Model model) throws Exception { 
		
		ADMINTBL  user = null;
		
		if(inx == 0){
			user = new ADMINTBL();
			user.setCrud(CRUDValue.C);
		}else {
			user = adminPaymentService.getUser(inx);
			user.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("user", user);
		
		model.addAttribute("url", "userList.do");
		model.addAttribute("title", "사용자 관리");
		return "tiles:admin-payment/user_form";
		
	}
	
	@RequestMapping("djemals/payment/userAction.do")
	public View userAction(ADMINTBL vo, HttpSession session, Model model ) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			break;
		case U:
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("userList.do");
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/payment/confirmExcel.do")
	public View confirmExcel(HttpServletRequest request, HttpServletResponse response,TBLORDERLIST vo, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("confirmExcel", userid, "결제관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"num","good_name","goods_code_num","app_time","app_no","tno","ordr_idxx","o_gubun","code_bran","card_name","quota","id","pers_birth","buyr_tel1","buyr_tel2","order_status","buyr_mail","good_mny2","round_economent2","mny"}; //헤더 영문
		String header_k[]={"No","상품명","연관고유번호","승인일자","승인번호","kcp 거래번호","주문번호","결제구분","지회구분","카드계열","할부구분","아이디(성명)","생년월일","전화번호","핸드폰","결과메세지","이메일","결제금액","수수료","지급예정금액"}; //헤더 국문
		
		list = adminPaymentService.excelConfirm(vo);
		
		return new ExcelDown("confirmExcel", header_k, header_e, list);
	}
	

}
