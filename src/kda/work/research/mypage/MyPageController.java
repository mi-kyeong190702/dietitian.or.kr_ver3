package kda.work.research.mypage;

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
import kda.work.research.report.ReportController;
import kda.work.research.report.ReportService;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class MyPageController {

	private Log log = LogFactory.getLog(MyPageController.class);
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	private IPINService ipinservice;
	
	@RequestMapping("research_mypage_report")
	public String research_mypage_report(HttpSession session, Model model) throws Exception{
		
		log.info("================================ MyPageController [research_mypage_report]");
		
		String returnURL 	= "";
		int cnt =0;
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			
			List<ACTULSTATUS> list= myPageService.getMyReport(vo.getPers_name(), vo.getLic_no());
			
			cnt = myPageService.getMyReportCount(vo.getPers_name(), vo.getLic_no());
			
			model.addAttribute("dataRow", list);
			model.addAttribute("dataCount", cnt);
			
			returnURL = "/work/research/mypage/km_report_view";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
		
	}
	
	@RequestMapping("research_mypage_education")
	public String research_mypage_education(HttpSession session, Model model) throws Exception{
		
		log.info("================================ MyPageController [research_mypage_education]");
		
		String returnURL 	= "";
		int cnt =0;
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			
			List<ACTULSTATUS> list= myPageService.getMyEdu(vo.getPers_name(), vo.getLic_no());
			
			cnt = myPageService.getMyEduCount(vo.getPers_name(), vo.getLic_no());
			
			model.addAttribute("dataRow", list);
			model.addAttribute("dataCount", cnt);
			
			returnURL = "/work/research/mypage/km_education_view";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
		
	}
	
	@RequestMapping("research_mypage_find")
	public String research_mypage_find(
			@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			HttpSession session, Model model) throws Exception{
		
		log.info("================================ MyPageController [research_mypage_find]");
		
		String returnURL 	= "";
		String result ="";
		String msg 	= "";
		
		try {
			
			result = myPageService.passwdFind(pers_name, lic_no);
			
			if("fail".equals(result)){
				msg = "일치하는 회원정보가 없습니다.";
			}else if("success".equals(result)){
				msg = "비밀번호가 휴대전화번호로 초기화 되었습니다.";
			}
			returnURL = "/work/research/mypage/mypage_ok";
			model.addAttribute("message", msg);
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}

		return returnURL;
	}
	
	@RequestMapping("research_mypage_change")
	public String research_mypage_change(
			@RequestParam(required = false) String old_pass,
			@RequestParam(required = false) String new_pass,
			HttpSession session, Model model) throws Exception{
		
		log.info("================================ MyPageController [research_mypage_find]");
		
		String returnURL 	= "";
		String result ="";
		String msg 	= "";
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			
			result = myPageService.passwdChange(vo.getPers_name(), vo.getLic_no(), old_pass, new_pass);
			
			if("fail".equals(result)){
				msg = "기존 비밀번호가 일치하지 않습니다.";
			}else if("success".equals(result)){
				msg = "비밀번호가 변경 되었습니다.";
			}
			returnURL = "/work/research/mypage/mypage_ok";
			model.addAttribute("message", msg);
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}

		return returnURL;
	}
	
	@RequestMapping("/work/research/mypage/km_update")
	public String km_update(HttpSession session, Model model, HttpServletRequest request) throws Exception {
		log.info("================================ MyPageController [km_update]");
		
		String returnURL 	= "tiles/work/research/mypage/km_unconfirmed";
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			
			if(vo!=null){
				
				Calendar cal = Calendar.getInstance();
				int yyyy = cal.get(Calendar.YEAR);
				int month = cal.get ( Calendar.MONTH ) + 1 ;
				int date = cal.get ( Calendar.DATE ) ;
				String year = Integer.toString(yyyy);
				
				HashMap<String, Object> map = new HashMap();
				map.put("PersName",        	vo.getPers_name());																					
				map.put("LicNo",        	vo.getLic_no());									

				int procReturn = 0;
				String ReturnStateStr = "";
				String ReturnFinishYN = "";
				
				ACTULSTATUS vo2 = reportService.getReportState(year, vo.getPers_name(), vo.getLic_no());
				
				reportService.getReportState_chk(map);
				System.out.println(map.get("ReturnState")+"/"+map.get("ReturnStateStr")+"/"+map.get("ReturnFinishYN"));
				if(map.get("ReturnState")!=null){
					procReturn = (Integer) map.get("ReturnState");
				}
				if(map.get("ReturnStateStr")!=null){
					ReturnStateStr = (String) map.get("ReturnStateStr");
				}
				if(map.get("ReturnFinishYN")!=null){
					ReturnFinishYN = (String) map.get("ReturnFinishYN");
				}
				
				if(vo2!=null){
					if("0".equals(vo2.getAr_finish_yn()) || "4".equals(vo2.getAr_finish_yn())){
						log.info("=====실태신고 상태  0-저장, 1-제출 , 2-완료, 3-보류, 4-회송 ====> "+vo2.getAr_finish_yn());
						model.addAttribute("finish_yn", "0");
						model.addAttribute("reportRow", reportService.getReportHistory(year,vo.getPers_name(), vo.getLic_no()));
						model.addAttribute("dateRow", reportService.getDate(year, vo.getPers_name(), vo.getLic_no()));
						model.addAttribute("recentRow", reportService.getRecent(year, vo.getPers_name(), vo.getLic_no()));
						model.addAttribute("recentYearRow", reportService.getRecentYear(year, vo.getPers_name(), vo.getLic_no()));
						model.addAttribute("personRow", reportService.getInfo(vo.getPers_name(), vo.getLic_no(), "000000"));
						model.addAttribute("yy", yyyy);
						model.addAttribute("mm", month);
						model.addAttribute("dd", date);
						model.addAttribute("getEmail", reportService.getEmail());
						
						returnURL = "tiles/work/research/mypage/km_update";
							
					}else if(vo2.getAr_finish_yn()==null){
						log.info("=====실태신고 상태 첫 등록  ====> ");
						model.addAttribute("finish_yn", "null");
						returnURL = "tiles/work/research/mypage/km_result";
						
					}else {
						log.info("=====실태신고 상태  0-저장, 1-제출 , 2-완료, 3-보류, 4-회송 ====> "+vo2.getAr_finish_yn());
						model.addAttribute("finish_yn", vo2.getAr_finish_yn());
						returnURL = "tiles/work/research/mypage/km_result";
					}
						
				}
				
				if(procReturn == 4) {
					model.addAttribute("finish_yn", "null");
					returnURL = "tiles/work/research/mypage/km_result";
				}
				else if(procReturn == 3) {
					model.addAttribute("ReturnStateStr", ReturnStateStr);
					model.addAttribute("procReturn", procReturn);
					//returnURL = "tiles/work/research/mypage/km_unconfirmed";
					returnURL = "tiles/work/research/mypage/km_result";
				}
				
				
			}
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}
	
	@RequestMapping("/work/research/mypage/km_action")
	public String km_action(ACTULSTATUS actulstatus,
			HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		log.info("================================ MyPageController [km_action]");
		
		String returnURL ="tiles/work/research/mypage/km_result";
		
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
			model.addAttribute("message","실태신고 수정이 완료되었습니다.");
			
			returnURL = "tiles/work/research/mypage/km_result";
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return returnURL;
	}
	
	
	@RequestMapping("/work/research/mypage/km_cancel")
	public String km_cancel(ACTULSTATUS actulstatus,
			HttpSession session, Model model, HttpServletRequest request) throws Exception{
		
		log.info("================================ MyPageController [km_cancel]");
		
		String returnURL ="tiles/work/research/mypage/km_result";
		
		try {
			
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			String year = Integer.toString(yyyy);
			
			actulstatus.setPers_name(vo.getPers_name());
			actulstatus.setLic_no(vo.getLic_no());
			actulstatus.setYear(year);
			
			reportService.personCancel(actulstatus);
			reportService.statusCancel(actulstatus);
			
			session.invalidate();			
			model.addAttribute("finish_yn", "9");			
			returnURL = "tiles/work/research/mypage/km_result";
			
			
		} catch (Exception e) {
			log.info(e);
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
