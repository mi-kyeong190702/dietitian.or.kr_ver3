package kda.admin.event;

import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminEventDao")
public class AdminEventDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	public LIST_HELPER selectPlusOneListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEvent.selectPlusOneCount", "adminEvent.selectPlusOneListHelper", listHelper);
	}
	
	public LIST_HELPER selectSnsListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEvent.selectSnsCount", "adminEvent.selectSnsListHelper", listHelper);
	}
	
	public List<Map<String, Object>> excelPlusOne()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminEvent.excelPlusOne");
	}
	
	public List<Map<String, Object>> excelSns()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminEvent.excelSns");
	}

}
