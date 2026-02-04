package kda.common;

import java.util.List;

import kda.common.data.GROUPCODE;

import org.apache.ibatis.exceptions.PersistenceException;

public interface CommonDao
{
	List<GROUPCODE> getGroupCodeList(String groupCode, String tempcd2) throws PersistenceException;
	
	public void insertExcel(String prog_name, String create_user, String sheet_name) throws PersistenceException;
}