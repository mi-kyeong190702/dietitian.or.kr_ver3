package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class StdBTbl //êµ??¡ê³¼????ì²?
{
	private int app_id;   //app???´ë??
	private int std_id;   //std???´ë??
	private int edu_id;   //edu???´ë??
	//private String pers_no;   //ì£¼ë?¼ë???
	private String pers_birth;   //????????
	private String edu_name;   //êµ??¡ì?´ë?
	private String center_flag;   //êµ??¡ì£¼ì²?
	private String end_day;   //EndDay
	private int edu_day;   //êµ??¡ì??
	private String code_private;   //ê°??¸ì???
	private int app_avg;   //App??ê·?
	private String csr_com_flag;   //CSR COM ì²´í?¬ê?
	private String csr_flag;   //CSR ì²´í?¬ê?
	private String submit_day;   //??ì¶?ê¸°í??
	private String payment;   //??ê¸???
	private String hyuhak;   //?´í???¬ë?
	private String diploma_no1;   //ì¡¸ì??ì¦???1
	private int diploma_no2;   //ì¡¸ì??ì¦???2
	private String fail_reason;   //Fail Reason
	private String edu_day_date;   //êµ??¡ë??ì§???
	private String diploma_date;   //ì¡¸ì????
	private String edu_day_pass;   //ì¡¸ì???¬ë?
	private String diploma_flag;   //ì¡¸ì??ê°?
	private String HOME_Pay_ipgumGubun;   //HOME_Pay_ipgumGubun
	private String RE_Pay_ipgumGubun;   //RE_Pay_ipgumGubun
	//private String HOME_BANK_UserName;   //HOME_BANK_UserName - ????
	//private String HOME_BANK_IpgumDate;   //HOME_BANK_IpgumDate
}