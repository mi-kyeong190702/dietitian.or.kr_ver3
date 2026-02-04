package kda.common;

import java.util.List;

import kda.common.data.GROUPCODE;

import org.apache.ibatis.exceptions.PersistenceException;

public interface CommonService {

	/***
	 * 공통코드 조회
	 * 
	 * @param groupCode
	 * @param tempcd2
	 * @return
	 * @throws PersistenceException
	 */
	List<GROUPCODE> getGroupCodeList(String groupCode, String tempcd2) throws PersistenceException;
	
	public void insertExcel(String prog_name, String create_user, String sheet_name) throws PersistenceException;
}
