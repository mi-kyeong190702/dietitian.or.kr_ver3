package kda;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import java.util.*;
import java.io.*;

public class SessionInfo 
{	
	public static String USER_ID		= "userid";
	public static String LOGIN			= "login";
	public static String LOGIN_INFO		= "login_info";
	public static String MEMBER_JOIN	= "member_join";
	public static String PERS_NAME		= "pers_name";
	public static String PERS_TEL		= "pers_tel";
	public static String PERS_HP		= "pers_hp";
	public static String CODE_MEMBER    = "code_member";//07:학생회원  21: 신규취업회원 22:신규미취업회원 25:기취업회원 26:기미취업회원 28:신규특별회원 29:기특별회원 30:신규평생정회원 31:기평생정회원 32:신규평생특별회원 33:기평생특별회원
	public static String EMAIL			= "email";
	public static String DUES_GUBUN     = "dues_gubun"; //(회비구분)1:연회비 2:평생회비 3:산하단체회비 4:CMS 회비
	public static String PERS_STATE     = "pers_state"; //01:정상  06:승인대기  07:선인증
	public static String AUTH_START     = "auth_start"; //유효기간 From
	public static String AUTH_END       = "auth_end"; //유효기간 End  
	public static String PWCHK       	= "pwchk";   
	public static String CODE_PERS      = "code_pers"; //회원번호
	public static String PERS_BIRTH     = "pers_birth"; //생년월일
	public static String CODE_BRAN      = "code_bran"; //소속지부  
	public static String USER_LEVEL     = "user_level"; //1 최고관리자 2 중간관리자 3  회원▲▲ 4 회원▲ 5 회원 6 비회원
	public static String PATH		    = "path";  
	public static String CODE_POST		= "code_post";  
	public static String PERS_ADD		= "pers_add";  
	public static String PERS_ADD_DETAIL= "pers_add_detail";  
	public static String LIC_NO			= "lic_no";  
	public static String PERS_POINT		= "pers_point"; 
	public static String SEARCH			= "search";
	public static String SEARCH_KEYWORD	= "search_keyword";
	public static String CODE_BIG		= "code_big";
	
	public static String HOMEPAGE_ADMIN = "homepage_admin";
	
	private HttpSession session;
	
	public SessionInfo ( HttpSession sess ) {
		session = sess;	
	}	
	
	public boolean isLogin () {
		String login = (String) session.getAttribute ( LOGIN );
		if ( login != null )
		{
			if ( login.equals("Y")) 
				return true;
			else 
				return false;
		}
		return false;
	}
	
	public String getUserId()
	{
		String userid = (String) session.getAttribute ( USER_ID );
		if ( userid != null )
			return userid;
		return "";
	}
	
	public int getUserLevel()
	{
		int user_level = 0;
		try{
			user_level = (int) session.getAttribute ( USER_LEVEL );
			if ( user_level > 0 )
				return user_level;
		
		}catch(Exception e){
			System.out.println("getUserLevel error:"+ e.toString());
		}
		return 0;
	}
	
	public int getPersPoint()
	{
		int pers_point = 0;
		try{
			if ( session.getAttribute ( PERS_POINT ) == null) {
				return 0;
			} else {
				pers_point = (int) session.getAttribute ( PERS_POINT );
				if ( pers_point > 0 )
					return pers_point;
			}
			
		}catch(Exception e){
			System.out.println("getPersPoint error:"+ e.toString());
		}
		return 0;
	}
	
	public String getCodebig()
	{
		String code_big = (String) session.getAttribute ( CODE_BIG );
		if ( code_big != null )
			return code_big;
		return "";
	}
	
	
	public String getPersState()
	{
		String pers_state = (String) session.getAttribute ( PERS_STATE );
		if ( pers_state != null )
			return pers_state;
		return "";
	}
}
