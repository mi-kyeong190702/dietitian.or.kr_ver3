package kda.edu.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class CertPrint 
{	

	//private String pers_name = "";
	private String pers_name ;
	private String pers_birth ;
	private String pers_license ;
	
	private String yyyy;
	private String operation_cnt; 
	private String operation_place; 
	private String edutest_name;
	private String code_seq;
	private String result_no;
	private String outside_yn;
	private String edu_marks;
	private String oper_start_dt;
	private String oper_end_dt;
	private String result_state_txt; 
	private String print_kind;
	private String code_kind;
	private String code_certifi;
	
	private String code_bran; 
	private String bran_seq;
	private String receipt_no; 
	private String oper_state_txt; 
	private String code_bran_txt;
	private String bran_txt; 
	private String oper_name;
	private String oper_lic_no; 
	private String oper_comp_name1; 
	private String detcode;
	
	
}