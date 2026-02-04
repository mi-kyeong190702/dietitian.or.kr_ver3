package kda.work.education.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class KE_EDU_TEST_NAME {

	private String yyyy;
	
	private String code_kind;
	private String code_certifi;
	private String code_seq;
	private String code_bran;
	private String bran_seq;
	
	private String edutest_name;
	private int operation_cnt;
	private int season;
	private int receipt_pers_cnt;
	private String instrument;
	private String certifi_name;
	private String btext;
	
	private String operation_place;
	private int start_dt;
	private int end_dt;
	private int oper_start_dt;
	private int oper_end_dt;
	
	private String code_target;	
	private int new_cost;
	private int new_cost_nomem;
	
	private int oper_cnt;
	
	private String edu_group;
	private String outside_yn;
	private String edu_marks;
	private String finish_date;
	private String account_way;
	private String finish_point;
	private String account_end_dt;
	private String btext2;
	private String point_manage;
	private String remark;
	private String test_remark;	
	
}
