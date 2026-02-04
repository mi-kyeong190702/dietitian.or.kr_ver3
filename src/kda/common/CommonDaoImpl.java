package kda.common;

import java.util.HashMap;
import java.util.List;

import kda.common.data.GROUPCODE;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaoImpl implements CommonDao
{
	private Log log = LogFactory.getLog(CommonDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Override
	public List<GROUPCODE> getGroupCodeList(String groupCode, String tempcd2) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<GROUPCODE> resultList = null;
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("groupcode", groupCode);		
		paramMap.put("tempcd2", tempcd2);
		
		log.info("groupCode : " + groupCode);
		log.info("tempcd2 xxx : " + tempcd2);
		
		try{
			resultList = session.selectList("getGroupcodeInfo", paramMap);
		}catch(Exception e){
			log.debug("error!", e);
			throw e;
		}finally {
			session.close();
		}
		
		return resultList;
	}
	
	@Override
	public void insertExcel(String prog_name, String create_user, String sheet_name) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("prog_name", prog_name);		
		paramMap.put("create_user", create_user);
		paramMap.put("sheet_name", sheet_name);
		
		try {
			session.insert("insertExcel", paramMap);
		} catch (Exception e) {
			log.debug("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
}
