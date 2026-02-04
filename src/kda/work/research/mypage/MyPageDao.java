package kda.work.research.mypage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.research.report.data.ACTULSTATUS;


public interface MyPageDao {

	int getMyReportCount(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULSTATUS> getMyEdu(HashMap<String, Object> map) throws PersistenceException;
	
	int getMyEduCount(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULSTATUS> getMyReport(HashMap<String, Object> map) throws PersistenceException;
	
	String passwdFind(HashMap<String, Object> map) throws PersistenceException;
	
	String passwdChange(HashMap<String, Object> map) throws PersistenceException;
	
}
