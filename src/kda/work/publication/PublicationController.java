package kda.work.publication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.purchase.AdminPurchaseService;
import kda.admin.purchase.NhnAlimtalkWithSmsFallback;
import kda.board.StoreBoardService;
import kda.board.data.CARTBOARD;
import kda.common.CommonController;
import kda.common.data.TBL_ORDER_LIST;
import kda.member.MemberService;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;
import kda.work.publication.payment.data.CARD_PAYMENT;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class PublicationController extends KdaAbstractController
{
	private Log log = LogFactory.getLog(PublicationController.class);
	
//	private String tiles = "tiles/work/publication/";
	
	@Autowired
	PublicationService publicatonService;	
	
	@Autowired
	StoreBoardService storeBoardService;
	
	@Autowired
	private CommonController commonController;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	AdminPurchaseService adminPurchaseService;	
	
	@RequestMapping("work/publication/kp_participation_mornitor.do") 
	public String initMonitor(HttpSession session, Model model) {
		return "tiles/work/publication/kp_participation_mornitor";
	}
	
	
	@RequestMapping("publication_doMonitor")
	public View insert_monitor( @ModelAttribute("monitor") TBL_NUTRITIONMONITOR monitor
								, HttpServletResponse response
								, Model model) throws Exception {
		
		int result = 0;
		log.info("================================ PublicationController [insert_monitor]");
		result = publicatonService.insert_monitor(monitor);
		
		JavaScript javaScript = new JavaScript();
		if (result > 0){
			javaScript.setMessage("참여해 주셔서 감사합니다.");
			javaScript.setLocation("work/publication/kp_participation_mornitor.do");
		} else {
			javaScript.setMessage("처리 중 오류가 발생하였습니다.");
			javaScript.setMethod("window.history.back()");
		}
		return new JavaScriptView(javaScript);
	}
	
// 	20151022 영양사협회_국민영양12월호설문요청 추가
	@RequestMapping("publication_nutservey1")
	public View insert_nutservey( @ModelAttribute("nutservey") TBL_NUTRITIONMONITOR nutservey
								, HttpServletResponse response
								, Model model) throws Exception {
		
		int result = 0;
		log.info("================================ PublicationController [insert_nutservey]");
		result = publicatonService.insert_nutservey(nutservey);
		
		JavaScript javaScript = new JavaScript();
		if (result > 0){
			javaScript.setMessage("참여해 주셔서 감사합니다.");
			javaScript.setMethod("window.close()");
		} else {
			javaScript.setMessage("처리 중 오류가 발생하였습니다.");
			javaScript.setMethod("window.history.back()");
		}
		return new JavaScriptView(javaScript);
	}

	@RequestMapping("ISS_GotoSearch.do")
	public String issGotoSearch() throws Exception {
		String strTemp1 = KdaStringUtil.getCurrentDateTimeAsString();

		int nowYear = Integer.parseInt(strTemp1.substring(0, 4));
		int nowMonth = Integer.parseInt(strTemp1.substring(4, 6));
		int nowDay = Integer.parseInt(strTemp1.substring(6, 8));
		int nowHour = Integer.parseInt(strTemp1.substring(8, 10));
		int nowMinute = Integer.parseInt(strTemp1.substring(10, 12));
		int nowSec = Integer.parseInt(strTemp1.substring(12, 14));

		strTemp1 = strTemp1.substring(2, 12);

		String strTemp2 = "";
		for (int intTemp1 = 1; intTemp1 <= strTemp1.length(); intTemp1++) {
			strTemp2 = strTemp1.substring(intTemp1 - 1, intTemp1) + strTemp2;
			if (intTemp1 == 1) {
				strTemp2 = Integer.toString(203 + (nowSec * nowMonth))+ strTemp2;
			}

			if (intTemp1 == 3) {
				strTemp2 = Integer.toString(189 + (nowDay * nowHour))+ strTemp2;
			}

			if (intTemp1 == 9) {
				strTemp2 = Integer.toString(187 + nowSec) + strTemp2;
			}
		}

		return "redirect:https://journal.kstudy.com/ISS_CreateSession.asp?encCode="
				+ strTemp2
				+ "&clientKey=5073&startPage=ISS_SForm&Session_Member=";
	}
	
	/**
	 * 결재 신청 화면
	 *  -  Page : kp_archiveshop_pay.do
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("kp_archiveshop_pay.do")	
	public String kp_archiveshop_pay(HttpSession session , Model model ) throws Exception {
		log.info("================================ BoardController [kp_archiveshop_pay]"+(String) session.getAttribute(SessionInfo.CODE_PERS));
		setDefaultModel(session, model);
		
		PERSON_M_TBL person = null;
		
		if( checkLogin(session) ) {
			model.addAttribute("point" , publicatonService.select_memberPoint((String) session.getAttribute(SessionInfo.CODE_PERS)));
			person = memberService.getPersonMTblByCode(getCodePers(session), true);
			
			String mail = person.getEmail();
			String mailAry[] = mail.split("@");
			if( mailAry.length == 2) {
				person.setEmail1(mailAry[0]);
				person.setEmail2(mailAry[1]);
			}
		} else {
			model.addAttribute("point", 0 );
			person = new PERSON_M_TBL();
		}
		
		List<CARTBOARD> cartList=  storeBoardService.list_cart(session.getId());
		model.addAttribute("cartList" , cartList);
		model.addAttribute("person", person);
		model.addAttribute("sessionId", session.getId());
		return "tiles/work/publication/kp_archiveshop_pay";
	}
	
	@RequestMapping("kp_archiveshop_nomem.do")
	public String kp_archiveshop_nomem(HttpSession session, Model model) throws Exception {
		return "tiles/work/publication/kp_archiveshop_nomem";
	}
	
	/**
	 * 결재 처리(무통장, 카드, 포인트)
	 * 
	 * @param buyaddress
	 * @param totalPrice
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("cart_payment")
	public String cart_payment( @ModelAttribute("buyaddress") PTB_BUYADDRESS buyaddress
									, @RequestParam(required=false) int totalPrice
			 						, Model model , HttpServletRequest request, HttpSession session) throws Exception {		
		int result = 0;
		int bIndex = 0;
		result = publicatonService.insert_buyaddress(buyaddress);
		if ( result > 0) {
			bIndex = publicatonService.getMaxBindex();
		}
		
		System.out.println(buyaddress);
		
		//result = publicatonService.insert_buygoods(bIndex, session.getId());
		result = publicatonService.insert_buygoods(bIndex, buyaddress.getSessionId());
		
		 if(buyaddress.getPay_gubun().equals("CARD")){ //카드결제
				
			CARD_PAYMENT cardPayment = new CARD_PAYMENT();
			cardPayment.setO_gubun("EDU-REAL");
			cardPayment.setGood_name("교육자료구입");
			cardPayment.setGood_mny(Integer.toString(totalPrice));
			cardPayment.setBuyr_mail(buyaddress.getBf_email());
			cardPayment.setBuyr_name(buyaddress.getBf_name());
			cardPayment.setBuyr_tel1(buyaddress.getBf_tel());
			cardPayment.setBuyr_tel2(buyaddress.getBf_mobile());
			cardPayment.setPers_birth(buyaddress.getPers_birth());
			cardPayment.setCode_bran("0");
			cardPayment.setGoods_code_num(Integer.toString(bIndex));
			
			return commonController.chkPlugIn("publication", cardPayment, session, model);		
		}
		 
		if( buyaddress.getPay_gubun().equals("POINT")){ //포인트 결제]
			String code_pers = getCodePers(session);
			int point = publicatonService.select_memberPoint(code_pers);
			publicatonService.update_memberPoint(point - totalPrice, code_pers); 
		} 

		if( checkLogin(session) ) {
			model.addAttribute("point",  publicatonService.select_memberPoint(getCodePers(session)));
		}
		model.addAttribute("cartList",  storeBoardService.list_cart(session.getId()));
		model.addAttribute("buyaddress",  publicatonService.select_buyaddress(bIndex));
		
		HashMap paramMap = new HashMap<>() ;
		paramMap.put("bindex", bIndex);   
		
		List<Map<String, Object>> booklist = adminPurchaseService.selectpublishingbook(paramMap);
		 
		String BookTitle = booklist.get(0).get("short_title").toString();
        String bookEa = "";
		
		if (booklist.size() >= 2) {
			bookEa = " 외 " + (booklist.size() - 1) + "건";
		} 
		
		//알림톡, SMS 키값
		kda.utils.NhnAlimtalkWithSmsFallback svc = new kda.utils.NhnAlimtalkWithSmsFallback(
				"vbrtyo76GDoWejcc", "2saCXFywN3ppk52S5oigY62iKDavqfce",
	               "9UjIies1LGXO3ZgN", "JvQA843wNSLzWuFVldg8DwhjkCi2ZZSt"
				);
		
		JSONObject params = new JSONObject();
		params.put("성명", buyaddress.getBf_name());
		params.put("주문일자", buyaddress.getBf_paymentdate());
		params.put("주문자료명", BookTitle);
		params.put("건수", bookEa);
		params.put("주문금액", String.format("%,d", totalPrice)); 
		
		String msg = "안녕하십니까?\n"
			    + "대한영양사협회입니다.\n\n"
			    + "주문하신 교육자료 주문이 정상 접수되었습니다.\n"
			    + "· 주문자명 : " + buyaddress.getBf_name() +"\n"
			    + "· 주문일자 : " + buyaddress.getBf_paymentdate() +"\n"
			    + "· 주문자료 : " + BookTitle + " " + bookEa + "\n"
			    + "· 금액 : "+ String.format("%,d", totalPrice) +" 원\n"
			    + "· 입금하실 계좌 : 신한은행 140-006-740640(예금주: (사)대한영양사협회)\n\n"
			    + "주문하신 자료는 입금내역 확인 후\n"
			    + "영업일 기준 2~3일 이내에 배송될 예정입니다.\n\n"
			    + "▶ 자세한 구매정보는 [대한영양사협회 홈페이지](https://www.dietitian.or.kr)- [KDA 출판]-[MY 구매정보]에서 확인 가능합니다.\n\n"
			    + "감사합니다.\n\n"
			    + "(사)대한영양사협회\n" 
			    + "E. kdabook@kdiet.or.kr";
		
		//템플릿코드, 모바일전화번호, 알림톡 내용,타이틀, 발신번호, MMS 수신내용 순...
		boolean s = svc.sendWithFallback("TPL_01", buyaddress.getBf_mobile().replace("-",""), params,"[대한영양사협회]",
				 "028235680", msg );
		//boolean s = svc.sendLmsMms("title", msg, "028235680", "01025653532");
		
		System.out.println("Result: "+s);
        svc.close();
		
		return "tiles" + "/work/publication/kp_archiveshop_pay_ok"; //무통장, 포인트 결제 완료 화면
	}
	
	@RequestMapping("insert_order_list")	
	public void insert_order_list( @ModelAttribute("orderInfo") TBL_ORDER_LIST orderInfo
									 , HttpSession session
									 , HttpServletResponse response
									 , Model model) throws Exception {
		
       log.info("card orderInfo :  " + orderInfo) ;
       
       publicatonService.insert_order_list(orderInfo);
    }
	
	
}
