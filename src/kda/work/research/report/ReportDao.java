package kda.work.research.report;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.research.recipient.data.ACTULSUBJECTS;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

public interface ReportDao {

	ACTULPERSON getReportUser(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getReportState(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getReportState2013(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getReportState2015(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULSTATUS> getReportEdu(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getReportHistory(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getReportHistory2(HashMap<String, Object> map) throws PersistenceException;
	
	void passwdInsert(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULPERSON getInfo(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULSTATUS getDate(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULSTATUS> getRecent(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULSTATUS> getRecentYear(HashMap<String, Object> map) throws PersistenceException;
	
	void personUpt(ACTULSTATUS actulstatus) throws PersistenceException;
	
	void statusUpt(ACTULSTATUS actulstatus) throws PersistenceException; 
	
	void statusUpt1(ACTULSTATUS actulstatus) throws PersistenceException; //20160120 2016년실태신고를 위한 수정
	
	void fileUpt(ACTULSTATUS actulstatus) throws PersistenceException;
	
	void personCancel(ACTULSTATUS actulstatus) throws PersistenceException;
	
	void statusCancel(ACTULSTATUS actulstatus) throws PersistenceException;
	
	List<ACTULSTATUS> getEmail(HashMap<String, Object> map) throws PersistenceException;
	
	HashMap<String, Object> getReportState_chk(HashMap<String, Object> map) throws PersistenceException;
	
	void personInfoUpt(ACTULPERSON actulperson) throws PersistenceException;

	List<ACTULSUBJECTS> getRecipientEduList(HashMap<String, Object> map) throws PersistenceException;

}
