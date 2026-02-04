package kda.admin.edu;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.edu.data.EDUGREEN;
import kda.admin.edu.data.ESTABLISHMENT;
import kda.common.CommonService;
import kda.common.data.GROUPCODE;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;


@Controller
public class AdminEduController extends KdaAbstractController{
	
	public static final HashMap<String, String> CERT_TY = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = -6545709996424734278L;
		{
			put("001002", "임상영양사 소지자");
			put("001003", "임상영양사 수료자");
			put("002001", "재수강 임상 소지자 및 수료자");
			put("002002", "재수강 일반");
		}
	};
	
	@Autowired
	private AdminEduService adminEduService;
	
	@Autowired
	private CommonService commonService;
	
	
	@RequestMapping("djemals/edu/cert.do")
	public String edu(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/edu/certList.do";
	}
	
	@RequestMapping("djemals/edu/certList.do")
	public String certList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = adminEduService.getCertListHelper(listHelper);
		
		model.addAttribute("certTy", CERT_TY);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "certList.do");
		model.addAttribute("title", "교육부분");
		return "tiles:admin/edu/cert_list";
	}
	
	@RequestMapping("djemals/edu/certEdit.do")
	public View certEdit(ESTABLISHMENT vo, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		String pers_name = vo.getPers_name();
		String lic_no = vo.getLic_no();
		String code_new = vo.getCode_new();
		String code_old = vo.getCode_old();
		String pers_birth = "";
		
		ESTABLISHMENT establishment = adminEduService.getCertInfo(pers_name,lic_no,code_old);
		
		pers_birth = establishment.getPers_birth();
		
		adminEduService.deleteCertInfo(pers_name,lic_no,code_old);
		
		adminEduService.insertCertInfo(pers_name,lic_no,pers_birth,code_new);
		
		javaScript.setMessage("수정 되었습니다.");
		
		String url ="certList.do";
		
		url +="?srchTy="+vo.getSrchTy()+"&srchName="+vo.getSrchName()+"&srchNo="+vo.getSrchNo();
		
		javaScript.setLocation(url);
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/edu/certInsert.do")
	public View certInsert(ESTABLISHMENT vo, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		String pers_name = vo.getSrchName();
		String lic_no = vo.getSrchNo();
		String code_new = vo.getSrchTy();
		String pers_birth = "";
		String msg = "";
		
		List<ESTABLISHMENT> persList = adminEduService.getPersBirth(pers_name, lic_no);
		
		if(persList.size()==0){
			msg = "회원이 아닙니다.";
		}else if(persList.size()>1){
			msg = "다수의 회원이 검색되었습니다. 관리자에게 문의가 필요합니다.";
		}else if(persList.size()==1){

			ESTABLISHMENT establishment = adminEduService.getGroupCode(pers_name, lic_no); 
			
			if("001001".equals(establishment.getGroupcode())){
				
				pers_birth = persList.get(0).getPers_birth();
				adminEduService.insertNewCert(pers_name, lic_no, pers_birth, code_new);
				
				msg = "등록되었습니다.";
				
			}else{
				
				String code_name ="";
				if("001002".equals(establishment.getGroupcode())){
					code_name = "임상영양사 소지자";
				}else if("001003".equals(establishment.getGroupcode())){
					code_name = "임상영양사 수료자";
				}else if("002001".equals(establishment.getGroupcode())){
					code_name = "재수강 일반";
				}else if("002002".equals(establishment.getGroupcode())){
					code_name = "재수강 임상 소지자 및 수료자";
				} 
				msg = code_name+" 에 등록되어 있습니다.검색 후 수정해주십시오.";
			}
		}
		
		javaScript.setMessage(msg);
		
		String url ="certList.do";
		
		javaScript.setLocation(url);
		return new JavaScriptView(javaScript);
	}
	
	
	
	@RequestMapping("djemals/edu/est.do")
	public String eduEst(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/edu/estList.do";
	}
	
	@RequestMapping("djemals/edu/estList.do")
	public String estList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = adminEduService.getEstListHelper(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "estList.do");
		model.addAttribute("title", "교육부분");
		return "tiles:admin/edu/est_list";
	}
	
	
	
	@RequestMapping("djemals/edu/green.do")
	public String green(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/edu/greenList.do";
	}
	
	@RequestMapping("djemals/edu/greenList.do")
	public String greenList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = adminEduService.getGreenListHelper(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "greenList.do");
		model.addAttribute("title", "교육부분");
		return "tiles:admin/edu/green_list";
	}
	
	private String nv(String v) {
	    return v == null ? "" : v.trim();
	}
	
	@RequestMapping("djemals/edu/logList.do")
	public String logList(HttpServletRequest request, Model model) throws Exception {
		
		LIST_HELPER listHelper = new LIST_HELPER(request);
		HashMap<String, Object> search =  new java.util.HashMap<>();
		Calendar cal = Calendar.getInstance();   // 시스템 TZ
		String endm   = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		cal.add(Calendar.MONTH, -6);
		String startm = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		
		if (nv(request.getParameter("startm"))==""){
			search.put("startm",  startm); 
			listHelper.setParam("startm", startm);
		}else{
			 search.put("startm",       nv(request.getParameter("startm")));
		}
		
		if (nv(request.getParameter("endm"))==""){
			search.put("endm",  endm);
			listHelper.setParam("endm", endm);
			 
		}else{
			search.put("endm",         nv(request.getParameter("endm")));
		}
		
		
		listHelper = adminEduService.getLogListHelper(listHelper); 
		
		
		
		search.put("year",         nv(request.getParameter("year")));
	    search.put("detcode",      nv(request.getParameter("detcode")));         // 셀렉트 value(코드)
	   
	    
	    search.put("person_name",  nv(request.getParameter("person_name")));
		
		System.out.print(search);
 
		List<GROUPCODE> cdmap = commonService.getGroupCodeList("036", null); 
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("yearList",cdmap);
		model.addAttribute("search",search);
		
		model.addAttribute("url", "logList.do");
		model.addAttribute("title", "교육부분");
		return "tiles:admin/edu/log_list";
	}
	
	@RequestMapping(value="djemals/edu/setEduList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> setEduList(HttpServletResponse response, 
	        @RequestParam(value = "year", required = false) Integer year,
	        Model model) throws Exception {
		Map<String, Object> param = new java.util.HashMap<>();  
		param.put("year", year);
	    
	    System.out.println(param);
	    return adminEduService.setEduList(param);
		 
		
	}
	
	@RequestMapping("djemals/edu/greenAction.do")
	public View greenAction(EDUGREEN vo,HttpServletRequest request, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			
			//javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			//javaScript.setMessage("완료처리 되었습니다.");
			break;
		case D:
			String checkIdx = request.getParameter("checkIdx");
			
			List<String> idxList = new ArrayList<String>();
			
			String [] idx = checkIdx.split(",");
			String id = "";
			
			for(int i=0;i<idx.length;i++){
				id = idx[i];
				idxList.add(id);
			}
			
			adminEduService.deleteGreen(idxList);
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("greenList.do");
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/edu/greenDown.do")
	public View green_file_download( HttpServletRequest request, HttpServletResponse response
								   ,@RequestParam(required = true, defaultValue = "0") String idx, Model model
								   ) throws Exception
	{
		
		JavaScript javaScript = new JavaScript();
		
		if("0".equals(idx)){
			javaScript.setMessage("올바른 첨부파일 번호가 아닙니다");
			javaScript.setLocation("");
			return new JavaScriptView(javaScript);
		}else{
			EDUGREEN vo = adminEduService.getFileUrl(idx);
			
			String fileUrl = "";
			String fileName = "";
			
			fileUrl = vo.getFile_add();
			fileName = vo.getFile_flag();
			
			return new DownLoadView( fileUrl, fileName );
			
		}
		
	}
	
	
	@RequestMapping("djemals/edu/estExcel.do")
	public View estExcel(HttpServletRequest request, HttpServletResponse responsem, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("estExcel", userid, "개설요청신청");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"regi_date","edu_type_text","name","birth","lic_no","hp","email","edu_area","big_name","company_name"}; //헤더 영문
		String header_k[]={"신청일시","교육과정","이름","생년월일","면허번호","연락처","이메일","소속지부","소속분과","근무처명"}; //헤더 국문			
		list = adminEduService.excelEst();
		/*List<Map<String, Object>> list2 = new ArrayList<>();
		for( Map map : list ) {
			list2.add(map);
		}*/
		
		return new ExcelDown("estExcel", header_k, header_e, list);
	}
	
	@RequestMapping("djemals/edu/greenExcel.do")
	public View greenExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("greenExcel", userid, "논문초록신청");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"num","gubun","edu_type","name","pers_birth","email","tel_hp","tel", "crtitle_name" , "branch_name","name2","branch_name2","lic_no2","file_add","reg_date"}; //헤더 영문
		String header_k[]={"번호","구분","분야","이름","생년월일","이메일","휴대전화","전화번호","초록제목","소속", "제1저자-이름","제1저자-소속","제1저자-면허번호","파일","신청일시"}; //헤더 국문
		list = adminEduService.excelGreen();
	
		return new ExcelDown("greenExcel", header_k, header_e, list);
		
	}
	
	@RequestMapping("djemals/edu/logExcel.do")
	public View logExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("logExcel", userid, "이수확인서 출력 리스트");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"num","print_date","print_seq","pers_name","lic_no","id","print_name"}; //헤더 영문
		String header_k[]={"번호"," 출력일","이수확인서 발급번호","이름","면허번호","ID","교육명"}; //헤더 국문
		list = adminEduService.excelLog();
	
		return new ExcelDown("logExcel", header_k, header_e, list);
		
	}

}
