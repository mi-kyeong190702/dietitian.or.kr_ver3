package kda.work.education;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.IPINService;
import kda.common.data.IPIN;
import kda.member.MemberService;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;
import kda.mypage.MyPageHService;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("work/education")
public class EducationPersonController extends KdaAbstractController {

	@Autowired
	private IPINService ipinservice;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MyPageHService myPageHService;
	
	@RequestMapping("ke_trainees_join.do")
	public String setJoinEdu(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		IPIN ipin = ipinservice.getIPIN(request);
		
		model.addAttribute("ipin", ipin);
		return "tiles/work/education/ke_trainees_join";
	}
					 
	@RequestMapping("ke_trainees_join_step1.do")
	public String joinStep1(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		MEMBER_JOIN join = null;
		String rtnTile = "tiles/work/education/ke_trainees_join_step1";
		
		if(request.getParameter("persName") != null) {
			join = new MEMBER_JOIN();
			join.setPers_name(request.getParameter("persName"));
			join.setPers_birth(request.getParameter("persBirth"));
			join.setPers_hp(request.getParameter("persHp"));
			session.setAttribute(SessionInfo.MEMBER_JOIN, join);
		}
		
		Object sesObj = session.getAttribute(SessionInfo.MEMBER_JOIN);
		
		if( sesObj == null  ) {
			model.addAttribute("errorKind", "1");
			return rtnTile;
		}
		
		/*MEMBER_JOIN join = (MEMBER_JOIN)sesObj;*/
		join = (MEMBER_JOIN)sesObj;
		
		Map paramMap = new HashMap();
		paramMap.put("persName", join.getPers_name());
		paramMap.put("persBirth", join.getPers_birth());
		paramMap.put("persHp", join.getPers_hp());
		int persCnt = memberService.getCountPerson(paramMap);
		if( persCnt > 0 ) {
			model.addAttribute("errorKind", "2");
			return rtnTile;
		}
		
		// 기본세팅
		join.setCode_member("00"); // 미회원 
		join.setPers_state("08");	
		
		model.addAttribute("join", join);
		return rtnTile;
	}
	
	@RequestMapping("ke_trainees_join_action.do")
	public View joinAction(MEMBER_JOIN join, HttpServletRequest request, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
		try {
			join.setCode_member("-2");
			join.setCertifi_view("00000");
			memberService.insertEduMember(join);
			javaScript.setLocation("ke_trainees_join_end.do");
		} catch(Exception e){
			javaScript.setMessage("등록 중 오류가 발생하였습니다.\n 다시 시도하여 주십시요.");
			javaScript.setMethod("window.history.back()");
		}
		return new JavaScriptView(javaScript);
	}

	@RequestMapping("ke_trainees_info.do")
	public String traineesInfo(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		if( !"08".equals(getPersState(session)) ) {
			return "redirect:/login/kl_trainees_login.do";
		}
				
		PERSON_M_TBL person = memberService.getPersonMTblByCode(getCodePers(session), true);
		MEMBER_JOIN join = person.convertMemberJoin();
		try {
			String[] aryEmail = join.getEmail().split("@");
			join.setEmail(aryEmail[0]);
			join.setEmail2(aryEmail[1]);
		} catch(Exception e) {System.out.println(e.toString());}
	
		model.addAttribute("join", join);
		model.addAttribute("update", "Y");
		
		return "tiles/work/education/ke_trainees_join_step1";
	}
	
	@RequestMapping("ke_trainees_info_action.do")
	public View traineesInfoAction(MEMBER_JOIN join, HttpSession session, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
		
		if( !checkLoingWithExpire(session)) {
			javaScript.setMessage("교육생으로 로그인 후 사용하여 주십시요.");
			javaScript.setLocation("ke_trainees_info.do");
			return new JavaScriptView(javaScript);
		}
			
		// 수정을 위한 파라미터 동기화
		join.setEmail( join.getEmail() + "@" + join.getEmail2() );
		join.setCode_pers(getCodePers(session));
		join.setPpost(join.getCode_post());
		join.setCpost(join.getCompany_code_post());
		
		boolean result = myPageHService.updateTrainees(join);
		if( result ) {
			javaScript.setMessage("수정 처리 되었습니다");
			javaScript.setLocation("ke_trainees_info.do");
		} else {
			javaScript.setMessage("오류가 발생 하였습니다.\n다시 시도하여 주십시요");
			javaScript.setMethod("window.history.back()");
		}
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("ke_trainees_logout.do")
	public View traineesLogout(HttpSession session, Model model) throws Exception {
		session.setAttribute(SessionInfo.LOGIN, null);
		session.setAttribute(SessionInfo.USER_LEVEL	, null); // 사용자 권한 : 비회원 로그인
		session.setAttribute(SessionInfo.CODE_PERS	, null); // 회원번호
		session.setAttribute(SessionInfo.PERS_STATE, null);
		session.setAttribute(SessionInfo.USER_ID, null);
		session.invalidate();
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("로그아웃 되었습니다.");
		javaScript.setLocation("/");
		return new JavaScriptView(javaScript);
	}
}
