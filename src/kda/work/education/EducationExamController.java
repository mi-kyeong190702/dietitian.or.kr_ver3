package kda.work.education;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.common.FileUploadService;
import kda.common.data.KDA_MAIL;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;
import kda.utils.MailBean;
import kda.utils.ParamUtils;
import kda.work.education.data.KE_EDU_CERTIFI;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_OPER_ADD_FILE;
import kda.work.education.data.KE_EDU_TEST_NAME;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("work/education")
public class EducationExamController extends KdaAbstractController {

	private Log log = LogFactory.getLog(EducationExamController.class);	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EducationService educationService;
	
	@Autowired
	private FileUploadService uploadService;
	
	@Autowired
	private ServletContext servletContext;
	
	/**
	 * [자격시험 신청]화면 생성
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_exam.do")
	public String initExam(HttpSession session, Model model ) throws Exception {
		if( !checkLogin(session)  ) {
			return goLocation("로그인이 필요합니다", "/login/kl_login_nor.do", model);
		} else {
			String codePers = (String)session.getAttribute(SessionInfo.CODE_PERS);
			PERSON_M_TBL person = memberService.getPersonMTblByCode(codePers, true);
			KE_EDU_OPERATOR oper = setOperator(person);
			
			model.addAttribute("operator", oper);
		}
		return "tiles/work/education/ke_exam";
	}
	
	
	
	/**
	 * [자격시험 신청] 지부 목록 Ajax
	 * 
	 * @param codeOperation
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="ke_ajax_code_bran.do")
	public @ResponseBody List ajaxCodeBran(@RequestParam String codeOperation) throws Exception {
		Map paramMap = new HashMap();
		paramMap.put("today", KdaStringUtil.getTodayString());
		List<Map>  branList = educationService.getEduTestBranList(paramMap);
		return branList;
	}
	
	/**
	 * [자격시험 신청] 시험 목록 Ajax
	 *   - VER2 Page : sub3_10_02.asp 
	 *   
	 * @param codeBran
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="ke_ajax_exam_list.do")
	public @ResponseBody List ajaxExamList(@RequestParam String codeBran, HttpSession session) throws Exception {
		
		log.debug("======회원 자격증 정보 조회================");
		String codePers = getCodePers(session);
		Map paramMap = new HashMap();
		paramMap.put("codePers", codePers);
		paramMap.put("avail", "Y");
		List<KE_EDU_CERTIFI> certifiList = educationService.getCerifiList(paramMap);
		
		
		log.debug("======시험 목록 조회================");
		
		paramMap = new HashMap();
		paramMap.put("today", KdaStringUtil.getTodayString());
		paramMap.put("examYn", "Y");
		paramMap.put("codeBran", codeBran);
		List<KE_EDU_TEST_NAME>  testNameList = educationService.getEduTestNameList(paramMap);
		List returnList = new ArrayList();
		
		String today = KdaStringUtil.getTodayString();
		String year = today.substring(0,4);
		Map dupParamMap = new HashMap();
		dupParamMap.put("codePers", codePers);
		dupParamMap.put("curYear", year);
		dupParamMap.put("today", today);
		
		for( KE_EDU_TEST_NAME testName : testNameList ) {
			String val = "0";
			
			log.debug("=========대상자격시험 종류============");
			log.debug(testName.getCode_kind());
			log.debug(testName.getCode_certifi());
			log.debug(testName.getCode_seq());
			log.debug(testName.getCode_bran());
			log.debug(testName.getBran_seq());
			
			log.debug("========= 종료 여부 확인 =============");
			if( testName.getOper_cnt() >= testName.getReceipt_pers_cnt() ){		
				val = "-1";
			} else {
				String eduTestKey =  testName.getCode_kind() + testName.getCode_certifi() + testName.getCode_seq()
									+ testName.getCode_bran() + testName.getBran_seq();
				String eduKey = eduTestKey + testName.getSeason();
				if( val.equals("0") ) {
					for( KE_EDU_CERTIFI certifi : certifiList ) {
						log.debug("===== 해당 자격증 소유 여부 확인 [ 소지자격 :" + certifi.getCode_certifi() + " 시험자격 : "  + testName.getCode_certifi());
						if( certifi.getCode_certifi().equals( testName.getCode_certifi() ) ) {
							val = "-3";
						} else {
			    			val = eduTestKey;
			    		}
					}
				}
				
				if( !val.equals("-3") ) {
					log.debug("========= 이미 해당 시험에 대한 신청여부 조회 =============");
					dupParamMap.put("codeKind", testName.getCode_kind());
					dupParamMap.put("codeCertifi", testName.getCode_certifi());
					dupParamMap.put("codeSeq", testName.getCode_seq());
					dupParamMap.put("season", testName.getSeason());
					dupParamMap.put("code_pers", getCodePers(session));
		    		int dupCount = educationService.getExamOperatorCount(dupParamMap);
		    		if( dupCount > 0 ) {
		    			val = "-2";
		    		} else {
		    			val = eduKey;
		    		}
				}
			}
			
			Map rtnMap = new HashMap();
			rtnMap.put("eduTestKey", val);
			rtnMap.put("testName", getExamName(testName,val));
			returnList.add(rtnMap);
		}
		return returnList;
	}
	
	@RequestMapping("ke_exam_upload_picture.do")
	public String uploadPicture( MultipartHttpServletRequest mRequest, HttpSession session, Model model) throws Exception {
		String path =  servletContext.getRealPath(WorkData.UPLOAD_EDU_TEMP);
		MultipartFile uploadImg = mRequest.getFile("upload_picture");
		String fileName = uploadService.uploadImage(uploadImg, path);
		String fileUrl =  WorkData.UPLOAD_EDU_TEMP + "/" + fileName;
		
		model.addAttribute("fileUrl", fileUrl);
		return "popup/img_proc";
	}
	
	/**
	 * 자격시험 신청 처리
	 * - VER2 Page : sub3_10_02_proc.asp
	 * 
	 * @param operator
	 * @param session
	 * @return	
	 * @throws Exception
	 */
	@RequestMapping("ke_exam_action.do")
	public View examAction(KE_EDU_OPERATOR operator, HttpSession session ) throws Exception {
		String code_pers = getCodePers(session);
		operator.setCode_pers(code_pers);
		operator.setPerson_yn(code_pers);
		
		// edu_test_key 확인
		if( !operator.convertEduTestKey() ) {
			return getHistoryGoView("올바르지 않은 접근입니다.");
		}
		
		// code_operation 구분별 Valid 체크
		String codeOpertion = operator.getCode_operation();
		if( "2".equals(codeOpertion) ) { // 재시험 대상
			boolean isReTest = educationService.isExamValidReTest(operator);
			if( !isReTest ) {
				return getHistoryGoView("재시험 대상이 아닙니다.");
			}	
		}
		
		if( "4".equals(codeOpertion)) { // 말소자
			int rtnVal = educationService.isExamValidExpire(operator);
			if( rtnVal == 1 ) 
				return getHistoryGoView("회원님은 말소자로 응시하실 수 없습니다.");
			
			if( rtnVal == 2 ) 
				return getHistoryGoView("선택 학기의 시험은 이미 합격하셨습니다.");
		}
		
		if( !"2".equals(codeOpertion) && !"4".equals(codeOpertion)  ) {
			String passFlag = educationService.isExamPassFlag(operator);
			if( !KdaStringUtil.isEmpty(passFlag) && "Y".equals(passFlag) ) 
				return getHistoryGoView("선택 학기의 시험은 이미 합격하셨습니다.");	
		}

		//중복 신청 여부 체크
		String today = KdaStringUtil.getTodayString();
		String year = today.substring(0,4);
		Map dupParamMap = new HashMap();
		dupParamMap.put("codePers", code_pers);
		dupParamMap.put("curYear", year);
		dupParamMap.put("today", today);
		dupParamMap.put("codeKind", operator.getCode_kind());
		dupParamMap.put("codeCertifi", operator.getCode_certifi());
		dupParamMap.put("codeSeq", operator.getCode_seq());
		dupParamMap.put("season", operator.getSeason());
		int dupCount = educationService.getExamOperatorCount(dupParamMap);
		if( dupCount > 0 ) {
			return getHistoryGoView("해당 자격시험은 이미 신청하였습니다.");
		}
		
		// 자격시험 신청정보 저장
		operator.setDB();
		MultipartFile addFile = operator.getOper_add_file();
		String ext = ""; 
		if( !operator.getCode_operation().equals("2") ) {
			if( addFile == null ) {
				return getHistoryGoView("첨부 파일이 존재하지 않습니다.\\n다시 시도하여 주십시요.");
			} 
			
			/*if( !KdaStringUtil.isZipFile(addFile.getOriginalFilename()) ) {
				return getHistoryGoView("허용되지 않은 확장자입니다.(압축파일로 업로드 하십시요.)");
			}*/
			ext =  KdaStringUtil.getExtension(addFile.getOriginalFilename());
		}
		
		MultipartFile addFile2 = operator.getOper_add_file2();
		String ext2 = ""; 
		if( !operator.getCode_operation().equals("2") ) {
			if( addFile2 == null ) {
				return getHistoryGoView("첨부 파일이 존재하지 않습니다.\\n다시 시도하여 주십시요.");
			} 
			
			/*if( !KdaStringUtil.isZipFile(addFile.getOriginalFilename()) ) {
				return getHistoryGoView("허용되지 않은 확장자입니다.(압축파일로 업로드 하십시요.)");
			}*/
			ext2 =  KdaStringUtil.getExtension(addFile.getOriginalFilename());
		}
		
		String receiptNo = educationService.insertExamOperator(operator);
		String operKey = operator.makeEduTestKey() + receiptNo;
		operator.setReceipt_no(receiptNo);
		
		if( !operator.getCode_operation().equals("2" )) {
			// 재시험이 아닐경우 무조건 첨부파일 저장 
			//반명함판 증명사진
			String addFileNo = KdaUtil.getOperAttachNo(operator.getCode_operation());
			
			addFile = operator.getOper_add_file();
			String operFileName = operKey + "_" +  addFileNo + "." + ext;
			
			String uploadFullPathName = servletContext.getRealPath(WorkData.UPLODAD_LICENSE) + File.separator + operFileName;
			uploadService.upload(addFile, uploadFullPathName);
			
			KE_EDU_OPER_ADD_FILE operAddFile = new KE_EDU_OPER_ADD_FILE( operKey, addFileNo, operFileName, addFile.getSize() );
			educationService.insertOperAddFile(operAddFile);
			
			//영양사면허증
			addFile = operator.getOper_add_file2();
			operFileName = operKey + "_" +  addFileNo + "." + ext2;
			
			uploadFullPathName = servletContext.getRealPath(WorkData.UPLODAD_LICENSE) + File.separator + operFileName;
			uploadService.upload(addFile, uploadFullPathName);
			
			operAddFile = new KE_EDU_OPER_ADD_FILE( operKey, addFileNo, operFileName, addFile.getSize() );
			educationService.insertOperAddFile(operAddFile);
		} else {
			// 재시험일 경우 이전 파일을 신규 시험 파일로 이관처리
			educationService.moveOperPrevAddFile(operator);
		}
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("전문교육과정 자격시험이 신청되었습니다.\\n재시험인 경우 자격시험 응시료를 입금해 주시기 바랍니다.\\n\\n※ 전문교육과정별 자격시험 재시험 응시료\\n    반려동물영양관리사 총 40,000원, 시니어푸드코디네이터 과목별 40,000원, 다이어트운동컨설턴트 총 50,000원)\\n※ 문의처: 대한영양사협회 교육국 02-823-5680(내선 513,514)\\n");
		javaScript.setLocation("ke_exam_view.do?idx="+ operKey + "&code_operation=" + operator.getCode_operation());
		return new JavaScriptView(javaScript);
	}
	
	
	
