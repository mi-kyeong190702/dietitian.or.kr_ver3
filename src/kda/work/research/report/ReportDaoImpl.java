package kda.work.research.report;

import java.util.HashMap;
import java.util.List;

import kda.work.research.recipient.data.ACTULSUBJECTS;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReportDaoImpl implements ReportDao {
	
	private Log log = LogFactory.getLog(ReportDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Override
	public ACTULPERSON getReportUser(HashMap<String, Object> map) throws PersistenceException{

		SqlSession session = sqlSessionFactory2.openSession();

		ACTULPERSON vo = null;

		try {
			
			vo = session.selectOne("getReportUser", map);
		
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return vo;

	}
	
	@Override
	public ACTULSTATUS getReportState(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getReportState", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public ACTULSTATUS getReportState2013(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getReportState2013", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public ACTULSTATUS getReportState2015(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getReportState2015", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public List<ACTULSTATUS> getReportEdu(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getReportEdu", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public ACTULSTATUS getReportHistory(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getReportHistory", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public ACTULSTATUS getReportHistory2(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getReportHistory2", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public void passwdInsert(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("passwdInsert", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public ACTULPERSON getInfo(HashMap<String, Object> map) throws PersistenceException{

		SqlSession session = sqlSessionFactory2.openSession();

		ACTULPERSON vo = null;

		try {
			
			vo = session.selectOne("getInfo", map);
		
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return vo;

	}
	
	@Override
	public ACTULSTATUS getDate(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULSTATUS vo = null;
		
		try {
			
			vo = session.selectOne("getDate", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public List<ACTULSTATUS> getRecent(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getRecent", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public List<ACTULSTATUS> getRecentYear(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getRecentYear", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public void personUpt(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("personUpt", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public void statusUpt(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("statusUpt", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public void statusUpt1(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("statusUpt1", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}	
	
	@Override
	public void fileUpt(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("fileUpt", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public void personCancel(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("personCancel", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public void statusCancel(ACTULSTATUS actulstatus) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("statusCancel", actulstatus);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public List<ACTULSTATUS> getEmail(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getEmail", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public HashMap<String, Object> getReportState_chk(HashMap<String, Object> map) throws PersistenceException{

		SqlSession session = sqlSessionFactory2.openSession();

		HashMap<String, Object> returnReportState = null;

		try {
			
			returnReportState = session.selectOne("ReportState_chk", map);
		
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return returnReportState;

	}
	
	@Override
	public void personInfoUpt(ACTULPERSON actulperson) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			
			session.update("personInfoUpt", actulperson);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	@Override
	public List<ACTULSUBJECTS> getRecipientEduList(HashMap<String, Object> map) throws PersistenceException{
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSUBJECTS> list = null;
		
		try {
			
			list = session.selectList("getRecipientEduList", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
		
	}

}
