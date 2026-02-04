package kda.work.publication;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.exceptions.PersistenceException;

import kda.common.data.TBL_ORDER_LIST;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;
import kda.work.publication.payment.data.PTB_BUYADDRESS;
import kda.work.research.community.data.ACTULPAPERBOARD;

@Repository
public class PublicationDaoImpl implements PublicationDao 
{
	private Log log = LogFactory.getLog(PublicationDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory3;
	

	public int insert_monitor(TBL_NUTRITIONMONITOR row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int result = 0;
		try{
			
			row.setMCode(session.selectOne("getMemCode").toString());
			
			if(row.getMCode() != null){
				
				result = session.insert("insertTBL_NUTRITIONMONITOR", row);
				log.info("row+++++++++++++++++++++++++ "+ row);
				if (result > 0) {
					
					result = session.insert("insertTBL_NUTRITIONMONITOR_DETAIL", row);
				}else return 0;
				
			}else return 0;
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return result;
	}
	
	
	// 20151022 영양사협회_국민영양12월호설문요청 추가	
	public int insert_nutservey(TBL_NUTRITIONMONITOR row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
	
		int result = 0;
		try{
			result = session.insert("insertTBL_NUTSERVEY", row);
			log.info("row+++++++++++++++++++++++++ "+ row);
			
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			
			log.info("commit+++++++++++++++++++++++++ "+ row);
			
			session.commit();
			session.close();
		}
	
		return result;
	}
	
	
	public int select_memberPoint(String code_pers) throws PersistenceException
	{

		SqlSession session = sqlSessionFactory2.openSession();
		
		int point = 0;	
		try{
			point = session.selectOne("kp_point_select", code_pers);
		} catch(Exception e) {
			log.debug("getMemberPoint error!", e);
			throw e;
		} finally {
			session.close();
		}
		return point;
	}
	
	public int update_memberPoint(HashMap<String, Object> paramMap) throws PersistenceException
	{

		SqlSession session = sqlSessionFactory2.openSession();
		
		int result = 0;	
		try{
			result = session.update("kp_point_select", paramMap);
		} catch(Exception e) {
			log.debug("getMemberPoint error!", e);
			throw e;
		} finally {
			session.close();
		}
		return result;
	}
	
	public int insert_buyaddress(PTB_BUYADDRESS row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int result = 0;
		try{
			
			result = session.insert("insert_buyaddress", row);
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return result;
	}
	
	public int getMaxBindex() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int bIndex = 0;
		try{
			
			bIndex = session.selectOne("getMaxBindex");
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return bIndex;
	}
	
	public int insert_buygoods(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int result = 0;
		try{
			result = session.insert("insert_buygoods", paramMap);
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return result;
	}
	
	public PTB_BUYADDRESS select_buyaddress(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();

		PTB_BUYADDRESS buyaddress = null;	
		try{
			buyaddress = session.selectOne("select_buyaddress",paramMap);
		} catch(Exception e) {
			log.debug("select_buyaddress error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return buyaddress;
	}
	
	public int insert_order_list(TBL_ORDER_LIST row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int result = 0;
		try{
			
			result = session.insert("insert_order_list", row);
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return result;
	}
	
}
