package kda.member.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class PERSON_M_TBL                          
{
	private String code_pers		= "";
	private String code_member		= "";
	private String pers_name		= "";                                             
	private String pers_birth		= "";
	
	private String lic_no			= "";
	private String lic_print_dt		= "";
	private String code_add_gubun	= "";
	private String code_post		= "";
	private String pers_add			= "";
	private String pers_add_detail	= "";
	private String pers_tel			= "";
	private String pers_hp			= "";
	private String email			= "";
	private String code_email_comp	= "";
	private String code_sex			= "";
	private String code_religion	= "";
	private String code_marry		= "";
	private String code_bran		= "";
	private String code_big			= "";
	private String code_sect		= "";
	private String code_scholar		= "";
	private String code_univer		= "";
	private String code_school		= "";
	private String code_call		= "";
	private String code_place		= "";
	private String pers_career		= "";
	private String certifi_view		= "0"; //자격현황
	private String code_sub			= "";
	private String regi_date		= "";
	private String Up_Date			= "";
	private String kda_level		= "";
	private String recommender		= "";
	private String recm_division	= "";
	private String recm_hp			= "";
	private String pers_state		= "";
	private String register			= "";
	private String agree_dt			= "";
	private String ipinno			= "";
	private String mem_gubun		= "1"; //0 (교육생) 1 (회원)  
	
	private String 	code_great;
	private String 	code_part;
	private String 	code_small;
	private int 	comp_seq;
	private String 	company_name;
	private String 	company_tel;
	private String 	company_code_post;
	private String 	company_add;
	private String 	company_add_detail;
	private String 	job_dept;
	private String 	job_level_code;
	private String 	job_line_code;
	
	private String id;
	private String passwd;
	
	private int sum_dues = 0;
	private String code_pay_flag = ""; //입금방법 코드 (10:무통장 20:카드 30:계산서)
	private String code_pay_name = "";//입금방법 이름
	

	private String email1;
	private String email2;

	public MEMBER_JOIN convertMemberJoin() {
		MEMBER_JOIN join = new MEMBER_JOIN();
		
		join.setPers_name(this.pers_name);
		join.setPers_birth(this.pers_birth);
		join.setCode_sex(this.code_sex);
		join.setCode_bran(this.code_bran);
		join.setLic_no(this.lic_no);
		join.setId(this.id);
		join.setPasswd(this.passwd);
		join.setEmail(this.email);
		join.setPers_tel(this.pers_tel);
		join.setPers_hp(this.pers_hp);
		join.setCode_post(this.code_post);
		join.setPers_add(this.pers_add);
		join.setCode_bran(this.code_bran);
		join.setCompany_name(this.company_name);
		join.setPers_add_detail(this.pers_add_detail);
		join.setJob_dept(this.job_dept);
		join.setJob_line_code(this.job_line_code);
		join.setJob_level_code(this.job_level_code);
		join.setCompany_name(this.company_name);
		join.setCompany_code_post(this.company_code_post);
		join.setCompany_add(this.company_add);
		join.setCompany_add_detail(this.company_add_detail);
		join.setCompany_tel(this.company_tel);
		join.setCode_place(this.code_place);
		join.setCode_call(this.code_call);
		join.setId(this.id);
		return join;
	}
	
	
	
}