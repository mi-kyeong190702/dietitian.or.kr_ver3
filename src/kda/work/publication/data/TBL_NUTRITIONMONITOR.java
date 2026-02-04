package kda.work.publication.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TBL_NUTRITIONMONITOR
{
	private String user_id = "";
	
	private int M_inx = 0; //순번
	private String M_name = ""; //성명
	//private String M_Serial; //주민번호
	//private String pers_birth = ""; //생년월일
	private String M_post = ""; //우편번호
	private String M_addr = ""; //주소
	private String M_Tel = ""; //연락처
	private String indate = ""; //등록일
	//private String M_element = ""; //근무처 
	private String MCode; //고유 pk 확인
	private String Mid = ""; //로그인 아이디
	private int Md_idx = 0; 
	private int M_idx = 0; 
	private String S_gubun01_01 = ""; //칼럼명 1
	private String S_text01_01 = ""; //의견1
	private String S_gubun01_02 = ""; //칼럼명2
	private String S_text01_02 = "";  //의견2
	private String S_gubun01_03 = "";  //칼럼명 3
	private String S_text01_03 = ""; //의견3
	//아쉬운 내용
	private String S_gubun02_01 = "";
	private String S_text02_01 = "";
	private String S_gubun02_02 = "";
	private String S_text02_02 = "";
	private String S_gubun02_03 = ""; 
	private String S_text02_03 = "";
	private String S_text03_01 = ""; //내용
	
	
	// 20151022 영양사협회_국민영양12월호설문요청 추가

	private String interest1 = "";
	private String interest2 = "";
	private String interest3 = "";
	private String interest4 = "";
	private String interest5 = "";
	private String interest6 = "";
	private String interest7 = "";
	private String interest8 = "";
	private String interest9 = "";
	private String interest10 = "";
	private String interest11 = "";
	private String interest12 = "";
	private String interest13 = "";
	
	// 20161021  영양사협회_국민영양12월호설문요청 추가
	private String interest14 = "";
	private String interest15 = "";
	
	// 20180515 추가
	private String interest16 = "";
	private String interest17 = "";
	private String interest18 = "";
	private String interest19 = "";
	
	private String new_name = "";
	private String new_tel = "";
	private String new_compname = "";
	private String serveyYMD = "";
	
} 