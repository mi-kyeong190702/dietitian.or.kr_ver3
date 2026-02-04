package kda.login;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.login.data.LOGININFO;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class LoginController extends KdaAbstractController {
	private Log log = LogFactory.getLog(LoginController.class);

	@Autowired
	LoginService service;

	@RequestMapping("login_doLoginNor")
	public String doLoginNor(@RequestParam(required = false) String id,
			@RequestParam(required = false) String passwd, HttpSession session,
			Model model)  throws Exception{
		
		
		String message 		= "";
		String redirect 	= "";
		String error_code 	= "";
		String pers_state 	= "";
		String code_dues 	= "";
		
		String returnURL 	= "";
	
		//사용자권한 
		 //1 : "최고관리자"
		 //2 : "중간관리자"
		 //3 : "회원▲▲"
		 //4 : "회원▲"
		 //5 : "회원"
		 //6 : "비회원"
				
		//관리자로 로그인시 강제 셋팅/ DB 테이블에 관리자 아이디가 없음.
		if( id.equals("ekdldjxm_!@##@!~") && passwd.equals("ekdldjxm007")){
			
			session.setAttribute(SessionInfo.PATH		, "/");
			session.setAttribute(SessionInfo.USER_ID	, id);
			session.setAttribute(SessionInfo.PERS_NAME	, "관리자");
			session.setAttribute(SessionInfo.USER_LEVEL	, 1);
			session.setAttribute(SessionInfo.LOGIN		, "Y");
			
			returnURL = "login/kl_login_ok";
			
		}else{//그 외
			
			LOGININFO loginInfo = service.userLogin(id, passwd);
			
			
			if (loginInfo != null && loginInfo.getPwchk().equals("Y")) {
				
				pers_state = loginInfo.getPers_state();
				code_dues = loginInfo.getDues_gubun();
				
				//산하단체회비 유효기간 만료 추가
				if ( !(pers_state.equals("01") || pers_state.equals("07") || pers_state.equals("09")) ) {
					log.info("===== here 1 pers_state : " + pers_state);
					message = "회원님은 회비를 납입하지 않으셨거나\\n회원유효기간이 만료 되었습니다.\\n회비를 입금하여 주시면 회원으로 활동 하실수 있습니다.\\n\\n입금확인 페이지로 이동합니다.";
					redirect = "/member/km_deposit.do";
				} else if (pers_state.equals("01")) {
					
					
					String auth_end = loginInfo.getAuth_end();
										
					
					if (!auth_end.equals("")) {
						
						if( !"4".equals(code_dues) ) { // CMS 회비가 아닌 경우에만 체크
						
							
							SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
							String begin = formatter.format(new Date());
							String end = auth_end;
							
							Date beginDate = formatter.parse(begin);
							Date endDate = formatter.parse(end);
						    
							long diff = endDate.getTime() - beginDate.getTime();
							long diffDays = diff / (24 * 60 * 60 * 1000);
						    
							if (diffDays < 0) {
								error_code = "1";
							} else if (diffDays <= 0) {
								error_code = "3";
							} else if ((1 < diffDays) && (diffDays < 15)) {
								error_code = "4";
							}

							log.info("===== diffDays : " + diffDays);
							// -- 만료기간 체크
							if (error_code.equals("1") || error_code.equals("2")) {
								log.info("===== here 2 error_code : " + error_code);
								message = "회원님은 회비를 납입하지 않으셨거나\\n회원유효기간이 만료 되었습니다.\\n회비를 입금하여 주시면 회원으로 활동 하실수 있습니다.\\n\\n입금확인 페이지로 이동합니다.";
								redirect = "/member/km_deposit.do";
							} else if (error_code.equals("3")) {
								setSession(session, id, loginInfo);
								message = "회원님의 회원 유효기간이 오늘로 만료 됩니다.";
								model.addAttribute("message", message);
								model.addAttribute("redirect", "/login/kl_login_valid_message.do");
								return "alert";
							} else if (error_code.equals("4")) {
								setSession(session, id, loginInfo);
								message = "회원님의 회원 유효기간이 " + diffDays + " 일 남았습니다.";
								model.addAttribute("message", message);
								model.addAttribute("redirect", "/login/kl_login_valid_message.do");
								return "alert";
							}
						}
					} else {
						log.info("===== here 3 error_code : " + error_code);
						message = "회원님은 회비를 납입하지 않으셨거나\\n회원유효기간이 만료 되었습니다.\\n회비를 입금하여 주시면 회원으로 활동 하실수 있습니다.\\n\\n입금확인 페이지로 이동합니다.";
						redirect = "/member/km_deposit.do";
					}
				} else {
					
				}
	
				
				log.info("============================================= LOGIN");
				log.info("Pwchk      : [" + loginInfo.getPwchk() + "]");
				log.info("code_dues  : [" + code_dues + "]");
				log.info("pers_state : [" + pers_state + "]");
				log.info("error_code : [" + error_code + "]");
				log.info("redirect   : [" + redirect + "]");
				log.info("============================================= LOGIN");
	
			} else{
				message = "아이디 또는 비밀번호를 확인해 주세요.";
			}
	
			log.info("message : " + message);
	
			if (!message.equals("")) {
				returnURL = "alert";
	
				model.addAttribute("message", message);
				model.addAttribute("redirect", redirect);
	
				session.setAttribute(SessionInfo.LOGIN		, "N");
				session.setAttribute(SessionInfo.LOGIN_INFO	, null);
			} else {
				setSession(session, id, loginInfo);
				returnURL = "redirect:login/kl_login_valid_message.do";
				
			} 
		}
		log.info("message-[" + message + "]-returnURL[" + returnURL + "]");

		return returnURL;
	}

	private void setSession(HttpSession session, String id, LOGININFO loginInfo) {
		session.setAttribute(SessionInfo.LOGIN		, "Y");
		session.setAttribute(SessionInfo.LOGIN_INFO	, loginInfo);
		session.setAttribute(SessionInfo.USER_ID	, id);
		session.setAttribute(SessionInfo.PERS_NAME	, loginInfo.getPers_name()); // 이름
		session.setAttribute(SessionInfo.PERS_TEL	, loginInfo.getPers_tel()); // 전화
		session.setAttribute(SessionInfo.PERS_HP	, loginInfo.getPers_hp()); // 휴대폰
		session.setAttribute(SessionInfo.CODE_MEMBER, loginInfo.getCode_member()); // 회원종류
		session.setAttribute(SessionInfo.EMAIL		, loginInfo.getEmail()); // 이메일
		session.setAttribute(SessionInfo.DUES_GUBUN	, loginInfo.getDues_gubun()); 
		session.setAttribute(SessionInfo.PERS_STATE	, loginInfo.getPers_state()); 
		session.setAttribute(SessionInfo.AUTH_START	, loginInfo.getAuth_start()); 
		session.setAttribute(SessionInfo.AUTH_END	, loginInfo.getAuth_end()); 
		session.setAttribute(SessionInfo.PWCHK		, loginInfo.getPwchk()); 
		session.setAttribute(SessionInfo.CODE_PERS	, loginInfo.getCode_pers()); // 회원번호
		session.setAttribute(SessionInfo.CODE_BRAN	, loginInfo.getCode_bran()); // 지부
		session.setAttribute(SessionInfo.PERS_BIRTH	, loginInfo.getPers_birth()); // 생년월일
		session.setAttribute(SessionInfo.USER_LEVEL	, 5); // 사용자 권한 : 회원
		session.setAttribute(SessionInfo.CODE_POST	, loginInfo.getCode_post());
		session.setAttribute(SessionInfo.PERS_ADD	, loginInfo.getPers_add());
		session.setAttribute(SessionInfo.PERS_ADD_DETAIL	, loginInfo.getPers_add_detail());
		session.setAttribute(SessionInfo.LIC_NO		, loginInfo.getLic_no());
		session.setAttribute(SessionInfo.PERS_POINT		, loginInfo.getPers_point());
		session.setAttribute(SessionInfo.CODE_BIG		, loginInfo.getCode_big());
	}
	
	@RequestMapping("login/kl_login_valid_message.do")
	public String loginValid(HttpSession session, Model model) throws Exception {
		String codePers = getCodePers(session);
		int dif = service.getPasswdUpateMonth(codePers);
		if( dif >= 6 ) {
			model.addAttribute("limit_pwd", true);
		}
		return "/login/kl_login_valid_message";
	}
	
	
	/**
	 * 교육생 로그인 화면
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("login/kl_trainees_login.do")
	public String loginEdu(@RequestParam(defaultValue="2", required=false) int kind, HttpSession session, Model model ) {
		model.addAttribute("kind" , kind);
		return "tiles/login/kl_trainees_login";
	}
	
	/**
	 * 교육생 로그인 처리
	 * 
	 * @param id
	 * @param passwd
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("login_trainees_action.do")
	public View doLoginEdu(@RequestParam(required = false) String id,
			@RequestParam(required = false) String passwd, HttpSession session,
			Model model)  throws Exception{
		JavaScript javaScript = new JavaScript();
		
		LOGININFO loginInfo = service.userLogin(id, passwd);
		
		// 아이디//비밀번호 체크
		if ( loginInfo == null || !loginInfo.getPwchk().equals("Y") ) {
			javaScript.setMessage("아이디 또는 비밀번호를 확인해 주세요");
			javaScript.setMethod("window.history.back()");
			return new JavaScriptView(javaScript);
		}
			
		String pers_state = loginInfo.getPers_state();
		boolean chk = false;
		
		log.debug( "ID : "  + id + " | state :" + pers_state );
		
		// 유효기간 만료 회원이면 교육생 로그인 처리
		if( pers_state.equals("05") || pers_state.equals("09") || pers_state.equals("10") ) {
			chk = true;
		} else if( pers_state.equals("08") || pers_state.equals("06") ) {
			// 상태가 교육생일 경우 로그인 처리
			chk = true;
		} else if( pers_state.equals("01")) {
			// 정상인 경우 유효기간 만료일을 한번 더 체크
			String auth_end = loginInfo.getAuth_end();
			if (!auth_end.equals("")) {
				int iToday = Integer.parseInt(KdaStringUtil.getTodayString());
				int iAuthEnd = Integer.parseInt(auth_end);
				if( iToday > iAuthEnd ) {
					chk = true;
				}
			} 
		}
		if( chk ) {
			session.setAttribute(SessionInfo.LOGIN, "N");
			session.setAttribute(SessionInfo.USER_LEVEL	, 6); // 사용자 권한 : 비회원 로그인
			session.setAttribute(SessionInfo.CODE_PERS	, loginInfo.getCode_pers()); // 회원번호
			session.setAttribute(SessionInfo.PERS_STATE, "08");
			session.setAttribute(SessionInfo.USER_ID, id);
						
			javaScript.setLocation("/work/education/ke_curriculum.do");
			return new JavaScriptView(javaScript);
		} else {
			javaScript.setMessage("현재 회원이므로 교육생으로 로그인이 불가능하며,\\n 회원 로그인 창으로 이동합니다.");
			javaScript.setLocation("/login/kl_login_nor.do");
			return new JavaScriptView(javaScript);
		}
	}
}
