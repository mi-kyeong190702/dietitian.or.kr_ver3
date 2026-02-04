package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class StdHTbl //êµ??¡ê³¼????ì²?
{
	//private String pers_no;   //ì£¼ë?¼ë???
	private String pers_birth;   //????????
	private int std_id;   //STD???´ë??
	private String s_date;   //????????
	private String iss_no;   //?´ì??ë²???
	private String e_date;   //????ì§?
	private int com_avg;   //Com??ê·?
	private int yet_avg;   //Yet ??ê·?
	private String com_flag;   //Comflag
	private int etc_avg;   //ê¸°í????ê·?
	private int center_com_avg;   //Center Com ??ê·?
	private int center_yet_avg;   //Center yet ??ê·?
	private int tot_center_avg;   //??ì²´ì?¼í?°í??ê·?
	private int tot_avg;   //??ì²´í??ê·?
	private String csr_flag;   //?´ë¦¬?´ê?
}