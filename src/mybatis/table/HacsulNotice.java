package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class HacsulNotice //????ê²?????
{
	private int hs_Serial_no;   //ë²???
	private String hs_User_name;   //?´ë?
	private String hs_wrt_date;   //ê¸??´ë??ì§?
	private String hs_wrt_time;   //ê¸??´ì??ê°?
	private String hs_title;   //??ëª?
	private String hs_content;   //?´ì??-text
	private int hs_read_no;   //ì¡°í????
	private String Status;   //????

}