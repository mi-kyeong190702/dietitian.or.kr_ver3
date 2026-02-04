package kda.admin.purchase.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class PTBCDBUYADDRESS extends KdaAbstractDto {
	
	private int bindex;
	private String buserId;
	private String bdate;
	private int bpayment;
	private String bpaymentDate;
	private String bf_PaymentDate;
	private String bf_PaymentName;
	private String bf_name;
	private String bf_ssn;
	private String bf_Tel;
	private String bf_Mobile;
	private String bf_Email;
	private int bf_Delivery;
	private String bt_name;
	private String bt_Post;
	private String bt_Address;
	private String bt_Tel;
	private String bt_Mobile;
	private String bt_Paper;
	private String bt_Text;
	private String bt_company;
	private String rcompanyTEL;
	private String rLicenseNumber;
	private int bf_birth;
	private String bPaymentDate;

}
