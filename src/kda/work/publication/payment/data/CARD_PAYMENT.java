package kda.work.publication.payment.data;

import javax.servlet.http.HttpServletRequest;

import kda.utils.KdaStringUtil;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class CARD_PAYMENT
{
	public static final String SESSION_KEY = "CARD_PAYMENT_SESSION";
	
	public static final String PAY_MEETING_KIND = "MEETING";
	
	public CARD_PAYMENT() {
		
	}
	
	public CARD_PAYMENT(HttpServletRequest request) {
		this.o_gubun = KdaStringUtil.nullToString(request.getParameter("o_gubun"));
		this.good_name = KdaStringUtil.nullToString(request.getParameter("good_name"));
		this.good_mny = KdaStringUtil.nullToString(request.getParameter("good_mny"));
		this.buyr_name = KdaStringUtil.nullToString(request.getParameter("buyr_name"));
		this.buyr_tel1 = KdaStringUtil.nullToString(request.getParameter("buyr_tel1"));
		this.buyr_tel2 = KdaStringUtil.nullToString(request.getParameter("buyr_tel2"));
		this.buyr_mail = KdaStringUtil.nullToString(request.getParameter("buyr_mail"));
		this.pers_birth = KdaStringUtil.nullToString(request.getParameter("pers_birth"));
		this.user_id = KdaStringUtil.nullToString(request.getParameter("user_id"));
		this.code_bran = KdaStringUtil.nullToString(request.getParameter("code_bran"));
		this.goods_code_num = KdaStringUtil.nullToString(request.getParameter("goods_code_num"));
		this.edu_kind = KdaStringUtil.nullToString(request.getParameter("edu_kind"));
		this.mem_due = KdaStringUtil.nullToString(request.getParameter("mem_due"));
		this.seq = KdaStringUtil.nullToString(request.getParameter("seq"));
	}
	
	private String o_gubun	= "";
	private String good_name = "";
	private String good_mny = "";  
	private String buyr_name = "";	
	private String buyr_tel1 = "";	
	private String buyr_tel2 = "";	
	private String buyr_mail = "";	
	private String pers_birth = "";
	private String user_id = "";	
	private String code_bran= "";	
	private String goods_code_num = "";	
	private String edu_kind	= "";
	private String mem_due = "";
	private String seq = "";
	
	private String service_kind = "";

}