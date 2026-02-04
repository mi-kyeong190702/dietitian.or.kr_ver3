package kda.admin.payment;

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

public interface AdminPaymentService {
	
	public LIST_HELPER getConfirmListHelper(LIST_HELPER listHelper) throws Exception;
	
	public TBLORDERLIST getConfirm(int o_code) throws Exception;
	
	public void updateConfirm(int o_code,String order_cancel_name, String order_cancel_msg) throws Exception;
	
	public List<PERSON_M_TBL> getMember(String pers_name, String pers_birth) throws Exception;
	
	public PERS_COMPANY getCompany(String code_pers) throws Exception;
	
	public List<DUES_H_TBL> getMoney(String code_pers) throws Exception;
	
	public PTBBUYADDRESS getCard(int bindex) throws Exception;
	
	public List<PTBBUYGOODS> getGoods(int bindex) throws Exception;
	
	public SCIENCEMEETINGACTIVE getTech(String idx) throws Exception;
	
	public LIST_HELPER getUserListHelper(LIST_HELPER listHelper) throws Exception;
	
	public ADMINTBL getUser(int inx) throws Exception;
	
	public List<Map<String, Object>> excelConfirm(TBLORDERLIST vo) throws Exception;
	
}
