package kda.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.mypage.data.MYEDUINFO;
import kda.mypage.data.MYLICENSEINFO;
import kda.mypage.data.MYMAGAZINEINFO;
import kda.mypage.data.MYMEMBERINFO;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.KdaStringUtil;
import kda.utils.MailBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyPageHController extends KdaAbstractController
{
	private Log log = LogFactory.getLog(MyPageHController.class);

	@Autowired
	MyPageHDao dao;	
	
	@Autowired
	MyPageHService service;
	

	@RequestMapping("kmp_benefit.do")
	public String kmpBenefit(HttpSession session, Model model) throws Exception {
		if( !checkLogin(session) ) {
			return getHistoryBackPage("로그인후 이용하여 주십시요", model);
		}
		return "tiles" + "/mypage/kmp_benefit";
	}
	
	
	@RequestMapping("kmp_situation")	
	public String kmp_situation(HttpSession session, Model model ) throws Exception
	{
		setDefaultModel(session, model);
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
	
		HashMap<String, Object> paramMap = new HashMap<String, Object>();	
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );		
		model.addAttribute("myList" , dao.getMyEduSituation(paramMap));	
				
		return "tiles" + "/mypage/kmp_situation";
	}
	 
	@RequestMapping("kmp_license")	
	public String kmp_license(HttpSession session, Model model ) throws Exception
	{
		setDefaultModel(session, model);
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("oper_name", (String) session.getAttribute(SessionInfo.PERS_NAME) );
		paramMap.put("oper_birth", (String) session.getAttribute(SessionInfo.PERS_BIRTH) );
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("state", "10");
		List<MYEDUINFO> myList = dao.getMyEduLicense(paramMap);
		
		Map rowMap = new HashMap();
		Map compMap = new HashMap();
		
		try {
			for ( int i =0; i < myList.size(); i++ ) {
				
				MYEDUINFO edu = (MYEDUINFO)myList.get(i);
				int rowCount =  KdaStringUtil.nullToInt(rowMap.get(edu.getCode_certifi()), 0);
				rowMap.put(edu.getCode_certifi(), rowCount+1);
				
				String key = edu.getCode_kind() + edu.getCode_certifi() + edu.getCode_seq() + edu.getCode_bran() + edu.getBran_seq() + edu.getSeason();
				
				int resultState = KdaStringUtil.nullToInt(edu.getResult_state(), 0);
				if( resultState >= 10 ) {
					int season = KdaStringUtil.nullToInt(edu.getSeason(), 0); 
					if( season == 1 ) {
						compMap.put( edu.getCode_certifi() + "1st"  , edu.getResult_no());
						compMap.put( edu.getCode_certifi() + "1key", key);
					} else if( season == 2) {
						compMap.put( edu.getCode_certifi() + "2st" ,  edu.getResult_no());
						compMap.put( edu.getCode_certifi() + "2key", key);
					} else if( season == 3 ) {
						compMap.put( edu.getCode_certifi() + "1st"  ,  edu.getResult_no());
						compMap.put( edu.getCode_certifi() + "1key", key);
					} else if( season == 4) {
						compMap.put( edu.getCode_certifi() + "2st" ,  edu.getResult_no());
						compMap.put( edu.getCode_certifi() + "2key", key);
						
					}
				}	
			}
			model.addAttribute("compMap", compMap);
			model.addAttribute("rowMap", rowMap);
			model.addAttribute("myList" , myList);
			
		} catch(Exception e) {
			log.info(e.toString());
		}
		
		
		return "tiles" + "/mypage/kmp_license";
	}
	
	@RequestMapping("kmp_elderly")	
	public String kmp_elderly(HttpSession session
							, Model model
							, HttpServletRequest request) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("code_certifi", 4 );
		
		List<MYEDUINFO> myList = dao.getMyEduOlderly(paramMap);
		
		String  view_num = "0";
		
		if(request.getParameter("no") != null){
			view_num = request.getParameter("no");
		}
		
		String result_no  = "";
		String result_start_dt  = "";
		String result_end_dt = "";
		String col1 = "";
		String col2 = "";
		String col3 = "";
		String total = "";
			
		try
		{
			String edu_name[] = new String[myList.size()];
			
			for ( int i = 0; i < myList.size(); i++ )
			{
				MYEDUINFO info = (MYEDUINFO)myList.get(i);
				String temp_result_no  = info.getResult_no();
				String temp_result_start_dt  = info.getResult_start_dt();
				String temp_result_end_dt = info.getResult_end_dt();
				String temp_col1 = info.getCol1();
				String temp_col2 = info.getCol2();
				String temp_col3 = info.getCol3();
				String temp_total = info.getTotal();
				
				if(String.valueOf(i).equals(view_num) ){
					result_no  = temp_result_no;
					result_start_dt  = temp_result_start_dt;
					result_end_dt = temp_result_end_dt;
					col1 = temp_col1;
					col2 = temp_col2;
					col3 = temp_col3;
					total = temp_total;
					
					model.addAttribute("result_no", result_no);
					model.addAttribute("result_start_dt",  result_start_dt.substring(0,4) + "."+ result_start_dt.substring(4,6) + "." + result_start_dt.substring(6,8));
					model.addAttribute("result_end_dt", result_end_dt.substring(0,4) + "."+ result_end_dt.substring(4,6) + "." + result_end_dt.substring(6,8));
					model.addAttribute("col1", col1);
					model.addAttribute("col2", col2);
					model.addAttribute("col3", col3);
					model.addAttribute("total", total);
					model.addAttribute("view_num", i);
					
				}
				
				edu_name[i] = "자격증 번호 :" + temp_result_no +" / 유효기간 : "
				+ temp_result_start_dt.substring(0,4) + "."+ temp_result_start_dt.substring(4,6) + "." + temp_result_start_dt.substring(6,8)
				+ " ~ "	+ temp_result_end_dt.substring(0,4) + "."+ temp_result_end_dt.substring(4,6) + "." +temp_result_end_dt.substring(6,8);
				
				
				log.info("edu_name[ "+ i  +"] = " + edu_name[i] );
			}
			
			model.addAttribute("myList", edu_name);
			
		}
		catch(Exception e)
		{
			log.info(e.toString());
		}
		
		
		paramMap.put("result_start_dt", result_start_dt);		
		paramMap.put("result_end_dt", result_end_dt);		
	
		model.addAttribute("myList2" , dao.getMyEduOlderly2(paramMap));
		
		return "tiles" + "/mypage/kmp_elderly";
	}
	
	@RequestMapping("kmp_sport")	
	public String kmp_sport(HttpSession session, Model model, HttpServletRequest request ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("code_certifi", 5 );
		
		List<MYEDUINFO> myList = dao.getMyEduOlderly(paramMap);
		
		String  view_num = "0";
		
		if(request.getParameter("no") != null){
			view_num = request.getParameter("no");
		}
		
		String result_no  = "";
		String result_start_dt  = "";
		String result_end_dt = "";
		String col1 = "";
		String col2 = "";
		String col3 = "";
		String total = "";
			
		try
		{
			String edu_name[] = new String[myList.size()];
			
			for ( int i = 0; i < myList.size(); i++ )
			{
				MYEDUINFO info = (MYEDUINFO)myList.get(i);
				String temp_result_no  = info.getResult_no();
				String temp_result_start_dt  = info.getResult_start_dt();
				String temp_result_end_dt = info.getResult_end_dt();
				String temp_col1 = info.getCol1();
				String temp_col2 = info.getCol2();
				String temp_col3 = info.getCol3();
				String temp_total = info.getTotal();
				
				if(String.valueOf(i).equals(view_num) ){
					result_no  = temp_result_no;
					result_start_dt  = temp_result_start_dt;
					result_end_dt = temp_result_end_dt;
					col1 = temp_col1;
					col2 = temp_col2;
					col3 = temp_col3;
					total = temp_total;
					
					model.addAttribute("result_no", result_no);
					model.addAttribute("result_start_dt",  result_start_dt.substring(0,4) + "."+ result_start_dt.substring(4,6) + "." + result_start_dt.substring(6,8));
					model.addAttribute("result_end_dt", result_end_dt.substring(0,4) + "."+ result_end_dt.substring(4,6) + "." + result_end_dt.substring(6,8));
					model.addAttribute("col1", col1);
					model.addAttribute("col2", col2);
					model.addAttribute("col3", col3);
					model.addAttribute("total", total);
					model.addAttribute("view_num", i);
					
				}
				
				edu_name[i] = "자격증 번호 :" + temp_result_no +" / 유효기간 : "
				+ temp_result_start_dt.substring(0,4) + "."+ temp_result_start_dt.substring(4,6) + "." + temp_result_start_dt.substring(6,8)
				+ " ~ "	+ temp_result_end_dt.substring(0,4) + "."+ temp_result_end_dt.substring(4,6) + "." +temp_result_end_dt.substring(6,8);
				log.info("edu_name[ "+ i  +"] = " + edu_name[i] );
				
				
				
			}
			
			model.addAttribute("myList", edu_name);
			
		}
		catch(Exception e)
		{
			log.info(e.toString());
		}
		
		
		paramMap.put("result_start_dt", result_start_dt);		
		paramMap.put("result_end_dt", result_end_dt);		
	
		model.addAttribute("myList2" , dao.getMyEduOlderly2(paramMap));
		
		return "tiles" + "/mypage/kmp_sport";
	}

	@RequestMapping("kmp_feed")	
	public String kmp_feed(HttpSession session, Model model, HttpServletRequest request ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("code_certifi", 1 );
		
		List<MYEDUINFO> myList = dao.getMyEduOlderly(paramMap);
		
		String  view_num = "0";
		
		if(request.getParameter("no") != null){
			view_num = request.getParameter("no");
		}
		
		String result_no  = "";
		String result_start_dt  = "";
		String result_end_dt = "";
		String col1 = "";
		String col2 = "";
		String total = "";
			
		try
		{
			String edu_name[] = new String[myList.size()];
			
			for ( int i = 0; i < myList.size(); i++ )
			{
				MYEDUINFO info = (MYEDUINFO)myList.get(i);
				String temp_result_no  = info.getResult_no();
				String temp_result_start_dt  = info.getResult_start_dt();
				String temp_result_end_dt = info.getResult_end_dt();
				String temp_col1 = info.getCol1();
				String temp_col2 = info.getCol2();
				String temp_total = info.getTotal();
				
				if(String.valueOf(i).equals(view_num) ){
					result_no  = temp_result_no;
					result_start_dt  = temp_result_start_dt;
					result_end_dt = temp_result_end_dt;
					col1 = temp_col1;
					col2 = temp_col2;
					total = temp_total;
					
					model.addAttribute("result_no", result_no);
					model.addAttribute("result_start_dt",  result_start_dt.substring(0,4) + "."+ result_start_dt.substring(4,6) + "." + result_start_dt.substring(6,8));
					model.addAttribute("result_end_dt", result_end_dt.substring(0,4) + "."+ result_end_dt.substring(4,6) + "." + result_end_dt.substring(6,8));
					model.addAttribute("col1", col1);
					model.addAttribute("col2", col2);
					model.addAttribute("total", total);
					model.addAttribute("view_num", i);
					
				}
				
				edu_name[i] = "자격증 번호 :" + temp_result_no +" / 유효기간 : "
				+ temp_result_start_dt.substring(0,4) + "."+ temp_result_start_dt.substring(4,6) + "." + temp_result_start_dt.substring(6,8)
				+ " ~ "	+ temp_result_end_dt.substring(0,4) + "."+ temp_result_end_dt.substring(4,6) + "." +temp_result_end_dt.substring(6,8);
				log.info("edu_name[ "+ i  +"] = " + edu_name[i] );
				
				
				
			}
			
			model.addAttribute("myList", edu_name);
			
		}
		catch(Exception e)
		{
			log.info(e.toString());
		}
		
		
		paramMap.put("result_start_dt", result_start_dt);		
		paramMap.put("result_end_dt", result_end_dt);		
	
		model.addAttribute("myList2" , dao.getMyEduOlderly2(paramMap));
		
		return "tiles" + "/mypage/kmp_feed";
	}	
	 
	@RequestMapping("kmp_health")	
	public String kmp_health(HttpSession session, Model model, HttpServletRequest request ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();	
		
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("code_certifi", 3 );
		
		List<MYEDUINFO> myList = dao.getMyEduOlderly(paramMap);
		
		String  view_num = "0";
		
		if(request.getParameter("no") != null){
			view_num = request.getParameter("no");
		}
		
		String result_no  = "";
		String result_start_dt  = "";
		String result_end_dt = "";
		String col1 = "";
		String col2 = "";
		String total = "";
			
		try
		{
			String edu_name[] = new String[myList.size()];
			
			for ( int i = 0; i < myList.size(); i++ )
			{
				MYEDUINFO info = (MYEDUINFO)myList.get(i);
				String temp_result_no  = info.getResult_no();
				String temp_result_start_dt  = info.getResult_start_dt();
				String temp_result_end_dt = info.getResult_end_dt();
				String temp_col1 = info.getCol1();
				String temp_col2 = info.getCol2();
				String temp_total = info.getTotal();
				
				if(String.valueOf(i).equals(view_num) ){
					result_no  = temp_result_no;
					result_start_dt  = temp_result_start_dt;
					result_end_dt = temp_result_end_dt;
					col1 = temp_col1;
					col2 = temp_col2;
					total = temp_total;
					
					model.addAttribute("result_no", result_no);
					model.addAttribute("result_start_dt",  result_start_dt.substring(0,4) + "."+ result_start_dt.substring(4,6) + "." + result_start_dt.substring(6,8));
					model.addAttribute("result_end_dt", result_end_dt.substring(0,4) + "."+ result_end_dt.substring(4,6) + "." + result_end_dt.substring(6,8));
					model.addAttribute("col1", col1);
					model.addAttribute("col2", col2);
					model.addAttribute("total", total);
					model.addAttribute("view_num", i);
					
				}
				
				edu_name[i] = "자격증 번호 :" + temp_result_no +" / 유효기간 : "
				+ temp_result_start_dt.substring(0,4) + "."+ temp_result_start_dt.substring(4,6) + "." + temp_result_start_dt.substring(6,8)
				+ " ~ "	+ temp_result_end_dt.substring(0,4) + "."+ temp_result_end_dt.substring(4,6) + "." +temp_result_end_dt.substring(6,8);
				log.info("edu_name[ "+ i  +"] = " + edu_name[i] );
				
				
				
			}
			
			model.addAttribute("myList", edu_name);
			
		}
		catch(Exception e)
		{
			log.info(e.toString());
		}
		
		
		paramMap.put("result_start_dt", result_start_dt);		
		paramMap.put("result_end_dt", result_end_dt);		
	
		model.addAttribute("myList2" , dao.getMyEduOlderly2(paramMap));
		
		return "tiles" + "/mypage/kmp_health";		
	}	
	
	@RequestMapping("kmp_hygiene")	
	public String kmp_hygiene(HttpSession session, Model model ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		log.info("================================ MyPageController [kmp_hygiene]");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("pers_birth", (String) session.getAttribute(SessionInfo.PERS_BIRTH) );
		paramMap.put("pers_name", (String) session.getAttribute(SessionInfo.PERS_NAME) );
		model.addAttribute("myList" , dao.getMyEduHygiene(paramMap));		
		
		return "tiles" + "/mypage/kmp_hygiene";
	}
	      
	@RequestMapping("kmp_repair")	
	public String kmp_repair(HttpSession session, Model model ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		log.info("================================ MyPageController [kmp_repair]");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pers_birth", (String) session.getAttribute(SessionInfo.PERS_BIRTH) );
		paramMap.put("pers_name", (String) session.getAttribute(SessionInfo.PERS_NAME) );
		model.addAttribute("myList" , dao.getMyEduRepair(paramMap));
		
		return "tiles" + "/mypage/kmp_repair";
	}	
	
	@RequestMapping("kmp_payment")	
	public String kmp_payment(HttpSession session, Model model
			 					, @RequestParam(required=false) String doc_code,
			 					  @RequestParam(defaultValue = "1") int page,
		                          @RequestParam(defaultValue = "10") int pageSize) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		log.info("================================ MyPageController [kmp_payment]" + doc_code);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(new Date()); 
		
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap.put("doc_code", doc_code );
		
		int totalCount = dao.getMyPaymentCount(paramMap);
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		int offset = (page - 1) * pageSize; // 실제 조회 시작 위치

		int pageBlockSize = 10;
		int currentBlock = (int) Math.ceil((double) page / pageBlockSize);
		int startPage = (currentBlock - 1) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPage);
	   
		paramMap.put("start", offset);
		paramMap.put("pageSize", pageSize);
		
		
		paramMap2.put("start", 0);
		paramMap2.put("pageSize", 5);
		paramMap2.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );
		paramMap2.put("doc_code", doc_code );

		String dues_h_seq="";
		String dues_gubun="";
		
		List<MYEDUINFO> list = dao.getMyPayment(paramMap2);
		
		boolean memberYn = false;
		for (MYEDUINFO dto : list) { 
		    if (
		        dto.getAuth_start().compareTo(today) <= 0 &&
		        dto.getAuth_end().compareTo(today) >= 0 &&
		        "3".equals(dto.getConform_yn()) &&
		        !"71".equals(dto.getCode_member()) &&
		        !"72".equals(dto.getCode_member())
		    ) {
		        memberYn = true;
		        dues_h_seq= dto.getDues_h_seq();
		        dues_gubun = dto.getDues_gubun();
		        break;
		    }
		}
		
		
		
		model.addAttribute("dues_gubun", dues_gubun);
		model.addAttribute("dues_h_seq", dues_h_seq);
		model.addAttribute("memberYn", memberYn ? "Y" : "N");
	    model.addAttribute("myList" , dao.getMyPayment(paramMap));
		//model.addAttribute("doc_name" ,  dao.getDocName(paramMap));
		
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalPage", totalPage); 
	    model.addAttribute("startPage", startPage); // 블록 시작 번호
	    model.addAttribute("endPage", endPage);     // 블록 끝 번호
	    
		
	
		return "tiles" + "/mypage/kmp_payment";
	}
	 
	@RequestMapping("/print/member_print")	
	public String kmp_payment_print(HttpSession session, Model model
			 					, @RequestParam(required=false) String dues_h_seq
			 					, @RequestParam(required=false) String dues_gubun ) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		} 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		
		paramMap.put("dues_h_seq", dues_h_seq );
		paramMap.put("dues_gubun", dues_gubun );
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );	
		System.out.println(paramMap);
		
		Map userInfo = dao.getMyPayment_user(paramMap);
		Map DocuInfo = dao.getMyPayment_print(paramMap);
		
		model.addAttribute("DocuInfo" , DocuInfo); 
		model.addAttribute("UserInfo" , userInfo);	
		
		String PRES_LET_DT = DocuInfo.get("PRES_LET_DT").toString().substring(0,4)
				+ "년   "
				+ DocuInfo.get("PRES_LET_DT").toString().substring(4,6)
				+ "월   "
				+ DocuInfo.get("PRES_LET_DT").toString().substring(6,8)
				+ "일  ";
		
		String temp_result_start_dt= DocuInfo.get("AUTH_START").toString();
		String temp_result_end_dt= DocuInfo.get("AUTH_END").toString();
		
		String result_dt= temp_result_start_dt.substring(0,4) + "/"+ temp_result_start_dt.substring(4,6) + "/" + temp_result_start_dt.substring(6,8)
		+ " ~ "	+ temp_result_end_dt.substring(0,4) + "/"+ temp_result_end_dt.substring(4,6) + "/" +temp_result_end_dt.substring(6,8);
		
		model.addAttribute("DUE_DT" , result_dt);
		model.addAttribute("PRES_LET_DT" , PRES_LET_DT);
		
		return  "print/member_print";
	} 
	
	/* 영수증 출력 */
	@RequestMapping("/print/member_rcp_print")	
	public String member_rcp_print(HttpSession session, Model model
				, @RequestParam(required=false) String dues_h_seq
				, @RequestParam(required=false) String dues_gubun) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		} 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		
		paramMap.put("dues_h_seq", dues_h_seq );
		paramMap.put("dues_gubun", dues_gubun );
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );	
		System.out.println(paramMap);
		
		Map userInfo = dao.getMyPayment_user(paramMap);
		Map DocuInfo = dao.getMyPayment_print(paramMap);
		
		model.addAttribute("DocuInfo" , DocuInfo); 
		model.addAttribute("UserInfo" , userInfo);	
		
		String PRES_LET_DT = DocuInfo.get("PRES_LET_DT").toString().substring(0,4)
				+ "년   "
				+ DocuInfo.get("PRES_LET_DT").toString().substring(4,6)
				+ "월   "
				+ DocuInfo.get("PRES_LET_DT").toString().substring(6,8)
				+ "일  ";
		
		String temp_result_start_dt= DocuInfo.get("AUTH_START").toString();
		String temp_result_end_dt= DocuInfo.get("AUTH_END").toString();
		
		String result_dt= temp_result_start_dt.substring(0,4) + "/"+ temp_result_start_dt.substring(4,6) + "/" + temp_result_start_dt.substring(6,8)
		+ " ~ "	+ temp_result_end_dt.substring(0,4) + "/"+ temp_result_end_dt.substring(4,6) + "/" +temp_result_end_dt.substring(6,8);
		
		model.addAttribute("DUE_DT" , result_dt);
		model.addAttribute("PRES_LET_DT" , PRES_LET_DT);
		
		return  "print/member_rcp_print";
	} 
	 
	
	/* 영수증 출력 */
	@RequestMapping("/print/rcp_print")	
	public String rcp_print(HttpSession session, Model model
			 					, @RequestParam(required=false) String person_yn
			 					, @RequestParam(required=false) String operkey 
			 					, @RequestParam(required=false , defaultValue = "true"
			 					) String isMember
			 					, @RequestParam(required=false) String rating) throws Exception
	{
		if( !checkLoingWithExpire(session) ) {
		    return goLogin(model);
	         
		} 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		if (!"Y".equals(rating) && "N".equals(rating)) {
		    rating = null;  
		}
		
		paramMap.put("rating", rating);
		paramMap.put("person_yn", person_yn );
		paramMap.put("operkey", operkey );
		paramMap.put("isMember", isMember.toUpperCase() );
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );	
 		 
		Map DocuInfo = dao.getRcp_print(paramMap);
		
		model.addAttribute("DocuInfo" , DocuInfo); 
		 
		
		return  "print/rcp_print";
	} 
	
	
	@RequestMapping("/print/certi_print")	
	public String certi_print(HttpSession session, Model model
			 					, @RequestParam(required=false) String detcode
			 					, @RequestParam(required=false) String doc_seq 
			 					, @RequestParam(required=false) String code_kind
			 					, @RequestParam(required=false) String rating) throws Exception
	{
		if( !checkLoingWithExpire(session) ) {
			return goLogin(model);
		}  
		 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		
		
		if (!"Y".equals(rating) && "N".equals(rating)) {
		    rating = null;  
		}
		paramMap.put("rating", rating);
		paramMap.put("detcode", detcode );
		//paramMap.put("doc_seq", doc_seq );
		paramMap.put("code_kind", code_kind );
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );	
		
		Map DocuInfoNm = dao.getCertiName_print(paramMap);
		paramMap.put("print_name",DocuInfoNm.get("edutest_name"));
		paramMap.put("print_cd","A");
		
		System.out.println(paramMap);
		
		//순번입력
		dao.insertLog_print(paramMap);
		
		if (doc_seq != null && !"".equals(doc_seq.trim())) {

		    String[] resultNoArray = doc_seq.split(",");

		    List<String> resultNoList = new ArrayList<String>();

		    for (int i = 0; i < resultNoArray.length; i++) {
		        String v = resultNoArray[i];
		        if (v != null) {
		            v = v.trim(); // 공백 제거
		            if (!"".equals(v)) {  // 빈값 제외
		                resultNoList.add(v);
		            }
		        }
		    }

		    // 리스트에 값이 하나라도 있으면 paramMap에 넣는다
		    if (!resultNoList.isEmpty()) {
		        paramMap.put("doc_seq", resultNoList);
		    }
		}
		
		List<Map> DocuInfo = dao.getCerti_print(paramMap);
		
		
		System.out.println(DocuInfo);
		
		model.addAttribute("DocuInfo" , DocuInfo);   
		model.addAttribute("DocuInfoNm" , DocuInfoNm);   
		
		return  "print/certi_print";
	}
	
	@RequestMapping("/print/certi_user")	
	public String certi_edu_print(HttpSession session, Model model
			 					, @RequestParam(required=false) String detcode
			 					, @RequestParam(required=false) String doc_seq 
			 					, @RequestParam(required=false) String code_kind
			 					, @RequestParam(required=false) String rating) throws Exception
	{
		 
		HashMap<String, Object> paramMap = new HashMap<String, Object>(); 
		
		
		
		if (!"Y".equals(rating) && "N".equals(rating)) {
		    rating = null;  
		}
		paramMap.put("rating", rating);
		paramMap.put("rating", rating);
		paramMap.put("detcode", detcode );
		paramMap.put("doc_seq", doc_seq );
		paramMap.put("code_kind", code_kind );
		
		
		if (doc_seq == null || doc_seq.trim().isEmpty()) {
			System.out.println("전체 출력 요청");
			
		}else {
			String[] resultNoArray = doc_seq.split(",");
			paramMap.put("doc_seq", Arrays.asList(resultNoArray) );
		}
		
		System.out.println(paramMap);
		
		List<Map> DocuInfo = dao.getCerti_print(paramMap);
		Map DocuInfoNm = dao.getCertiName_print(paramMap);
		
		System.out.println(DocuInfoNm);
		
		model.addAttribute("DocuInfo" , DocuInfo);   
		model.addAttribute("DocuInfoNm" , DocuInfoNm);  
		
		
		return  "print/certi_user";
	}
	
	
	@RequestMapping("kmp_point_aply")
	public void kmp_point_aply(HttpSession session
								, HttpServletResponse response
								, Model model
								, String type
								, String seq) throws Exception
	{
		
		
		log.info("================================ MyPageController [kmp_point_aply]");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("certitype", type );
		paramMap.put("seq", seq );
		paramMap.put("user_id", (String) session.getAttribute(SessionInfo.USER_ID) );
		
		dao.setPointAply(paramMap);
		
		String str1 = "";
		
		if( type.equals("1"))
			str1 = "급식경영영양사 자격증에 ";
		else if( type.equals("2"))
			str1 = "임상영양사 자격증에 ";
		else if( type.equals("3"))
			str1 = "산업보건영양사 자격증에 ";
		else if( type.equals("4"))
			str1 = "노인영양사 자격증에 ";
		else if( type.equals("5"))
			str1 = "스포츠영양사 자격증에 ";
		
		try 
		    {
		    	response.setContentType("text/html; charset=utf-8");
		    	response.getWriter().print(str1 + "점수가 반영되었습니다.");    
		    } catch (IOException e) {
		    	//e.printStackTrace();    
		    	log.info("IOException : " + e.toString());
		    } catch (Exception e) {
		    	log.info("Exception : " + e.toString());
		    }
		
	}
	
	/**
	 * My 자격증 정보
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/kmp_my_licence.do")
	public String kmp_my_license(HttpSession session, Model model) throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		String code_pers = getCodePers(session);
		List<Map> certifiList = service.getMyCerifiList(code_pers);
		System.out.println(certifiList);
		model.addAttribute("certifiList", certifiList);
		return "tiles/mypage/kmp_my_licence";
	}
	
	/**
	 * 회원정보 수정 Form
	 * (url : /kmp_member_info.do )
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("kmp_member_info")	
	public String kmp_member_info(HttpSession session, Model model) throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );
		model.addAttribute("memberInfo" , dao.getMyMemberInfo(paramMap));
		return "tiles" + "/mypage/kmp_member_info";
	}
	 
	/**
	 * 회원정보 수정 Action
	 * 
	 * @param memberInfo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "update_member_info", method = RequestMethod.POST)
	public String update_member_info(@ModelAttribute("formMember") MYMEMBERINFO memberInfo
			, HttpSession session , Model model) throws Exception {
		  
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		 
		memberInfo.setRegister((String) session.getAttribute(SessionInfo.PERS_NAME));
		
		String redirect = "tiles" + "/kmp_member_info";
		boolean setMyInfo = service.setMyMemberInfo(memberInfo);
		if ( !setMyInfo )
		{
			redirect = "alert";
			model.addAttribute("message", "기본정보 수정이 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
			model.addAttribute("redirect", "/kmp_member_info.do");			
		}else {
			redirect = "alert";
			model.addAttribute("message", "회원정보가 수정되었습니다.");
			model.addAttribute("redirect", "/kmp_member_info.do");			
		} 
			
		return redirect;
	}
	
	/**
	 * 면허 정보 수정 Form
	 * - 관련 페이지 : /kmp_license_modify.do
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("kmp_license_modify")
	public String kmp_license_modify(HttpSession session, Model model)
			throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );
		model.addAttribute("licenseInfo" , dao.getMyLicenseInfo(paramMap));
			
		return "tiles" + "/mypage/kmp_license_modify";
	}
	
	@RequestMapping("kmp_password_modify")
	public String kmp_password_modify(HttpSession session, Model model)
			throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );
		model.addAttribute("memberInfo" , dao.getMyMemberInfo(paramMap));
			
		return "tiles" + "/mypage/kmp_password_modify";
	}
	
	@RequestMapping("update_password_info.do")
	public String update_password_info(
			@ModelAttribute("memberInfo") MYMEMBERINFO memberInfo,
			HttpSession session, Model model) throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		memberInfo.setRegister((String) session.getAttribute(SessionInfo.PERS_NAME));
		
		String redirect = "tiles" + "/kmp_member_info";
		System.out.println("////////////////////////////////////////////");
		System.out.println(memberInfo);
		
		boolean setMyInfo = service.setMyPassword(memberInfo);
		
		if ( !setMyInfo ){
			redirect = "alert";
			model.addAttribute("message",
					"비밀번호 수정이 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
			model.addAttribute("redirect", "/kmp_password_modify.do");
		} else {
			redirect = "alert";
			model.addAttribute("message", "비밀번호가 수정되었습니다.");
			model.addAttribute("redirect", "/kmp_password_modify.do");
		}
			
		return redirect;
	}
	
	
	/**
	 * 면허 정보 수정 Action
	 * - 관련 페이지 : /kmp_license_modify.do
	 * 
	 * @param licenseInfo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("update_license_info.do")
	public String update_license_info(
			@ModelAttribute("licenseInfo") MYLICENSEINFO licenseInfo,
			HttpSession session, Model model) throws Exception {
		
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		licenseInfo.setRegister((String) session.getAttribute(SessionInfo.PERS_NAME));
		
		String redirect = "tiles" + "/kmp_license_modify";
		if (!service.setMyLicenseInfo(licenseInfo)) {
			redirect = "alert";
			model.addAttribute("message",
					"기타정보 수정이 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
			model.addAttribute("redirect", "/kmp_license_modify.do");
		} else {
			redirect = "alert";
			model.addAttribute("message", "기타정보가 수정되었습니다.");
			model.addAttribute("redirect", "/kmp_license_modify.do");
		}
			
		return redirect;
	}
	
	@RequestMapping("kmp_magazine_y")	
	public String kmp_magazine_y(HttpSession session, Model model) throws Exception
	{
		if( !checkLogin(session) ) {
			return goLogin(model);
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put(SessionInfo.CODE_PERS, (String) session.getAttribute(SessionInfo.CODE_PERS) );
		
		model.addAttribute("info" , dao.getMyMagazine(paramMap));
		
		return "tiles" + "/mypage/kmp_magazine_y";
	}
	
	@RequestMapping("kmp_magazine_sendmail")
	public void kmp_magazine_sendmail( @ModelAttribute("magazineInfo") MYMAGAZINEINFO magazineInfo
								, HttpSession session
								, HttpServletResponse response
								, Model model)  throws Exception
	{
		boolean result = false;
		try
		{
			MailBean mail = new MailBean();
			String from 		= "info@dietitian.or.kr"; //WorkData.MAGAZINE_MAILTO; //"info@dietitian.or.kr";
			String fromName 	= magazineInfo.getPers_name();
				
			String toEmail 	 = WorkData.MAGAZINEMAIL;
					
			String mailTitle = "국민영양 / 학술지 미수령 신청";
			String mailBody  = "";
	
			mailBody = "신청인 : "+ magazineInfo.getPers_name();
			mailBody +=	"<br>생년월일 : " + magazineInfo.getPers_birth();
			
			mailBody +=	"<br>회신가능한주소 : "+ magazineInfo.getGet_place();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + magazineInfo.getZip1();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + magazineInfo.getAddress();
			mailBody +=	"<br>연락가능한번호 : " + magazineInfo.getGet_phone() + "-" + magazineInfo.getPhone();
	
			mailBody +=	"<br><br><br>신청내역";
			mailBody +=	"<br>&nbsp;* 국민영양";
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp1·2월호 : " + magazineInfo.getReview01_0102();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp3월호 : "  + magazineInfo.getReview01_03();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp4월호 : "  + magazineInfo.getReview01_04();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp5월호 : "  + magazineInfo.getReview01_05();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp6월호 : "  + magazineInfo.getReview01_06();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp7·8월호 : "  + magazineInfo.getReview01_0708();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp9월호 : "  + magazineInfo.getReview01_09();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp10월호 : "  + magazineInfo.getReview01_10();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp11월호 : "  + magazineInfo.getReview01_11();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp12월호 : "  + magazineInfo.getReview01_12();
			/*
			mailBody +=	"<br><br>&nbsp;* 학술지";
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp2월호 : " + magazineInfo.getReview02_02();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp5월호 : "  + magazineInfo.getReview02_05();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp8월호 : "  + magazineInfo.getReview02_08();
			mailBody +=	"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp11월호 : "  + magazineInfo.getReview02_11();
            */		
			mailBody +=	"<br><br><br>&nbsp;기타문의 내용 : " + magazineInfo.getQuestion();
			
			
			result = mail.sendMail(from, fromName, toEmail, mailTitle, mailBody);			
		} catch(Exception e) {
			log.error("error! :"+ e);
		}

		try
		{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if ( result ) 
				writer.println("<script>alert('메일이 관리자에게 발송되었습니다.'); location.href = 'index.jsp'; </script>");					
			else
				writer.println("<script>alert('메일 발송에 실패하였습니다. 다시 시도해주세요.'); history.go(-1); </script>");
		}
		catch(Exception e){}			
	}
	
}
