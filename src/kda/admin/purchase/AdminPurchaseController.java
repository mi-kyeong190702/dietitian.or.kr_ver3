package kda.admin.purchase;

import java.io.FileInputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo; 
import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.admin.purchase.data.PTBCDBUYADDRESS; 
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown; 
import kda.values.CRUDValue;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.annotation.JsonFormat.Value;

@Controller
public class AdminPurchaseController extends KdaAbstractController{
	
	@Autowired
	AdminPurchaseService adminPurchaseService;
	
	@Autowired
	private CommonService commonService; 
	
	
	@RequestMapping("djemals/purchase/purchase.do")
	public String purchase(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/purchase/purchaseList.do";
	}
	
	@RequestMapping("djemals/purchase/purchaseList.do")
	public String purchaseList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminPurchaseService.getPurchaseListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "purchaseList.do");
		model.addAttribute("title", "구매 관리");		
		return "tiles:admin/purchase/purchase_list";
	}
	
	@RequestMapping("djemals/purchase/purchaseForm.do")
	public String purchaseForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int bindex) throws Exception {
		
		PTBBUYADDRESS purchase = null;
		List<PTBBUYGOODS> goods = null;
		
		if(bindex == 0) {
			purchase = new PTBBUYADDRESS();
			purchase.setCrud(CRUDValue.C);
		}else {
			purchase = adminPurchaseService.getPurchase(bindex);
			goods = adminPurchaseService.getPurchaseGoods(bindex);
			purchase.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("purchase", purchase);
		model.addAttribute("goods", goods);
		
		model.addAttribute("url", "purchaseList.do");
		model.addAttribute("title", "구매 관리");
		return "tiles:admin/purchase/purchase_form";
	}
	
	@RequestMapping("djemals/purchase/purchaseCd.do")
	public String purchaseCd(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/purchase/purchaseCdList.do";
	}
	
	@RequestMapping("djemals/purchase/purchaseCdList.do")
	public String purchaseCdList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		listHelper = adminPurchaseService.getPurchaseCdListHelper(listHelper);
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("url", "purchaseCdList.do");
		model.addAttribute("title", "공동구매 관리");
		return "tiles:admin/purchase/purchaseCd_list";
	}
	
	@RequestMapping("djemals/purchase/purchaseCdForm.do")
	public String purchaseCdForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int bindex) throws Exception {
		
		PTBCDBUYADDRESS purchase = null;
		List<PTBBUYGOODS> goods = null;
		
		if(bindex == 0) {
			purchase = new PTBCDBUYADDRESS();
			purchase.setCrud(CRUDValue.C);
		}else {
			purchase = adminPurchaseService.getPurchaseCd(bindex);
			goods = adminPurchaseService.getPurchaseCdGoods(bindex);
			purchase.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("purchase", purchase);
		model.addAttribute("goods", goods);
		
		model.addAttribute("url", "purchaseCdList.do");
		model.addAttribute("title", "공동구매 관리");
		return "tiles:admin/purchase/purchaseCd_form";
	}
	
	@RequestMapping("djemals/purchase/purchaseAction.do")
	public View boardAction(PTBCDBUYADDRESS vo, HttpSession session, Model model,
			@RequestParam (required=false, defaultValue="purchase") String cd) throws Exception {
		
			
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			//adminBoardService.insertBoard(vo);
			//javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			adminPurchaseService.updatePayment(vo.getBindex(), vo.getBpaymentDate(), cd);
			javaScript.setMessage("입금 확인 되었습니다.");
			break;
		case D:
			if(adminPurchaseService.deleteBuyAddr(vo.getBindex(),cd)){
				javaScript.setMessage("삭제 되었습니다.");
			}else{
				javaScript.setMessage("처리 실패 하였습니다.");
			}
			break;			
		}
		
		if("group".equals(cd)) javaScript.setLocation("purchaseCdList.do"); 
		else javaScript.setLocation("purchaseList.do");
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("djemals/purchase/purchaseExcel.do")
	public View purchaseExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("purchaseExcel", userid, "구매관리");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={"bindex","bf_PaymentName","bdate","bf_PaymentDate","bf_List","bf_Price","bpayment","bpaymentDate","bt_Text","bf_name","bf_birth","bf_license","bf_Mobile","bf_Email","bt_name","bt_Address_Total","bt_Mobile"}; //헤더 영문
		String header_k[]={"번호","송금자 이름","주문날짜","입급 예정일","주문자료리스트","총 결제금액","입금여부", "입금일","기타주문사항","주문자 이름","생년월일","면허번호","휴대폰번호","이메일","수령자 이름","수령자 주소","수령자 휴대전화"}; //헤더 국문			
		list = adminPurchaseService.excelPurchase();
		
		return new ExcelDown("purchaseExcel", header_k, header_e, list);
	}	

	@RequestMapping("/work/publication/kp_publishing_action.do")	
	public String kp_publishing_action(  HttpServletRequest request, HttpSession session
									 , HttpServletResponse response
									 , Model model
									 ,@RequestParam(required = false) String phone
									 ,@RequestParam(required = false) String name
									 ,@RequestParam(required = false) String birth) throws Exception {
		
	   HashMap paramMap = new HashMap<>() ; 
	   ModelAndView mav = new ModelAndView();
	   JavaScript javaScript = new JavaScript();
	   Cookie[] cookies = request.getCookies();
	   String cookieValue="";
	   String setCookieValue="";
	   List<Map<String,Object>> resultList= new ArrayList<>();
	   int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	   int pageSize = 10;
	   int startRow = (currentPage - 1) * pageSize + 1;
	   int endRow = currentPage * pageSize;
	   
	   
	   
	   if (cookies != null) {
	        for (Cookie c : cookies) { 
	            if ("kp_publishing".equals(c.getName())) {
	            	cookieValue = URLDecoder.decode(c.getValue(), "UTF-8");	
	            	System.out.println(c.getName());
	            	String[] parts = cookieValue.split(",");
	            	name =  parts[0];
	            	phone = parts[1];
	            	birth = parts[2];
	                break;
	            }
	        }
	        
	     }
	   paramMap.put("name", name);
	   paramMap.put("phone", phone);
	   paramMap.put("birth", birth);
	   paramMap.put("startRow", startRow);
	   paramMap.put("endRow", endRow);
	   
	   PTBBUYADDRESS resultMap = adminPurchaseService.selectpublishingLogin(paramMap);
	    
	   
       if (resultMap == null) {
    	   
    	   Cookie cookie = new Cookie("kp_publishing", null);
    	   cookie.setPath("/work/publication");
    	   cookie.setMaxAge(0);  // 삭제
    	   response.addCookie(cookie);    	   
    	     
    	   model.addAttribute("return_msg", "주문내용이 존재하지 않습니다."); 
		   return "tiles:kp_publishing_form";
    	    
       }else{ 
    	   resultList = adminPurchaseService.selectpublishingList(paramMap);
    	   int totalCount = adminPurchaseService.selectpublishingCnt(paramMap);
    	   
    	   setCookieValue = resultMap.getBf_name()+","+ phone +","+ birth;
    	   Cookie cookie = new Cookie("kp_publishing", URLEncoder.encode(setCookieValue, "UTF-8"));
    	   cookie.setPath("/work/publication");
    	   cookie.setMaxAge(60 * 5);
    	   response.addCookie(cookie); 
    	   
    	   model.addAttribute("user_info", resultMap); 
    	    
    	   int totalPages = (int)Math.ceil(totalCount / (double)pageSize);
    	    
    	   model.addAttribute("resultList", resultList);
    	   model.addAttribute("currentPage", currentPage);
    	   model.addAttribute("totalPages", totalPages);
    	   System.out.println(totalPages);
    	   
    	   //javaScript.setLocation("/work/publication/kp_publishing_list.do");
    	   mav.setViewName("kp_publishing_list");
    	   return "tiles:kp_publishing_list";
       } 
        
    }
	
	@RequestMapping("/work/publication/kp_publishing_login.do")	
	public View kp_publishing_login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		JavaScript javaScript = new JavaScript();
		
		 Cookie[] cookies = request.getCookies();
	     String userId = null;

	     if (cookies != null) {
	        for (Cookie c : cookies) {
	        	if ("kp_publishing".equals(c.getName())) {
	                userId = c.getValue();	               
	                break;
	            }
	        }
	     }
	      
		if(userId==null){
			javaScript.setLocation("/work/publication/kp_publishing_form.do");
		}else{
			javaScript.setLocation("/work/publication/kp_publishing_action.do");
		}
		return new JavaScriptView(javaScript);
	}
	
	
	@RequestMapping("/work/publication/kp_publishing_logout.do")	
	public View kp_publishing_logout(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	   JavaScript javaScript = new JavaScript();
	   Cookie cookie = new Cookie("kp_publishing", null);
 	   cookie.setPath("/work/publication");
 	   cookie.setMaxAge(0);  // 삭제
 	   response.addCookie(cookie);    	 
 	   
 	   javaScript.setLocation("/work/publication/kp_publishing_form.do");
 	   model.addAttribute("rsl_msg", "주문내용이 존재하지 않습니다."); 
 	   System.out.println("삭제후 다시 로그인화면");
	    return new JavaScriptView(javaScript);
	}
	
	
	@RequestMapping("/work/publication/kp_publishing_cancel.do")
	public View kp_publishing_cancel(PTBCDBUYADDRESS vo, HttpSession session, Model model,
			@RequestParam (required=false, defaultValue="purchase") String cd) throws Exception {
	 	
		JavaScript javaScript = new JavaScript();
		 
		if(adminPurchaseService.deleteBuyAddr(vo.getBindex(),cd)){
			javaScript.setMessage("삭제 되었습니다.");
		}else{
			javaScript.setMessage("처리 실패 하였습니다.");
		}		 
		
		javaScript.setLocation("/work/publication/kp_publishing_action.do");
		
		return new JavaScriptView(javaScript);
	}
	
	@RequestMapping("/work/kp_publishing_detail.do")
	public String kp_publishing_detail(PTBCDBUYADDRESS vo, HttpSession session, Model model) throws Exception {
		
		HashMap paramMap = new HashMap<>() ;
		paramMap.put("bindex", vo.getBindex());  
		PTBBUYADDRESS result= adminPurchaseService.selectpublishingLogin(paramMap);
		
		model.addAttribute("result", result); 
		System.out.println(result);
		
		return "tiles:kp_publishing_detail";
	}
	
	
	@RequestMapping("/work/kp_publishing_print.do")
	public String kp_publishing_print(PTBCDBUYADDRESS vo, HttpSession session, Model model,
			@RequestParam (required=false, defaultValue="0") String gb) throws Exception {
		
		HashMap paramMap = new HashMap<>() ;
		paramMap.put("bindex", vo.getBindex());   
		
		System.out.println("gb::::"+gb);
		
		String rslJsp="/print/quote_print";
		if (gb.equals("2")){
			rslJsp="/print/transDetails_print";
		}
		Map<String, Object> addMap = new HashMap<>();
		PTBBUYADDRESS result= adminPurchaseService.selectpublishingLogin(paramMap);
		
		List<Map<String, Object>> booklist = adminPurchaseService.selectpublishingbook(paramMap);
	 
		int totalAmt =  Integer.parseInt(result.getBf_Price());
		
		int totalEA = 0;
		for (Map<String, Object> book : booklist) {
		    if (book.get("eEa") != null) {
		        String val = book.get("eEa").toString().trim();
		        if (!val.isEmpty()) {
		        	totalEA += Integer.parseInt(val);
		        }
		    }
		}
		System.out.println("총합: " + totalEA);

		
		addMap.put("oTitle", "배송비");
		addMap.put("eEa", "");
		addMap.put("ePrice1", "");
		addMap.put("ePrice2", 3000);
		addMap.put("bs_CategoryType", "");
		
		if( Integer.parseInt(result.getBf_Price())<50000){
			booklist.add(addMap);
		}
		
		Map<String, Object> addMap2 = new HashMap<>();
		 
		addMap2.put("title", "계");
		addMap2.put("totalAmt", result.getBf_Price());
		addMap2.put("totalEa", totalEA);
		
		model.addAttribute("result", result); 
		model.addAttribute("booklist", booklist); 
		model.addAttribute("total", addMap2);
		 
		
		return rslJsp;
	}
	
	
	@RequestMapping("/work/kp_publishing_rcp.do")
	public String kp_publishing_rcp(PTBCDBUYADDRESS vo, HttpSession session, Model model) throws Exception {
		
		HashMap paramMap = new HashMap<>() ;
		paramMap.put("bindex", vo.getBindex());   
		
		HashMap DocuInfo =  new HashMap<>() ;
		
		String bookNm = "";
		 
		List<Map<String, Object>> booklist = adminPurchaseService.selectpublishingbook(paramMap); 
		
		
		bookNm = booklist.get(0).get("oTitle").toString();
		
		if(booklist.size()>1){
			bookNm += "외" + (booklist.size()-1) +"건";
		}
		
		 
		
		PTBBUYADDRESS result= adminPurchaseService.selectpublishingLogin(paramMap);
		 
		String paymentDate = result.getBpaymentDate();
		int price = Integer.parseInt(result.getBf_Price());
		
		if (price < 50000) { 
			bookNm+="\n ,배송비";
		} 
		
		if (paymentDate != null && !paymentDate.isEmpty() && paymentDate.contains("-")) {
		    String[] arr = paymentDate.split("-");
		    if (arr.length == 3) {
		        String formatted = arr[0] + "년 " + arr[1] + "월 " + arr[2] + "일";
		        
		    }
		} 
		DocuInfo.put("bPaymentDate", result.getBpaymentDate());
		DocuInfo.put("NEW_COST_KOR", result.getBf_Price_kor());
		DocuInfo.put("EDUNAME", bookNm); 
		DocuInfo.put("NEW_COST", result.getBf_Price());
		
		DocuInfo.put("PERS_NAME", result.getBf_name());
		
		
	 
		model.addAttribute("DocuInfo", DocuInfo);    
		 
		return "/print/purchas_rcp_print"; 
	
	}
	 
}
