package kda.work.research.recipient.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Component
@Data public class ACTULSUBJECTS extends KdaAbstractDto{
	
	private int code_seq;           
	private String cs_secter;          
	private String cs_secter_organ;     
	private String pers_hp;             
	private String email;               
	private String code_post;           
	private String pers_add;            
	private String pers_add_detail;     
	private String cs_non_target;       
	private String cs_non_target_detail;
	private String cs_attachments;      
	private String ar_state;            
	private String ar_state_kr;            
	private String ar_regi_date;        
	private String ar_conform_date;     
	private String up_date;            
	private String cs_attachments_url;  
	private String cs_attachments_type; 
	private long cs_attachments_size; 
	private String pers_name;           
	private String lic_no;              
	private String pers_year;           
	private String authority_premises;
	private String code_sex;
	private String cs_con_education;
	private String cs_attachments2;
	private String cs_attachments_url2;  
	private String cs_attachments_type2; 
	private long cs_attachments_size2; 
	private String cs_attachments3;
	private String cs_attachments_url3;  
	private String cs_attachments_type3; 
	private long cs_attachments_size3; 
	
	
	private CommonsMultipartFile image_file;
	private CommonsMultipartFile image_file2;
	private CommonsMultipartFile image_file3;
	
}
