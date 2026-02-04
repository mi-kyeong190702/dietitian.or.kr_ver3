package kda.work.research.recipient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.admin.edu.data.EDUGREEN;
import kda.common.FileUploadService;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.work.research.recipient.data.ACTULSUBJECTS;
import kda.work.research.report.ReportController;
import kda.work.research.report.ReportService;
import kda.work.research.report.data.ACTULSTATUS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;


@Controller
public class RecipientController extends KdaAbstractController{
	
	private static final String BANNER_PATH =  "/upload/recipient";
	
	private Log log = LogFactory.getLog(ReportController.class);
	
	@Autowired
	RecipientService recipientService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	private FileUploadService fileUplaodService;
	
	
	@RequestMapping("/work/research/recipient/recipient.do")
	public String recipient(HttpServletRequest request, Model model) throws Exception {
		String url ="tiles/work/research/recipient/kr_recipient_check";
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientModify.do")
	public String recipientModify(HttpServletRequest request, Model model) throws Exception {
		String url ="tiles/work/research/recipient/kr_recipientModify";
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientEduChk.do")
	public String recipientEduChk(HttpServletRequest request, Model model) throws Exception {
		String url ="tiles/work/research/recipient/kr_recipientEduChk";
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientModifyForm.do")
	public String recipientModifyForm(HttpServletRequest request, Model model ,HttpSession session, ACTULSUBJECTS vo) throws Exception {
		String url ="tiles/work/research/recipient/kr_recipientModifyForm";
		
		//ACTULSUBJECTS vo = (ACTULSUBJECTS) session.getAttribute("recipientVo");

		if(vo==null){
			url ="tiles/work/research/recipient/kr_recipient_check";
			model.addAttribute("msg", "잘못된 접근입니다.");
		}else{
			model.addAttribute("vo", vo);			
			model.addAttribute("getEmail", reportService.getEmail());
			session.removeAttribute("recipientVo");
		}

		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientModifyAction.do")
	public View recipientModifyAction(ACTULSUBJECTS vo,HttpServletRequest request, Model model) throws Exception{
		String url="";
		
		MultipartFile file = vo.getImage_file();
		MultipartFile file2 = vo.getImage_file2();
		MultipartFile file3 = vo.getImage_file3();
		
		if(file.getOriginalFilename().endsWith(".wmv") || file2.getOriginalFilename().endsWith(".wmv") || file3.getOriginalFilename().endsWith(".wmv")){
			JavaScript javaScript = new JavaScript();
			javaScript.setMessage("잘못된 파일입니다.");
			javaScript.setLocation("recipientModify.do");
			return new JavaScriptView(javaScript);
		}
		
		if( file != null && file.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments()) ) {
				String filePath = servletContext.getRealPath(vo.getCs_attachments_url());
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName = fileUplaodService.uploadFile(file, path, true);
			
			String [] exts = fileName.split("\\.");
			
			vo.setCs_attachments(file.getOriginalFilename());
			vo.setCs_attachments_type(exts[1]);
			vo.setCs_attachments_size(file.getSize());
			vo.setCs_attachments_url(BANNER_PATH + "/" + fileName);
			
		}
		
		//파일첨부2
		if( file2 != null && file2.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments2()) ) {
				String filePath2 = servletContext.getRealPath(vo.getCs_attachments_url2());
				fileUplaodService.deleteFile(filePath2);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName2 = fileUplaodService.uploadFile(file2, path, true);
			
			String [] exts = fileName2.split("\\.");
			
			vo.setCs_attachments2(file2.getOriginalFilename());
			vo.setCs_attachments_type2(exts[1]);
			vo.setCs_attachments_size2(file2.getSize());
			vo.setCs_attachments_url2(BANNER_PATH + "/" + fileName2);
			
		}
		
		//파일첨부3
		if( file3 != null && file3.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments3()) ) {
				String filePath3 = servletContext.getRealPath(vo.getCs_attachments_url3());
				fileUplaodService.deleteFile(filePath3);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName3 = fileUplaodService.uploadFile(file3, path, true);
			
			String [] exts = fileName3.split("\\.");
			
			vo.setCs_attachments3(file3.getOriginalFilename());
			vo.setCs_attachments_type3(exts[1]);
			vo.setCs_attachments_size3(file3.getSize());
			vo.setCs_attachments_url3(BANNER_PATH + "/" + fileName3);
			
		}
		
		JavaScript javaScript = new JavaScript();
		recipientService.updateRecipientDetail(vo);
		
		javaScript.setMessage("수정이  완료되었습니다.\\n 1일(주말제외)후 메일로 발송된 미대상 등록결과를 확인하시고 실태신고를 해 주십시오.");
		javaScript.setLocation("recipientModify.do");
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("/work/research/recipient/recipientCheck.do")
	public String recipientCheck(HttpServletRequest request, Model model,HttpSession session,
			ACTULSUBJECTS vo) throws Exception {
		
		String msg ="";
		String url ="tiles/work/research/recipient/kr_recipient_check";
		
		int Pcnt = 0;
		int Rcnt = 0;
		int Rcnt1 = 0;
		
		if("".equals(vo.getPers_name()) || "".equals(vo.getLic_no())){
			msg ="잘못된 접근입니다.";
		}else{
			Pcnt = recipientService.personCheck(vo.getPers_name(), vo.getLic_no());
			if(Pcnt == 0){
				msg ="일치하는 회원정보가 없습니다.";
			}else if(Pcnt > 1){
				msg ="회원이 두명이상 존재합니다.관리자에게 문의하세요";
			}else{				
				Rcnt = recipientService.recipientCheck(vo.getPers_name(), vo.getLic_no(),vo.getCs_con_education()); 
				Rcnt1 = recipientService.recipientCheck1(vo.getPers_name(), vo.getLic_no(),vo.getCs_con_education()); // 20160118 미대상데이타가 없을시 보수교육 '알수없음'외의 데이타 있으면 '이미 미대상 신청'메세지 뿌림, 없으면 미대상신청페이지로
				
				System.out.println(Rcnt1+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				if(Rcnt > 0){
					msg ="이미 미대상 신청을 하셨습니다.";
				}else if(Rcnt == 0){
					if(Rcnt1 == 0){ 
								
					url ="redirect:/work/research/recipient/recipientForm.do";
					session.setAttribute("recipientVo", vo);
					
				//	model.addAttribute("cs_con_education", cs_con_education);
					
					}else{
						
						msg ="선택년도에 보수교육 미대상자 신청대상이 아닙니다.";
					}
				}
			}
		}
		
		if(!"".equals(msg)) model.addAttribute("msg", msg);
		
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientModifyCheck.do")
	public String recipientModifyCheck(HttpServletRequest request, Model model,HttpSession session,
			ACTULSUBJECTS vo) throws Exception {
		
		String msg ="";
		String url ="tiles/work/research/recipient/kr_recipientModify";
		
		if("".equals(vo.getPers_name()) || "".equals(vo.getLic_no())){
			msg ="잘못된 접근입니다.";
		}else{
			Map pInfo = recipientService.personInfoCheck(vo.getPers_name(), vo.getLic_no(), vo.getPers_hp());
			
			int pCnt = (int) pInfo.get("pCnt");   // 이름, 면허번호로  count
			int hpCnt = (int) pInfo.get("hpCnt"); // 이름, 면허번호, 휴대펀 번호로 count
			int rCnt = (int) pInfo.get("rCnt");   // 회송 count 
			
			if(rCnt == 0) {
				msg ="[회송]인 경우 수정 가능합니다.";
				model.addAttribute("msg", msg);
				return url;
			}
			else {
				if(pCnt == 0) { 
					msg ="일치하는 회원정보가 없습니다.";
					model.addAttribute("msg", msg);
					return url;
				}
				else {
					if(hpCnt == -1) { 
						msg ="휴대폰 번호가 일치하지 않습니다. \\r\\n관리자에게 문의하세요.02-823-5680(내선516)";
						model.addAttribute("msg", msg);
						return url;
					}
					else if(pCnt > 1) {
						msg ="회원이 두명이상 존재합니다. \\r\\n관리자에게 문의하세요.02-823-5680(내선516)";
						model.addAttribute("msg", msg);
						return url;
					}
					else {
						//보수교육 리스트 count 조회
						List<ACTULSUBJECTS> coConEduList = reportService.getRecipientEduList(vo.getPers_name(), vo.getLic_no());
						
						//보수교육 미대상자 내역이 있으면 다음 화면 이동
						if(coConEduList.size() > 0) { 
							//System.out.println("111111111" + coConEduList.toString());
							session.setAttribute("csConEduList", coConEduList);
							session.setAttribute("recipientVo", vo);
							url ="redirect:/work/research/recipient/recipientEduChk.do";
						}
						//보수교육 내역이 없을 경우 신청 화면으로 이동.
						else {
							url ="redirect:/work/research/recipient/recipientForm.do";
							session.setAttribute("recipientVo", vo);
						}
					}
				}
			}
		}
		
		if(!"".equals(msg)) model.addAttribute("msg", msg);
		
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientForm.do")
	public String recipientList(HttpServletRequest request, Model model,HttpSession session) throws Exception {
		String url ="tiles/work/research/recipient/recipient_form";
		
		ACTULSUBJECTS vo = (ACTULSUBJECTS) session.getAttribute("recipientVo");
		
		if(vo==null){
			url ="tiles/work/research/recipient/kr_recipient_check";
			model.addAttribute("msg", "잘못된 접근입니다.");
		}else{
			model.addAttribute("vo", vo);			
			model.addAttribute("getEmail", reportService.getEmail());
			session.removeAttribute("recipientVo");
		}
		
		return url;
	}
	
	@RequestMapping("/work/research/recipient/recipientAction.do")
	public View recipientAction(ACTULSUBJECTS vo,HttpServletRequest request, Model model) throws Exception{
		
		MultipartFile file = vo.getImage_file();
		MultipartFile file2 = vo.getImage_file2();
		MultipartFile file3 = vo.getImage_file3();
		
		if(file.getOriginalFilename().endsWith(".wmv")){
			JavaScript javaScript = new JavaScript();
			javaScript.setMessage("잘못된 파일입니다.");
			javaScript.setLocation("recipient.do");
			return new JavaScriptView(javaScript);
		}
		
		if( file != null && file.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments()) ) {
				String filePath = servletContext.getRealPath(vo.getCs_attachments_url());
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName = fileUplaodService.uploadFile(file, path, true);
			
			String [] exts = fileName.split("\\.");
			
			vo.setCs_attachments(file.getOriginalFilename());
			vo.setCs_attachments_type(exts[1]);
			vo.setCs_attachments_size(file.getSize());
			vo.setCs_attachments_url(BANNER_PATH + "/" + fileName);
			
		}
		
		//파일첨부2
		if( file2 != null && file2.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments2()) ) {
				String filePath = servletContext.getRealPath(vo.getCs_attachments_url2());
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName2 = fileUplaodService.uploadFile(file2, path, true);
			
			String [] exts2 = fileName2.split("\\.");
			
			vo.setCs_attachments2(file2.getOriginalFilename());
			vo.setCs_attachments_type2(exts2[1]);
			vo.setCs_attachments_size2(file2.getSize());
			vo.setCs_attachments_url2(BANNER_PATH + "/" + fileName2);
			
		}
		
		//파일첨부3
		if( file3 != null && file3.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(vo.getCs_attachments3()) ) {
				String filePath3 = servletContext.getRealPath(vo.getCs_attachments_url3());
				fileUplaodService.deleteFile(filePath3);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String fileName3 = fileUplaodService.uploadFile(file3, path, true);
			
			String [] exts3 = fileName3.split("\\.");
			
			vo.setCs_attachments3(file3.getOriginalFilename());
			vo.setCs_attachments_type3(exts3[1]);
			vo.setCs_attachments_size3(file3.getSize());
			vo.setCs_attachments_url3(BANNER_PATH + "/" + fileName3);
			
		}
		
		JavaScript javaScript = new JavaScript();
		
		recipientService.insertRecipient(vo);
		
		javaScript.setMessage("신청이  완료되었습니다.\\n 1일(주말제외)후 메일로 발송된 미대상 등록결과를 확인하시고 실태신고를 해 주십시오.");
		javaScript.setLocation("recipient.do");
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("/work/research/recipient/recipietnDown.do")
	public View recipietnDown( HttpServletRequest request, HttpServletResponse response
								   ,@RequestParam(required = true, defaultValue = "0") String fileUrl
								   ,@RequestParam(required = true, defaultValue = "0") String fileName, Model model
								   ) throws Exception
	{
		
		JavaScript javaScript = new JavaScript();
		
		if("0".equals(fileUrl)){
			javaScript.setMessage("올바른 첨부파일 번호가 아닙니다");
			javaScript.setLocation("");
			return new JavaScriptView(javaScript);
		}else{
			return new DownLoadView( fileUrl, fileName );
		}
		
	}
	
	
	
}
