package kda.work.news;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.FileUploadService;
import kda.common.data.LIST_HELPER;
import kda.login.data.LOGININFO;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.ParamUtils;
import kda.values.CRUDValue;
import kda.work.news.data.KN_EMPLOY;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

@Controller
public class NewsController extends KdaAbstractController{
	
	public final String EMPLOY_FILE_PATH = "/board/file/employ/";
	
	private Log log = LogFactory.getLog(NewsController.class);	
	
	private String tiles = "tiles/work/news/";
	
	@Autowired
	private NewsService service;	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	private FileUploadService fileUplaodService;
 	
	@RequestMapping("/work/news/kn_calendar")
	public String kn_calendar( @RequestParam(required=false) String yy
			  				 , @RequestParam(required=false) String mm
							 , Model model ) throws Exception {

		Calendar cal = Calendar.getInstance(); 
		
		if ( yy == null ) 
			yy = "" + cal.get(Calendar.YEAR);
		
		if ( mm == null ) 
			mm = "" + ( cal.get(Calendar.MONTH) + 1 );
		
		if ( mm.length() == 1 )
			mm = "0" + mm;
		
		model.addAttribute("YY", yy);
		model.addAttribute("MM", mm);
		model.addAttribute("DD", KdaStringUtil.getDay());
		model.addAttribute("list", service.get_schedulex_list(yy, mm));
		return tiles + "kn_calendar";
	}
	
	@RequestMapping("/work/news/kn_license.do")
	public String knLicenseReg(HttpSession session, Model model ) throws Exception {
		if( !checkLogin(session) ) {
			return getHistoryBackPage("로그인 후 사용하여 주십시요", model);
		}
		String codePers = getCodePers(session);
		
		PERSON_M_TBL person = memberService.getPersonMTblByCode(codePers, false);
		model.addAttribute("person", person);
		
		return tiles + "kn_license";
	}
	
	@RequestMapping("/work/news/kn_ajax_license.do")
	public @ResponseBody String knAjaxLicense(@RequestParam String licNo, HttpSession session, Model model) 
			throws Exception {
		if( !checkLogin(session) ) {
			return "로그인 후 사용하여 주십시요.";
		}
		
		String codePers = getCodePers(session);
		if( memberService.getLicNo(licNo, codePers) != null ) {
			return "중복된 면허번호입니다.";
		}
		
		try {			
			memberService.updateLicNo(codePers, licNo);
			return "면허번호가 변경되었습니다.";
		} catch(Exception e) {
			return "3";
		}
	}
	
	/**
	 * 구인정보 목록
	 * 
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/work/news/kn_careers.do")
	public String careersList(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request); 
		listHelper = service.getEmployList(listHelper);
	
		model.addAttribute("listHelper", listHelper);
		return  tiles + "kn_careers";
	}
	
	/**
	 * 구인정보 상세보기
	 * 
	 * @param idx
	 * @param rnum
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/work/news/kn_careers_view.do")
	public String careersView(@RequestParam int idx, 
			@RequestParam( required=false, defaultValue="1" ) int rnum,
			HttpSession session, HttpServletRequest request, Model model) 
		throws Exception {
		
		KN_EMPLOY employ = service.getEmploy(idx);
		if( employ == null ) {
			return "/error/";
		} else {
			
			/** 서브목록 조회 */
			Map paramMap = ParamUtils.getParamMap(request);
			paramMap.put("rnum", rnum);
			List<Map> naviList = service.getEmployNavi(paramMap);
			
			if( checkLogin(session) ) {
				/* 댓글 조회 */
				List<Map> cmtList = service.getEmployComment(idx);
				if( cmtList == null) {
					cmtList = new ArrayList<Map>();
				}
				model.addAttribute("cmtList", cmtList);
			}
			
