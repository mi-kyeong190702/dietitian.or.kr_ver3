package kda.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.login.data.LOGININFO;

public interface LoginDao
{
	LOGININFO getUserPassword(HashMap<String,Object> pramMap) throws PersistenceException;
	LOGININFO getUserInfo(HashMap<String,Object> pramMap) throws PersistenceException;
	public int selectPasswdUpateMonth(String codePers) throws PersistenceException; 
}