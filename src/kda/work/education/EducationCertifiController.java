package kda.work.education;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.common.FileUploadService;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.mypage.data.MYEDUINFO;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.KdaStringUtil;
import kda.work.education.data.KE_EDU_CERTIFI;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_OPER_ADD_FILE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("work/education")
public class EducationCertifiController extends KdaAbstractController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EducationService educationService;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FileUploadService uploadService;
	
	@RequestMapping("ke_application.do")
	public String initLic(HttpSession session, Model model)  {
		if( !checkLogin(session) ) {
			return goLocation("로그인 후 사용하여 주십시요", "/login/kl_login_nor.do", model);
		}
		
		return "tiles/work/education/ke_application";
	}
	
	
	
	/*20151201 구위생교육 자격증 출력*/
	@RequestMapping("ke_oldcertifilist.do")	
	public String ke_oldcertifilist(@RequestParam(required = false) String pers_name,
									@RequestParam(required = false) String birth_no,
									@RequestParam(required = false) String lic_no, HttpSession session, Model model ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("pers_name", pers_name );
		paramMap.put("birth_no", birth_no);
		paramMap.put("lic_no", lic_no);
		List<KE_EDU_CERTIFI> oldcertifiList = educationService.getOldCertifiList(paramMap);
		
		model.addAttribute("oldcertifiList" , oldcertifiList);
			
		return "tiles" + "/mypage/kmp_situation";
	}
	
	
	
	/**
	 * 자격증 신청 화면
	 * 
	 * @param classifyCode
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_certifi_code.do")
	public String certifiCode(@RequestParam int classifyCode, HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return goLocation("로그인 후 사용하여 주십시요", "/login/kl_login_nor.do", model);
		}
		
		List<Map> certifiCodes = educationService.getCertifiCodeList();
		
		KE_EDU_CERTIFI certifi = new KE_EDU_CERTIFI();
		certifi.setClassify_code(classifyCode);
		
		/*테스트를 위해 막음 20160725*/
