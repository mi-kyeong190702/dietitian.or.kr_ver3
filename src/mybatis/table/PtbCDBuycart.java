package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbCDBuycart//CD êµ¬ë§¤ ?¥ë?êµ¬ë??
{
	private int ctIndex;   //??ë²?
	private String ctSessionID;   //SessionID
	private int oIndex;   //ê³???ë²???
	private int ctEa;   //????
	private String ctDate;   //??ì§? - smalldatetime
	private String ctGubun;   //êµ¬ë?
	private String ctGoodsName;   //?´ë?
	private int ctPrice;   //ê°?ê²?
}