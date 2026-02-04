package kda.admin.discuss;

import java.util.HashMap;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kda.admin.discuss.data.PTBDEBATE;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

@Repository("adminDiscussDao")
public class AdminDiscussDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	public LIST_HELPER selectDiscussListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminDiscuss.selectDiscussCount", "adminDiscuss.selectDiscussListHelper", listHelper);
	}
	
	public PTBDEBATE getDiscuss(HashMap<String, Object> map)
			throws PersistenceException {
		return (PTBDEBATE) selectOne(sqlSessionFactory1, "adminDiscuss.getDiscuss", map);
	}
	
	public void insertDiscuss(HashMap<String, Object> map)
			throws PersistenceException {
		insert(sqlSessionFactory1, "adminDiscuss.insertDiscuss", map);
	}
	
	public void updateDiscuss(HashMap<String, Object> map)
			throws PersistenceException {
		update(sqlSessionFactory1, "adminDiscuss.updateDiscuss", map);
	}
	
	public void deleteDiscuss(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory1, "adminDiscuss.deleteDiscuss", map);
	}
	

}