	@RequestMapping("ke_exam_view.do")
	public String examView(@RequestParam String idx, String code_operation, HttpSession session, Model model) throws Exception {
		KE_EDU_OPERATOR operator =  educationService.getOperator(null, getCodePers(session), null, idx);
		System.out.println("Operator : " + operator.getOper_email());
		model.addAttribute("operator", operator);
		return "tiles/work/education/ke_exam_view";
		
	}
	
	/**
	 * [자격시험 신청 현황(목록)] 화면 생성
	 *  
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_exam_situation.do")
	public String initSituation(HttpSession session, Model model) throws Exception {
		if( !checkLogin(session)  ) {
			return goLocation("로그인이 필요합니다", "/login/kl_login_nor.do", model);
		} else {
			String codePers = getCodePers(session);
			List<Map> operList = educationService.getExamOperatorRegList(codePers);
			for(Map map : operList) {
				String examKey = map.get("code_kind").toString() + map.get("code_certifi").toString() 
						+ map.get("code_seq").toString() + map.get("code_bran").toString() 
						+ map.get("bran_seq").toString() + map.get("receipt_no").toString();
				map.put("examKey", examKey);
			}
			int today = Integer.parseInt(KdaStringUtil.getTodayString());
			model.addAttribute("today", today);
			model.addAttribute("operList", operList);
		}
		return "tiles/work/education/ke_exam_situation";
	}
	
	/**
	 * [자격시험 취소] 처리
	 * 
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_exam_cancel_action.do")
	public View examCancelAction(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
		if( !checkLogin(session)  ) {
			javaScript.setMessage("로그인이 필요합니다.");
			javaScript.setLocation("/login/kl_login_nor.do");
			return new JavaScriptView(javaScript);
		} else {
			Map paramMap = ParamUtils.getParamMap(request);
			paramMap.put("codePers", getCodePers(session));
			
			// 상태 업데이트
			educationService.updateExamCancel(paramMap);
			
			// 취소 메일
			sendCancelMail(paramMap);
			
			String msg = "자격시험 신청이 최소되었습니다.\\n시험비를 입금하신 분께서는 문의처로 연락주시기 바랍니다.\\n\\n※ 대한영양사협회 교육국 : 02-823-5680 (교 514)";
			javaScript.setMessage(msg);
			javaScript.setLocation("ke_exam_situation.do");
			return new JavaScriptView(javaScript);
		}
		
	}
	
	/* ==================== private 영역 ============================== */
	
