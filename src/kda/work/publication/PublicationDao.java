package kda.work.publication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.publication.data.TBL_NUTRITIONMONITOR;
import kda.work.publication.payment.data.PTB_BUYADDRESS;
import kda.common.data.TBL_ORDER_LIST;

public interface PublicationDao
{
	int insert_monitor(TBL_NUTRITIONMONITOR row) throws PersistenceException;
	int insert_nutservey(TBL_NUTRITIONMONITOR row) throws PersistenceException; // 20151022 영양사협회_국민영양12월호설문요청 추가
	int select_memberPoint(String code_pers) throws PersistenceException; 
	int insert_buyaddress(PTB_BUYADDRESS row) throws PersistenceException;
	int getMaxBindex() throws PersistenceException;
	int insert_buygoods(HashMap<String, Object> paramMap) throws PersistenceException;
	PTB_BUYADDRESS select_buyaddress(HashMap<String, Object> paramMap) throws PersistenceException;
	int update_memberPoint(HashMap<String, Object> paramMap) throws PersistenceException;
	int insert_order_list(TBL_ORDER_LIST row) throws PersistenceException;
}