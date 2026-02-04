package kda.work.research.login;

import java.util.HashMap;

import kda.work.research.report.data.ACTULPERSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RloginDaoImpl implements RloginDao {
	
	private Log log = LogFactory.getLog(RloginDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Override
	public ACTULPERSON passwdCk(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		ACTULPERSON vo = null;

		try {

			vo = session.selectOne("passwdCk", map);
			
			if(vo!=null){
				if("Y".equals(vo.getPwchk())){
					
				}				
			}

		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return vo;

	}
	
	@Override
	public int insertHistory(HashMap<String, Object> map) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int bbs_idx = 0;
		try{
			bbs_idx = session.insert("insertHistory", map);
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
		
		return bbs_idx;
	}
	
	@Override
	public int loginHistory(HashMap<String, Object> map) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int bbs_idx = 0;
		try{
			bbs_idx = session.update("loginHistory", map);
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
		
		return bbs_idx;
	}
	
	@Override
	public int logoutHistory(HashMap<String, Object> map) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int bbs_idx = 0;
		try{
			bbs_idx = session.update("logoutHistory", map);
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
		
		return bbs_idx;
	}
	
	@Override
	public int isUser(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		int cnt = 0;

		try {
			cnt = (Integer) session.selectOne("isUser", map);
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		return cnt;
	}
	

}
