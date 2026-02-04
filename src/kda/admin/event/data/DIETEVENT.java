package kda.admin.event.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class DIETEVENT extends KdaAbstractDto{
	
	private String pers_name;
	private String detcodename;
	private String lic_no;
	private String pers_tel;
	private String pers_hp;
	private String email;
	private String company_name;
	private String code_post;
	private String pers_add;
	private String pers_add_detail;
	private String new_name;
	private String new_tel;
	private String new_compname;
	private String reg_date;
	private String sns_domain;

}
