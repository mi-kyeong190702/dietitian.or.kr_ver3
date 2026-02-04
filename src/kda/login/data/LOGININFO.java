package kda.login.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class LOGININFO 
{
	// -- to-be
	
	private String pers_name;
	private String conform_yn;
	private String pers_tel;
	private String pers_hp;
	private String code_member;
	private String email;
	private String dues_gubun;
	private String pers_state;
	private String auth_start;
	private String auth_end;
	private String code_pers;
	private String pwchk;
	private String code_bran;
	private String pers_birth;
	private String code_post;	
	private String pers_add;
	private String pers_add_detail;	
	private String lic_no;
	private String code_big;
	
	// -- as-is
	
	private String hosts;
	private String user_id;
	private String user_name;
	private String user_ssn;
	private String user_level;
	private String user_code;
	private String user_memberjoin;
	private String cook_email;
	private String cook_hp;
	
	private int pers_point;
}
