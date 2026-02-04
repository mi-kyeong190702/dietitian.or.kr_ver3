package kda.spring.abstr;

import java.util.List;

import kda.common.data.LIST_HELPER;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public abstract class KdaAbstractMapper  {
	
	private Log log = LogFactory.getLog(KdaAbstractMapper.class);

	@SuppressWarnings("rawtypes")
	protected List selectList( SqlSessionFactory sqlSessionFactory, String statement) throws PersistenceException {
		return selectList(sqlSessionFactory, statement, null);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	protected List selectList(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		List list = null;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			list = session.selectList(statement, parameter);
		} catch(PersistenceException pe) {
			//pe.printStackTrace();
			log.info("Exception : " + pe.toString());
			throw pe;
		} finally {
			session.close();
		}
		return list;
	}

	protected LIST_HELPER selectListHelper(SqlSessionFactory sqlSessionFactory, String countQuery, String listQuery, LIST_HELPER listHelper) 
			throws PersistenceException {
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			int totalCount = 0;
			int totalPage = 0;
			
			Object rtnObject =  session.selectOne(countQuery, listHelper.getParamMap());
			try {
				totalCount = Integer.parseInt(rtnObject.toString());
			} catch(Exception e) {
				//e.printStackTrace();
				log.info("Exception : " + e.toString());
				if( session != null ) { 
					session.close();
					session = null;
				}
				throw new PersistenceException( "SELECT COUNT QUERY ERROR : " + countQuery, e);
			} 
			
			listHelper.setTotalCount(totalCount);
			List listObject = session.selectList(listQuery, listHelper.getParamMap());
			listHelper.setList(listObject);
			
			//전체 페이지 구하기
			if(totalCount > 0){
				if ( totalCount % listHelper.getCntPerPage() == 0) {
					totalPage = (int) ( totalCount / listHelper.getCntPerPage());
				} else {
					totalPage = (int) ( totalCount / listHelper.getCntPerPage()) + 1;
				}
			}
			listHelper.setTotalPage(totalPage);			
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
			throw new PersistenceException( "LIST QUERY ERROR : " + listQuery, e);
		}  finally {
			if( session != null ) {
				session.close();
				session = null;
			}
		}
		return listHelper;
	}
	
	protected Object selectOne(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		Object object = null;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			object = session.selectOne(statement, parameter);
		} catch(PersistenceException pe) {
			//pe.printStackTrace();
			log.info("Exception : " + pe.toString());
			throw pe;
		} finally {
			session.close();
		}
		return object;
	}
	
	protected int selectInt(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		int result = 0;
		Object object = null;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			object = session.selectOne(statement, parameter);
		} catch(PersistenceException pe) {
			throw pe;
		} finally {
			session.close();
		}
		
		try {
			result =Integer.parseInt(object.toString());
		} catch(NumberFormatException fe) {
			throw new PersistenceException("not return integer");
		} catch(NullPointerException ne) {
			throw new PersistenceException("return null");
		}
		return result;
	}
	
	protected void insert(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			session.insert(statement, parameter);
		} catch(PersistenceException pe) {
			//pe.printStackTrace();
			log.info("Exception : " + pe.toString());
			throw pe;
		} finally {
			session.close();
		}
	}
	
	protected void update(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			session.insert(statement, parameter);
		} catch(PersistenceException pe) {
			//pe.printStackTrace();
			log.info("Exception : " + pe.toString());
			throw pe;
		} finally {
			session.close();
		}
	}
	
	protected void delete(SqlSessionFactory sqlSessionFactory, String statement, Object parameter) throws PersistenceException {
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			session.delete(statement, parameter);
		} catch(PersistenceException pe) {
			//pe.printStackTrace();
			log.info("Exception : " + pe.toString());
			throw pe;
		} finally {
			session.close();
		}
	}
	
}
