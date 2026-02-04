package kda.work.education;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.common.CommonController;
import kda.common.FileUploadService;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.ParamUtils;
import kda.values.CRUDValue;
import kda.work.education.data.KE_EDU_GREEN;
import kda.work.education.data.KE_EDU_MEETING;
import kda.work.education.data.KE_EDU_MEETING_DEL;
import kda.work.publication.payment.data.CARD_PAYMENT;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

@Controller
public class EducationMeetingController extends KdaAbstractController {
	
    @SuppressWarnings("rawtypes")
	
    public static final HashMap DEPARTS = new LinkedHashMap() {
    	{
	    	put("", "선택하세요");
	    	put("영양교사", "영양교사");
	    	put("학교영양사", "학교영양사");
	        put("산업체", "산업체");
	        put("병원", "병원");
	        put("보건복지시설", "보건복지시설");
	        put("건강상담", "건강상담");
	        put("어린이급식관리지원센터", "어린이급식관리지원센터");
	        put("기타", "기타");
    	}
	};
	
	@Autowired
	private CommonController commonController;
	
	@Autowired
	private EducationService educationService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileUploadService uploadService;
	
	@Autowired
	private ServletContext servietContext;
	
	@RequestMapping("work/education/ke_receipt_application.do")
	public String initMeeting( HttpServletRequest request, HttpSession session, Model model) throws Exception {
		// 날짜 체크
		int iCurDay = Integer.parseInt(KdaStringUtil.getTodayString());
		System.out.println(iCurDay);

		// 1차 사전등록 시작일 ~ 2차 사전등록 종료일
		//if( iCurDay >= 20200506 && iCurDay <= 20200724 )	// 개발 서버에서 test 가능하도록 날짜 수정 
		//if( iCurDay >= 20200511 && iCurDay <= 20200807 ) {
		//2024.05.01 기간 변경
		//2025.05.12 기간 변경
		if( iCurDay >= 20250512 && iCurDay < 20250726 ) {
			// 개인정보 동의 체크
			if( !checkLogin(session) && KdaStringUtil.isEmpty(request.getParameter("accept")) ) {
				return "tiles/work/education/ke_receipt_application_agree";
			} else {
				KE_EDU_MEETING meeting = new KE_EDU_MEETING();
				if ( !checkLogin(session)  ){
					meeting.setMember_flag("0"); // 비회원
				} else {
					// 회원정보 동의
					PERSON_M_TBL person = memberService.getPersonMTblByCode(getCodePers(session), true);
					if( person != null ) {
						meeting.setMember_flag("1"); // 회원
						meeting.setName( person.getPers_name() );
						meeting.setBirth( person.getPers_birth());
						meeting.setLic_no( person.getLic_no());
						meeting.setOffice_name( person.getCompany_name());
						meeting.setTel( person.getPers_tel());
						meeting.setTel_hp( person.getPers_hp());
						meeting.setBranch_name(" "); // TODO : BRANCH NAME SET
						String email = "";
						if (request.getParameter("agree_yn") == "Y"){
					          meeting.setAgree_yn("y");
						} else {
					          meeting.setAgree_yn("n");
					    }
						if( person.getCode_email_comp().equals("01") ) {
							email = person.getEmail();
						} else {
							email = person.getEmail() + "@" + person.getCode_email_comp();
						}
						meeting.setZip(person.getCode_post());
						meeting.setEmail( email );
						String addr = person.getCompany_add() + " " + person.getCompany_add_detail();
						meeting.setAddr(addr);
					}
				}
				meeting.setGtype("a");
				meeting.setPay_flag("B");
				
				model.addAttribute("departs", DEPARTS);
				model.addAttribute("meeting", meeting);
				return "tiles/work/education/ke_receipt_application";
			}
		} else {
			model.addAttribute("limit", "예약등록이 마감되었습니다.");
			return "tiles/work/education/ke_receipt_application";
		}
	}
	
