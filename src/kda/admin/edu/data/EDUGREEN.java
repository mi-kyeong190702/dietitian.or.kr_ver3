package kda.admin.edu.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

@Component
@Data public class EDUGREEN extends KdaAbstractDto{
	
	
	private String idx;
	private String gubun;
	private String pers_no_sub;
	private String email;
	private String email_sub;
	private String tel_hp;
	private String tel;
	private String branch_name;
	private String name1;
	private String branch_name1;
	private String edu_js_type1;
	private String lic_no1;
	private String name2;
	private String branch_name2;
	private String edu_js_type2;
	private String lic_no2;
	private String file_flag;
	private String file_add;
	private String reg_date;
	private String up_date;
	private String is_open;
	private String crtitle_name;
	private String edu_type;
	private String name;
	private String pers_birth;
	private String edu_type_etc;
	private int num;
	

}
