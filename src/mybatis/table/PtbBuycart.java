package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbBuycart//ï¿½Î»ï¿½?´Ñ?ï¿½ï¿½
{
	private int ctIndex;   //ï¿½ï¿½è¸°ï¿½
	private String ctSessionID;   //ï¿½ë?ï¿½ï¿½ï¿½ï¿½ï¿½ë??ï¿½ï¿½
	private int oIndex;   //?¨ï¿½ï¿½ï¿½è¸°ï¿½ï¿½ï¿½
	private int ctEa;   //ï¿½ï¿½ï¿½ï¿½
	private String ctDate;   //ï¿½ï¿½ï§?ï¿? - smalldatetime
	private String ctGubun;   //?´Ñ?ï¿?
}