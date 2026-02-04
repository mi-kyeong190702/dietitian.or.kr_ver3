package kda.admin.contest.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class SCIENCEMEETINGACTIVE extends KdaAbstractDto{

	private String idx;
	private String name;
	private String birth;
	private String lic_no;
	private String member_flag;
	private String office_name;
	private String zip;
	private String addr;
	private String tel;
	private String tel_hp;
	private String email;
	private String lic_clinic_flag;
	private String lic_supply_flag;
	private String join_flag;
	private String pay_date;
	private String pay_amount;
	private String reg_date;
	private String pay_flag;
	private String diet_License01;
	private String diet_License02;
	private String diet_License03;
	private String diet_License04;
	private String branch_name;
	private String big_name;
	private String sect_name;
	private String gtype;
	private String card_Status;
	private int inx_key=0;
	private String baccname;
	private String agree_yn;
	private String online_yn;
	private String online_yn2;
	private String ebook_yn;
	
}
