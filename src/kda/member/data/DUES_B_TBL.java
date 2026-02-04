package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DUES_B_TBL				
{
	private String code_pers;
	private String dues_gubun;
	private int dues_h_seq;
	private int dues_b_seq;
	//private String udes_gubun;
	private String pres_let_dt;
	private String code_inout_gubun;
	private String bank_name;
	private String code_receipt;
	private long pres_money;
	private String code_pay_flag;
	private String conform_dt;
	private String conform_yn;
	private String regi_date;
	private String register;
}