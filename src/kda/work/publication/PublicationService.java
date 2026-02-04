package kda.work.publication;

import java.util.HashMap;
import java.util.List;

import kda.common.data.LIST_HELPER;
import kda.common.data.TBL_ORDER_LIST;
import kda.work.publication.data.KDA_COLUMN;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

public interface PublicationService 
{
	int insert_monitor(TBL_NUTRITIONMONITOR row) throws Exception;
	int insert_nutservey(TBL_NUTRITIONMONITOR row) throws Exception; // 20151022 영양사협회_국민영양12월호설문요청 추가
	int select_memberPoint(String code_pers) throws Exception;
	int update_memberPoint(int point, String code_pers) throws Exception;
	int insert_buyaddress(PTB_BUYADDRESS row) throws Exception;
	int getMaxBindex() throws Exception;
	int insert_buygoods(int bindex, String ctsessionid) throws Exception;
	PTB_BUYADDRESS select_buyaddress(int bindex) throws Exception;
	int insert_order_list(TBL_ORDER_LIST row ) throws Exception;
	
	/** Magazine */
	public LIST_HELPER getKdaColumnListHelper(LIST_HELPER listHelper) throws Exception;
	public KDA_COLUMN getKdaColumn(int idx) throws Exception;
	public void insertKdaColumn(KDA_COLUMN kdaColumn) throws Exception;
	public void updateKdaColumn(KDA_COLUMN kdaColumn) throws Exception;
	public void deleteColumn(int idx) throws Exception;
	
	public LIST_HELPER getEbookColumnListHelper(LIST_HELPER listHelper) throws Exception;
	public KDA_COLUMN getEbookColumn(int idx) throws Exception;
	public void insertEbookColumn(KDA_COLUMN kdaColumn) throws Exception;
	public void updateEbookColumn(KDA_COLUMN kdaColumn) throws Exception;
	public void deleteEbookColumn(int idx) throws Exception;
	
	 
}
