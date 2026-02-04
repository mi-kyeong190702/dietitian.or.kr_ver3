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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminPaymentService")
public class AdminPaymentServiceImpl implements AdminPaymentService{
	
	@Autowired
	AdminPaymentDao adminPaymentDao;
	
	
	@Override
	public LIST_HELPER getConfirmListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminPaymentDao.selectConfirmListHelper(listHelper);
	}
	
	@Override
	public TBLORDERLIST getConfirm(int o_code)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("o_code", o_code);
		return adminPaymentDao.getConfirm(map);
	}
	
	@Override
	public void updateConfirm(int o_code,String order_cancel_name, String order_cancel_msg)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("o_code", o_code);
		map.put("order_cancel_name", order_cancel_name);
		map.put("order_cancel_msg", order_cancel_msg);
		adminPaymentDao.updateConfirm(map);
	}
	
	@Override
	public List<PERSON_M_TBL> getMember(String pers_name, String pers_birth)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("pers_birth", pers_birth);
		return adminPaymentDao.getMember(map);
	}
	
	@Override
	public PERS_COMPANY getCompany(String code_pers)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("code_pers", code_pers);
		return adminPaymentDao.getCompany(map);
	}
	
	@Override
	public List<DUES_H_TBL> getMoney(String code_pers)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("code_pers", code_pers);
		return adminPaymentDao.getMoney(map);
	}
	
	@Override
	public PTBBUYADDRESS getCard(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPaymentDao.getCard(map);
	}
	
	@Override
	public List<PTBBUYGOODS> getGoods(int bindex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bindex", bindex);
		return adminPaymentDao.getGoods(map);
	}
	
	@Override
	public SCIENCEMEETINGACTIVE getTech(String idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		return adminPaymentDao.getTech(map);
	}

	@Override
	public LIST_HELPER getUserListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminPaymentDao.selectUserListHelper(listHelper);
	}
	
	@Override
	public ADMINTBL getUser(int inx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("inx", inx);
		return adminPaymentDao.getUser(map);
	}
	
	@Override
	public List<Map<String, Object>> excelConfirm(TBLORDERLIST vo)
			throws Exception {
		return adminPaymentDao.excelConfirm(vo);
	}
	
}
