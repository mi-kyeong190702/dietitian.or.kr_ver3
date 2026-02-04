package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbBookGoods //ï§?ï¿½æ?´Ñ???
{
	private int oIndex;   //ï¿½ï¿½è¸°ï¿½
	private String oYear;   //ï¿½ï¿½ï¿½ï¿½
	private String oTitle;   //ï¿½ï¿½ï§?ï¿?
	private int oPrice1;   //åª?ï¿½å??ï¿?
	private int oPrice2;   //åª?ï¿½å??ï¿?1
	private String oContents;   //ï¿½ë??ï¿½ï¿½
	private String oImage;   //ï¿½ë??ï¿½ë?ï¿½ï¿½?ï¿?
	private String oDate;   //ï¿½ï¿½ï§?ï¿½ï¿½ï¿½å?ï¿? - datetime
	private int oTop;   //Top
	private String Materials_status;   //ï¿½ï¿½ï¿½ï¿½
	private int Bs_Category;   //Category
	private String bs_CategoryType;   //Category ï¿½ï¿½ï¿½ï¿½
}