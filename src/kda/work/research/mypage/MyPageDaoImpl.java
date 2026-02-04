package kda.work.research.mypage;

import java.util.HashMap;
import java.util.List;

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
public class MyPageDaoImpl implements MyPageDao {
	
	private Log log = LogFactory.getLog(MyPageDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	
	@Override
	public int	getMyReportCount(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int cnt = 0;
		
		try {
			
			cnt = (Integer) session.selectOne("getMyReportCount", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	@Override
	public List<ACTULSTATUS> getMyReport(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getMyReport", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public int	getMyEduCount(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int cnt = 0;
		
		try {
			
			cnt = (Integer) session.selectOne("getMyEduCount", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	@Override
	public List<ACTULSTATUS> getMyEdu(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULSTATUS> list = null;
		
		try {
			
			list = session.selectList("getMyEdu", map);
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public String passwdFind(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		ACTULPERSON vo = null;
		String result = "fail";

		try {

			vo = session.selectOne("passwdFind", map);
			
			if(vo==null){
				result = "fail";
			}else{
				map.put("pass_wd", vo.getPers_hp());
				session.update("passwdInit", map);
				result ="success";
			}

		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return result;

	}
	
	
	@Override
	public String passwdChange(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULPERSON vo = null;
		String result = "fail";
		
		try {
			
			vo = session.selectOne("passwdChange", map);
			
			if("N".equals(vo.getPwchk())){
				result = "fail";
			}else{
				session.update("passwdInit", map);
				result ="success";
			}
			
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return result;
		
	}
	

}
