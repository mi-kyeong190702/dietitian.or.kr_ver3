package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class HotnewsNotice //?«ë?´ì?¤ê?????
{
	private int hn_Serial_no;   //ë²???
	private String hn_User_name;   //?´ë?
	private String hn_wrt_date;   //ê¸??´ë??ì§?
	private String hn_wrt_time;   //ê¸??´ì??ê°?
	private String hn_title;   //??ëª?
	private String hn_content;   //?´ì??-text
	private int hn_read_no;   //ì¡°í????
	private String Status;   //????

}