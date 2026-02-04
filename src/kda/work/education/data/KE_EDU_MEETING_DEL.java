package kda.work.education.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class KE_EDU_MEETING_DEL {
	private String name = ""; 
	private String birth = ""; 
	private String office_name = ""; 
	private String in_date = "";
	private String in_paydate = ""; 
	private String in_payprice = "";
	private String bank_name = ""; 
	private String bank_num = ""; 
	private String bank_username = ""; 
	private String lic_no = "";
	private String tel_hp = "";
	private String ipgum_bambup = "";
	private String del_date = "";
	private String del_price = "";
	
	private String del_date01 = "";
	private String del_date02 = "";
	
	private String online_yn = "";
	private String online_yn2 = "";
}
