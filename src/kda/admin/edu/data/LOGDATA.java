package kda.admin.edu.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

@Component
@Data public class LOGDATA extends KdaAbstractDto{ 
	
	private int num; 
	private int idx; 
	private String id; 
	private String print_date;
	private String print_cd;
	private String code_pers;
	private String print_name;
	private String ins_date;
	private String print_seq;
	private String lic_no;
	private String pers_name;

}
