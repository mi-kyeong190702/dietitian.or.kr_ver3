package kda.admin.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.admin.purchase.data.PTBCDBUYADDRESS;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository("adminPurchaseDao")
public class AdminPurchaseDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory3;
	
	@Autowired
	private DataSourceTransactionManager transactionManager1;
	
	public LIST_HELPER selectPurchaseListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory3, "adminPurchase.selectPurchaseCount", "adminPurchase.selectPurchaseListHelper", listHelper);
	}
	
	public LIST_HELPER selectPurchaseCdListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory3, "adminPurchase.selectPurchaseCdCount", "adminPurchase.selectPurchaseCdListHelper", listHelper);
	}
	
	public PTBBUYADDRESS getPurchase(HashMap<String, Object> map)
			throws PersistenceException {
		return (PTBBUYADDRESS) selectOne(sqlSessionFactory3, "adminPurchase.getPurchase", map);
	}
	
	public List<PTBBUYGOODS> getPurchaseGoods(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<PTBBUYGOODS>) selectList(sqlSessionFactory3, "adminPurchase.getPurchaseGoods", map);
	}
	
	public PTBCDBUYADDRESS getPurchaseCd(HashMap<String, Object> map)
			throws PersistenceException {
		return (PTBCDBUYADDRESS) selectOne(sqlSessionFactory3, "adminPurchase.getPurchaseCd", map);
	}
	
	public List<PTBBUYGOODS> getPurchaseCdGoods(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<PTBBUYGOODS>) selectList(sqlSessionFactory3, "adminPurchase.getPurchaseCdGoods", map);
	}
	
	public void updatePayment(HashMap<String, Object> map)
			throws PersistenceException {
		String cd = (String) map.get("cd");
		String name ="";
		if("groud".equals(cd)) name = "adminPurchase.updatePaymentCd";
		else name = "adminPurchase.updatePayment";
		
		update(sqlSessionFactory3, name, map);
	}
	
	public boolean deleteBuyAddr(HashMap<String, Object> map)
			throws PersistenceException {
		
		boolean result = false;
		String cd = (String) map.get("cd");
		String name ="";
		
		// transaction 
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("insert_comments_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager1.getTransaction(def);
		try {
			
		if("groud".equals(cd)) name = "adminPurchase.deleteBuyAddrCd";
		else name = "adminPurchase.deleteBuyAddr";
		
		delete(sqlSessionFactory3, name, map);
		delete(sqlSessionFactory3, "adminPurchase.deleteBuyGoods", map);
		
		transactionManager1.commit(status);
		result = true;
		
		} catch (PersistenceException e) {
			transactionManager1.rollback(status);
		} catch(Exception e) {
			throw e;
		}
		
		return result;
	}

	public List<Map<String, Object>> excelPurchase()
			throws Exception {
		return selectList(sqlSessionFactory3, "adminPurchase.excelPurchase");
	}
	 
	public PTBBUYADDRESS selectpublishingLogin(HashMap<String, Object> map)
			throws PersistenceException {
		return (PTBBUYADDRESS) selectOne(sqlSessionFactory3, "adminPurchase.selectpublishingLogin", map);
	}
	
	public List<Map<String, Object>> selectpublishingList(HashMap<String, Object> map)
			throws PersistenceException {
		return selectList(sqlSessionFactory3, "adminPurchase.selectpublishingList", map);
	}
	
	public int selectpublishingCnt(HashMap<String, Object> map)
			throws PersistenceException {
		return (int) selectOne(sqlSessionFactory3, "adminPurchase.selectpublishingCnt", map);
	}
	
	public List<Map<String, Object>> selectpublishingbook(HashMap<String, Object> map)
			throws PersistenceException {
		return selectList(sqlSessionFactory3, "adminPurchase.selectpublishingbook", map);
	}
}
