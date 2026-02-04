package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbEduschedule //?????¸ì??êµ??¡ì????
{
	private int ilIndex;   //??ë²?
	private String ilSponsor;   //?¤í?°ì??
	private String ilEduName;   //êµ??¡ë?
	private String ilName;   //???±ì??
	private String ilSubject;   //??ëª?
	private String ilContents;   //?´ì??
	private String ilLocation;   //?¥ì??
	private String ilTime;   //??ê°?
	private String ilTel;   //????
	private int ilRecognition;   //ê²????¬ë?
	private String ilType;   //êµ??¡êµ¬ë¶?
	private String ilPoint;   //?¬ì?¸í??
	private int ilYear;   //????
	private int ilMonth;   //??
	private int ilDay;   //??
	private String ilUrl;   //Url
	private String  ilRegDate;   //?????? -datetime
	private String ilRecognition_sub;   //ê²?????ë¸?
}