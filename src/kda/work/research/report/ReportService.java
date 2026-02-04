package kda.work.research.report;

import java.util.HashMap;
import java.util.List;

import kda.work.research.recipient.data.ACTULSUBJECTS;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

public interface ReportService {
	
	ACTULPERSON getReportUser(String pers_name, String lic_no) throws Exception;
	
	ACTULSTATUS getReportState(String year,String pers_name, String lic_no) throws Exception;
	
	ACTULSTATUS getReportState2013(String year,String pers_name, String lic_no) throws Exception;
	
	ACTULSTATUS getReportState2015(String year,String pers_name, String lic_no) throws Exception;
	
	List<ACTULSTATUS> getReportEdu(String year,String pers_name, String lic_no) throws Exception;
	
	ACTULSTATUS getReportHistory(String year,String pers_name, String lic_no) throws Exception;
	
	ACTULSTATUS getReportHistory2(String year,String pers_name, String lic_no) throws Exception;
	
	void passwdInsert(String pers_name, String lic_no, String user_pw) throws Exception;
	
	ACTULPERSON getInfo(String pers_name, String lic_no, String user_pw) throws Exception;
	
	ACTULSTATUS getDate(String year,String pers_name, String lic_no) throws Exception;
	
	List<ACTULSTATUS> getRecent(String year,String pers_name, String lic_no) throws Exception;
	
	List<ACTULSTATUS> getRecentYear(String year,String pers_name, String lic_no) throws Exception;
	
	void personUpt(ACTULSTATUS actulstatus) throws Exception;
	
	void statusUpt(ACTULSTATUS actulstatus) throws Exception;
	
	void statusUpt1(ACTULSTATUS actulstatus) throws Exception; //20160120 2016년실태신고를 위한 수정
	
	void fileUpt(ACTULSTATUS actulstatus) throws Exception;
	
	void personCancel(ACTULSTATUS actulstatus) throws Exception;
	
	void statusCancel(ACTULSTATUS actulstatus) throws Exception;
	
	List<ACTULSTATUS> getEmail() throws Exception;
	
	HashMap<String, Object> getReportState_chk(HashMap<String, Object> param) throws Exception;
	
	void personInfoUpt(ACTULPERSON actulperson) throws Exception;

	List<ACTULSUBJECTS> getRecipientEduList(String pers_name, String lic_no) throws Exception;

}
