package kda.admin.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.payment.data.ADMINTBL;
import kda.admin.payment.data.TBLORDERLIST;
import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.common.data.LIST_HELPER;
import kda.member.data.DUES_H_TBL;
import kda.member.data.PERSON_M_TBL;
import kda.member.data.PERS_COMPANY;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminPaymentDao")
public class AdminPaymentDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	
	public LIST_HELPER selectConfirmListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminPayment.selectConfirmCount", "adminPayment.selectConfirmListHelper", listHelper);
	}
	
	public TBLORDERLIST getConfirm(HashMap<String, Object> map)
			throws PersistenceException {
		return (TBLORDERLIST) selectOne(sqlSessionFactory2, "adminPayment.getConfirm", map);
	}
	
	public void updateConfirm(HashMap<String, Object> map)
			throws PersistenceException {
		update(sqlSessionFactory2, "adminPayment.updateConfirm", map);
	}
	
	public List<PERSON_M_TBL> getMember(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<PERSON_M_TBL>) selectList(sqlSessionFactory2, "adminPayment.getMember", map);
	}
	
	public PERS_COMPANY getCompany(HashMap<String, Object> map)
			throws PersistenceException {
		return (PERS_COMPANY) selectOne(sqlSessionFactory2, "adminPayment.getCompany", map);
	}
	
	public List<DUES_H_TBL> getMoney(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<DUES_H_TBL>) selectList(sqlSessionFactory2, "adminPayment.getMoney", map);
	}
	
	public PTBBUYADDRESS getCard(HashMap<String, Object> map)
			throws PersistenceException {
		return (PTBBUYADDRESS) selectOne(sqlSessionFactory1, "adminPayment.getCard", map); 
	}
	
	public List<PTBBUYGOODS> getGoods(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<PTBBUYGOODS>) selectList(sqlSessionFactory1, "adminPayment.getGoods", map); 
	}
	
	public SCIENCEMEETINGACTIVE getTech(HashMap<String, Object> map)
			throws PersistenceException {
		return (SCIENCEMEETINGACTIVE) selectOne(sqlSessionFactory2, "adminPayment.getTech", map); 
	}
	
	public LIST_HELPER selectUserListHelper(LIST_HELPER listHelper)
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminPayment.selectPaymentUserCount", "adminPayment.selectPaymentUserListHelper", listHelper); 
	}
	
	public ADMINTBL getUser(HashMap<String, Object> map)
			throws PersistenceException {
		return (ADMINTBL) selectOne(sqlSessionFactory2, "adminPayment.getUser", map); 
	}
	
	public List<Map<String, Object>> excelConfirm(TBLORDERLIST vo)
			throws Exception {
		return selectList(sqlSessionFactory4, "adminPayment.excelConfirm",vo);
	}
	
}
