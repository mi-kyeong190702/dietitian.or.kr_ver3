package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TblNutritionmonitor //êµ?ë¯¼ì???? ëª¨ë???? ê´?ë¦?
{
	private int M_inx;   //ë²???
	private String M_name;   //?´ë?
	//private String M_Serial;   //ì£¼ë?¼ë???
	private String pers_birth;   //????????
	private String M_post;   //?°í?¸ë???
	private String M_addr;   //ì£¼ì??
	private String M_Tel;   //????ë²???
	private String indate;   //?±ë???
	private String M_element;   //ì§???
	private String MCode;   //ì½???
	private String Mid;   //???´ë??
}