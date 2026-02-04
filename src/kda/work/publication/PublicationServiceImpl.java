package kda.work.publication;

import java.util.HashMap;
import java.util.List;

import kda.common.data.LIST_HELPER;
import kda.common.data.TBL_ORDER_LIST;
import kda.work.publication.data.KDA_COLUMN;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PublicationServiceImpl implements PublicationService {
	
	private Log log = LogFactory.getLog(PublicationServiceImpl.class);

	@Autowired
	PublicationDao dao;
	
	@Autowired
	public KdaColumnDao kdaColumnDao;
	
	public int insert_monitor(TBL_NUTRITIONMONITOR row)  throws Exception
	{
		return dao.insert_monitor(row);
	}
	
// 	20151022 영양사협회_국민영양12월호설문요청 추가	
	public int insert_nutservey(TBL_NUTRITIONMONITOR row)  throws Exception
	{
		return dao.insert_nutservey(row);
	}
	
	
	
	public int select_memberPoint(String code_pers) throws Exception	
	{
		return dao.select_memberPoint(code_pers);
	}

	
	public int update_memberPoint(int point, String code_pers) throws Exception	
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("point", point);
		paramMap.put("code_pers", code_pers);
		
		return dao.update_memberPoint(paramMap);
	}
	
	public int insert_buyaddress(PTB_BUYADDRESS row) throws Exception	
	{
		return dao.insert_buyaddress(row);
	}
	
	public int getMaxBindex() throws Exception	
	{
		return dao.getMaxBindex();
	}
	
	public int insert_buygoods(int bindex, String ctsessionid) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bindex", bindex);
		paramMap.put("ctsessionid", ctsessionid);
		
		return dao.insert_buygoods(paramMap);
	}
	
	public PTB_BUYADDRESS select_buyaddress(int bindex) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bindex", bindex);
		return dao.select_buyaddress(paramMap);
	}
	
	public int insert_order_list(TBL_ORDER_LIST row) throws Exception
	{	
		return dao.insert_order_list(row);
	}

	@Override
	public LIST_HELPER getKdaColumnListHelper(LIST_HELPER listHelper)
			throws Exception {
		return kdaColumnDao.selectKdaColumnListHelper(listHelper);
	}

	@Override
	public KDA_COLUMN getKdaColumn(int idx) throws Exception {
		
		return kdaColumnDao.selectKdaColumn(idx);
	}

	@Override
	public void insertKdaColumn(KDA_COLUMN kdaColumn) throws Exception {
		kdaColumnDao.insertKdaColumn(kdaColumn);
	}

	@Override
	public void updateKdaColumn(KDA_COLUMN kdaColumn) throws Exception {
		kdaColumnDao.updateKdaColumn(kdaColumn);
		
	}

	@Override
	public void deleteColumn(int idx) throws Exception {
		kdaColumnDao.deleteKdaColumn(idx);
		
	}
	
	/* E-Book 추가 */
	@Override
	public LIST_HELPER getEbookColumnListHelper(LIST_HELPER listHelper)
			throws Exception {
		return kdaColumnDao.selectEbookColumnListHelper(listHelper);
	}
	
	@Override
	public KDA_COLUMN getEbookColumn(int idx) throws Exception {
		
		return kdaColumnDao.selectEbookColumn(idx);
	}

	@Override
	public void insertEbookColumn(KDA_COLUMN kdaColumn) throws Exception {
		kdaColumnDao.insertEbookColumn(kdaColumn);
	}

	@Override
	public void updateEbookColumn(KDA_COLUMN kdaColumn) throws Exception {
		kdaColumnDao.updateEbookColumn(kdaColumn);
		
	}

	@Override
	public void deleteEbookColumn(int idx) throws Exception {
		kdaColumnDao.deleteEbookColumn(idx);
		
	} 
		
}
