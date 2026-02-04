package kda.work.news;

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

import kda.board.data.PAPERBOARD;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.news.data.KN_CALENDAR;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

@Repository
public class NewsDaoImpl  extends KdaAbstractMapper  implements NewsDao 
{
	private Log log = LogFactory.getLog(NewsDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory2;
	
	@Override
	public List<KN_CALENDAR> get_schedulex_list(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<KN_CALENDAR> schedulexList = null;	
		try
		{
			schedulexList = session.selectList("get_schedulex_list",paramMap);
		} catch(PersistenceException e) {
			log.info("error!", e);	
			throw e;
		} finally {
			session.close();
		}
		return schedulexList;
	}

	@Override
	public void insertJob(Map paramMap) throws PersistenceException {
		insert(sqlSessionFactory2, "adminJob.insertTblJob", paramMap);
		
	}
	
	
	
}
