package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DangNotice //?¹ë??(????)
{
	private int dang_Serial_no;   //ë²???
	private String dang_User_name;   //???±ì??
	private String dang_wrt_date;   //?±ë???
	private String dang_wrt_time;   //?±ë???ê°?
	private String dang_title;   //??ëª?
	private String dang_content;   //?´ì??
	private int dang_read_no;   //ì¡°í??
	private String Status;   //????
}