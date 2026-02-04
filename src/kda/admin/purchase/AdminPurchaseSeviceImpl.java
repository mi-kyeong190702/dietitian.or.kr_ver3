package kda.admin.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.admin.purchase.data.PTBCDBUYADDRESS;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminPurchaseService")
public class AdminPurchaseSeviceImpl implements AdminPurchaseService{
	
	@Autowired
	AdminPurchaseDao adminPurchaseDao;
	
	@Override
	public LIST_HELPER getPurchaseListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminPurchaseDao.selectPurchaseListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getPurchaseCdListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminPurchaseDao.selectPurchaseCdListHelper(listHelper);
	}
	
	@Override
	public PTBBUYADDRESS getPurchase(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPurchaseDao.getPurchase(map);
	}
	
	@Override
	public List<PTBBUYGOODS> getPurchaseGoods(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPurchaseDao.getPurchaseGoods(map);
	}
	
	@Override
	public PTBCDBUYADDRESS getPurchaseCd(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPurchaseDao.getPurchaseCd(map);
	}
	
	@Override
	public List<PTBBUYGOODS> getPurchaseCdGoods(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPurchaseDao.getPurchaseCdGoods(map);
	}
	
	@Override
	public void updatePayment(int bindex, String bpaymentDate, String cd)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		map.put("bpaymentDate", bpaymentDate);
		map.put("cd", cd);
		adminPurchaseDao.updatePayment(map);
	}
	
	@Override
	public boolean deleteBuyAddr(int bindex, String cd)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		map.put("cd", cd);
		return adminPurchaseDao.deleteBuyAddr(map);
	}

	@Override
	public List<Map<String, Object>> excelPurchase()
			throws Exception {
		return adminPurchaseDao.excelPurchase();
	} 

	@Override
	public PTBBUYADDRESS selectpublishingLogin(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return  adminPurchaseDao.selectpublishingLogin(map);
	}

	@Override
	public List<Map<String, Object>> selectpublishingList(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return  adminPurchaseDao.selectpublishingList(map);
	}

	@Override
	public int selectpublishingCnt(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return adminPurchaseDao.selectpublishingCnt(map);
	}

	@Override
	public List<Map<String, Object>> selectpublishingbook(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return adminPurchaseDao.selectpublishingbook(map);
	}
	
	
}
