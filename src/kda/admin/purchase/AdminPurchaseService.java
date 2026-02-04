package kda.admin.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.purchase.data.PTBBUYADDRESS;
import kda.admin.purchase.data.PTBBUYGOODS;
import kda.admin.purchase.data.PTBCDBUYADDRESS;
import kda.common.data.LIST_HELPER;

public interface AdminPurchaseService {
	
	public LIST_HELPER getPurchaseListHelper(LIST_HELPER listHelper) throws Exception;
	
	public LIST_HELPER getPurchaseCdListHelper(LIST_HELPER listHelper) throws Exception;
	
	public PTBBUYADDRESS getPurchase(int bindex) throws Exception;
	
	public List<PTBBUYGOODS> getPurchaseGoods(int bindex) throws Exception;
	
	public PTBCDBUYADDRESS getPurchaseCd(int bindex) throws Exception;
	
	public List<PTBBUYGOODS> getPurchaseCdGoods(int bindex) throws Exception;
	
	public void updatePayment(int bindex, String bpaymentDate, String cd) throws Exception;
	
	public boolean deleteBuyAddr(int bindex, String cd) throws Exception;
	
	public List<Map<String, Object>> excelPurchase() throws Exception;
	
	public PTBBUYADDRESS selectpublishingLogin(HashMap map) throws Exception; 
	
	public List<Map<String, Object>> selectpublishingList(HashMap map) throws Exception; 
	
	public int selectpublishingCnt(HashMap map) throws Exception;
	
	public List<Map<String, Object>> selectpublishingbook(HashMap map) throws Exception; 
	
	
}
