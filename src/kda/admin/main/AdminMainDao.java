package kda.admin.main;

import java.util.HashMap;
import java.util.Map;

import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminMainDao")
public class AdminMainDao extends KdaAbstractMapper {
	
	private Log log = LogFactory.getLog(AdminMainDao.class);
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory2;
	
	public Map selectUserMaster(String strid, String strpwd) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("strid", strid);
		paramMap.put("strpwd", strpwd);
		return (Map)selectOne(sqlSessionFactory2, "adminUser.selectUserMaster", paramMap);
	}
	
}