/*		if( classifyCode == 2 && !checkLastDues(session) ) {
			// 갱신 회원일 경우 회비 3년 체크
			return getHistoryBackPage("발급 대상이 아닙니다.", model);
		}*/
		
		model.addAttribute("certifi", certifi);
		model.addAttribute("certifiCodes", certifiCodes);
		return "tiles/work/education/ke_certifi_code";
	}
	
	private boolean checkLastDues(HttpSession session) throws Exception {
		List<Map> duesList = educationService.getLastDuesList(getCodePers(session));
		if( duesList == null ) {
			return false;
			
		} else {
			String prevAuthEnd = "";
			String authEnd = "";
			int duesCnt = 0;
			for( int i = 0; i < duesList.size(); i++ ) {
				Map dues = duesList.get(i);
				if( i == 0 )
					prevAuthEnd = KdaStringUtil.nullToString(dues.get("PREV_AUTH_END"));
				
				authEnd = KdaStringUtil.nullToString(dues.get("AUTH_END")); 
				if( authEnd.substring(0, 4).equals("9999") ) {
					duesCnt = 2;
				}
				
/*				if( authEnd.equals(prevAuthEnd) ) {
					duesCnt++;
				}*/
				if( !authEnd.equals(prevAuthEnd) ) {
					return false;
				}else{ 
					duesCnt++;
				}
				prevAuthEnd = KdaStringUtil.nullToString(dues.get("PREV_AUTH_END"));
			}
			
			System.out.println("dues cnt : " + duesCnt);
			
			if(  duesCnt < 2 ) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 자격증 신청 가능여부 확인
	 * 
	 * @param classifyCode
	 * @param codeCertifi
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_ajax_valid_certifi.do")
	public @ResponseBody Map validCertifi(@RequestParam int classifyCode, @RequestParam String codeCertifi,
			HttpSession session, Model model) throws Exception {
		
		System.out.println( "ke_ajax_valid_certifi => code : " + codeCertifi );
		String codePers = getCodePers(session);
		Map rtnMap = null;
		switch(classifyCode) {
		case 1:
			// 자격증별 신규 신청 가능여부 조회
			rtnMap = checkValidCertifiNew(codeCertifi,codePers);
			break;
		case 2:
			// 자격증 갱신발급 가능여부 조회
			rtnMap = checkValidCertifiChg(codeCertifi, codePers);
			break;
		case 3:	
			// 자격증별 재발급 신청 가능여부 조회
			rtnMap = checkValidCertifiRe(codeCertifi,codePers);
			break;
		}
		return rtnMap;
	}
	
	
	@RequestMapping("ke_certifi_chg_check.do")
	public String certifiChgCheck(KE_EDU_CERTIFI certifi, HttpSession session, Model model) throws Exception {
		
		String codeCerti = certifi.getCode_certifi();
		KE_EDU_CERTIFI dbCert =  educationService.getMaxCertifi(certifi.getCode_certifi(), getCodePers(session), "Y");
		
		List<Map> markList = educationService.getChgMarkCheckList(codeCerti, getCodePers(session), dbCert.getResult_start_dt(), dbCert.getResult_end_dt());
	
	    int in_edu_marks = 0;
	    int in_service_marks = 0;
	    int in_no_fix_edu_marks = 0;
	    int in_no_fix_service_marks = 0;
	    int out_edu_marks = 0;
	    int out_service_marks = 0;
	    int out_no_fix_edu_marks = 0;
	    int out_no_fix_service_marks = 0;
	    
	    for( Map mark : markList ) {
	    	System.out.println( mark);
	    	String outside_yn = KdaStringUtil.nullToString(mark.get("outside_yn"));
	    	String code_certifi = KdaStringUtil.nullToString(mark.get("code_certifi"));
	    	int point_manage =  KdaStringUtil.nullToInt(mark.get("point_manage"), 0);
	    	int edu_marks=  KdaStringUtil.nullToInt(mark.get("edu_marks"), 0);
	    	int service_marks =  KdaStringUtil.nullToInt(mark.get("service_marks"), 0);
	    	if( outside_yn.equals("N") ) {
	    		if( code_certifi.equals("0") ) {
	    			if( point_manage == 0 ) {
	    		        in_no_fix_edu_marks = in_no_fix_edu_marks + edu_marks;
	    		        in_no_fix_service_marks = in_no_fix_service_marks + service_marks;
	    			} else {
	    				in_edu_marks = in_edu_marks + edu_marks;
	    				in_service_marks = in_service_marks + service_marks;
	    			}
	    		} else {
	    			 in_edu_marks = in_edu_marks + edu_marks;
	    			 in_service_marks = in_service_marks + service_marks;
	    		}
	    	} else {
	    		if( code_certifi.equals("0")) {
	    			if( point_manage == 0 ) {
	    			       out_no_fix_edu_marks = out_no_fix_edu_marks + edu_marks;
	    			       out_no_fix_service_marks = out_no_fix_service_marks + service_marks;
	    			} else {
	    		        out_edu_marks = out_edu_marks + edu_marks;
	    		        out_service_marks = out_service_marks + service_marks;
	    			}
	    		} else {
	    			  in_edu_marks = in_edu_marks + edu_marks;
	    			  in_service_marks = in_service_marks + service_marks;
	    		}
	    	}
	    }
	
	    int in_total_marks = in_edu_marks + in_service_marks + in_no_fix_edu_marks + in_no_fix_service_marks;
	    int out_total_marks = out_edu_marks + out_service_marks + out_no_fix_edu_marks + out_no_fix_service_marks;
	    int total_marks = in_total_marks + out_total_marks;
	    	    
	    model.addAttribute("in_total_marks", in_total_marks);
	    model.addAttribute("out_total_marks", out_total_marks);
	    model.addAttribute("total_marks", total_marks);
	    
	    model.addAttribute("certifi", certifi);
	    model.addAttribute("name" , getUserName(session) );
		return "tiles/work/education/ke_certifi_chg_check";
	}
	
	/**
	 * 자격증 신청 화면
	 * - page : sub3_15_02_11.asp
	 * 
	 * @param certifi
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_certifi_form.do")
	public String certifiForm(KE_EDU_CERTIFI certifi, HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return goLocation("로그인 후 사용하여 주십시요", "/login/kl_login_nor.do", model);
		}
		
		System.out.println( "CODE CERTI : " + certifi.getCode_certifi() );
		
		String codePers = getCodePers(session);
		String codeCertifi = certifi.getCode_certifi();
		PERSON_M_TBL person = memberService.getPersonMTblByCode(codePers, true);
		int classifyCode = certifi.getClassify_code();
		if( classifyCode == 1 ) {
			List chkSeason2List = educationService.getPassExamListByCertifi(certifi.getCode_certifi(), codePers, null,  new String[]{ "5", "6" }  );
			KE_EDU_OPERATOR operator = (KE_EDU_OPERATOR)chkSeason2List.get(0);
			String operKey = operator.makeOperKey();	
			List<KE_EDU_OPER_ADD_FILE> addFileList = educationService.getOperAddFileList(operKey);
			for(KE_EDU_OPER_ADD_FILE addFile : addFileList) {
				if( addFile.getAdd_file_no().equals("22") ) {
					model.addAttribute("addFile1", WorkData.UPLODAD_LICENSE + "/" + addFile.getChang_file_name());
				}
				if( addFile.getAdd_file_no().equals("28") ) {
					model.addAttribute("addFile2", WorkData.UPLODAD_LICENSE + "/" + addFile.getChang_file_name());
				}
			}
		}
		
		if( classifyCode == 2) { 
			certifi = educationService.getChgCerti(codeCertifi, getCodePers(session));
			certifi.setClassify_code(classifyCode);
			certifi.setCode_certifi(codeCertifi);
			
			/*테스를 위해 체크 로직 막음 20160725*/
/*			if( certifi == null || !checkLastDues(session) ) {
				return getHistoryBackPage("발급대상이 아닙니다.", model);
			}*/
		}
		
		// 재발급 신청
		if( classifyCode == 3 ) {
			certifi = educationService.getMaxCertifi(certifi.getCode_certifi(), codePers, "Y");
			certifi.setClassify_code(classifyCode);
			if( certifi == null || !checkLastDues(session) ) {
				return getHistoryBackPage("발급대상이 아닙니다.", model);
			}
		}
		
		model.addAttribute("certifi", certifi);
		model.addAttribute("person", person);
		return "tiles/work/education/ke_certifi_form";
	}
	
	/**
	 * 자격증 신청 처리
	 * 
	 * @param certifi
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_certifi_form_action.do")
	public String ceritifiAction(KE_EDU_CERTIFI certifi, HttpSession session, Model model) throws Exception {
		String rtnPage = "";
		String codePers = getCodePers(session);
		switch(certifi.getClassify_code()) {
		case 1: // 신규 신청일 경우(해당 첨부파일만 입력하여 주고 관리자에서 승인처리)
			List chkSeason1List = educationService.getPassExamListByCertifi(certifi.getCode_certifi(), codePers, null,  new String[]{ "5" } );
			List chkSeason2List = educationService.getPassExamListByCertifi(certifi.getCode_certifi(), codePers, null,  new String[]{ "6" }  );
			if( chkSeason1List != null && chkSeason2List != null ) {
				
				KE_EDU_OPERATOR operator = (KE_EDU_OPERATOR)chkSeason2List.get(0);
				String operKey = operator.makeOperKey();
				String operFileName = "";
				String ext = "";
				
				certifi.setDB();
				KE_EDU_OPER_ADD_FILE addFile = null;
				// 이미지 (화면에서 확장자 처리) 파일 저장
				if( !KdaStringUtil.isEmpty(certifi.getAdd_file1()) ) {
					
					System.out.println( " ADD FILE 1 : " + certifi.getAdd_file1() );
					
					ext = KdaStringUtil.getExtension( certifi.getAdd_file1() );
					operFileName = operKey + "_" +  "22" + "." + ext;
					String sourcePath = servletContext.getRealPath( certifi.getAdd_file1() );
					String targetPath = servletContext.getRealPath(WorkData.UPLODAD_LICENSE) + File.separator + operFileName; 
					uploadService.moveFile(sourcePath, targetPath);
					
					addFile = new KE_EDU_OPER_ADD_FILE(operKey, "22", operFileName, 0);	
					educationService.insertOperAddFile(addFile);
				}
				
				// 첨부파일2 (ZIP 파일) 저장
				MultipartFile addFile2 = certifi.getAdd_file2();
				if( addFile2 != null && addFile2.getSize() >  0  ) {
					if( !KdaStringUtil.isZipFile(addFile2.getOriginalFilename()) ) {
						return getHistoryBackPage("허용되지 않은 확장자입니다.(압축파일로 업로드 하십시요.)", model);
					}
					ext =  KdaStringUtil.getExtension(addFile2.getOriginalFilename());
					operFileName = operKey + "_" +  "28" + "." + ext;
					
					long file_size = addFile2.getSize();
					String uploadFullPathName = servletContext.getRealPath(WorkData.UPLODAD_LICENSE) + File.separator + operFileName;
					uploadService.upload(addFile2, uploadFullPathName);
					
					addFile = new KE_EDU_OPER_ADD_FILE(operKey, "28", operFileName, file_size);	
					educationService.insertOperAddFile(addFile);
				}
				
		    } else {
				model.addAttribute("errorMsg", "신청 대상이 아닙니다.");
			}
			break;
		
		case 2: // 갱신신청
			certifi.setPrint_state("4");
			rtnPage = setUpdatePrintResult(certifi, session, model);
			break;
		case 3: // 재발급 신청
			certifi.setPrint_state("5");
			rtnPage = setUpdatePrintResult(certifi, session, model);
			break;
		}
		
		if( !KdaStringUtil.isEmpty(rtnPage) ) {
			return rtnPage;
		}
		
		return "redirect:/work/education/ke_certifi_success.do?classifyCode=" + certifi.getClassify_code();
	}
	
	/**
	 * 자격증 신청확인
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ke_verification.do")
	public String keVerification(HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return goLocation("로그인 후 사용하여 주십시요", "/login/kl_login_nor.do", model);
		}
		
		
		String codePers = getCodePers(session);
		List<HashMap> resultList = educationService.getReqResultPrintList(codePers);
		List<Map> certiReqList = new ArrayList<Map>();
		
		/*  초기화 */
		boolean isFirstSeason = false;
		boolean isSecondSeason = false;
		String certifi = "";
		for(Map req : resultList) {
			/* 비교 자격증 코드 초기화 */
			if( !certifi.equals( req.get("code_certifi").toString() ) ) {
				isFirstSeason = false;
				isSecondSeason = false;
			}
			
			int season = Integer.parseInt(req.get("season").toString());
			if( season == 1|| season == 3 ) {
				isFirstSeason = true;
			} else if( season == 2 || season == 4 ) {
				isSecondSeason = true;
			}
			
			if( isFirstSeason && isSecondSeason ) {
				certiReqList.add(req);
			}
			certifi = req.get("code_certifi").toString();
		}
		
		model.addAttribute("reqList", certiReqList);
		return "tiles/work/education/ke_verification";
	}
	
	private String setUpdatePrintResult( KE_EDU_CERTIFI certifi, HttpSession session, Model model ) throws Exception{
		String ext = "";
		String common_file_name = getCodePers(session) + certifi.getCode_certifi() + certifi.getResult_no() + certifi.getCode_seq();
		String file1Name = "";
		String file2Name = "";
		// 이미지 파일 이동
		if( !KdaStringUtil.isEmpty(certifi.getAdd_file1()) ) {
			ext = KdaStringUtil.getExtension( certifi.getAdd_file1() );
			file1Name = common_file_name + "_" + "22." + ext;
			String sourcePath = servletContext.getRealPath( certifi.getAdd_file1() );
			String targetPath = servletContext.getRealPath(WorkData.UPLOAD_LICENSE_RENEWAL) + File.separator + file1Name;
			uploadService.moveFile(sourcePath, targetPath);
		}
		
		// 첨부파일2 (ZIP 파일) 저장
		MultipartFile addFile2 = certifi.getAdd_file2();
		if( addFile2 != null && addFile2.getSize() >  0  ) {
			if( !KdaStringUtil.isZipFile(addFile2.getOriginalFilename()) ) {
				return getHistoryBackPage("허용되지 않은 확장자입니다.(압축파일로 업로드 하십시요.)", model);
			}
			ext =  KdaStringUtil.getExtension(addFile2.getOriginalFilename());
			file2Name = common_file_name + "_" + "28." + ext;
		
			String uploadFullPathName = servletContext.getRealPath(WorkData.UPLOAD_LICENSE_RENEWAL) + File.separator + file2Name;
			uploadService.upload(addFile2, uploadFullPathName);
		}
		certifi.setDeposit_due_date( certifi.getDeposit_due_date().replaceAll("-", "") );
		certifi.setCode_pers(getCodePers(session));
		
		certifi.setAdd_file_2(file1Name);
		certifi.setAdd_file_5(file2Name);
		educationService.updateResultPrint(certifi);
		
		return "";
	}
	
	
	/**
	 * 해당 자격증 신규 발급 가능여부 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws Exception
	 */
	private Map checkValidCertifiNew(String codeCertifi, String codePers) 
			throws Exception {
		Map resultMap = new HashMap();
		resultMap.put("valid", "N");
		String addFileNo = "";
		
		// 해당 자격증 보유 조회
		KE_EDU_CERTIFI certifi = educationService.getMaxCertifi(codeCertifi, codePers, null);
		
		boolean chkSeason1 = false;
		boolean chkSeason2 = false;
		boolean chkSeason3 = false;
		boolean chkSeason4 = false;
	
		String resultEndDt = null;
		List<KE_EDU_OPERATOR> certifiList = null;
		if( certifi == null  ) { // 자격증이 없는 경우
			// 합격한 시험 목록 조회
			certifiList = educationService.getPassExamListByCertifi(codeCertifi, codePers);
		} else if( certifi.getPrint_state().equals("2") ) { // 자격증 유효기간만료인 사람
			// 합격한 시험 목록에서 만료일 이후 시험을 조회
			certifiList = educationService.getPassExamListByCertifi(codeCertifi, codePers, resultEndDt );
		} else { // 기타 사용자는 자격증 발급이 불가.
			return resultMap;
		}
		
		for(KE_EDU_OPERATOR operator : certifiList) {
			String season = KdaStringUtil.nullToString(operator.getSeason());
			if( season.equals("1") ) {
				chkSeason1 = true;
			} else if( season.equals("2") ) {
				chkSeason2 = true;
			} else if( season.equals("3") ) {
				chkSeason3 = true;
			} else if( season.equals("4") ) {
				chkSeason4 = true;
			}
			if( !KdaStringUtil.isEmpty(operator.getAdd_file_no()) && !KdaStringUtil.isEmpty(addFileNo) ) {
				addFileNo = operator.getAdd_file_no();
			}
		}

		if( ( chkSeason1 && chkSeason2 ) || ( chkSeason3 && chkSeason4 ) ) {
			resultMap.put("valid", "Y");
			resultMap.put("addFileNo", addFileNo);
		}	
		
		return resultMap;
	}
	

	private Map checkValidCertifiChg(String codeCertifi, String codePers) 
			throws Exception {
		Map resultMap = new HashMap();
		
		KE_EDU_CERTIFI certifi = educationService.getChgCerti(codeCertifi, codePers);
		if( certifi == null ) {
			resultMap.put("valid", "N");
			resultMap.put("msg", "발급 대상이 아닙니다.");
		} else {
			String printState = KdaStringUtil.nullToString(certifi.getPrint_state());
			if( "0".equals(certifi.getQuarter()) ) {
				resultMap.put("valid", "N");
				resultMap.put("msg", "발급 대상이 아닙니다.");
			} else if( "4".equals(printState) || "5".equals(printState)  ) {
				resultMap.put("valid", "N");
				resultMap.put("msg", "발급 심사중입니다.");
			} else {
				resultMap.put("valid", "Y");
			}
		}
		return resultMap;
	}
	
	/**
	 * 재발급 가능여부 확인
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws Exception
	 */
	private Map checkValidCertifiRe(String codeCertifi, String codePers) 
			throws Exception {
		Map resultMap = new HashMap();
		
		
		KE_EDU_CERTIFI certifi = educationService.getMaxCertifi(codeCertifi, codePers, "Y");
		if( certifi == null ) {
			resultMap.put("valid", "N");
			resultMap.put("msg", "발급 대상이 아닙니다.");
		} else {
			String printState = KdaStringUtil.nullToString(certifi.getPrint_state());
			if( "0".equals(certifi.getQuarter()) ) {
				resultMap.put("valid", "N");
				resultMap.put("msg", "발급 대상이 아닙니다.");
			} else if( "4".equals(printState) || "5".equals(printState)  ) {
				resultMap.put("valid", "N");
				resultMap.put("msg", "발급 심사중입니다.");
			} else {
				resultMap.put("valid", "Y");
			}
		}
		return resultMap;
	}
	
	

}
