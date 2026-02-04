package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class GoodsBook //êµ??¡ì??ë£? ??ë§¤í??
{
	private String Serial_no;   //ë²??? - decimal(18, 0)
	private String mng_code;   //Mngì½???
	private String mng_nm;   //?????´ë?
	private String mng_memo;   //????ë©?ëª?
	private String mng_img1;   //?´ë?¸ì?1
	private String mng_img2;   //?´ë?¸ì?2
	private int mng_price;   //ê°?ê²?
	private int mng_price1;   //ê°?ê²?1
	private String mng_date;   //??ì§?
	private String status;   //????
}