	private KE_EDU_OPERATOR setOperator(PERSON_M_TBL person) {
		KE_EDU_OPERATOR oper = new KE_EDU_OPERATOR();
		oper.setOper_name(person.getPers_name());
		oper.setOper_lic_no(person.getLic_no());
		oper.setOper_comp_name1(person.getCompany_name());
		oper.setPers_tel(person.getPers_tel());
		oper.setCompany_tel(person.getCompany_tel());
		oper.setOper_hp(person.getPers_hp());
		oper.setOper_birth(person.getPers_birth());
		String codePlace = person.getCode_place();
		String codePost = "";
		String addr = "";
		if( person.getCode_place().equals("2") ) {
			codePost = person.getCompany_code_post();	
			addr = person.getCompany_add() + " " + person.getCompany_add_detail();
		
		} else {
			codePost = person.getCode_post();
			addr = person.getPers_add() + " " + person.getPers_add_detail();
		}
		
		String[] emailAry = person.getEmail().split("@");
		if( emailAry.length == 2 ) {
			oper.setEmail1(emailAry[0]);
			oper.setEmail2(emailAry[1]);
		}
		oper.setCode_post(codePost);
		oper.setOper_comp_add1_2(addr);
		oper.setRemittor(person.getPers_name());
		
		return oper;
	}
	
	
	private String getExamName(KE_EDU_TEST_NAME testName, String val ) {
		String examName = "";
		if( val.equals("-1") ) {
			examName = "[ 종료 - " + testName.getCertifi_name() + " ] ";
		} else if( val.equals("-3") ) {
			examName = "[ 자격증 기보유 - " + testName.getCertifi_name() + " ] "; 
		} else {
			examName = "[ " + testName.getCertifi_name() + " ] ";
		}
		if( testName.getSeason() == 4 ) {
			examName += "온라인교육 ";
		} else if (testName.getSeason() == 3) {
			examName += "집합교육 ";
		}
		examName += testName.getEdutest_name();
		examName += " " +  KdaStringUtil.getFormatDayKo(testName.getOper_start_dt());
		examName += "(" + KdaStringUtil.getWeekDayKo(testName.getOper_start_dt()) + ")";
		return examName;
	}
	
	
	
