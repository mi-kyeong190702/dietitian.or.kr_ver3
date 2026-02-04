package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class HangsaNotice //êµ?ë¯¼ì???? ê²?????
{
	private int ha_Serial_no;   //ë²???
	private String ha_User_name;   //?´ë?
	private String ha_wrt_date;   //ê¸??´ë??ì§?
	private String ha_wrt_time;   //ê¸??´ì??ê°?
	private String ha_title;   //??ëª?
	private String ha_content;   //?´ì??-text
	private int ha_read_no;   //ì¡°í????
	private String Status;   //????
	private String free_file;   //????
	private String free_size;   //???¼ì?¬ì?´ì?


}