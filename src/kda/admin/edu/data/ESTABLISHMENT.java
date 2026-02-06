package kda.admin.edu.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

@Component
@Data public class ESTABLISHMENT extends KdaAbstractDto{
	
	private int num;
	private String srchTy;
	private String srchName;
	private String srchNo;
	
	
	private String code_pers;
	private String groupcode;
	private String groupcodename;
	private String id;
	private String pers_name;
	private String lic_no;
	private String state;
	private String code_new;	
	private String code_old;	
	private String pers_birth;
	
	
	
	
	private int idx;
	private String name;
	private String birth;
	private String work_yy;
	private String work_mm;
	private String edu_type;
	private String edu_type_text;
	private String edu_area;
	private String regi_date;
	private String regi_time;
	
	private String hp;
	private String email;
	private String big_name;
	private String company_name;

}