			model.addAttribute("employ", employ);
			model.addAttribute("naviList", naviList);
			model.addAttribute("params", ParamUtils.getParamString(request) );
			// model.addAttribute("isAdmin", false );	
			return  tiles + "kn_careers_view";
		}
	}
	
	@RequestMapping("/work/news/kn_careers_download.do")
	public View downLoad(@RequestParam int idx, Model model ) throws Exception {
		KN_EMPLOY employ = service.getEmploy(idx);
		String path = servletContext.getRealPath(employ.getBbs_file_url());
		path = employ.getBbs_file_url();
		return new DownLoadView(path, employ.getBbs_file_name());
	}
	
	/**
	 * 구입정보 Form
	 * 
	 * @param eIndex
	 * @param pwd
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/work/news/kn_careers_form.do")
	public String careersForm(@RequestParam (defaultValue="0", required=false) int eIndex, 
				@RequestParam ( defaultValue="", required=false) String pwd,
				HttpSession session, Model model,HttpServletResponse resp
				) throws Exception { 
		KN_EMPLOY employ = null;
		if( eIndex == 0  ) {
			employ = new KN_EMPLOY();
			employ.setCrud(CRUDValue.C);
			
	        employ.setEcemail(null);
	        employ.setEpwd(null);

	        model.addAttribute("clearOnLoad", Boolean.TRUE);
			
		} else {
			employ = service.getEmploy(eIndex);
			if( !isAdmin(session) && !employ.getEpwd().equals(pwd) ) {
				return getHistoryBackPage("비밀번호가 올바르지 않습니다", model);
			}
			employ.convertForm();
			employ.setCrud(CRUDValue.U);
		} 
		
		resp.setHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0");
		resp.addHeader("Cache-Control","post-check=0, pre-check=0");
		resp.setHeader("Pragma","no-cache");
		resp.setDateHeader("Expires", 0);
		
		model.addAttribute("employ", employ);
		return tiles + "kn_careers_form";
	}
	
	@RequestMapping("/work/news/kn_careers_action.do")
	public View careersAction(KN_EMPLOY employ) throws Exception {
		
		employ.convertDB();
		
		MultipartFile file = employ.getBbs_file();
		if(file.getOriginalFilename().endsWith(".wmv")){
			JavaScript javaScript = new JavaScript();
			javaScript.setMessage("잘못된 파일입니다.");
			javaScript.setLocation("./kn_careers.do");
			return new JavaScriptView(javaScript);
		}
		
		if( file != null && file.getSize() > 0 ) {

			if( file.getSize() > 10485760 ) {
				// file 크기 제한 : 10MByte(= 10,485,760 byte)
				log.info("=========== file getSize => " + file.getSize()+ " Byte // " + (file.getSize()/1024) + " KByte" + (file.getSize()/1024/1024) + " MByte");
				
				JavaScript javaScript = new JavaScript();
				javaScript.setMessage("첨부파일 크기가 큽니다.(크기제한 : 10MB)");
				javaScript.setLocation("./kn_careers.do");
				return new JavaScriptView(javaScript);
				
			} else {
				
				// 기존 이미지가 존재할 경우 삭제
				if( !KdaStringUtil.isEmpty(employ.getBbs_file_url()) ) {
					String filePath = servletContext.getRealPath(employ.getBbs_file_url());
					fileUplaodService.deleteFile(filePath);
				}
				
				// 신규 파일을 저장하고 Setter처리
				String path = servletContext.getRealPath(EMPLOY_FILE_PATH);
				String fileName = fileUplaodService.uploadImage(file, path);
				
				employ.setBbs_file_name( file.getOriginalFilename() );
				employ.setBbs_file_url( EMPLOY_FILE_PATH + fileName );
				employ.setBbs_file_size( file.getSize() );
				employ.setBbs_file_type( KdaStringUtil.getExtension(fileName));
				
			}
		}
		
		JavaScript javaScript = new JavaScript();
		switch(employ.getCrud()) {
		case C :
			service.insertEmploy(employ);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U :
			service.updateEmploy(employ);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			if( !KdaStringUtil.isEmpty(employ.getBbs_file_url()) ) {
				String filePath = servletContext.getRealPath(employ.getBbs_file_url());
				fileUplaodService.deleteFile(filePath);
			}
			service.deleteEmploy(employ.getEindex());
			javaScript.setMessage("삭제 되었습니다.");
			break;
		}
		javaScript.setLocation("./kn_careers.do");
		return new JavaScriptView(javaScript);
	}
	
	
	@RequestMapping("/work/news/kn_careers_cmt_action")
	public String careeersCmtAction(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		LOGININFO user = getUserInfo(session);
		if( !checkLogin(session) && !isAdmin(session)) {
			return getHistoryBackPage("잘못된 호출입니다.", model);
		}
		
		Map requestMap = ParamUtils.getParamMap(request);
		String viewParam = "idx=" + requestMap.get("cEmIndex") + "&rnum=" + requestMap.get("rnum");
		if( requestMap.get("crud").equals("C")) {
			requestMap.put("cUser_Id", session.getAttribute(SessionInfo.USER_ID) );
			requestMap.put("cName", session.getAttribute(SessionInfo.PERS_NAME));
			requestMap.put("cJobIndex", 0);
			requestMap.put("cUser_Ip", request.getRemoteAddr());
			service.insertEmployComment(requestMap);
			
		} else  if( requestMap.get("crud").equals("D")  ) {
			
			int cIndex = Integer.parseInt(requestMap.get("cIndex").toString());
			service.deleteEmployComment(cIndex);
		}
		return "redirect:/work/news/kn_careers_view.do?" + viewParam;
	}
	
	@RequestMapping("/work/news/kn_job")
	public String job(Model model) throws Exception {
		return "tiles/work/news/kn_job";
	}
	
	@RequestMapping("/work/news/kn_job_action")
	public View jobAction(HttpServletRequest request, Model model) throws Exception {
		Map paramMap = ParamUtils.getParamMap(request);
		paramMap.put("today", KdaStringUtil.getTodayString());
		service.insertJob(paramMap);
		
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("저장되었습니다.");
		javaScript.setLocation("/work/news/kn_notice.do?bbs_board_code=2");
		
		return new JavaScriptView(javaScript);
	}
}
