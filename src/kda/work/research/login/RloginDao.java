package kda.work.research.login;

import java.util.HashMap;

import kda.work.research.report.data.ACTULPERSON;

import org.apache.ibatis.exceptions.PersistenceException;


public interface RloginDao {

	ACTULPERSON passwdCk(HashMap<String, Object> map) throws PersistenceException;
	
	int insertHistory(HashMap<String, Object> map) throws PersistenceException;
	
	int loginHistory(HashMap<String, Object> map) throws PersistenceException;
	
	int logoutHistory(HashMap<String, Object> map) throws PersistenceException;
	
	int isUser(HashMap<String,Object> map) throws PersistenceException;
	
}
