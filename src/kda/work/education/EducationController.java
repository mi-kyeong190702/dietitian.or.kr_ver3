package kda.work.education;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.CommonController;
import kda.common.CommonService;
import kda.common.data.GROUPCODE;
import kda.common.data.LOCAL_ACC;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.mypage.MyPageHDao;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;
import kda.utils.ParamUtils;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_TEST_NAME;
import kda.work.education.data.PTB_EDUSCHEDULE;
import kda.work.publication.payment.data.CARD_PAYMENT;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.ss.formula.ptg.OperandPtg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("work/education")
public class EducationController extends KdaAbstractController {

	@Autowired
	private EducationService educationService;
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CommonController commonCotroller;
	
	@Autowired
	MyPageHDao myPageDao;	
	
	private Log log = LogFactory.getLog(EducationController.class);	
	
	@RequestMapping("ke_curriculum.do")
	public String initCurriculumPage(HttpSession session, Model model) throws Exception {
	
		if( checkLoingWithExpire(session)  ) {
			return "redirect:/work/education/ke_edu_list.do";
		} else {
			return "tiles/work/education/ke_edu_login";
		}
	}
	
	/**
	 * 교육과정 목록 ( 회원 및 교육생 교육신청 )
	 * 
	 * @param detcode
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_list.do")
	public String eduList( @RequestParam( defaultValue="", required=false) String detcode, HttpSession session, Model model) throws Exception {
		setDefaultModel(session, model);
		
		if( !checkLoingWithExpire(session)  ) {
			return "tiles/work/education/ke_edu_login";
		}
		
		String today = KdaStringUtil.getTodayString();
		String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
		
		List<GROUPCODE> departList = commonService.getGroupCodeList("034", null);
		
		model.addAttribute("departList", departList);
		
		Map paramMap = new HashMap();
		paramMap.put("today", today);
		paramMap.put("memberYn","Y");
		paramMap.put("codeBran", detcode);
		paramMap.put("personYn", codePers);
		List eduList = educationService.getEduTestNameList(paramMap);
		
		KE_EDU_OPERATOR operator = new KE_EDU_OPERATOR();
		operator.setPerson_yn((String)session.getAttribute(SessionInfo.CODE_PERS));
		model.addAttribute("operator", operator);
	
		model.addAttribute("eduList", eduList);
		
		return "tiles/work/education/ke_edu_list";
	}
	
	/**
	 * 교육 등록 Action
	 * 
	 * @param operator
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_reg_act.do")
	public View eduRegAct(KE_EDU_OPERATOR operator,  HttpSession session, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
	
		if( !checkLoingWithExpire(session)  ) {
			javaScript.setMessage("회원 또는 교육생만 신청 가능합니다.");
			javaScript.setLocation("ke_edu_login.do");
			return new JavaScriptView(javaScript);
		}
		
		String codePers = getCodePers(session);
		operator.setPerson_yn(codePers);
		
		int dupCount =  educationService.getEduDupCount(operator);
		if( dupCount > 0 ) {
			javaScript.setMessage("이미 신청한 교육입니다. 다시 확인 하세요.");
			javaScript.setLocation("ke_edu_list.do");
			return new JavaScriptView(javaScript);
		}
		
		HashMap<String, Integer> countMap = educationService.getOperatorLimitPersCnt(operator);
		int receiptPersCnt =  countMap.get("receipt_pers_cnt");
		int operCnt = countMap.get("oper_cnt");
		if( operCnt >= receiptPersCnt ) {
			javaScript.setMessage("접수인원이 초과되어 접수가 마감됐습니다.");
			javaScript.setLocation("ke_edu_list.do");
			return new JavaScriptView(javaScript);
		}
		
		educationService.regOperator(operator);
		
		String pay_appid =  operator.getCode_kind() + operator.getCode_certifi() + operator.getCode_seq() + operator.getCode_bran() + operator.getBran_seq() + operator.getReceipt_no();
		
		javaScript.setMessage("교육신청이 완료 되었습니다.\\n\\n개인정보 및 결제정보 확인을 위한 페이지로 이동합니다.");
		javaScript.setLocation("ke_edu_pay_select.do?pay_appid=" + pay_appid);
		return new JavaScriptView(javaScript);
	}
	
	/**
	 * 교육 신청 결재 방법 선택(공용)
	 * 
	 * @param pay_appid
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_pay_select.do")
	public String paySelectFrom(@RequestParam String pay_appid, HttpSession session,  Model model ) 
			throws Exception {
		
		setDefaultModel(session, model);	
		if( !checkLoingWithExpire(session)  ) {
			return getHistoryBackPage("회원 또는 교육생만 신청 가능합니다.", model);
		}
	
		KE_EDU_OPERATOR operator = educationService.getOperator(null, getCodePers(session), "01", pay_appid);
		if( operator == null ) {
			return getHistoryBackPage("신청하신 내역이 없습니다.\\n확인 후 다시 시도하여 주십시요", model);
		}
		
		String cardBran = getCardBran(operator.getCode_bran());
		
		String eduId = pay_appid.substring(0, 11);
		KE_EDU_TEST_NAME testName = educationService.getEduTestName(eduId);
		
		LOCAL_ACC localAcc = KdaUtil.getLocalAcc(testName.getCode_bran());
	
		
		model.addAttribute("localAcc", localAcc);
		model.addAttribute("testName", testName);
		model.addAttribute("operator", operator);
		model.addAttribute("cardBran", cardBran);
		
		return "tiles/work/education/ke_edu_pay_select";	
	}
	
	/**
	 * 교육신청 결재방법 저장
	 * 
	 * @param operator
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_pay_action.do")
	public String payAction(KE_EDU_OPERATOR operator, HttpSession session, Model model) 
			throws Exception {
		setDefaultModel(session, model);
		// "-" Replace
		operator.setDeposit_due_date( operator.getDeposit_due_date().replaceAll("-", "") );
		
		educationService.updateOperator(operator);
		return "redirect:ke_edu_pay_view.do?pay_appid=" + operator.getOper_key();
	}
	
	/**
	 * 카드 교육비 결재
	 * 
	 * @param card
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_pay_card_action.do")
	public String payCardAction(CARD_PAYMENT cardPayment, HttpSession session, Model model) 
			throws Exception {
		setDefaultModel(session, model);
		
		KE_EDU_OPERATOR operator = new KE_EDU_OPERATOR();
		operator.setOper_key( cardPayment.getGoods_code_num() );
		operator.setUpdate_kind("pay");
		operator.setCode_pay_flag("20");
		educationService.updateOperator(operator);
		
		return commonCotroller.chkPlugIn("education", cardPayment, session, model);
	
	}
	
	/**
	 * 교육신청 취소 처리
	 * 
	 * @param operKey
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_pay_cancel.do")
	public View cancelAction( @RequestParam String operKey,  HttpSession session, Model model ) throws Exception {
		setDefaultModel(session, model);	
		if( !checkLoingWithExpire(session)  ) {
			return getHistoryBackView("회원 또는 교육생만 신청 가능합니다.");
		}
		
		String codePers = getCodePers(session);
		KE_EDU_OPERATOR operator = educationService.getOperator(null, codePers, "01", operKey);
		if( !operator.getPerson_yn().equals(codePers) ) { 
			return getHistoryBackView("잘못된 접속입니다.");
		}
		operator.setUpdate_kind("cancel");
		operator.setOper_key(operKey);
		educationService.updateOperator(operator);
		
		
		String msg = "신청한 교육이 최소되었습니다. \\n" +
			 	 	 "교육비를 결제하신 분께서는 \\n" +
			 	 	 "아래의 문의처로 연락주시기 바랍니다. \\n\\n" +
			 	 	 "[문의처] 대한영양사협회 교육국 Tel. 02-823-5680 (내선 514, 513)";
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage(msg);
		javaScript.setLocation("/work/education/ke_situation.do");
		return new JavaScriptView(javaScript);
	}
		
	
	/**
	 * 교육신청 결재 상세보기
	 * 
	 * @param pay_appid
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_edu_pay_view.do")
	public String payView(@RequestParam String pay_appid, HttpSession session, Model model) 
			throws Exception {
		setDefaultModel(session, model);
		
		String codePers = getCodePers(session);
		KE_EDU_OPERATOR operator = educationService.getOperator(null, codePers, "01", pay_appid);
		if( !operator.getPerson_yn().equals(codePers) ) { 
			return getHistoryBackPage("잘못된 접속입니다.", model);
		}
		LOCAL_ACC localAcc = KdaUtil.getLocalAcc(operator.getCode_bran());
		model.addAttribute("localAcc", localAcc);
		model.addAttribute("operator", operator);
		return "tiles/work/education/ke_edu_pay_view";
	}
	


	
	/**
	 * 교육 신청 목록 조회
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_situation.do")
	public String operatorList(HttpSession session, Model model) throws Exception {
		setDefaultModel(session, model);
		if( !checkLoingWithExpire(session) ) {
			return "redirect:/work/education/ke_edu_login.do";
		}
		
		String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
		String year = KdaStringUtil.getTodayString().substring(0, 4);
		
		List<KE_EDU_OPERATOR> operatorList = educationService.getOperatorList(year, codePers, "01");
		model.addAttribute("operatorList", operatorList);
		model.addAttribute("today", KdaStringUtil.getTodayString());
		
		return "tiles/work/education/ke_situation";
	}
	
	/**
	 * 마이페이지 교육 현황 목록 조회
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_mySituation.do")
	public String myOperatorList(HttpSession session, Model model) throws Exception {
		setDefaultModel(session, model);
		if( !checkLoingWithExpire(session) ) {
			return "redirect:/work/education/ke_edu_login.do";
		}
		
		String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
		String year = KdaStringUtil.getTodayString().substring(0, 4);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();	
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );		
		model.addAttribute("myList" , myPageDao.getMyEduSituation(paramMap));	
		return "tiles/work/education/ke_mySituation";
	}
	
	
	@RequestMapping("situation_print")	
	public String rcp_print(HttpSession session, Model model
			 					, @RequestParam(required=false) String person_yn
			 					, @RequestParam(required=false) String operkey 
			 					, @RequestParam(required=false , defaultValue = "true"
			 					) String isMember
			 					, @RequestParam(required=false) String rating) throws Exception
	{
		 
		setDefaultModel(session, model);
		if( !checkLoingWithExpire(session) ) {
			return "redirect:/work/education/ke_edu_login.do";
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		if (!"Y".equals(rating) && "N".equals(rating)) {
		    rating = null;  
		}
		
		paramMap.put("rating", rating);
		paramMap.put("person_yn", person_yn );
		paramMap.put("operkey", operkey );
		paramMap.put("isMember", isMember.toUpperCase() );
	 	 
		model.addAttribute("DocuInfo" , myPageDao.getSituation_print(paramMap));   
		 
		return  "print/rcp_situation_print";
	} 
	
	/**
	 * 
	 * 교육 개설 신청 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_open_request.do")
	public String openRequest(@RequestParam String edu_name, HttpSession session, Model model) throws Exception {
		String tmp = "";
		
		if( !checkLogin(session) ) {
			model.addAttribute("errorMsg", "로그인 후 이용가능 합니다");
			return getHistoryBackPage("로그인 후 이용가능 합니다", model);
		}
		
		model.addAttribute("name", session.getAttribute(SessionInfo.PERS_NAME));
		model.addAttribute("pers_birth", session.getAttribute(SessionInfo.PERS_BIRTH));
		model.addAttribute("lic_no", session.getAttribute(SessionInfo.LIC_NO));
		model.addAttribute("pers_hp", session.getAttribute(SessionInfo.PERS_HP));
		model.addAttribute("email", session.getAttribute(SessionInfo.EMAIL));
		
		String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
		PERSON_M_TBL person = memberService.getPersonMTblByCode(codePers, true);
		
		List<GROUPCODE> departList = commonService.getGroupCodeList("007", null);
		for(GROUPCODE row : departList){				
			if(person.getCode_bran().equals(row.getDetcode())){
				model.addAttribute("bran_name", row.getDetcodename());
			}
		}
		
		departList = commonService.getGroupCodeList("004", null);
		for(GROUPCODE row : departList){				
			if(person.getCode_big().equals(row.getDetcode())){
				model.addAttribute("big_name", row.getDetcodename());
			}
		}
		
		model.addAttribute("company_name", person.getCompany_name());
		if ( edu_name.equals("elderly") ) {
			tmp = "시니어푸드코디네이터(등록민간자격 발급과정)";
		} else if ( edu_name.equals("sport") ) {
			tmp = "다이어트운동컨설턴트(등록민간자격 발급과정)";
		} else if ( edu_name.equals("pet") ) {
			tmp = "반려동물영양관리사(등록민간자격 발급과정)";
		} else if ( edu_name.equals("health") ) {
			tmp = "의료기관 인증조사 준비 비법노트";
		} else if ( edu_name.equals("coach") ) {
			tmp = "식습관코치";
		} else if ( edu_name.equals("kid") ) {
			tmp = "아동요리지도";
		} else if ( edu_name.equals("cookie") ) {
			tmp = "쿠키클레이";
		} else if ( edu_name.equals("yofer") ) {
			tmp = "요퍼먼스지도자";
		}
		
		model.addAttribute("edu_name", tmp);
		
		return "tiles/work/education/ke_open_request";
 	}
	
	
	/**
	 * 교육 개설 신청 완료 페이지
	 * 
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_open_request_action.do")
	public View openRequestAction( HttpServletRequest request, HttpSession session, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
		
		if( !checkLogin(session) ) {
			javaScript.setMessage("로그인 후 이용가능 합니다");
			javaScript.setMethod("window.history.back()");
			return new JavaScriptView(javaScript);
		}	

		Map paramMap = ParamUtils.getParamMap(request);
		paramMap.put("regi_date", KdaStringUtil.getTodayString());
		paramMap.put("regi_time", KdaStringUtil.getCurrentTime());
		educationService.insertEduEstablishment(paramMap);
		
		String tmp = paramMap.get("edu_type_text").toString();
		
		javaScript.setMessage("개설 신청이 완료되었습니다");
		
		if ( tmp.equals("시니어푸드코디네이터(민간자격 발급과정)") ) {
			javaScript.setLocation("ke_elderly_info.do");
		} else if ( tmp.equals("다이어트운동컨설턴트(민간자격 발급과정)") ) {
			javaScript.setLocation("ke_sport_info.do");
		} else if ( tmp.equals("의료기관 인증조사 준비 비법노트") ) {
			javaScript.setLocation("ke_health_info.do");
		} else if ( tmp.equals("식습관코치") ) {
			javaScript.setLocation("ke_coach_info.do");
		} else if ( tmp.equals("아동요리지도") ) {
			javaScript.setLocation("ke_kidscooking_info.do");
		} else if ( tmp.equals("쿠키클레이") ) {
			javaScript.setLocation("ke_cookieclayleader_info.do");
		} else if ( tmp.equals("요퍼먼스지도자") ) {
			javaScript.setLocation("ke_yofermense_info.do");
		} else {
			javaScript.setLocation("ke_elderly_info.do");
		}
		
		return new JavaScriptView(javaScript);
	}

	/**
	 * 교육 일정표
	 * 
	 * @param session
	 * @param model
	 * @param yy
	 * @param mm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_schedule.do")
	public String ke_schedule(HttpSession session, Model model, String yy, String mm) throws Exception {

		Calendar cal = Calendar.getInstance(); 
		if ( yy == null ) 
			yy = "" + cal.get(Calendar.YEAR);
		
		if ( mm == null ) 
			mm = "" + ( cal.get(Calendar.MONTH) + 1 );
		
		if ( mm.length() == 1 ) {
			mm = "0" + mm;
		}
		
		model.addAttribute("ilyear", yy);
		model.addAttribute("ilmonth", mm);
		model.addAttribute("list", educationService.get_eduschedule_list(yy, mm));
	
		return "tiles/work/education/ke_schedule";
	}
	
	@RequestMapping("ke_schedule_detail.do")
	public String ke_schedule_detail(HttpSession session, Model model, String yy, String mm, @RequestParam int ilindex) throws Exception {

		Calendar cal = Calendar.getInstance(); 
		if ( yy == null ) 
			yy = "" + cal.get(Calendar.YEAR);
		
		if ( mm == null ) 
			mm = "" + ( cal.get(Calendar.MONTH) + 1 );
		
		if ( mm.length() == 1 ) {
			mm = "0" + mm;
		}
	
		model.addAttribute("ilyear", yy);
		model.addAttribute("ilmonth", mm);
		model.addAttribute("list", educationService.get_eduschedule_list(yy, mm));
		model.addAttribute("detail", educationService.get_eduschedule_detail(ilindex));
	
		return "tiles/work/education/ke_schedule_detail";
	}
	@RequestMapping("ke_schedule_form.do")
	public String eduscheduleForm(@RequestParam (required=false, defaultValue="0") int  ilindex,
				HttpSession session, Model model  ) 
			throws Exception {
		PTB_EDUSCHEDULE eduschedule =  null;
		if( ilindex == 0 ) {
			eduschedule = new PTB_EDUSCHEDULE();
			eduschedule.setIlyear( KdaStringUtil.getYear() );
			eduschedule.setIlmonth( KdaStringUtil.getMonth() );
			eduschedule.setIlday( KdaStringUtil.getDay() );
		} else {
			eduschedule = educationService.get_eduschedule_detail(ilindex);
		}
		model.addAttribute("schedule", eduschedule);
		return "tiles/work/education/ke_schedule_form";
	}
	
	@RequestMapping("ke_schedule_form_action.do")
	public View eduscheduleAction(PTB_EDUSCHEDULE schedule, @RequestParam (required=false, defaultValue="0") int  method,  HttpSession session, Model model ) 
			throws Exception {
		String param = "yy="+ schedule.getIlyear() + "&mm=" + schedule.getIlmonth();
		
		JavaScript javaScript = new JavaScript();
		if( method > 0  ) {
			educationService.delete_eduschedule(method);
			javaScript.setMessage("삭제 되었습니다");
			javaScript.setLocation("ke_schedule.do" );
			return new JavaScriptView(javaScript);
		}
		
		if( schedule.getIlindex() == 0 ) {
			educationService.insert_eduschedule(schedule);
			javaScript.setMessage("입력 되었습니다");
			javaScript.setLocation("ke_schedule.do?" + param );
			return new JavaScriptView(javaScript);
		} else {
			educationService.update_eduschedule(schedule);
			javaScript.setMessage("수정 되었습니다");
			javaScript.setLocation("ke_schedule.do?"  + param );
			return new JavaScriptView(javaScript);
		}
		
	}
	
	
	private String getCardBran(String codeBran) {
		if( codeBran.equals("00") || codeBran.equals("01") ) 
			return "0";
		else if( codeBran.equals("02") )
			return "10";
		else if( codeBran.equals("03") )
			return "20";
		else if( codeBran.equals("04") )
			return "30";
		else if( codeBran.equals("05") )
			return "40";
		else if( codeBran.equals("06") )
			return "50";
		else if( codeBran.equals("07") )
			return "60";
		else if( codeBran.equals("08") )
			return "70";
		else if( codeBran.equals("09") )
			return "80";
		else if( codeBran.equals("10") )
			return "90";
		else if( codeBran.equals("11") )
			return "100";
		else if( codeBran.equals("12") )
			return "110";
		else if( codeBran.equals("13") )
			return "120";
		else if( codeBran.equals("14") )
			return "130";
		else 
			return "0";
	}
	
	
	@RequestMapping("ke_training_list.do")
	public String TrnList( @RequestParam( defaultValue="", required=false) String detcode, HttpSession session, Model model) throws Exception {
		setDefaultModel(session, model);
		
		if( !checkLoingWithExpire(session)  ) {
			return "tiles/work/education/ke_edu_login";
		} 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();	 
		
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );		
		model.addAttribute("myList" , myPageDao.getMyEduSituation(paramMap));	
		
		 
		return "tiles/work/education/ke_training_list";
	}
	
}
