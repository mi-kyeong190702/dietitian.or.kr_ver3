package kda.mypage;

import javax.servlet.http.HttpSession;

import kda.WorkData;
import kda.member.MemberService;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.MEMBER_PAY;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.MailBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class MyPagePayController extends KdaAbstractController {

	
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MyPageHService mypageHService;
	
	/**
	 * 기존 회원 재가입/입금 확인
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("kmp_deposit.do")
	public String kmpLicense(HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return getHistoryBackPage("로그인후 이용하여 주십시요", model);
		}
		return "tiles" + "/mypage/kmp_deposit";
	}
	
	
	
	@RequestMapping("mypage/pre_receipt_card.do")
	public String preReceiptCard(@ModelAttribute("mPay") MEMBER_PAY mPay, HttpSession session, Model model) throws Exception {
		// 만약 Reload가 아니면
		if( KdaStringUtil.isEmpty(mPay.getMethod()) && KdaStringUtil.isEmpty(mPay.getCode_bran()) ) {
			if(  checkLogin(session) ) {
				PERSON_M_TBL person = service.getPersonMTblByCode(getCodePers(session), true);
				mPay = new MEMBER_PAY(person);
			} else {
				mPay = new MEMBER_PAY();
			}
		} 
		
		mPay.setGood_name(" 재가입입금");
		
		model.addAttribute("mPay", mPay);
		return "tiles/mypage/pre_receipt_card";
	}
	
	
	@RequestMapping("mypage/kmp_deposit_cms.do")
	public String depositCms(HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return goLogin(model); 
		}
		
		PERSON_M_TBL person = service.getPersonMTblByCode(getCodePers(session), true);
		MEMBER_JOIN memberJoin = new MEMBER_JOIN();
		memberJoin.setPers_name(person.getPers_name());
		memberJoin.setCode_bran(person.getCode_bran());
		memberJoin.setLic_no(person.getLic_no());
		memberJoin.setPers_tel(person.getPers_tel());
		memberJoin.setPers_hp(person.getPers_hp());
		memberJoin.setCompany_name(person.getCompany_name());
		memberJoin.setEmail(person.getEmail());
		memberJoin.setPers_add(person.getPers_add());
		memberJoin.setCode_pers(person.getCode_pers());
		memberJoin.setCode_member(person.getCode_member());
	
		model.addAttribute("memberJoin", memberJoin);
		
		return "tiles/mypage/kmp_deposit_cms";
	}
	
	
	/**
	 * 재가입 입금 처리 ( CMS 입금)
	 * 
	 * @param member_join
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mypage/kmp_deposit_cms_action.do")
	public String depositCmsAction(MEMBER_JOIN member_join, HttpSession session, Model model ) throws Exception {
		mypageHService.insertDepositCms(member_join);
		service.sendMemberMail(member_join);
		
		return "redirect:/mypage/kmp_deposit_cms_result.do";
	}
	
	
	
}
