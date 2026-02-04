package kda.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.data.GROUPCODE;
import kda.common.data.TBL_ORDER_LIST;
import kda.login.data.LOGININFO;
import kda.member.MemberService;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.KdaStringUtil;
import kda.work.publication.payment.data.CARD_PAYMENT;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommonController extends KdaAbstractController
{
	private Log log = LogFactory.getLog(CommonController.class);
	
	@Autowired
	CommonDao dao;	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private IPINService ipinService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	// --030 :우편물 발송지 구분, 018:발송호칭 010:직렬, 011:직급, 027:최종학력, 019:학위, 028:출신학교
	@RequestMapping("common_gruopcode")
	public void common_gruopcode( @RequestParam(required=false) String groupCode
							   , @RequestParam(required=false) String tempcd2
							   , HttpServletResponse response
							   , Model model ) throws Exception
	{
		log.info("================================ common_getCodes");

		// -- group
		List<GROUPCODE> groupList = dao.getGroupCodeList(groupCode, tempcd2);
		for(GROUPCODE row : groupList){}
		
	    try {
	    	response.getWriter().print("");    
	    } catch (IOException e) {
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	@RequestMapping("common_groupcode_option")
	public void common_groupcode_option( @RequestParam(required=false) String groupCode
									  , @RequestParam(required=false) String tempcd2	
									  , @RequestParam(required=false , defaultValue = "") String val	
									  , HttpServletResponse response
									  , Model model )
	{
		log.info("================================ common_getCodes_option");

		log.info("groupCode : " + groupCode);
		log.info("tempcd2 : " + tempcd2);
		
		// -- group
		List<GROUPCODE> groupList = dao.getGroupCodeList(groupCode, tempcd2);

		String options = "";
		for(GROUPCODE row : groupList) {
			String html = "";
			if( val.equals( row.getDetcode() ) ) {
				html = "selected";
			}
			options += "<option value=" + row.getDetcode() + " " + html + ">" + row.getDetcodename() + "</option>";
		}
	
	    try 
	    {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(options);    
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}	
	
	@RequestMapping("/member/sso_login2.do")
	public String setSSOLogin(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		String rtnPage = "common/sso2";
		String referUrl = KdaStringUtil.nullToString(request.getHeader("referer"));
	
		if( !referUrl.contains("dietitian.or.kr") && !referUrl.contains("210.127.56.232") && !referUrl.contains("localhost") 
			&& !referUrl.contains("211.171.32.206")	
				) {
			model.addAttribute("errorMsg", "올바르지 않은 접근입니다."+referUrl);
			return rtnPage;
		}
		
		
		if( !checkLoingWithExpire(session)  ) { 
			model.addAttribute("errorMsg", "로그인 후 사용하여 주십시요");
			return "redirect:/work/education/ke_curriculum.do";
		}
		
		String codePers = getCodePers(session);
		if( KdaStringUtil.isEmpty(codePers) ) {
			model.addAttribute("errorMsg", "올바르지 않은 사용자입니다.");
		} else {
			PERSON_M_TBL personMTbl = memberService.getPersonMTblByCode(codePers, false);
			Map person = memberService.getPersonByCertTemp(codePers);
			person.put("id", personMTbl.getId());
			
			person.put("lic_no", personMTbl.getLic_no());
			model.addAttribute("person", person);
		}
		return rtnPage;
	}
	
	@RequestMapping("/common/result_ipin.do")
	public String resultIPIN(HttpServletRequest request, HttpSession session, Model model) throws Exception {
	
		MEMBER_JOIN memberJoin = ipinService.getResult(request);
		
		session.setAttribute(SessionInfo.MEMBER_JOIN, memberJoin);
		model.addAttribute("memberJoin", memberJoin);
		return "common/result_ipin";
	}
	
	@RequestMapping("/payment/{menu}/chk_plugin.do")
	public String chkPlugIn(@PathVariable String menu, CARD_PAYMENT cardPayment, HttpSession session, Model model) throws Exception {
		
		model.addAttribute("cardPayment", cardPayment);
		
		int good_mny = KdaStringUtil.nullToInt(cardPayment.getGood_mny(), 0);
		model.addAttribute("menu", menu);
		
		if( menu.equals("member") )
			return "tiles:payment-root/" + menu + "/chk_plugin";
		else 
			return "tiles:payment/" + menu + "/chk_plugin";
	}
	
	@RequestMapping("/payment/{menu}/order.do")
	public String order( @PathVariable String menu, CARD_PAYMENT cardPayment,  HttpSession session, Model model) throws Exception {
		
		if( cardPayment == null  ) {
			return "/payment/error";
		}
		
		model.addAttribute("cardPayment", cardPayment);
		if( menu.equals("member") )
			return "tiles:payment-root/" + menu + "/order";
		else 
			return "tiles:payment/" + menu + "/order";
	}
	
	@RequestMapping("/payment/{menu}/pp_cli_hub.do")
	public String hub( @PathVariable String menu, HttpSession session, Model model) throws Exception {
		return "payment/pp_cli_hub";
	}
	

	@RequestMapping("/payment/{menu}/result.do")
	public String result( TBL_ORDER_LIST order,  @PathVariable String menu, HttpServletRequest request,
			HttpSession session, Model model) throws Exception {
		/* ============================================================================== */
	    /* =   결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)= */
	    /* = -------------------------------------------------------------------------- = */
	    /* =   결제 정상 : res_cd값이 0000으로 설정됩니다.                              = */
	    /* =   결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.                     = */
	    /* = -------------------------------------------------------------------------- = */
		
		String res_msg_bsucc = "";
		String bScc = KdaStringUtil.nullToString(request.getParameter("bSucc"));
		if ( "pay".equals ( order.getReq_tx() ) ) {
			if ( "false".equals ( bScc ) ) {
				if ( "0000".equals ( order.getRes_cd() ) ) {
					res_msg_bsucc = "1" ;
					order.setRes_msg("자동취소(처리오류)");
				} else {
					res_msg_bsucc = "2";
					order.setRes_msg("자동취소(" + order.getRes_cd() + ")");
				}
			} else {
				res_msg_bsucc = "3";
			}
		}
		
		log.debug(order);
		
		paymentService.setPaymentResult(order);
	
		model.addAttribute("order", order);
		model.addAttribute("res_msg_bsucc", res_msg_bsucc);
		if( menu.equals("member") )
			return "tiles:payment-root/" + menu + "/result";
		else 
			return "tiles:payment/" + menu + "/result";
	
		// return "tiles:payment/" + menu + "/result";
	}
}
