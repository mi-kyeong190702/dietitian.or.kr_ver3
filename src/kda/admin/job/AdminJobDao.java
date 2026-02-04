package kda.admin.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminJobDao")
public class AdminJobDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	public LIST_HELPER selectJobListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminJob.selectJobCount", "adminJob.selectJobListHelper", listHelper);
	}
	
	public void deleteJob(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory2, "adminJob.deleteJob", map);
	}
	
	public List<Map<String, Object>> excelJob()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminJob.excelJob");
	}
	

}
