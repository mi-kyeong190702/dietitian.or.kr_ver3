package kda.work.news;

import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.news.data.KN_EMPLOY;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("employDao")
public class EmployDao extends KdaAbstractMapper {

	@Autowired
	private SqlSessionFactory sqlSessionFactory1;
	
	
	
	/**
	 * 구인정보 목록 조회
	 * 
	 * @param listHelper
	 * @return
	 * @throws PersistenceException
	 */
	public LIST_HELPER selectEmployList(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper( sqlSessionFactory1, "kn_employ.selectEmployCount", "kn_employ.selectEmployList", listHelper );
	}
	
	public KN_EMPLOY selectEmploy(int idx) throws PersistenceException {
		KN_EMPLOY employ = (KN_EMPLOY)selectOne(sqlSessionFactory1, "kn_employ.selectEmploy", idx);
		return employ;
	}
	
	public List<Map> selectEmployNavi(Map paramMap) throws PersistenceException {
		update(sqlSessionFactory1, "kn_employ.updateEmployVisit", paramMap);
		return (List<Map>)selectList(sqlSessionFactory1, "kn_employ.selectEmployNavi", paramMap);
	}
	
	public void insertEmploy(KN_EMPLOY employ) throws PersistenceException {
		insert(sqlSessionFactory1, "kn_employ.insertEmploy", employ);
	}
	
	public void updateEmploy(KN_EMPLOY employ) throws PersistenceException {
		update(sqlSessionFactory1, "kn_employ.updateEmploy", employ);
	}
	
	public void deleteEmploy(int eindex) throws PersistenceException {
		delete(sqlSessionFactory1, "kn_employ.deleteEmploy", eindex);
	}
	
	public List<Map> selectEmployComment(int idx) throws PersistenceException {
		return (List<Map>)selectList(sqlSessionFactory1, "kn_employ.selectEmployComment", idx);
	}
	
	public void insertEmployComment(Map cmtMap) throws PersistenceException {
		insert(sqlSessionFactory1, "kn_employ.insertEmployComment", cmtMap);
	}
	
	public void deleteEmployComment(int cIndex) throws PersistenceException {
		delete(sqlSessionFactory1, "kn_employ.deleteEmployComment", cIndex);
	}
	
	public void updateEmployViewCount(int idx) throws PersistenceException {
		update(sqlSessionFactory1, "kn_employ.updateEmployViewCount", idx);
	}
}
