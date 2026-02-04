package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data 
public class PAPERBOARD
{
	private int		board_rownum; 
	private int		bbs_idx;		
	private String 	bbs_user_id;       
	private String 	bbs_board_code;    
	private boolean	bbs_notice		= false;
	private String  bbs_notice_str  = "";
	private float 	bbs_m_number;
	private int		bbs_step		= 1;          
	private String	bbs_file_name 	= "";     
	private String  bbs_file_url      = "";   
	private String	bbs_file_type 	= "";     
	private long	bbs_file_size;
	private int		bbs_file_down;
	private int		bbs_comments_count;
	private String	bbs_pwd			= "";           
	private String	bbs_category	= "";      
	private String	bbs_name		= "";          
	private String	bbs_email		= "";         
	private String	bbs_tel			= "";           
	private String	bbs_option		= "";        
	private String	bbs_subject		= "";       
	private String	bbs_contents	= "";      
	private int		bbs_view		= 0;          
	private String	bbs_edit_date_dt= "";  
	private String	bbs_reg_date_dt	= "";   
	private String	bbs_user_ip		= "";       
	private boolean	bbs_del_flag	= false;
	private int		bbs_re_count	= 0;
	private int		bbs_re_number	= 0;
	private String	bbs_file_name2 	= "";    
	private String	bbs_file_url2	= "";     
	private String	bbs_file_type2	= "";    
	private long	bbs_file_size2;    
	private int		bbs_file_down2;    
	private String	bbs_file_name3	= "";    
	private String	bbs_file_url3	= "";
	private String	bbs_file_type3	= "";    
	private long	bbs_file_size3;
	private int		bbs_file_down3;	    
	private String	bbs_file_name4	= "";    
	private String	bbs_file_url4	= "";     
	private String	bbs_file_type4	= "";    
	private long	bbs_file_size4;    
	private int		bbs_file_down4;    
	private String	bbs_file_name5	= "";    
	private String	bbs_file_url5	= "";     
	private String	bbs_file_type5	= "";    
	private long	bbs_file_size5;    
	private int		bbs_file_down5;    
	private int		bbs_recomm;  
	private String  bbs_new			= "";
	private String  bbs_html		= "";
	private String  file_del_chk    = "N";
	private String  file_del_chk2   = "N";
	private String  file_del_chk3   = "N";
	private String  file_del_chk4   = "N";
	private String  file_del_chk5   = "N";
	
	private String board_form = "";
	
	private String update_point_kind = "";
	private String update_point_pers = "";
	private int	   update_point = 0;
	
	private String	bbs_visible_yn = "Y";
	
	private int     bbs_notice_order = 0;
}
