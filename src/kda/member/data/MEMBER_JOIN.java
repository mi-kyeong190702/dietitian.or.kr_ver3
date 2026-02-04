package kda.member.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class MEMBER_JOIN 
{	
	private String code_pers;
	
	// -- ID_TBL
	
	private String 	id			= "";
	private String 	passwd		= "";
	private long 	point;
	private String 	use_yn;
	
	// -- DUES_B_TBL
	
	private String 	dues_gubun			= "";
	private int 	dues_h_seq;
	private int 	dues_b_seq;
	private String 	pres_let_dt			= "";
	private String 	code_inout_gubun	= "";
	private String 	bank_name			= "";
	private String 	code_receipt		= "";
	private long 	pres_money;
	private String 	code_pay_flag		= "";
	private String 	code_pay_name		= ""; //
	private String 	conform_dt			= "";
	private String 	conform_yn			= "";
	private String 	regi_date			= "";
	private String 	register			= "";
	
	// -- DUES_H_TBL
	
	private String 	regi_dt 			= null;
	private String 	code_member 		= null; //-2 (교육생)
	private String 	auth_start 			= null;
	private String 	auth_end			= null;
	private long 	mem_dues;
	private long 	sum_dues			= 0l;
	private String 	incom_flag 			= null;	
	
	// -- PERSON_M_TBL
  //private String code_pers		= "";	//회원코드	                   
  //private String 	code_member		= ""; //-2 (교육생)
	private String 	pers_name		= "";
	private String 	pers_birth		= "";
	private String 	lic_no			= "";
	private String 	lic_print_dt	= "";
	private String  pers_sex 		= "";
	private String 	code_add_gubun	= "";
	private String 	code_post		= "";
	private String 	pers_add		= "";
	private String 	pers_add_detail	= "";
	private String 	pers_tel		= "";
	private String 	pers_hp			= "";
	private String 	email			= "";
	private String 	email2			= "";
	private String 	code_sex		= "";
	//빠진 코드
	private String 	code_email_comp	= "01";	
	private String 	code_religion	= "00";
	private String 	code_marry		= "0";
	private String 	code_sect		= "0000000";
	//
	private String 	code_bran		= "";
	private String 	code_big		= "N";
	private String 	code_scholar	= "";
	private String 	code_univer		= "00"; //학위
	private String 	code_school 	= "00000"; //최종학력
	private String 	code_call 		= "";
	private String 	code_place 		= "";
	private String 	pers_career		= "0000"; //경력
	private String 	certifi_view	= "0"; //자격현황
	private String 	certifi_view2	= "0"; //자격현황
	private String 	certifi_view3	= "0"; //자격현황
	private String 	certifi_view4	= "0"; //자격현황
	private String 	certifi_view5	= "0"; //자격현황
	private String 	code_sub		= "";
	private String 	up_date			= "";
	private String 	kda_level		= "";
	private String 	recommender		= "";
	private String 	recm_division	= "";
	private String 	recm_hp			= "";
	private String 	pers_state		= "";
	private String 	agree_dt		= "";
	private String 	ipinno			= "";
	private String 	mem_gubun		= "1"; //0 (교육생) 1 (회원)  
	
	// -- PERSON_M_HISTORY
	
	private String 	up_dt 			= null;                  
	private int 	up_dt_seq;                               
	private String 	updater 		= null;   	
	
	// -- PERSON_COMPANY
	
	//private String code_pers		     = "";	//회원코드	
	private int    comp_seq			     = 0;	//근무처 순번	
	private String company_name		     = "";	//근무처명	
	private String company_code_post	 = "";	//우편번호	
	private String company_add		     = "";	//근무처 주소	
	private String company_add_detail	 = "";	//근무처 상세주소
	private String company_tel		     = "";	//전화번호	
	private String company_fax		     = "";	//팩스번호	
	private String code_part		     = "0";	//근무처구분	
	private String code_great		     = "000";	//근무처 대분류	
	private String code_small		     = "00000";	//근무처 소분류	
	private String pers_in_dt		     = "";	//입사일		
	private String pers_out_dt		     = "";	//퇴사 일자	
	private String code_use			     = "";	//운영형태	
	private String job_dept			     = "";	//부서 및 직급(부)	
	private String job_level_code		 = "";	//직급		
	private String job_line_code		 = "";	//직렬		
	private int    lic_pay			     = 0;	//영양사 면허수당	
	private int    year_pay			     = 0;	//연봉(만원)	
	private int    company_sick_bad		 = 0;	//허가병상	
	private int    company_meal		     = 0;	//1식재료비	
	private int    join_con			     = 0;	//공동관리	
	private int    join_cook		     = 0;	//공동조리	
	private String primary_flag		     = "";	//우선 근무처	
	private String pers_multy		     = "";	//겸직여부	
	private int    company_count_mom	 = 0;	//급식인원_아침	
	private int    company_count_lunch	 = 0;	//급식인원_점심	
	private int    company_count_dinner	 = 0;	//급식인원_저녁	
	private int    company_count_midnig	 = 0;	//급식인원_야식	
	private String trust_code		 	 = "";	//위탁업체코드	
	private String trust_name		     = "";	//위탁업체명	
	private String trust_addr		     = "";	//위탁업체주소	
	private String trust_tel		     = "";	//위탁업체 전화	
	private String secu_no			     = "";	//산재번호	
	//private String regi_date		     = "";	//등록일자	
	//private String register			 = "";	//등록자
	
	// -- IPIN

	private String  encpsnlinfo		= "";
	private String  dupinfo			= "";
	private String  coinfo1			= "";
	private String  coinfo2			= "";
	private String  ciupdate		= "";
	private String  virtualno		= "";
	private String  cpcode			= "";
	//private String  realname		= "";
	private String  cprequestnumber	= "";
	private String  age				= "";
	private String  sex				= "";
	private String  nationalinfo	= "";
	private String  birthdate		= "";
	private String  authinfo		= "";
	
	// Convert 추가
	private String company_name_org = "";
	private String ppost;
	private String cpost;
	
	//com_code
	private String	detCodeName 		= "";	//세부코드명
	
	//DUES_H_TBL_CMS
	//private String code_pers			= ""; // 회원코드
	//private String dues_gubun			= ""; // 입금구분
	//private int    dues_h_seq			= 0; // 회비관리 순번	
	//private String code_member		= ""; // 회원여부
	private String CMS_date				= ""; // 납부일
	private String CMS_bank				= ""; // 은행	
	private String CMS_acount			= ""; // 입금액
	private String CMS_name				= ""; // 출금계좌 예금주명	
	private String CMS_birth			= ""; // 생일
	private String CMS_pers_tel			= ""; // 전화번호	
	private String CMS_pers_hp			= ""; // 핸드폰
	private String CMS_agree_YN			= ""; // 개인정보 수집 동의
	private String CMS_agree_other_yn	= ""; // 개인정보 제3자 수집 동의
	private double CMS_dues				= 0l; // 월 납부금액-기존회원
	private String CMS_auth_start		= ""; // 월 납부금액-신규회원-최초 1년간
	private String CMS_auth_end			= ""; // 월 납부금액-신규회원-1년 이후
	//private String regi_date			= ""; // 등록일시
	//private String regi_dt			= ""; // 등록일자	
	//private String register			= ""; // 등록자	
	//private String up_date			= ""; // 수정일시	
	//private String updater			= ""; // 수정자
}