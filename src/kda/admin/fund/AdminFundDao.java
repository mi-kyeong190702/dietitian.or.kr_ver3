package kda.admin.fund;

import java.util.HashMap;

import kda.admin.fund.data.TBLFURN;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminFundDao")
public class AdminFundDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	public LIST_HELPER selectFundListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminFund.selectFundCount", "adminFund.selectFundListHelper", listHelper);
	}
	
	public TBLFURN getFund(HashMap<String, Object> map)
			throws PersistenceException {
		return (TBLFURN) selectOne(sqlSessionFactory2, "adminFund.getFund", map);
	}
	
	public LIST_HELPER selectFundraisingListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminFund.selectFundraisingCount", "adminFund.selectFundraisingListHelper", listHelper);
	}
	
	public TBLFURN getFundraising(HashMap<String, Object> map)
			throws PersistenceException {
		return (TBLFURN) selectOne(sqlSessionFactory2, "adminFund.getFundraising", map);
	}
	
	public void deleteFund(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory2, "adminFund.deleteFund", map);
	}
	
	public void deleteFundraising(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory2, "adminFund.deleteFundraising", map);
	}

}
