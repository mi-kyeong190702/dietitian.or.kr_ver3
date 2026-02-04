package kda.member;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.IPINService;
import kda.common.data.IPIN;
import kda.member.data.DUES;
import kda.member.data.MEMBER;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;
import kda.member.data.TRUST_COMPANY;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
public class MemberController extends KdaAbstractController{
	private Log log = LogFactory.getLog(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	MemberDao dao;
	
	@Autowired
	private IPINService ipinservice;
	
	
	/** 
	 * 아이디 조회
	 * 
	 * @param response
	 * @param uname
	 * @param pers_birth
	 * @param pers_hp
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("member_doFindUserId")
	public void doFindUserId( HttpServletResponse response
								, @RequestParam(required=false) String uname
								, @RequestParam(required=false) String pers_birth
								, @RequestParam(required=false) String pers_hp
								, Model model) throws Exception {
	
		uname = URLDecoder.decode(uname, "UTF-8");
		String result  = "";		
		List<MEMBER>  idList = service.getMemberId(uname, pers_birth, pers_hp);
		String id = "";
		
		int i = 0;
    	for(MEMBER row : idList){				
    		if(row.getPers_state().equals("02") || row.getPers_state().equals("03") || row.getPers_state().equals("04")){
    			result = "del"; 
    			break; //사망,탈퇴,삭제인 경우
    		}else{
    			result = "success="+row.getId();
    		}
    		i++;
		}
		
		if ( idList == null )
			result = "error";
		else if(i > 1)
			result = "multi"; //다중아이디인 경우
		
		try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(result);
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	/**
	 * 비밀번호 초기화
	 * @param response
	 * @param uid
	 * @param uname
	 * @param pers_birth
	 * @param gubun
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("member_doInitPw")
	public void doInitPw( HttpServletResponse response
									, @RequestParam(required=false) String uid
									, @RequestParam(required=false) String uname
									, @RequestParam(required=false) String pers_birth
									, @RequestParam(required=false) String gubun
									, Model model) throws Exception
	{	
		uname = URLDecoder.decode(uname, "UTF-8");		
		
		String hp = service.getMemberHp(uid, uname, pers_birth);
		
		String result ="";
		boolean tmpPwResult = true;
		
		if (gubun.equals("1")) { // 임시비밀번호 요청

			int randomlen = 4;
			StringBuilder sb = new StringBuilder("");

			for (char c : hp.toCharArray()) {
				if (!Character.isDigit(c)) { // 숫자가 아닐 경우
					tmpPwResult = false;
					break;
				}
			}

			if (tmpPwResult && (hp.length() == 10 || hp.length() == 11)) { // 휴대폰 번호가정상인경우
				if (hp.length() == 10)
					randomlen = 3;

				for (int i = 0; i < 4; i++) {
					sb.append((char) (Math.random() * 26 + 97));
				}
				// 012 3456 7891
				hp = sb.toString() + hp.substring(randomlen + 3, hp.length());
				log.info("임시비밀번호 생성 :" + hp);
			} else {
				tmpPwResult = false; // 휴대폰번호가 비정상적으로 들어간 경우
			}

			int updateResult = service.setInitPw(hp, uid);

			if (updateResult < 1) {
				result = "error";
			} else if (updateResult > 0 && gubun.equals("1")) {
				if (tmpPwResult) {
					result = "tmpPwMsg="
							+ "요청하신 임시비밀번호는 다음과 같습니다.<br/>"
							+ sb.toString()
							+ "****" + "(****은 저장된 휴대폰 뒷번호 4자리)<br/> 로그인 후 반드시 변경하여 사용해 주시기 바랍니다.<br/>휴대폰 번호가 변경되신 경우 02-823-5680(311)로 문의주세요.";
				} else {
					result = "tmpPwMsg=" + "관리자(02-823-5680 내선311)에게 문의해 주세요";
				}
			} else {
				result = "success=" + hp;
			}

		} else {
			result = "error";
		}
		
		try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(result);
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	@RequestMapping("/member/km_join")
	public String setkm_join(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		IPIN ipin = ipinservice.getIPIN(request);
		model.addAttribute("ipin", ipin);
		return "tiles/member/km_join";
	}
	
	
	/**
	 * 자격번호 체크( Ajax ) 
	 * 
	 * @param ck_val
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("member_checkLicNo")
	public @ResponseBody String  checkLicNo(
			@RequestParam(required=false) String ck_val, @RequestParam(required=false, defaultValue="") String codePers,
			HttpServletResponse response  , Model model) throws Exception {			
		String licNo = service.getLicNo(ck_val, null);
		if (licNo == null) 
				licNo = "";
		
		return licNo;
	}
	
	@RequestMapping("member_checkId")
	public void checkId(@RequestParam(required=false) String ck_val
						 , HttpServletResponse response
						 , Model model) throws Exception {			
		
		String id = service.getId(ck_val);
		if (id == null) id= "";
	    try {	
	    	response.getWriter().print(id);    
	    } catch (IOException e) {
	    	//e.printStackTrace();
	    	log.info("Exception : " + e.toString());
	    }
	}	
	
	// ************************** MEMBER JOIN STEP ************************** // 

	@RequestMapping("member_join_step3")
	public String km_join_step3( @ModelAttribute("memberJoin") MEMBER_JOIN member_join
							   , HttpSession session, Model model ) throws Exception
	{
		MEMBER_JOIN s_member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
		if( member_join == null ) {
			session.setAttribute(SessionInfo.MEMBER_JOIN, null);
			model.addAttribute("msg", "올바르지 않은 접속입니다");
			model.addAttribute("script", "location.href='/';");
			return "common/script";
		}
		
		String redirect = "";
		if ( s_member_join == null ) {
			redirect = "tiles" + "/member/km_join";
		} else {
			redirect = "tiles" + "/member/km_join_step3";
			s_member_join.setCode_member( member_join.getCode_member() );
			
			//신규일 경우-----------------------------------------------------------------------------
			s_member_join.setCode_add_gubun("2");	//???
			s_member_join.setPers_state("06");		//회원구분 01 : 정상 , 06 : 승인대기 , 07 : 선인증
			s_member_join.setRegister("system");	//등록자
			//-------------------------------------------------------------------------------------
			
			if(  member_join.getCode_member().equals("10") 
					|| member_join.getCode_member().equals("12")
					|| member_join.getCode_member().equals("30")
					|| member_join.getCode_member().equals("32")){//	'평생회원-정회원/특별회원 인 경우
				s_member_join.setDues_gubun("2"); //회비구분 1:연회비 2:평생회비 3:산하단체회비 4:cms회비
				//s_member_join.setAuth_end("99991231"); //유효기간 
			}else{
				s_member_join.setDues_gubun("1");
				//s_member_join.setAuth_end("CONVERT(VARCHAR(20), DATEADD(day, 364, getdate()), 112)");
			}
		}		
		
		return redirect;		
	}
	
	
	@RequestMapping("/member/km_join_step2.do")
	public String member_join_stemp2(HttpSession session, Model model, HttpServletRequest request ) throws Exception {
		MEMBER_JOIN join = null;
		String tile = "tiles/member/km_join_step2";
				
		if(request.getParameter("persName") != null) {
			join = new MEMBER_JOIN();
			join.setPers_name(request.getParameter("persName"));
			join.setPers_birth(request.getParameter("persBirth"));
			join.setPers_hp(request.getParameter("persHp"));
			session.setAttribute(SessionInfo.MEMBER_JOIN, join);
		}
		
		Object obj = session.getAttribute(SessionInfo.MEMBER_JOIN);
		
		if( obj == null ) {
			model.addAttribute("errorKind", "1");
			return tile;	
		}
		
		join = (MEMBER_JOIN)obj;
		
		Map paramMap = new HashMap();
		paramMap.put("persName", join.getPers_name());
		paramMap.put("persBirth", join.getPers_birth());
		paramMap.put("persHp", join.getPers_hp());
		int persCnt = service.getCountPerson(paramMap);
		if( persCnt > 0 ) {
			model.addAttribute("errorKind", "2");
		}
		
		return tile;
	}
	
/*
	@RequestMapping("/member/km_join_step2.do")
	public String member_join_stemp2(HttpSession session, Model model ) throws Exception {
		MEMBER_JOIN join = null;
		String tile = "tiles/member/km_join_step2";
				
		Object obj = session.getAttribute(SessionInfo.MEMBER_JOIN);
		
		if( obj == null ) {
			model.addAttribute("errorKind", "1");
			return tile;	
		}
		
		join = (MEMBER_JOIN)obj;
		
		Map paramMap = new HashMap();
		paramMap.put("persName", join.getPers_name());
		paramMap.put("persBirth", join.getPers_birth());
		int persCnt = service.getCountPerson(paramMap);
		if( persCnt > 0 ) {
			model.addAttribute("errorKind", "2");
		}
		
		return tile;
	}
*/	
	@RequestMapping("member_join_step3_1")
	public String member_join_step3_1( @ModelAttribute("memberJoin") MEMBER_JOIN member_join, HttpSession session, Model model ) throws Exception
	{
		MEMBER_JOIN s_member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
		
		if( member_join == null ) {
			session.setAttribute(SessionInfo.MEMBER_JOIN, null);
			model.addAttribute("msg", "올바르지 않은 접속입니다");
			model.addAttribute("script", "location.href='/';");
			return "common/script";
		}
		
		String redirect = "";
		if ( s_member_join == null )
			redirect = "tiles" + "/member/km_join";
		else {
			redirect = "tiles" + "/member/km_join_step3_1";
			
			s_member_join.setPers_name( member_join.getPers_name() );						// 성명
			s_member_join.setPers_birth( member_join.getPers_birth() );						// 생년월일
			s_member_join.setCode_sex( member_join.getCode_sex() );							// 성별			
			s_member_join.setLic_no( member_join.getLic_no() );								// 면허번호
			s_member_join.setId( member_join.getId() );										// 이용자ID
			s_member_join.setPasswd( member_join.getPasswd() );								// 비밀번호
			s_member_join.setEmail( member_join.getEmail()); 								// 이메일
			s_member_join.setEmail2( member_join.getEmail2()); 								// 이메일2
			s_member_join.setPers_tel( member_join.getPers_tel());							// 집 전화번호
			s_member_join.setPers_hp( member_join.getPers_hp() );							// 휴대용 전화번호
			
			s_member_join.setCode_post( member_join.getCode_post() );						// 우편번호
			s_member_join.setPers_add( member_join.getPers_add() );							// 자택주소
			s_member_join.setPers_add_detail( member_join.getPers_add_detail() );   		// 자택주소 상세
			s_member_join.setCompany_name( member_join.getCompany_name() );   				// 근무처명
			s_member_join.setJob_dept( member_join.getJob_dept() );   						// 부서 및 직급(부)
			s_member_join.setJob_line_code( member_join.getJob_line_code() );   			// 직렬
			s_member_join.setJob_level_code( member_join.getJob_level_code() );   			// 직급
			
			s_member_join.setCompany_code_post( member_join.getCompany_code_post() );   	// 근무처 주소 우편
			s_member_join.setCompany_add( member_join.getCompany_add() );  					// 주소1
			s_member_join.setCompany_add_detail( member_join.getCompany_add_detail() );   	// 주소2
			s_member_join.setCompany_tel( member_join.getCompany_tel() );   				// 근무처 전화번호
			
			s_member_join.setCode_place( member_join.getCode_place() );   					// 우편물 수신처
			s_member_join.setCode_call( member_join.getCode_call() );   					// 수취인 호칭
			s_member_join.setRecommender( member_join.getRecommender() );   				// 추천인 성명
			s_member_join.setRecm_division( member_join.getRecm_division() );   			// 근무처명
			s_member_join.setRecm_hp( member_join.getRecm_hp() );   						// 휴대폰
			
			
			s_member_join.setTrust_code( member_join.getTrust_code() );   						// 위탁업체코드
			s_member_join.setTrust_name( member_join.getTrust_name() );   						// 위탁업체명
			s_member_join.setTrust_tel( member_join.getTrust_tel() );   						// 위탁업체전화 
			s_member_join.setTrust_addr( member_join.getTrust_addr() );   						// 위탁업체휴대폰
		
			
			
			log.info("member_join_step3_1★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
			log.info(s_member_join);
			log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
			
		}				
		
		return redirect;
	}
	
	@RequestMapping("member_join_step4")
	public String member_join_step4(  @ModelAttribute("memberJoin") MEMBER_JOIN member_join
									, HttpSession session
									, Model model ) throws Exception {
		
		if( member_join == null ) {
			session.setAttribute(SessionInfo.MEMBER_JOIN, null);
			model.addAttribute("msg", "올바르지 않은 접속입니다");
			model.addAttribute("script", "location.href='/';");
			return "common/script";
		}
		
		MEMBER_JOIN s_member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);		
		
		String redirect = "";
		if ( s_member_join == null )
			redirect = "tiles" + "/member/km_join";
		else {						
			redirect = "tiles" + "/member/km_join_step4";
			
			s_member_join.setCode_part( member_join.getCode_part() );						// 근무처분류1
			s_member_join.setCode_great( member_join.getCode_great() );						// 근무처분류2
			s_member_join.setCode_small( member_join.getCode_small() );						// 근무처분류3
			
			s_member_join.setCode_big(  member_join.getCode_great()); //근무처대분류와 소속분과 코드 동일
			
			s_member_join.setCode_use( member_join.getCode_use() );							// 운영형태
			s_member_join.setTrust_name( member_join.getTrust_name() );						// 위탁업체-업체명
			s_member_join.setTrust_tel( member_join.getTrust_tel() );						// 위탁업체-연락처
			s_member_join.setTrust_addr( member_join.getTrust_addr() );						// 위탁업체-주소
			s_member_join.setCompany_meal( member_join.getCompany_meal() );					// 1식 재료비
			s_member_join.setCompany_sick_bad( member_join.getCompany_sick_bad() );			// 허가병상
			s_member_join.setCompany_count_mom( member_join.getCompany_count_mom() );		// 1일 급식인원-아침
			s_member_join.setCompany_count_lunch( member_join.getCompany_count_lunch() );	// 1일 급식인원-점심
			s_member_join.setCompany_count_dinner( member_join.getCompany_count_dinner() );	// 1일 급식인원-저녁
			s_member_join.setCompany_count_midnig( member_join.getCompany_count_midnig() );	// 1일 급식인원-야식
			s_member_join.setJoin_con( member_join.getJoin_con() );							// 공동여부-공동관리
			s_member_join.setJoin_cook( member_join.getJoin_cook() );						// 공동여부-공동조리
			s_member_join.setPers_multy( member_join.getPers_multy() );						// 겸직여부yn			
			s_member_join.setLic_pay( member_join.getLic_pay() );							// 영양사면허수당
			s_member_join.setYear_pay( member_join.getYear_pay() );							// 연봉
			
			s_member_join.setCode_scholar( member_join.getCode_scholar() );					// 최종학력
			s_member_join.setCode_scholar( member_join.getCode_scholar() );					// 학위
			s_member_join.setCode_school( member_join.getCode_school() );					// 출신학교
			s_member_join.setCertifi_view( member_join.getCertifi_view() +	member_join.getCertifi_view2()
					+ member_join.getCertifi_view3() + member_join.getCertifi_view4() 
					+ member_join.getCertifi_view5());										// 자격증 종류
			s_member_join.setPers_career( member_join.getPers_career() );					// 경력
			s_member_join.setCode_sub( member_join.getCode_sub() );							// 산하단체/분야회	
			
		}
		
		return redirect;
	}
	
	@RequestMapping(value="member_join_insert", method=RequestMethod.POST)
	public String member_join_insert(  @ModelAttribute("memberJoin") MEMBER_JOIN member_join
									, HttpSession session
									, Model model )  throws Exception {	
		MEMBER_JOIN s_member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
		if( member_join == null || s_member_join == null ) {
			session.setAttribute(SessionInfo.MEMBER_JOIN, null);
			model.addAttribute("msg", "올바르지 않은 접속입니다");
			model.addAttribute("script", "location.href='/member/km_join.do';");
			return "common/script";
		}
		
		s_member_join.setCode_pay_flag( member_join.getCode_pay_flag() );		// 입금방법 코드			
		s_member_join.setCode_bran( member_join.getCode_bran() );				// 지부 코드	
		s_member_join.setSum_dues(service.getSumDues(s_member_join.getCode_member(), s_member_join.getCode_bran()));
	
		if ( s_member_join.getCode_pay_flag().equals("15"))  { //cms
			//함수셋팅 안한 것들은 테이블에 컬럼이 없는 것들!!
			//s_member_join.set( member_join.get() );				// 신청인명
			//s_member_join.set( member_join.get() );				// 예금주와의 관계
			s_member_join.setCode_bran( member_join.getCode_bran() );					// 신청인 소속지부
			s_member_join.setDues_gubun("4");                           // CMS 회원
			//s_member_join.set( member_join.get() );					// 신청인 영양사면허번호
			s_member_join.setCMS_pers_tel( member_join.getCMS_pers_tel() );				// 신청인 연락처
			s_member_join.setCMS_pers_hp( member_join.getCMS_pers_hp() );				// 신청인 휴대번호
			//s_member_join.set( member_join.get() );									// 신청인 근무처명
			//s_member_join.set( member_join.get() );									// 신청인 이메일
			//s_member_join.set( member_join.get() );									// 신청인 주소
			s_member_join.setCMS_dues( member_join.getCMS_dues() );						// 월 납부금액-기존회원       
			s_member_join.setCMS_auth_start( member_join.getCMS_auth_start() );			// 월 납부금액-신규금액-최초 1년간
			s_member_join.setCMS_auth_end( member_join.getCMS_auth_end() );				// 월 납부금액-신규금액-1년 이후 
			s_member_join.setCMS_date( member_join.getCMS_date() );						// 납부일
			s_member_join.setCMS_bank( member_join.getCMS_bank() );						// 출급계좌 금융기관명
			s_member_join.setCMS_acount( member_join.getCMS_acount() );					// 출금 계좌번호
			s_member_join.setCMS_name( member_join.getCMS_name() );						// 출금계좌 예금주명
			s_member_join.setCMS_birth( member_join.getCMS_birth() );					// 예금주 생년월일
			s_member_join.setCMS_pers_tel( member_join.getCMS_pers_tel() );				// 예금주 연락처
			s_member_join.setCMS_pers_hp( member_join.getCMS_pers_hp() );				// 예금주 휴대전화
			s_member_join.setCMS_agree_YN( member_join.getCMS_agree_YN() );				// 개인정보 수집 동의
			s_member_join.setCMS_agree_other_yn( member_join.getCMS_agree_other_yn() );	// 개인정보 제3자 수집 동의
		}
		
		String code_pers = null;	
		if ( (code_pers = service.insertMember(s_member_join)) == null ) {
			session.setAttribute(SessionInfo.MEMBER_JOIN, null);
			model.addAttribute("msg", "회원가입이 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
			model.addAttribute("script", "location.href='/member/km_join.do';");
			return "common/script";
		} else {
			service.sendMemberMail(s_member_join);
		}	
		session.setAttribute(SessionInfo.MEMBER_JOIN, null);
		return "redirect:/member/km_join_step6_ok.do?code_pers=" + code_pers;
	}
	
	@RequestMapping("/member/km_join_step6_ok.do")
	public String member_join_ok(@RequestParam String code_pers, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		// 혹시 몰라서 다시 한변 NULL 처리
		session.setAttribute(SessionInfo.MEMBER_JOIN, null);
		PERSON_M_TBL person = service.getPersonMTblByCode(code_pers, true);
		List<Map> duesList = service.getPersonDuesList(code_pers);
		if( duesList != null && duesList.size() > 0 ) {
			Map dues = duesList.get(0);
			person.setCode_pay_flag((String)dues.get("code_pay_flag"));
			person.setCode_pay_name((String)dues.get("pf_name"));
			person.setSum_dues((int)dues.get("pres_money") );
		}
		model.addAttribute("person", person);
		return "tiles/member/km_join_step6_ok";
	}
	
	@RequestMapping("member_reentrance")
	public String member_reentrance(  @ModelAttribute("memberJoin") MEMBER_JOIN member_join
									, HttpSession session
									, Model model )  throws Exception
	{	
		MEMBER_JOIN s_member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
		
		s_member_join.setCode_pay_flag( member_join.getCode_pay_flag() );		// 입금방법 코드			
		s_member_join.setCode_bran( member_join.getCode_bran() );				// 지부 코드	
		
		//s_member_join.setSum_dues(service.getSumDues(member_join.getCode_member(), s_member_join.getCode_bran()));
		
		String redirect = "";
		if ( s_member_join == null ){
			redirect = "redirect:/member/km_join.do";
		} else {
							
			if(s_member_join.getCode_pay_flag().equals("10")){ // 무통장 입금 or 평생회원
				
				redirect = "tiles" + "/member/km_join_step6_ok"; //입금 및 확인 > 소속시도영양사회 지회 선택(m_check05)
				
			}else if(s_member_join.getCode_pay_flag().equals("15")){ //cms
				
				//redirect = member_join_step4_cms(s_member_join, session, model);
				
			}else if(s_member_join.getCode_pay_flag().equals("60")){ //지로입금
					
				redirect = "tiles" + "/member/km_join_step6_ok";
			}
			service.insertReentrance(s_member_join);
		}
		return redirect;
	}


	@RequestMapping("member_dues_bran")
	public void member_dues_bran( @RequestParam(required=false) String code_bran ,@RequestParam(required=false, defaultValue="") String pay, 
			HttpServletResponse response , Model model ) throws Exception {
		
		String selected ="";
		String options = "";		
		try  {
			List<DUES>  duesList = dao.getDuesBranList(code_bran);
	    	for(DUES row : duesList){				
				if(SessionInfo.CODE_MEMBER.equals(row.getCode_member())){
						selected = "selected";
				}
				int code_member = KdaStringUtil.nullToInt(row.getCode_member(), 0);
				if( code_member >= 80  ) {
					options += "<option value='"+ row.getCode_member() +"'" + selected + ">"
						  + row.getDetcodename() + " ("+ row.getTempcd3() + ")" + " ￦  " + "" + row.getSum_dues() +  "</option>";
				}
			}
	    	
	    	 if( ! pay.equals("card") ) { 
	    		 options += "<option value=\"07\">학생회원 (학생회원) ￦  20,000</option>";
	    	 }
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(options);  
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	
	@RequestMapping("getTrustCompanyList")	
	public String  getTrustCompanyList( @RequestParam(required=false) String ser_keyword			
									  , HttpServletResponse response, Model model  ) throws Exception {
		try{
			if( !KdaStringUtil.isEmpty(ser_keyword)) {
				List<TRUST_COMPANY>  list = null;
				list= dao.getTrustCompanyList(ser_keyword);	    	
				model.addAttribute("list", list);
			}
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
		
		return "trust_company";
	}
	
	@RequestMapping("insert_trust_company")	
	public View insert_trust_company( @RequestParam(required=false) String trust_name
									  , @RequestParam(required=false) String trust_tel			
									  ,	@RequestParam(required=false) String trust_post			
									  ,	@RequestParam(required=false) String trust_addr			
									  , HttpServletResponse response
									  , Model model  ) throws Exception {
		try 
	    {
			List<TRUST_COMPANY>  list = null;
			HashMap<String, String> paramMap = new HashMap<String, String>();
			
			paramMap.put("trust_name", trust_name);
			paramMap.put("trust_tel", trust_tel);
			paramMap.put("trust_post", trust_post);
			paramMap.put("trust_addr", trust_addr);
			
	    	dao.insert_trust_company(paramMap);
	    	list= dao.getTrustCompanyList(trust_name);
		    model.addAttribute("list", list);
			
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("업체가 추가되었습니다");
		javaScript.setLocation("./getTrustCompanyList.do?ser_keyword=" + trust_name);
		return new JavaScriptView(javaScript);
	}
	
}
