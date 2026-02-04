package kda.work.research.login;

import kda.work.research.report.data.ACTULPERSON;


public interface RloginService {
	
	ACTULPERSON passwdCk(String pers_name, 	String lic_no, String user_pw) throws Exception;
	
	int insertHistory(String pers_name, 	String lic_no, String ip) throws Exception; 
	
	int loginHistory(String pers_name, 	String lic_no, String ip) throws Exception; 
	
	int logoutHistory(String pers_name, 	String lic_no) throws Exception; 
	
	int isUser(String pers_name, 	String lic_no) throws Exception;
	
}
