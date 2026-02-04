package kda.main;

import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kda.main.data.NOTICE;
import kda.mypage.data.MYMEMBERINFO;
import kda.spring.abstr.KdaAbstractMapper;

@Repository
public class MainDaoImpl extends KdaAbstractMapper implements MainDao
{
	private Log log = LogFactory.getLog(MainDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	@Override
	public List<NOTICE> getNoticeList()  throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<NOTICE> resultList = null;
		List<NOTICE> resultList2 = null;
		
		try{
			resultList = session.selectList("noticeList");
			resultList2 = session.selectList("noticeList1");
			
			resultList.addAll(resultList2);
		}catch(Exception e){
			if(log.isDebugEnabled()){
				log.debug("error!", e);
			}
		} finally {
			session.close();
		}
		
		return resultList;
	} 
	
	@Override
	public List<NOTICE> getNoticeList2()  throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<NOTICE> resultList = null; 
		
		try{
			resultList = session.selectList("noticeList2"); 
			 
		}catch(Exception e){
			if(log.isDebugEnabled()){
				log.debug("error!", e);
			}
		} finally {
			session.close();
		}
		
		return resultList;
	} 
	
	@Override
	public List<NOTICE> getNoticeList3() throws PersistenceException {
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<NOTICE> resultList = null;
		List<NOTICE> resultList2 = null;
		
		try{
			resultList = session.selectList("noticeList3"); 
			resultList2 = session.selectList("noticeList4");
			
			resultList.addAll(resultList2);
			 
		}catch(Exception e){
			if(log.isDebugEnabled()){
				log.debug("error!", e);
			}
		} finally {
			session.close();
		}
		return resultList;
	} 
	
	@Override
	public void saveLog(String date, String time) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("date", date);
		paramMap.put("time", time);
		insert(sqlSessionFactory1, "main.saveLog", paramMap);
	}

	@Override
	public void saveLogBanner(String date, String time, int bannerIdx)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("date", date);
		paramMap.put("time", time);
		paramMap.put("bannerIdx", bannerIdx);
		insert(sqlSessionFactory1, "main.saveLogBanner", paramMap);
		
	}
	
	@Override
	public void saveLogMember(String code_pers, String pers_name, String date, String time, String page_title) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("code_pers", code_pers);
		paramMap.put("pers_name", pers_name);
		paramMap.put("date", date);
		paramMap.put("time", time);
		paramMap.put("page_title", page_title);
		insert(sqlSessionFactory1, "main.saveLogMember", paramMap);
	}
	
	@Override
	public MYMEMBERINFO getSend_edu(String id, String gubun) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("user_id", id);
		paramMap.put("gubun", gubun);
		
		return (MYMEMBERINFO) selectOne(sqlSessionFactory4, "main.getSend_edu", paramMap);
	}
	@Override
	public List<NOTICE> getnoticeList_89() throws PersistenceException {
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<NOTICE> resultList = null; 
		
		try{
			resultList = session.selectList("noticeList_89"); 
			
			resultList.addAll(resultList);
		}catch(Exception e){
			if(log.isDebugEnabled()){
				log.debug("error!", e);
			}
		} finally {
			session.close();
		}
		
		return resultList;
	}
 
	
}