	private void sendCancelMail(Map paramMap) throws Exception {
		KDA_MAIL mail = new KDA_MAIL();
		
		String mailTitle = "교육취소요청- " + paramMap.get("oper_name") + "/ "+ paramMap.get("edutest_name");
		String mbody =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>"
				 		+ "<table border=0 width=500 cellpadding=4>"
				 		+ "<tr height=50 align=right><td colspan=2><b>" + paramMap.get("oper_name") + "</b>님 께서 교육취소 환불을 요청하셨습니다.</td></tr>"
				 		+ "<tr><td width=100  align=right>교육명 : </td><td>" + paramMap.get("edutest_name") + "</td></tr>"
				 		+ "<tr><td width=100  align=right>성명 : </td><td>" + paramMap.get("oper_name") + "</td></tr>"
				 		+ "<tr><td width=100 align=right>면허번호 : </td><td>" + paramMap.get("oper_lic_no") + "</td></tr>"
				 		+ "<tr><td width=100 align=right>회원번호 : </td><td>" + paramMap.get("codePers") +  "</td></tr>"
				 		+ "<tr><td width=100 align=right>휴대폰 : </td><td>" + paramMap.get("oper_hp")  + "</td></tr>"
				 		+ "<tr><td width=100 align=right>이메일 : </td><td>" + paramMap.get("oper_email")  +  "</td></tr>"
				 		+ "</table>";
		String to 	= KDA_MAIL.EDU_TO_MAIL;
		String from	= "center@dietitian.or.kr";
		mail.setFrom(from);
		mail.setFromName("시스템");
		mail.setToEmail(to);
		mail.setMailTitle(mailTitle);
		mail.setMailBody(mbody);
		
		log.debug( mail );
		
		MailBean mailBean = new MailBean();
		mailBean.sendMail(mail);
	
	}
}
