package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PERS_COMPANY              
{
	private String code_pers		     = "";	//회원코드	
	private int    comp_seq			     = 0;	//근무처 순번	
	private String company_name		     = "";	//근무처명	
	private String code_post		     = "";	//우편번호	
	private String company_add		     = "";	//근무처 주소	
	private String company_add_detail	 = "";	//근무처 상세주소
	private String company_tel	 		 = "";	//전화번호	
	private String company_fax		     = "";	//팩스번호	
	private String code_part		     = "";	//근무처구분	
	private String code_great		     = "";	//근무처 대분류	
	private String code_small		     = "";	//근무처 소분류	
	private String pers_in_dt		     = "";	//입사일		
	private String pers_out_dt		     = "";	//퇴사 일자	
	private String code_use			     = "";	//운영형태	
	private String job_dept			     = "";	//부서		
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
	private String regi_date		     = "";	//등록일자	
	private String register			     = "";	//등록자
 
}
