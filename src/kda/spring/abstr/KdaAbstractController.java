package kda.spring.abstr;

import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.login.data.LOGININFO;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;

import org.springframework.ui.Model;

public abstract class KdaAbstractController {

	public static final String LOGIN_URL = "/login/kl_login_nor.do";
	
	private static final String ADMIN_ID = "ekdldjxm_!@##@!~";
	
	public void setDefaultModel(HttpSession session, Model model) {
		String today = KdaStringUtil.getTodayString();
		model.addAttribute("today", today);
		model.addAttribute("g_user_level", getUserLevel(session));
		
		if(  checkLogin(session) ) {
			model.addAttribute("isMember", true);
		} else {
			model.addAttribute("isMember", false);
			if( checkLoingWithExpire(session) ) {
				model.addAttribute("isStudent", true);
			} else {
				model.addAttribute("isStudent", false);
			}
		}
	}
	
	public boolean isAdmin(HttpSession session) {
		int userLevel =  KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.USER_LEVEL), 6);
		String userId = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.USER_ID));
	
		if( userId.equals(ADMIN_ID) ) {
			return true;
		} else {
			return false;
		}
	}	
	
	public boolean checkLogin(HttpSession session) {
		String isLogin = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.LOGIN));
		String codePers = KdaStringUtil.nullToString( session.getAttribute( SessionInfo.CODE_PERS));
		String userId = KdaStringUtil.nullToString(session.getAttribute( SessionInfo.USER_ID ));
		int userLevel =  KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.USER_LEVEL), 0);
		if( "Y".equals( isLogin  ) && !"".equals(codePers) &&  userLevel == 5 ) {
			return true;
		} else {
			System.out.println( "user id : " + userId );
			if( WorkData.MASTER_USER.equals(userId) ) {
				
				return true;
			} else {
				return false;
			}
		}
	}
	
	public SessionInfo getAdminInfo(HttpSession session) {
		SessionInfo sessionInfo = new SessionInfo ( session );
		if( sessionInfo.getUserLevel() > 2 ) {
			return null;
		} else {
			return sessionInfo;
		}
	}
	
	public LOGININFO getUserInfo(HttpSession session) {
		LOGININFO user = (LOGININFO)session.getAttribute(SessionInfo.LOGIN_INFO);
		String userId = (String)session.getAttribute(SessionInfo.USER_ID);
		if( user == null && userId.equals(ADMIN_ID)) {
			user = new LOGININFO();
			user.setPers_name("관리자");
			user.setEmail("");
		}
		return user;
	}
	
	public String getUserName(HttpSession session) {
		return  (String)session.getAttribute(SessionInfo.PERS_NAME);
	}
	
	public boolean checkLoingWithExpire(HttpSession session) {
		String isLogin = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.LOGIN));
		int userLevel =  KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.USER_LEVEL), 0);
		String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
		String persState =  KdaStringUtil.nullToString(session.getAttribute(SessionInfo.PERS_STATE));
		
		if( ( "Y".equals(isLogin) && userLevel == 5  ) || 
				(  userLevel == 6 && persState.equals("08") && !KdaStringUtil.isEmpty(codePers) ) ) {

			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Session에서 CODE_PERS 반환
	 * 
	 * @param session
	 * @return
	 */
	public String getCodePers(HttpSession session) {
		String codePers = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.CODE_PERS));
		return codePers;
	}
	
	public String getPersState(HttpSession session) {
		String persState = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.PERS_STATE));
		return persState;
	}
	
	public int getUserLevel(HttpSession session) {
		int userLevel = KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.USER_LEVEL), 6);
		return userLevel;
	}
	public int getCodeBig(HttpSession session){
		int codeBig = KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.CODE_BIG), 999);
		return codeBig;
	}
	
	public JavaScriptView getHistoryBackView(String msg) {
		JavaScript javaScript = new JavaScript();
		if(!KdaStringUtil.isEmpty(msg))
			javaScript.setMessage(msg);
		javaScript.setMethod("window.history.back()");
		return new JavaScriptView(javaScript);
	}
	
	public JavaScriptView getHistoryGoView(String msg) {
		JavaScript javaScript = new JavaScript();
		if(!KdaStringUtil.isEmpty(msg))
			javaScript.setMessage(msg);
		javaScript.setMethod("window.history.go(-2)");
		return new JavaScriptView(javaScript);
	}
	
	public String getHistoryBackPage(String msg, Model model) {
		model.addAttribute("msg", msg);
		model.addAttribute("script", "window.history.back();");
		return "common/script";
	}
	
	public String goLocation(String msg, String location, Model model) {
		model.addAttribute("msg", msg);
		model.addAttribute("script", "location.href='" + location + "';");
		return "common/script";
	}
	
	public String goLogin(Model model) {
		model.addAttribute("msg", "회원 전용 메뉴입니다");
		model.addAttribute("script", "location.href='" + this.LOGIN_URL + "'" );
		return "common/script";
	}
	
}
