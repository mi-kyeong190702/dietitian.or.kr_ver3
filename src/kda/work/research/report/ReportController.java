package kda.work.research.report;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.WorkData;
import kda.board.data.BOARDFILE;
import kda.common.IPINService;
import kda.common.data.IPIN;
import kda.work.research.login.RloginService;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class ReportController {
	
	private Log log = LogFactory.getLog(ReportController.class);
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	private IPINService ipinservice;
	
	@Autowired
	RloginService rloginService;
	
	@RequestMapping(value="kr_report_state_chk")
	public String kr_report_state_chk( 
			@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			HttpSession session, Model model,HttpServletRequest request) throws Exception{
		
		String returnURL ="";
		
		try {
			HashMap<String, Object> map = new HashMap();
			map.put("PersName",        	pers_name);																					
			map.put("LicNo",        	lic_no);									

			int procReturn = 0;
			String ReturnStateStr = "";
			String ReturnFinishYN = "";
			
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			int month = cal.get ( Calendar.MONTH ) + 1 ;
			int date = cal.get ( Calendar.DATE ) ;
			String year = Integer.toString(yyyy);
			
			reportService.getReportState_chk(map);

			if(map.get("ReturnState")!=null){
				procReturn = (Integer) map.get("ReturnState");
			}
			if(map.get("ReturnStateStr")!=null){
				ReturnStateStr = (String) map.get("ReturnStateStr");
			}
			if(map.get("ReturnFinishYN")!=null){
				ReturnFinishYN = (String) map.get("ReturnFinishYN");
			}
			System.out.println("ReturnStateStr===========>"+ReturnStateStr);
			System.out.println("procReturn===========>"+procReturn);
			
			// ReturnState : 1 (대상자아님-면허발급일자가 3년 이내) => 신규페이지 필요
			if(procReturn == 1) {
				model.addAttribute("yy", yyyy);
				model.addAttribute("pers_name", pers_name);
				model.addAttribute("ReturnStateStr", ReturnStateStr);
				returnURL = "kr_report_step8";
			}
			// ReturnState : 2 (면허발급일자 작성) => 면허발급일자 작성 페이지
			else if (procReturn == 2) {
				model.addAttribute("msg",  "영양사면허 발급일이 확인되지 않습니다. \\r\\n 면허발급일을 입력해주시기 바랍니다.");
				returnURL = "kr_report_step7";
			}
			// ReturnState : 3 (교육이수필요-실태신고자격미달)(실태신고 기록없음)
			else if (procReturn == 3) {
				model.addAttribute("ReturnStateStr", ReturnStateStr);
				returnURL = "kr_report_step2_unconfirmed";
			}
			// ReturnState : 4 (실태신고작성가능)
			else if (procReturn == 4) {
				ACTULPERSON actulpersonVo = reportService.getReportUser(pers_name, lic_no);
				session.setAttribute("actulpersonVo", actulpersonVo);
				
				IPIN ipin = ipinservice.getIPIN(request);
				model.addAttribute("ipin", ipin);
				
				returnURL = "kr_report_step2";
			}
			// ReturnState : 5 (실태신고 저장상태)
			else if (procReturn == 5) {
				
				model.addAttribute("loginVo", reportService.getInfo(pers_name, lic_no, "000000"));
				model.addAttribute("finish_yn", "0");
				model.addAttribute("reportRow", reportService.getReportHistory(year,pers_name, lic_no));
				model.addAttribute("dateRow", reportService.getDate(year, pers_name, lic_no));
				model.addAttribute("recentRow", reportService.getRecent(year, pers_name, lic_no));
				model.addAttribute("recentYearRow", reportService.getRecentYear(year, pers_name, lic_no));
				model.addAttribute("personRow", reportService.getInfo(pers_name, lic_no, "000000"));
				model.addAttribute("yy", yyyy);
				model.addAttribute("mm", month);
				model.addAttribute("dd", date);
				model.addAttribute("getEmail", reportService.getEmail());
				
				returnURL = "kr_report_step5";
			}
			// ReturnState : 6 (실태신고완료)
			else if (procReturn == 6) {
				model.addAttribute("yy", yyyy);
				model.addAttribute("pers_name", pers_name);
				model.addAttribute("ReturnStateStr", ReturnStateStr);
				model.addAttribute("finish_yn", ReturnFinishYN);
				System.out.println("finish_yn ReturnFinishYN===========>"+ReturnFinishYN);
				returnURL = "kr_report_step6";
			}
			// ReturnState : 7 (존재하지 않는 사용자)
			else if (procReturn == 7) {
				returnURL = "kr_report_step2_fail";
			}
			System.out.println("returnURL===========>"+returnURL);
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}
	
	@RequestMapping("kr_report_step1")
	public String kr_report_step1(
			HttpSession session, Model model,HttpServletRequest request) throws Exception{
		
		String returnURL = "";
		String pers_name = "";
		String lic_no = "";
		
		ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
		
		//로그인 후 실태신고 신청
		if( vo != null) {
			pers_name = vo.getPers_name();
			lic_no = vo.getLic_no();
			return this.kr_report_state_chk(pers_name, lic_no, session, model, request);
		}
		else { 
			returnURL = "kr_report_step1";
		}
		
		return returnURL;

	}
	
	@RequestMapping(value="kr_report_step7", method=RequestMethod.POST)
	public String kr_report_step7(
			@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			@RequestParam(required = false) String lic_print_dt,
			HttpSession session, Model model,HttpServletRequest request) throws Exception{
		
		log.info("================================ kr_report_step7 start");
		
		try {
			
			ACTULPERSON actulstatus = reportService.getInfo(pers_name, lic_no, "");
			log.info("================================ kr_report_step7 start" + actulstatus);
			actulstatus.setLic_print_dt(lic_print_dt);
			reportService.personInfoUpt(actulstatus);
			
		} catch (Exception e) {
			log.info(e);
			throw e;			
		}
		
		return this.kr_report_state_chk(pers_name, lic_no, session, model, request);
	}
	
	@RequestMapping(value="kr_report_step2", method=RequestMethod.POST)
	public String kr_report_step2(
			@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			HttpSession session, Model model,HttpServletRequest request) throws Exception{
		
		log.info("================================ kr_report_step2 start");
		
		String returnURL = "";
		boolean pass = false;
		
		try {
			
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			String year = Integer.toString(yyyy);
			
			
			ACTULPERSON actulpersonVo = reportService.getReportUser(pers_name, lic_no);
			ACTULSTATUS Vo3 = reportService.getReportState(year,pers_name, lic_no);
			
			if(actulpersonVo==null){
				returnURL = "kr_report_step2_fail";
			}else if( Vo3 == null) { 
				log.info("============================ 실태신고 기록없음");
				returnURL = "kr_report_step2_unconfirmed";
				
			}else{
				
/*				Calendar cal = Calendar.getInstance();
				int yyyy = cal.get(Calendar.YEAR);
				String year = Integer.toString(yyyy);*/
				
				ACTULSTATUS actulstatusVo = reportService.getReportState(year,pers_name, lic_no);
				ACTULSTATUS actulstatusVo2013 = reportService.getReportState2013(year,pers_name, lic_no);
				ACTULSTATUS actulstatusVo2015 = reportService.getReportState2015(year,pers_name, lic_no);
				
				System.out.println("Step2 vo 1111======================>" + actulstatusVo );
				
				/*log.info("222============================ar_state"+yyyy+actulstatusVo2013.getAr_state());
				log.info("222============================ar_finish_yn 2013==="+yyyy+actulstatusVo2013.getAr_finish_yn ());
				log.info("222============================ar_finish_yn 2015==="+yyyy+actulstatusVo2015.getAr_finish_yn ());
				log.info("222============================report_year 2013==="+yyyy+actulstatusVo2013.getReport_year());
				log.info("222============================report_year 2015==="+yyyy+actulstatusVo2015.getReport_year());*/
				
				/*if (year == actulstatusVo.getReport_year()){
					returnURL = "kr_report_step2_complete";
				}*/

				/*if ("2".equals(actulstatusVo.getAr_finish_yn())) {*/
				
				boolean pass2013 = org.springframework.util.StringUtils.isEmpty(actulstatusVo2013.getReport_year());
				boolean pass2015 = org.springframework.util.StringUtils.isEmpty(actulstatusVo2015.getReport_year());
				
				if (!pass2013 && actulstatusVo2015 != null) {
					
					log.info("============================actul_report_year 2013===================");
					
					int actul_report_year = Integer.parseInt(actulstatusVo2013.getReport_year());
					int actul_report_year_1 = Integer.parseInt(actulstatusVo2013.getReport_year())+1;
					int actul_report_year_2 = Integer.parseInt(actulstatusVo2013.getReport_year())+2;
										
					if (yyyy == actul_report_year || yyyy == actul_report_year_1  || yyyy == actul_report_year_2){
						
						model.addAttribute("finish_yn", "2");
						returnURL = "kr_report_step6";
						
						log.info("============================actul_report_year===================");
						
						return returnURL;		
					} else{
					log.info("============================actul_report_year111111111111111===================");
					
					}
					}else if (!pass2015 && actulstatusVo2013 != null){
						
						int actul_report_year_3 = Integer.parseInt(actulstatusVo2015.getReport_year());
						int actul_report_year_4 = Integer.parseInt(actulstatusVo2015.getReport_year())+1;
						int actul_report_year_5 = Integer.parseInt(actulstatusVo2015.getReport_year())+2;
						
						if (yyyy == actul_report_year_3 || yyyy == actul_report_year_4  || yyyy == actul_report_year_5){
							
							model.addAttribute("finish_yn", "2");
							returnURL = "kr_report_step6";
							
							log.info("============================actul_report_year 2015===================");
							
							return returnURL;	
						
										} else{
						log.info("============================actul_report_year222222222222222===================");
						
						}

							
			/*} else if(actulstatusVo==null){
					log.info("============================ 실태신고 기록없음");
					returnURL = "kr_report_step2_unconfirmed";
					
					log.info("============================kr_report_step2_unconfirmed===================");*/
	
				}  else{ 
					
					returnURL = "kr_report_step2_unconfirmed";
					
					
					if("0".equals(actulstatusVo.getAr_state())){
						
						List<ACTULSTATUS> list = null;
						list = reportService.getReportEdu(year, pers_name, lic_no);
						returnURL = "kr_report_step2_unconfirmed";
						
						/*20160113 2016년 실태신고를 위한 수정 시작 */						
							if (yyyy%2==0){
								log.info("짝수년도============================"+yyyy+"년 보수교육년도 조회된 수"+list.size());
								if(list.size()==2){
									/*if("0".equals(list.get(0).getAr_state()) && "0".equals(list.get(1).getAr_state())){*/
									if("3".equals(list.get(0).getAr_state()) || "3".equals(list.get(1).getAr_state())){ 
										pass = false;
									}else{  pass = true;}
									/*pass = false;*/
								}
								
							}else{
								log.info("홀수년도============================"+yyyy+"년 보수교육년도 조회된 수"+list.size());
								if(list.size()==2){
									if("3".equals(list.get(0).getAr_state()) || "3".equals(list.get(1).getAr_state()) ){
										pass = false;
									}else {pass = true;}
								}
							}
						
/*20160113 2016년 실태신고를 위한 수정 끝*/	
						
/*						
						if(yyyy==2015){
							log.info("============================2015년 보수교육년도 조회된 수"+list.size());
							if(list.size()==1){
								if("0".equals(list.get(0).getAr_state())){
									pass = true;
								}
							}
							
						}else if(yyyy==2016){
							log.info("============================2016년 보수교육년도 조회된 수"+list.size());
							if(list.size()==2){
								if("0".equals(list.get(0).getAr_state()) && "0".equals(list.get(1).getAr_state())){
									pass = true;
								}
							}
							
						}else if(yyyy==2018){
							log.info("============================2018년 보수교육년도 조회된 수"+list.size());
							if(list.size()==2){
								if("0".equals(list.get(0).getAr_state()) && "0".equals(list.get(1).getAr_state())){
									pass = true;
								}
							}
							
						}else if(yyyy==2019){
							log.info("============================2019년 보수교육년도 조회된 수"+list.size());
							if(list.size()==1){
								if("0".equals(list.get(0).getAr_state())){
									pass = true;
								}
							}
						}*/
						
						
						if(pass){
							
							if(actulstatusVo.getAr_finish_yn()==null || "".equals(actulstatusVo.getAr_finish_yn())){
								log.info("=====실태신고 상태 첫 등록  ====> ");
	
    							IPIN ipin = ipinservice.getIPIN(request);
								model.addAttribute("ipin", ipin);
								returnURL = "kr_report_step2";

							}else{
								log.info("=====실태신고 상태  0-저장, 1-제출 , 2-완료, 3-보류, 4-회송 ====> "+actulstatusVo.getAr_finish_yn());
								returnURL = "kr_report_step4";
								
							}
							
							session.setAttribute("actulpersonVo", actulpersonVo);
						}else{
							log.info("============================ 1  미이수");
							returnURL = "kr_report_step2_unconfirmed";
						}
						
						
						
					}else if("2".equals(actulstatusVo.getAr_state()) || "4".equals(actulstatusVo.getAr_state())){
						log.info("=====0  이수, 2 면제, 4 미대상 ====> "+actulstatusVo.getAr_state());
						
						/*20160203 2016년 실태신고를 위한 수정 시작 */								
						List<ACTULSTATUS> list = null;
						list = reportService.getReportEdu(year, pers_name, lic_no);
						returnURL = "kr_report_step2_unconfirmed";
						
									
							if (yyyy%2==0){
								log.info("333============================"+yyyy+"년 보수교육년도 조회된 수"+list.size());
								if(list.size()==2){
									/*if("0".equals(list.get(0).getAr_state()) && "0".equals(list.get(1).getAr_state())){*/
									if("3".equals(list.get(0).getAr_state()) || "3".equals(list.get(1).getAr_state())){ 
										
										
										returnURL = "kr_report_step2_unconfirmed";
									}else{  
										
										
										if(actulstatusVo.getAr_finish_yn()==null || "".equals(actulstatusVo.getAr_finish_yn())){
											log.info("=====실태신고 상태 첫 등록  ====> ");
											IPIN ipin = ipinservice.getIPIN(request);
											model.addAttribute("ipin", ipin);
											returnURL = "kr_report_step2";
											
										}else{
											log.info("=====실태신고 상태  0-저장, 1-제출 , 2-완료, 3-보류, 4-회송 ====> "+actulstatusVo.getAr_finish_yn());
											returnURL = "kr_report_step4";
											
										}
										
									}
									/*returnURL = "kr_report_step2_unconfirmed";*/
								}
								
							}else{
								log.info("444============================"+yyyy+"년 보수교육년도 조회된 수"+list.size());
								
								if("3".equals(list.get(0).getAr_state()) || "3".equals(list.get(1).getAr_state())){ 
									
									
									returnURL = "kr_report_step2_unconfirmed";
								}else{  
									
									
									if(actulstatusVo.getAr_finish_yn()==null || "".equals(actulstatusVo.getAr_finish_yn())){
										log.info("=====실태신고 상태 첫 등록  ====> ");
										IPIN ipin = ipinservice.getIPIN(request);
										model.addAttribute("ipin", ipin);
										returnURL = "kr_report_step2";
										
									}else{
										log.info("=====실태신고 상태  0-저장, 1-제출 , 2-완료, 3-보류, 4-회송 ====> "+actulstatusVo.getAr_finish_yn());
										returnURL = "kr_report_step4";
										
									}
									
								}
								/*returnURL = "kr_report_step2_unconfirmed";*/
							
							
	/*							if(list.size()==1){
									if("0".equals(list.get(0).getAr_state())){
										log.info("=====실태신고 상태 등록1  ====> ");
										IPIN ipin = ipinservice.getIPIN(request);
										model.addAttribute("ipin", ipin);
										returnURL = "kr_report_step2";
									}
								}*/
							}
						
/*20160113 2016년 실태신고를 위한 수정 끝*/	
							
						

						
						session.setAttribute("actulpersonVo", actulpersonVo);
						
					}else if("1".equals(actulstatusVo.getAr_state())){
						log.info("============================ 1  미이수");
						returnURL = "kr_report_step2_unconfirmed";
						
					}else if("3".equals(actulstatusVo.getAr_state())){
						log.info("============================ 3  알수없음");
						returnURL = "kr_report_step2_unconfirmed";
						
					}else if("5".equals(actulstatusVo.getAr_state())){
						log.info("============================ 5  재교부대상");
						returnURL = "kr_report_step2_unconfirmed";
						
					}else{
						log.info("============================ ????");
						returnURL = "kr_report_step2_unconfirmed";
						
					}
				} 
				
					
			} 
			
		} catch (Exception e) {
			log.info(e);
			throw e;			
		}
		
		return returnURL;
	}
	
	@RequestMapping("kr_report_step3")
	public String kr_report_step3(
			HttpSession session, Model model) throws Exception{
		
		log.info("================================ kr_report_step3 start");
		
		String returnURL ="";
		
		try {
			
			returnURL = "kr_report_step3";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}

	@RequestMapping("kr_report_step4")
	public String kr_report_step4(
			@RequestParam(required = false) String user_pw,			
			HttpSession session, Model model) throws Exception{
		
		log.info("================================ kr_report_step4 start");
		
		String returnURL ="";
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("actulpersonVo");
			
			reportService.passwdInsert(vo.getPers_name(), vo.getLic_no(), user_pw);
			
			session.removeAttribute("actulpersonVo");
			
			returnURL = "kr_report_step4";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}
	
	@RequestMapping("kr_report_step5")
	public String kr_report_step5(
			@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			@RequestParam(required = false) String user_pw,
			HttpSession session, Model model,HttpServletRequest request) throws Exception{
		
		log.info("================================ kr_report_step5 start");
		
		String returnURL ="";		
		int  n=0;
		
		try {
			
			ACTULPERSON vo = reportService.getInfo(pers_name, lic_no, user_pw);
			
			if(vo==null){
				returnURL = "kr_report_step4";
				model.addAttribute("msg", "일치하는 회원정보가 없습니다.");
			}else{
				
				if("Y".equals(vo.getPwchk())){
					
					session.setAttribute("loginVo", vo);

					Calendar cal = Calendar.getInstance();
					int yyyy = cal.get(Calendar.YEAR);
					int month = cal.get ( Calendar.MONTH ) + 1 ;
					int date = cal.get ( Calendar.DATE ) ;
					String year = Integer.toString(yyyy);
					
					log.info("=====실태신고 상태 첫 등록  ====> ");
					model.addAttribute("yy", yyyy);
					model.addAttribute("mm", month);
					model.addAttribute("dd", date);
					model.addAttribute("reportRow", reportService.getReportHistory2(year,pers_name, lic_no));
					model.addAttribute("dateRow", reportService.getDate(year, pers_name, lic_no));
					model.addAttribute("recentRow", reportService.getRecent(year, pers_name, lic_no));
					model.addAttribute("recentYearRow", reportService.getRecentYear(year, pers_name, lic_no));
					model.addAttribute("getEmail", reportService.getEmail());
					model.addAttribute("personRow", reportService.getInfo(pers_name, lic_no, "000000"));
					
					returnURL = "kr_report_step5";
					
					
						
				}else if("N".equals(vo.getPwchk())){
					returnURL = "kr_report_step4";
					model.addAttribute("msg",  "비밀번호를 확인해 주세요.");
				}
				
			}
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}
	
	@RequestMapping("kr_report_step6")
	public String kr_report_step6(ACTULSTATUS actulstatus,
			HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		log.info("================================ kr_report_step6 start");
		
		String returnURL ="";
		
		try {
			
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			String year = Integer.toString(yyyy);
			
			actulstatus.setYear(year);
			actulstatus.setReport_year(year);
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
			
			String filePath = WorkData.ROOT;		
			String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);
			
			BOARDFILE bbs_file1 = this.getBoardFile( multipartRequest, "bbs_file1", 1);
			
			reportService.personUpt(actulstatus);
			reportService.statusUpt(actulstatus);

			if(bbs_file1!=null){
				if("Y".equals(actulstatus.getFile_yn())){
					this.delBoardFiles(actulstatus, bbs_file1, realPath);
				}
				this.setBoardFiles(actulstatus, bbs_file1);
				reportService.fileUpt(actulstatus);
			}
			
			model.addAttribute("finish_yn", actulstatus.getAr_finish_yn());
			
			//returnURL = "kr_report_step6";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return this.kr_report_state_chk(actulstatus.getPers_name(), actulstatus.getLic_no(), session, model, request);
	}
	
	@RequestMapping("statusCheck")
	public String statusCheck(@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			@RequestParam(required = false) String success_url,
			@RequestParam(required = false) String fail_url,
			@RequestParam(required = false) String menuCD,
			HttpSession session, Model model) throws Exception{
		
		log.info("================================ statusCheck start");
		
		String returnURL ="";
		
		try {
			
			ACTULPERSON actulpersonVo = reportService.getReportUser(pers_name, lic_no);
			
			if(actulpersonVo!=null){
				
				if("license".equals(menuCD)) {
					model.addAttribute("msg","이미 등록된 회원입니다.");
					model.addAttribute("returnURL",fail_url);
					session.setAttribute("licenseVo", "Y"); 
				} else if("recipient".equals(menuCD)) {
					session.setAttribute("statusVo", actulpersonVo);
					model.addAttribute("msg","회원정보가 확인되었습니다.");
					model.addAttribute("returnURL",success_url);
				}
			}else{
				if("license".equals(menuCD)) {
					session.setAttribute("licenseVo", "N");
					model.addAttribute("msg","면허 정보가 확인되지 않아\\r\\n면허 정보 등록 메뉴로 이동합니다.");
					model.addAttribute("returnURL",success_url);
				} else if("recipient".equals(menuCD)) {
					session.setAttribute("statusVo", actulpersonVo);
					model.addAttribute("msg","일치하는 회원정보가 없습니다.");
					model.addAttribute("returnURL",fail_url);
				}
			}
			
			returnURL = "/work/research/license/kr_license_ok";
			
		} catch (Exception e) {
			log.info("Exception : " + e.toString());
			throw e;
		}
		
		return returnURL;
	}
	
	private BOARDFILE getBoardFile( MultipartHttpServletRequest multipartRequest, String name, int index) throws Exception
	{
		log.info("getBoardFile-------------------------------- : " + name);
		
		SimpleDateFormat formatter  = new SimpleDateFormat("yyyyMMddHHmm");
		Date date = new Date();
		
		String filePath = WorkData.UPLOAD;
		
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);		
		
		// board_cod set real path
		filePath += "report";
		realPath += "/report";
		
		FileOutputStream fos = null;		
		BOARDFILE boardFile = null;	
		String fileName = "";
		
		if(realPath.indexOf("../") >=0){
			return boardFile;
		}
		File dir = new File(realPath); 
		if ( !dir.isDirectory() )
			dir.mkdir();
						
		
		try
		{		
			MultipartFile multipartFile = multipartRequest.getFile (name);
			
			if(!multipartFile.getOriginalFilename().equals(""))
			{
				String orgFileName = multipartFile.getOriginalFilename();
				if(orgFileName.endsWith(".wmv")){
					return boardFile;
				}
				boardFile = new BOARDFILE();
				
				// -- 해당 파일은 확장자를 붙여 준다 as-is 기준
				fileName = multipartRequest.getSession().getId() + "_" +  formatter.format(date) + "_" + index;					
				
				String ext = "";
				String [] exts = multipartFile.getOriginalFilename().split("\\.");
				
				if ( exts.length > 0 )
				{
					ext = exts[ exts.length - 1].toLowerCase();
					
					String check = "jpg,jpeg,gif,bmp,png,swf,tiff,tif,mpg,mpeg,avi,asf,wma,wmv,rm,ra,mp3,xls,xlsx,hwp,pdf";
					if ( check.indexOf(ext) >= 0 )
						fileName += "." + ext;
				}
				
				// file name [ session_noewdate ]
				boardFile.setBbs_file_name(orgFileName);
				boardFile.setBbs_file_size(multipartFile.getSize());
				boardFile.setBbs_file_url(filePath + "/" + fileName); 
				boardFile.setBbs_file_type(ext);
				
				
				byte[] fileData = multipartFile.getBytes();
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				fos = new FileOutputStream(realPath + "/" + fileName);					
				fos.write(fileData);
				
				log.info("********************** [FILE][" + name + "]");
				log.info("FILE_NAME      : " + fileName);
				log.info("FILE_NAME_ORG  : " + orgFileName);
				log.info("FILE_SIZE      : " + boardFile.getBbs_file_size());
				log.info("FILE_URL       : " + boardFile.getBbs_file_url());					
				log.info("FILE_SAVE_PATH : " + realPath);
				log.info("********************** [FILE][" + name + "]");					
			}
	
		} catch(FileNotFoundException fe) {
			log.info("file upload error!",fe);
		}catch(Exception e) {
			
			log.info("file upload error!",e);
					
			if ( boardFile != null )
			{
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				File uploadFile = new File(realPath+"/"+fileName);
				if(uploadFile != null)
					uploadFile.delete();
			}
			throw e;
			
		}finally{
			try{
				if(fos != null) fos.close();
			}catch(Exception e){
				log.info("file upload error!",e);					
			}
		}		
		return boardFile;
	}
	
	private void delBoardFiles(ACTULSTATUS actulstatus,
			BOARDFILE boardFile1, String realPath) throws Exception{
		
		// -- update file delete
		File deleteFile = null;

		String bbs_file_url = actulstatus.getBbs_file_url();
		
		if (bbs_file_url != null && !bbs_file_url.equals("")) {
			deleteFile = new File(realPath + "/" + bbs_file_url);
			if (deleteFile.isFile())
				deleteFile.delete();
		}

	}

	private void setBoardFiles(ACTULSTATUS actulstatus,
			BOARDFILE boardFile1) throws Exception{

		if (boardFile1 != null) {
			actulstatus.setAr_add_file_name(boardFile1.getBbs_file_name());
			actulstatus.setAr_add_file_url(boardFile1.getBbs_file_url());
			actulstatus.setAr_add_file_type(boardFile1.getBbs_file_type());
			actulstatus.setAr_add_file_size(boardFile1.getBbs_file_size());
		}

	}
	
}
