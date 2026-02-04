package kda.admin.hunt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.hunt.data.JOBHUNT;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminHuntDao")
public class AdminHuntDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory3;
	
	public LIST_HELPER selectHuntListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminHunt.selectHuntCount", "adminHunt.selectHuntListHelper", listHelper);
	}	
	
	public LIST_HELPER selectOfferListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminHunt.selectOfferCount", "adminHunt.selectOfferListHelper", listHelper);
	}	
	
	public JOBHUNT getFileUrl(HashMap<String, Object> map)
			throws PersistenceException {
		return (JOBHUNT) selectOne(sqlSessionFactory1, "adminHunt.getFileUrl", map);
	}
	
	public List<Map<String, Object>> excelHunt()
			throws Exception {
		return selectList(sqlSessionFactory3, "adminHunt.excelHunt");
	}
	
	public List<Map<String, Object>> excelOffer()
			throws Exception {
		return selectList(sqlSessionFactory3, "adminHunt.excelOffer");
	}

}
