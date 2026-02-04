package kda.work.publication.payment.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PTB_BUYADDRESS 
{
	private int 	bindex;
	private String 	buserid;
	private String 	bdate;
	private int 	bpayment;
	private String 	bpaymentdate;
	//주문자
	private String 	bf_paymentdate;
	private String 	bf_paymentname;
	private String 	bf_name;
	private String 	pers_birth;
	private String 	bf_tel;
	private String 	bf_mobile;
	private String 	bf_email;
	private int 	bf_delivery;
	//수령자
	private String 	bt_name;
	private String 	bt_post;
	private String 	bt_address;
	private String 	bt_tel;
	private String 	bt_mobile;
	private String 	bt_paper; 
	private String 	bt_text;
	private String 	pay_gubun;
	private String 	bf_license;
	
	//세션아이디
	private String 	sessionId;
}