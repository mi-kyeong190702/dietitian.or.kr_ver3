package kda.login;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.exceptions.PersistenceException;

import kda.login.data.LOGININFO;
import kda.spring.abstr.KdaAbstractMapper;

@Repository
public class LoginDaoImpl extends KdaAbstractMapper implements LoginDao
{
	private Log log = LogFactory.getLog(LoginDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	@Override
	public LOGININFO getUserPassword(HashMap<String,Object> pramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		LOGININFO result = null;
		
		try{
			result = session.selectOne("userPassword", pramMap);
		}catch(Exception e){
			log.debug("error!", e);
			throw e;
		} finally {
			session.close();
		}		
		return result;
	}

	public LOGININFO getUserInfo(HashMap<String,Object> pramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory4.openSession();
		
		LOGININFO result = null; 
		try{
			result = session.selectOne("userInfo", pramMap);
		}catch(Exception e){
			if(log.isDebugEnabled()) {
				log.debug("error!", e);
			}
			throw e;
		} finally {
			session.close();
		}		
		return result;
	}
	
	public int selectPasswdUpateMonth(String codePers) throws PersistenceException {
		return selectInt(sqlSessionFactory2, "member.selectPasswdUpateMonth", codePers);
	}
}
