package kda.admin.campaign;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.campaign.data.CAMPAIGN;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminCampaignDao")
public class AdminCampaignDao extends KdaAbstractMapper{

	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;

	
	public List<CAMPAIGN> getHandonList(HashMap<String, Object> map)
			throws PersistenceException {
		return selectList(sqlSessionFactory1, "adminCampaign.getHandonList", map);
	}
	
	public CAMPAIGN getHandonContent(HashMap<String, Object> map)
			throws PersistenceException {
		return (CAMPAIGN) selectOne(sqlSessionFactory1, "adminCampaign.getHandonContent", map);
	}
	
	public CAMPAIGN getHandonUser(HashMap<String, Object> map)
			throws PersistenceException {
		return (CAMPAIGN) selectOne(sqlSessionFactory4, "adminCampaign.getHandonUser", map);
	}
	
	public List<Map<String, Object>> excelHandon(HashMap<String, Object> map)
			throws Exception {
		return selectList(sqlSessionFactory1, "adminCampaign.excelHandon", map);
	}
	
	
}
