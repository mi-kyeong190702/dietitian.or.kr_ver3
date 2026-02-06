package kda.admin.campaign.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class CAMPAIGN extends KdaAbstractDto {
	
	private int bbs_idx;
	private String bbs_subject;
	private String bbs_user_id;      
	private String bbs_name;    
	private String bbs_reg_date_dt;
	private String bbc_user_id;
	private String bbc_name;
	private String bbc_contents;
	private String bbc_date;
	private int cnt2;
	private String pers_name;
	private String email;
	private String code_post;
	private String pers_add;
	private String pers_add_detail;
	private String pers_tel;
	private String pers_hp;
	private String id;
	private String company_name;
	private String bbs_view;
	private String bbs_contents;   
	private String bbs_file_size;
	private String bbs_file_type;  
	private String bbs_file_name;
	private String bbs_file_size2; 
	private String bbs_file_type2;
	private String bbs_file_name2; 
	private String bbs_file_size3;
	private String bbs_file_type3;
	private String bbs_file_name3;
	private String bbs_file_size4; 
	private String bbs_file_type4; 
	private String bbs_file_name4; 
	private String bbs_file_size5; 
	private String bbs_file_type5; 
	private String bbs_file_name5;

}
