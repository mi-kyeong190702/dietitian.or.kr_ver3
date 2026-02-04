package kda.event;

import java.util.HashMap;
import java.util.Map;

import kda.event.data.EventView;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;

@Repository
public class EventDaoImpl extends KdaAbstractMapper implements EventDao{
	private Log log = LogFactory.getLog(EventDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;

	@Override
	public EventView selectMyEventview(String code_pers) throws PersistenceException {
		
		/*Map paramMap = new HashMap();
		paramMap.put("code_pers", code_pers);
		
		System.out.println("selectMyEventview  -11111111111111111>");
		System.out.println("code_pers  -11111111111111111>"+code_pers);
		*/
		
		EventView eventview = (EventView)super.selectOne(sqlSessionFactory4, "event.selectMyEventview", code_pers );
		
		System.out.println("selectMyEventview  --22222222222222222>"+eventview);
		
		return eventview;
	}
	
 	
	public int eventinsert(EventView row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory4.openSession();
	
		int result = 0;
		try{
			System.out.println("insertONEPLUSEVENT  ----------------------------------------> ok");
			result = session.insert("insertONEPLUSEVENT", row);
			log.info("row+++++++++++++++++++++++++ "+ row);
			
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
	
		return result;
	}	
	
	public int eventinsert_sns(EventView row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory4.openSession();
	
		int result = 0;
		try{
			System.out.println("insertSNS  ----------------------------------------> ok");
			result = session.insert("insertSNSEVENT", row);
			log.info("row+++++++++++++++++++++++++ "+ row);
			
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
	
		return result;
	}	
	
/*	@Override
	public List<Map> selectMyCerifiList(String code_pers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("code_pers", code_pers);
		
		List<Map> cerifiList = selectList(sqlSessionFactory2, "mypage.selectMyCertiList", paramMap );
		
		return cerifiList;
	}*/
	
	
}