	@RequestMapping("work/education/ke_receipt_application_action.do")
	public String regMeeting(KE_EDU_MEETING meeting, HttpSession session, Model model) throws Exception {
		int count = educationService.getMeetingCount(meeting);
		if( count == 0  ) {
			meeting.convertValue();
			System.out.println("meeting====>"+meeting);
			meeting = educationService.insertMeeting(meeting);
				
			if( meeting.getPay_flag().equals("C") ) {
				CARD_PAYMENT cardPayment = new CARD_PAYMENT();
			
				cardPayment.setService_kind(CARD_PAYMENT.PAY_MEETING_KIND);
				cardPayment.setO_gubun("STUDY_REA");
				cardPayment.setGood_name("전국영양사학술대회");
				cardPayment.setGood_mny(meeting.getPay_amount()); // 결재금액
				cardPayment.setBuyr_name(meeting.getName());
				cardPayment.setBuyr_tel1(meeting.getTel());
				cardPayment.setBuyr_tel2(meeting.getTel_hp());
				cardPayment.setBuyr_mail(meeting.getEmail());
				cardPayment.setPers_birth(meeting.getBirth());
				cardPayment.setUser_id((String)session.getAttribute(SessionInfo.USER_ID)  );
				cardPayment.setCode_bran("0");
				cardPayment.setGoods_code_num(meeting.getIdx());
				
				System.out.println( cardPayment );
				
				return commonController.chkPlugIn("education", cardPayment, session, model);
			}
		
		} else {
			model.addAttribute("error", "이미 신청하셨습니다.");
		}
		return "/work/education/ke_receipt_application_result";
	}
	
