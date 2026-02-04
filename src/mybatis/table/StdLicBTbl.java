package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class StdLicBTbl //êµ??¡ê³¼????ì²?
{
	private int std_lic_b_id;   //??ë²?
	private int edu_id;   //êµ??¡ì???´ë??
	private int edu_lic_id;   //êµ???LicId
	//private String pers_no;   //ì£¼ë?¼ë???
	private String pers_birth;   //????????
	private int code_session;   //ì½??? Session
	private int code_season;   //ì½??? Season
	private String submit_day;   //??ì¶???
	private String payment;   //ì§?ë¶???
	private String hyuhak;   //?´í???¬ë?
	private String center_flag;   //ì§?ë¶?ì²´í?¬ì?¬ë?
	private String edu_name;   //êµ??¡ì?´ë?
	private String csr_flag;   //CsrFlag
	private int edu_day;   //ì¶????¼ì??
	private String edu_day_date;   //êµ??¡ì?? 
	private String edu_day_pass;   //êµ??¡í?¨ì?¤ì?¬ë?
	private int edu_exam;   //êµ??¡ì?¼ì??
	private String edu_exam_date;   //êµ??¡ë?????ì§?
	private String edu_exam_pass;   //êµ??¡í?¨ì?¤ì²´??
	private String fail_reason;   //ë¶??©ê²© ?´ì??
	private String re_exam_flag;   //?¬ì?????¬ë?
	private String get_place;   //?°í?¸ë¬¼ ë°???ê³?
	private String exam_place;   //êµ??¡ì????
	private String exam_area;   //êµ??¡ì???
	private String exam_gubun;   //êµ??¡êµ¬ë¶?
	private String exam_flag;   //êµ??¡êµ¬ë¶?ê°?
	private String exam_date;   //êµ??¡ë??ì§? - datetime
	private String bank_name;   //??ê¸?ì£?
	private String bank_day;   //??ê¸???
	private String HOME_Pay_ipgumGubun;   //HOME_Pay_ipgumGubun
	private String RE_Pay_ipgumGubun;   //RE_Pay_ipgumGubun
	private String HOME_BANK_UserName;   //HOME_BANK_UserName
	private String HOME_BANK_IpgumDate;   //HOME_BANK_IpgumDate
	private int paper_inx;   //??ë¥???ì¶??¬ë?
}