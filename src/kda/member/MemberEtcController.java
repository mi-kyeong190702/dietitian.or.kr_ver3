package kda.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.WorkData;
import kda.member.data.DUES;
import kda.member.data.MEMBER_PAY;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.MailBean;
import kda.utils.ParamUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
public class MemberEtcController extends KdaAbstractController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	private MemberDao dao;
	
	
	/**
	 * 지로용지 발송 요청 - 메일 보내기
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("member/km_deposit_manner_action.do")
	public View depositMannerAction(HttpServletRequest request, Model model ) {
		
		
		HttpSession session = request.getSession();
	    Long last = (Long) session.getAttribute("last_deposit_time");
	    long now = System.currentTimeMillis();
	    if ( last != null && now - last < 5_000 ) { // 5초 이내 중복 차단 예
	        JavaScript js = new JavaScript();
	        js.setMessage("너무 빠른 요청입니다. 잠시 후 다시 시도하세요.");
	        js.setLocation("/member/km_deposit_manner.do");
	        return new JavaScriptView(js);
	    }
	    session.setAttribute("last_deposit_time", now);
		
		
		Map formMap = ParamUtils.getParamMap(request);
		String subject = "지로용지 발송 요청 - " + KdaStringUtil.nullToString(formMap.get("name"));
		String body = "<style>body,td{font-family:돋움;font-size:9pt;}</style>";
			   body += "<table border=0 width=500 cellpadding=4>";
			   body += "<tr height=50><td colspan=2><b>" + KdaStringUtil.nullToString(formMap.get("name"))  + "</b>님 께서 지로용지 발송 요청하셨습니다.</td></tr>";
			   body += "<tr><td width=100>성명</td><td>" + KdaStringUtil.nullToString(formMap.get("name")) + "</td></tr>";
			   body += "<tr><td>주소</td><td>(" + KdaStringUtil.nullToString(formMap.get("code_post")) + ") " +  KdaStringUtil.nullToString(formMap.get("pers_add"))  + "</td></tr>";
			   body += "<tr><td>연락처</td><td>" +  KdaStringUtil.nullToString(formMap.get("tel")) + "</td></tr>";
			   body += "<tr><td>요청사항</td><td>" + KdaStringUtil.nullToString(formMap.get("request_msg")) + "</td></tr>";
			   body += "</table>";
			   
		JavaScript javaScript = new JavaScript();
		MailBean mail = new MailBean();
		boolean isSend = mail.sendMail(WorkData.CENTER_FROM_MAIL, "시스템", WorkData.DEPOSIT_TO_MAIL, subject, body);
		
		String name = String.valueOf(formMap.get("name"));
		String tel = String.valueOf(formMap.get("tel"));
		String ip = request.getRemoteAddr();
	    String ua = request.getHeader("User-Agent");
	    
	    System.out.println("deposit request from ip={"+ip+"}, ua={"+ua+"}, name={"+name+"}, tel={"+tel+"}");
	    //logger.info("deposit request from ip={}, ua={}, name={}, tel={}", ip, ua, name, tel);
		
		//boolean isSend = mail.sendMail("areum1@dbinc.co.kr", "시스템", "areum1@dbinc.co.kr", subject, body);
		if( isSend ) {
			javaScript.setMessage("요청 되었습니다.");
		} else {
			javaScript.setMessage("요청 중 오류가 발생하였습니다.");
		}
		String kind = KdaStringUtil.nullToString(formMap.get("kind"));
		if( kind.equals("2") ) {
			javaScript.setLocation("/member/km_deposit.do");
		} else { 
			javaScript.setLocation("/member/km_deposit_manner.do");
		}
		return new JavaScriptView(javaScript);
	}
	
	/** 
	 * 회원 유효기간 조회
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("member/km_member_period_action.do")
	public @ResponseBody String  periodAjax(HttpServletRequest request) throws Exception {
		Map paramMap = ParamUtils.getParamMap(request);
		String uid = KdaStringUtil.nullToString(paramMap.get("uid"));
		String compValue = KdaStringUtil.nullToString(paramMap.get("compValue"));
		Map resultMap = service.checkMemberPerid(uid, compValue);
		int iCase = KdaStringUtil.nullToInt(resultMap.get("case"), 0);
		switch(iCase) {
			case 1:
				return "존재하지 않는 아이디/패스워드 입니다";
			case 2:
				return "회원님의 유효기간을 찾을 수 없습니다.<br />좌측의 입금계좌 및 문의처를 통해 문의하시기 바랍니다.";
			case 3:
				String msg = "";
				Map dueMap = (Map)resultMap.get("due");
				int dueGubun = KdaStringUtil.nullToInt(dueMap.get("dues_gubun"), 0);
				String authStart = KdaStringUtil.nullToString(dueMap.get("auth_start"));
				String authEnd = KdaStringUtil.nullToString(dueMap.get("auth_end"));
				msg = "회원님의 유효 기간은 다음과 같습니다.<br />";
				if( dueGubun == 2 ) {
					msg += "회원님은 " + KdaStringUtil.getFormatDayKo(authStart);
					msg += "로부터 평생회원 입니다.";
				} else {
					msg += "회원 유효기간 : " + KdaStringUtil.getFormatDayKo(authStart) + " ~ ";
					msg += KdaStringUtil.getFormatDayKo(authEnd);
				}
				return msg;
		}
		return "조회 중 오류가 발생하였습니다.";
	}
	
	/**
	 * 기존 회원 재가입/입금 확인 - 무통장/지로 입금 확인
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("member/popup/km_deposit_receipt.do")
	public String depositReceipt(@ModelAttribute("mPay") MEMBER_PAY mPay,
			HttpSession session, Model model) throws Exception {
		// 만약 Reload가 아니면
		if( KdaStringUtil.isEmpty(mPay.getMethod()) && KdaStringUtil.isEmpty(mPay.getCode_bran()) ) {
			if(  checkLogin(session) ) {
				PERSON_M_TBL person = service.getPersonMTblByCode(getCodePers(session), true);
				mPay = new MEMBER_PAY(person);
			} else {
				mPay = new MEMBER_PAY();
			}
		} 
		
		String code_bran = "";
		if( mPay.getMethod().equals("중앙회") ) {
			code_bran = "02";
		} else {
			code_bran = mPay.getCode_bran();
		}
		
		List<DUES> duesList = dao.getReDuesList(code_bran);
		
		model.addAttribute("duesList", duesList);
		model.addAttribute("mPay", mPay);
		return "popup/receipt";
	}
	
	@RequestMapping("member/pre_receipt_card.do")
	public String depositReceiptCard(@ModelAttribute("mPay") MEMBER_PAY mPay,
			HttpSession session, Model model) throws Exception {
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
		System.out.println(mPay.getGood_name());
		model.addAttribute("mPay", mPay);
		return "tiles/member/pre_receipt_card";
	}
	
	
	@RequestMapping("member/popup/km_deposit_receipt_action.do")
	public View depositReceiptAction( MEMBER_PAY mPay, HttpSession session, Model model ) throws Exception {
		//System.out.println("111111111"+ mPay);
		
		// 회원가입 여부 체크
		Map paramMap = new HashMap();
		paramMap.put("persName", mPay.getPers_name());
		paramMap.put("persBirth", mPay.getPers_birth());
		int count = service.getCountPerson(paramMap);
		JavaScript javaScript = new JavaScript();
		if( count == 0 ) {
			javaScript.setMessage("회원가입후 이용하시기 바랍니다.");
			javaScript.setMethod("window.close()");
			return new JavaScriptView(javaScript);
		}
		
		String Mail=null;
		
		switch(String.valueOf(mPay.getCode_bran())){
			/*2025.03.10 서울지부 메일계정 변경 - 원복*/
			/*case "02" : Mail="kdas29@hanmail.net"; break;*/
			case "02" : Mail="kdas29@hanmail.net"; break;
			case "03" : Mail="kdabs333@hanmail.net"; break;
			/*2022.04.18 인천지부 메일계정 변경*/
			/*case "04" : Mail="incho599@unitel.co.kr"; break;*/
			case "04" : Mail="kdaic@naver.com"; break;
			
			case "05" : Mail="kdakg@hanmail.net"; break;
			/*2022.04.13 강원지부 메일계정 변경*/
			/*case "06" : Mail="kda123@unitel.co.kr"; break;*/
			case "06" : Mail="gwd-kda@naver.com"; break;
			
			case "07" : Mail="cbdietitian@naver.com"; break;
			case "08" : Mail="kdatj22@daum.net"; break;
			case "09" : Mail="kdajb@hanmail.net"; break;
			case "10" : Mail="kdakj@hanmail.net"; break;
			case "11" : Mail="kdadk@hanmail.net"; break;
			case "12" : Mail="kdakn@hanmail.net"; break;
			case "13" : Mail="ukda@hanmail.net"; break;
			case "14" : Mail="2jejukda@hanmail.net"; break;
		}
		//sendGiroMail(mPay, "simplee02@daum.net");
		//2022.09.08 메일주소 변경
		sendGiroMail(mPay, Mail, "kdacenter@kdiet.or.kr");
		javaScript.setMessage("관리자에게 전달됐습니다.\\r\\n입금확인까지 24시간 소요됩니다.\\r\\n문의사항은 소속영양사회로 연락부탁드립니다.");
		javaScript.setMethod("window.close()");
		return new JavaScriptView(javaScript);
	}
	
	private void sendGiroMail(MEMBER_PAY pay, String Mail, String Mail2) {
		// String toMail = WorkData.GIROMAIL +  "," + pay.getLocal_email(); // 받는 사람
		String toMail = Mail;
		String ccMail = Mail2;
		String fromMail = WorkData.CENTER_FROM_MAIL;
		String fromName = WorkData.CENTER_FROM_MAIL_NAME;
		
				
		String subject	= pay.getPers_name() + " 님께서 회원 재가입을 위해 입금확인 요청을 하셨습니다. - " + KdaStringUtil.getTodayString();
		
		String mbody =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>";
			mbody += "<br><table width='616' border='0' cellpadding='4' cellspacing='1' bgcolor='#CCCCCC' align=center>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<th height='32' colspan='2' bgcolor='#FFFFFF'><div align='center' class='style11'>입금 확인 요청</div></th>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td width='154' height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>";
			mbody += "<div align='center'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>";
			mbody +=  "</div></td>";
			mbody +=  "<td width='443' bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_name() +  "</span><span class='style6'> - " + pay.getDues_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>생년월일</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_birth() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>입금자명</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getSend_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>연락처</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_hp() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>소속시도회</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getLocal_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금방법</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getMethod() + "</span></td>";
			mbody +=  "</tr>";
			if( pay.getMethod().equals("계좌이체") | pay.getMethod().equals("중앙회") ) {
				mbody += "<tr bgcolor='#EFEFEF'>";
				mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금계좌</div></td>";
				mbody += "<td bgcolor='#FFFFFF'><span class='style9'>[" + pay.getBank() +"] " + pay.getAccount_num() +  "</span></td>";
				mbody += "</tr>";
			}
		
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>회원종류</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getDues_name() + "</span></td>";
		mbody += "</tr>";
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금일</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getSend_date() + "</span></td>";
		mbody += "</tr>";
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>참고사항</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>"+ pay.getRef_msg() + "</span></td>";
		mbody += "</tr>";
		mbody += "</table><br><br>";
		
		MailBean mail = new MailBean();
		mail.sendMailCc(fromMail, fromName, toMail, subject, mbody, ccMail);
		
	}
	
	
	private void sendGiroMail(MEMBER_PAY pay, String Mail) {
		// String toMail = WorkData.GIROMAIL +  "," + pay.getLocal_email(); // 받는 사람
		String toMail = Mail;
		String fromMail = WorkData.CENTER_FROM_MAIL;
		String fromName = WorkData.CENTER_FROM_MAIL_NAME;
		
				
		String subject	= pay.getPers_name() + " 님께서 회원 재가입을 위해 입금확인 요청을 하셨습니다. - " + KdaStringUtil.getTodayString();
		
		String mbody =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>";
			mbody += "<br><table width='616' border='0' cellpadding='4' cellspacing='1' bgcolor='#CCCCCC' align=center>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<th height='32' colspan='2' bgcolor='#FFFFFF'><div align='center' class='style11'>입금 확인 요청</div></th>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td width='154' height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>";
			mbody += "<div align='center'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>";
			mbody +=  "</div></td>";
			mbody +=  "<td width='443' bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_name() +  "</span><span class='style6'> - " + pay.getDues_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>생년월일</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_birth() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>입금자명</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getSend_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>연락처</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getPers_hp() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>소속시도회</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getLocal_name() + "</span></td>";
			mbody +=  "</tr>";
			mbody +=  "<tr bgcolor='#EFEFEF'>";
			mbody +=  "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금방법</div></td>";
			mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getMethod() + "</span></td>";
			mbody +=  "</tr>";
			if( pay.getMethod().equals("계좌이체") | pay.getMethod().equals("중앙회") ) {
				mbody += "<tr bgcolor='#EFEFEF'>";
				mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금계좌</div></td>";
				mbody += "<td bgcolor='#FFFFFF'><span class='style9'>[" + pay.getBank() +"] " + pay.getAccount_num() +  "</span></td>";
				mbody += "</tr>";
			}
		
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>회원종류</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getDues_name() + "</span></td>";
		mbody += "</tr>";
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금일</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + pay.getSend_date() + "</span></td>";
		mbody += "</tr>";
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>참고사항</div></td>";
		mbody += "<td bgcolor='#FFFFFF'><span class='style9'>"+ pay.getRef_msg() + "</span></td>";
		mbody += "</tr>";
		mbody += "</table><br><br>";
		
		MailBean mail = new MailBean();
		mail.sendMail(fromMail, fromName, toMail, subject, mbody);
		
	}
}
