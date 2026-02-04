package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TblNutritionmonitorDetail //êµ?ë¯¼ì???? ëª¨ë???? ???¸ì??ë³?
{
	private int Md_idx;   //ë²???
	private int M_idx;   //ì¤?ë²???
	private String S_gubun01_01;   //????ê°?
	private String S_text01_01;   //?´ì??
	private String S_gubun01_02;   //????ê°?1
	private String S_text01_02;   //?´ì??1
	private String S_gubun01_03;   //????ê°?2
	private String S_text01_03;   //?´ì??2
	private String S_gubun02_01;   //????ê°?3
	private String S_text02_01;   //?´ì??3
	private String S_gubun02_02;   //????ê°?4
	private String S_text02_02;   //?´ì??4
	private String S_gubun02_03;   //????ê°?5
	private String S_text02_03;   //?´ì??5
	private String S_text03_01;   //?´ì??
	private String indate;   //???¥ì?¼ì??
	private String MCode;   //ì½???
}