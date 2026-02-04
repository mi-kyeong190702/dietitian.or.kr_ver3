package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DUES_H_TBL_CMS					
{
	private String code_pers			= ""; // 회원코드
	private String dues_gubun			= ""; // 입금구분
	private int    dues_h_seq			= 0; // 회비관리 순번	
	private String code_member			= ""; // 회원여부
	private String CMS_date				= ""; // 입금날짜
	private String CMS_bank				= ""; // 은행	
	private String CMS_acount			= ""; // 입금액
	private String CMS_name				= ""; // 이름	
	private String CMS_birth			= ""; // 생일
	private String CMS_pers_tel			= ""; // 전화번호	
	private String CMS_pers_hp			= ""; // 핸드폰
	private String CMS_agree_YN			= ""; // CMS동의여부
	private String CMS_agree_other_yn	= ""; // CMS다른동의여부
	private double CMS_dues				= 0l; // CMS 입금금액
	private String CMS_auth_start		= ""; // CMS 입금일
	private String CMS_auth_end			= ""; // CMS 종료일
	private String regi_date			= ""; // 등록일시
	private String regi_dt				= ""; // 등록일자	
	private String register				= ""; // 등록자	
	private String up_date				= ""; // 수정일시	
	private String updater				= ""; // 수정자
}