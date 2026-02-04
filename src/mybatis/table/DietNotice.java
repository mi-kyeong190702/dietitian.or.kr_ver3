package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DietNotice //?¤ì?´ì?´í?? ???? ê²?????
{
	private int diet_Serial_no;   //??ë²?
	private String diet_User_name;   //ê¸??´ì??
	private String diet_wrt_date;   //ê¸??´ë????
	private String diet_wrt_time;   //ê¸??´ì??ê°?
	private String diet_title;   //??ëª?
	private String diet_content;   //?´ì??
	private int diet_read_no;   //ì¡°í????
	private String Status;   //????
	private String filename;   //???¼ì?´ë?
	private String hot_news;   //?«ë?´ì??
}