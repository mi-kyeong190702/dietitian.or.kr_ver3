package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class WooriNotice //?´ì????
{
	private int wr_Serial_no;   //??ë²?
	private String wr_User_name;   //?´ë?
	private String wr_wrt_date;   //ê¸??´ë??ì§?
	private String wr_wrt_time;   //ê¸??´ì??ê°?
	private String wr_title;   //??ëª?
	private String wr_content;   //?´ì??
	private int wr_read_no;   //ì¡°í????
	private String Status;   //????
}