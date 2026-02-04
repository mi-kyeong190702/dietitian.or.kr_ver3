package kda.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.main.data.NOTICE;
import kda.mypage.data.MYMEMBERINFO;

public interface MainDao
{
	List<NOTICE> getNoticeList() throws PersistenceException;
	
	List<NOTICE> getNoticeList2() throws PersistenceException; 
	
	List<NOTICE> getNoticeList3() throws PersistenceException; 
	
	public void saveLog(String date, String time) throws PersistenceException;
	
	public void saveLogBanner(String date, String time, int bannerIdx) throws PersistenceException;
	
	public void saveLogMember(String code_pers, String pers_name, String date, String time, String page_title) throws PersistenceException;
	
	public MYMEMBERINFO getSend_edu(String id, String gubun) throws PersistenceException;

	List<NOTICE> getnoticeList_89() throws PersistenceException;
	
}