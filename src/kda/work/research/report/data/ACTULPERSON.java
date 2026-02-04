package kda.work.research.report.data;

import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class ACTULPERSON {
	
	private int code_seq;
	private String pers_name;
	private String lic_no;
	private String lic_print_dt;
	private String userpw;	
	private String code_sex;
	private String pers_year;
	private String code_post;
	private String pers_add;
	private String pers_add_detail;
	private String pers_tel;
	private String pers_hp;
	private String email;
	private String pers_state;
	private String regi_dt;
	private String up_date;
	private String pwchk;
	private String ar_state;
	private String user_pw;

}

