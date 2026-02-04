package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class File1Notice //?????? ê´??? ê²?????
{
	private int diet_Serial_no;   //??ë²?
	private String diet_User_name;   //ê¸??´ì??
	private String diet_wrt_date;   //ê¸??´ë??ì§?
	private String diet_wrt_time;   //ê¸??´ì??ê°?
	private String diet_title;   //??ëª?
	private String diet_content;   //?´ì??
	private int diet_read_no;   //ì¡°í????
	private String Status;   //????
	private String diet_file;   //????
	private String diet_size;   //???¼í?¬ê¸°
}