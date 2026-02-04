package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PaperBoard
{
	private int		bbs_idx;		
	private String 	bbs_user_id;       
	private int 	bbs_board_code;    
	private Boolean	bbs_notice;        
	private float 	bbs_m_number;      
	private String	bbs_step;          
	private String	bbs_file_name;     
	private String	bbs_file_url;      
	private String	bbs_file_type;     
	private int		bbs_file_size;     
	private int		bbs_file_down;     
	private int		bbs_comments_count;
	private String	bbs_pwd;           
	private String	bbs_category;      
	private String	bbs_name;          
	private String	bbs_email;         
	private String	bbs_tel;           
	private String	bbs_option;        
	private String	bbs_subject;       
	private String	bbs_contents;      
	private int		bbs_view;          
	private String	bbs_edit_date_dt;  
	private String	bbs_reg_date_dt;   
	private String	bbs_user_ip;       
	private Boolean	bbs_del_flag;      
	private int		bbs_re_count;      
	private int		bbs_re_number;     
	private String	bbs_file_name2;    
	private String	bbs_file_url2;     
	private String	bbs_file_type2;    
	private int		bbs_file_size2;    
	private int		bbs_file_down2;    
	private String	bbs_file_name3;    
	private String	bbs_file_url3;     
	private String	bbs_file_type3;    
	private int		bbs_file_size3;    
	private int		bbs_file_down3;    
	private String	bbs_file_name4;    
	private String	bbs_file_url4;     
	private String	bbs_file_type4;    
	private int		bbs_file_size4;    
	private int		bbs_file_down4;    
	private String	bbs_file_name5;    
	private String	bbs_file_url5;     
	private String	bbs_file_type5;    
	private int		bbs_file_size5;    
	private int		bbs_file_down5;    
	private int		bbs_recomm;
	private String	bbs_visible_yn;
}