	/**
	 * -ver2 : sub3_07_04_4.asp
	 */
	/**
	 * 학술대회 신청 취소 화면
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("work/education/ke_receipt_cancel.do")
	public String cancelMeeting(HttpSession session, Model model) throws Exception {
		
		setDefaultModel(session, model);
		
		KE_EDU_MEETING_DEL meetingDel = new KE_EDU_MEETING_DEL();
		
		meetingDel.setIpgum_bambup("무통장입금");
		model.addAttribute("meetingDel", meetingDel);
	
		return "tiles/work/education/ke_receipt_cancel";
	}
	
	/**
	 * 
	 * 학술대회 신청 처리 Action
	 * 
	 * @param cancel
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("work/education/ke_receipt_cancel_action.do")
	public View cancelMeetingAction(KE_EDU_MEETING_DEL cancel, HttpServletRequest request, Model model) throws Exception {

		if( cancel.getDel_date01().equals("1") && cancel.getDel_date02().equals("1") ){
			cancel.setDel_date("2025년 7월 24일(목), 2025년 7월 25일(금)");
		} else if( cancel.getDel_date01().equals("1") ) {
			cancel.setDel_date("2025년 7월 24일(목)");
		} else if(cancel.getDel_date02().equals("1") ) {
			cancel.setDel_date("2025년 7월 25일(금)");
		}
		cancel.setIn_paydate(cancel.getIn_paydate().replaceAll("-", ""));
		educationService.insertMeetingCancel(cancel);
	
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("취소 신청이 완료 되었습니다. 관리자 확인 후 승인 처리 됩니다.");
		javaScript.setLocation("./ke_receipt.do");
		
		return new JavaScriptView(javaScript);
	}

	/**
	 * 초록논문 입력 화면
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("work/education/ke_green_online.do")
	public String eduGreenOnline(@RequestParam (required=false, defaultValue="") String idx, 
			HttpSession session, Model model) throws Exception {
		setDefaultModel(session, model);
		
		//논문초록관련 추가요청사항 (반영전) 18.07.05
		if(!checkLogin(session)){
			return "tiles"+"/login/kl_login_nor";
		} 
		else {
			KE_EDU_GREEN green = null;
			if( !KdaStringUtil.isEmpty(idx) ) {
				green = educationService.getGreen(idx);
				green.setCrud(CRUDValue.U);
			} else {
				green = new KE_EDU_GREEN();
				green.setCrud(CRUDValue.C);
			}
			 
			model.addAttribute("green", green );
			return "tiles/work/education/ke_green_online" ;
		}
	}
	
	@RequestMapping("work/education/ke_green_online_action.do")
	public View eduGreenOnlineAction(KE_EDU_GREEN green, Model model) throws Exception {
		MultipartFile addFile = green.getAdd_file();
		if( addFile == null && green.getCrud() == CRUDValue.C ) {
			return getHistoryBackView("첨부파일이 존재하지 않습니다.");
		}
		
		if( addFile.getSize() > 0  ) {
			String fileName = addFile.getOriginalFilename();
			if(fileName.endsWith(".wmv")){
				JavaScript javaScript = new JavaScript();
				javaScript.setMessage("잘못된 파일입니다.");
				javaScript.setLocation("./ke_green.do");
				return new JavaScriptView(javaScript);
			}
			green.setFile_flag(fileName);
			
			String uploadPath = servietContext.getRealPath(WorkData.UPLOAD_EUD_GREEN);
			
			String uploadName = uploadService.uploadFile(addFile, uploadPath, true);
			green.setFile_add( WorkData.UPLOAD_EUD_GREEN  + uploadName );
		}
		
		JavaScript javaScript = new JavaScript();
		switch(green.getCrud()){
		case C:
			educationService.insertEduGreen(green);
			javaScript.setMessage("신청 되었습니다.");
			javaScript.setLocation("./ke_green.do");
			break;
		case U:
			educationService.updateEduGreen(green);
			javaScript.setMessage("수정 되었습니다.");
			javaScript.setLocation("./ke_green.do");
			break;
		case D:
			educationService.deleteEduGreen(green);
			javaScript.setMessage("취소 되었습니다.");
			javaScript.setLocation("./ke_green.do");
			break;
		}
		
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("work/education/ke_green_list.do")
	public String eduGreenList(HttpServletRequest request, Model model) throws Exception {
		Map<String, String> reqMap = ParamUtils.getParamMap(request);
		
		List<KE_EDU_GREEN> greenList = educationService.getGreenList( reqMap.get("name"), reqMap.get("tel_hp"));
		model.addAttribute("greenList", greenList);
	
 		return "tiles/work/education/ke_green_list";
	}
	
	@RequestMapping("work/education/ke_ebook_action")
	public View eduMeetingList(HttpServletRequest request, Model model) throws Exception {
		Map<String, String> reqMap = ParamUtils.getParamMap(request);
		
		List<KE_EDU_MEETING> meetingList = educationService.getMeetingList( reqMap.get("name"), reqMap.get("tel_hp"), reqMap.get("birth"));
		
		JavaScript javaScript = new JavaScript();
		
		if (meetingList == null || meetingList.size() < 1) {
			javaScript.setMessage("e-Book 다운받기 대상 회원이 아닙니다.\\n이름 : " + reqMap.get("name") + "\\n핸드폰번호 : " + reqMap.get("tel_hp") + "\\n생년월일 : " + reqMap.get("birth"));
			javaScript.setLocation("./ke_ebook.do");
			
			return new JavaScriptView(javaScript);
		}else {
			String fileUrl = "";
			String fileName = "";
			
			if( meetingList.get(0).getJoin_flag().equals("1") ) {
				fileUrl = "/assets/ver2/edu/docu/2025/[대한영양사협회] 학술대회 1일차 교재★.pdf";
				fileName = "[대한영양사협회] 학술대회 1일차 교재★.pdf";
				
				//javaScript.setLocation("https://www.apub.kr/ebook/KDA/KDA_2024_1day/index.html#page=1");
			}else if( meetingList.get(0).getJoin_flag().equals("2") ) {
				fileUrl = "/assets/ver2/edu/docu/2025/[대한영양사협회] 학술대회 2일차 교재★.pdf";
				fileName = "[대한영양사협회] 학술대회 2일차 교재★.pdf";
				
				//javaScript.setLocation("https://www.apub.kr/ebook/KDA/KDA_2024_2day/index.html#page=1");
			}else{
				fileUrl = "/assets/ver2/edu/docu/2025/[대한영양사협회] 학술대회 1+2일차 교재★.pdf";
				fileName = "[대한영양사협회] 학술대회 1+2일차 교재★.pdf";
				
				//if (reqMap.get("dayOpt").equals("Y")) {
				//	javaScript.setLocation("https://www.apub.kr/ebook/KDA/KDA_2024_1day/index.html#page=1");
				//}else{
				//	javaScript.setLocation("https://www.apub.kr/ebook/KDA/KDA_2024_2day/index.html#page=1");
				//}
			}
			return new DownLoadView( fileUrl, fileName );
		}
		
		//return new JavaScriptView(javaScript);
	}
}
