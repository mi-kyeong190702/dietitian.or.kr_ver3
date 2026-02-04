package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class BemanNotice //ë¹?ë§? ê²?????
{
	private int bm_Serial_no;   //??ë²?
	private String bm_User_name;   //ê¸??´ì??
	private String bm_wrt_date;   //ê¸??´ë??????
	private String bm_wrt_time;   //ê¸??´ì??ê°?
	private String bm_title;   //??ëª?
	private String bm_content;   //?´ì??
	private int bm_read_no;   //ì¡°í????
	private String Status;   //????
}