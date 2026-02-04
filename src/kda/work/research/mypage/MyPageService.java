package kda.work.research.mypage;

import java.util.List;

import kda.work.research.report.data.ACTULSTATUS;



public interface MyPageService {
	
	int getMyReportCount(String pers_name,	String lic_no) throws Exception;
	
	List<ACTULSTATUS> getMyReport(String pers_name,	String lic_no) throws Exception;
	
	int getMyEduCount(String pers_name,	String lic_no) throws Exception;
	
	List<ACTULSTATUS> getMyEdu(String pers_name,	String lic_no) throws Exception;
	
	String passwdFind(String pers_name,	String lic_no) throws Exception;
	
	String passwdChange(String pers_name,	String lic_no, String old_pass, String new_pass) throws Exception;
	
}
