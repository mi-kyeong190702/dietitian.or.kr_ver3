package kda.admin.campaign;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.campaign.data.CAMPAIGN;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminCampaignService")
public class AdminCampaignServiceImpl implements AdminCampaignService{
	
	@Autowired
	AdminCampaignDao adminCampaignDao;
	
	@Override
	public List<CAMPAIGN> getHandonList(String startm, String endm)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startm", startm);
		map.put("endm", endm);
		return adminCampaignDao.getHandonList(map);
	}
	
	@Override
	public CAMPAIGN getHandonContent(int bbs_idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bbs_idx", bbs_idx);
		return adminCampaignDao.getHandonContent(map);
	}
	
	@Override
	public CAMPAIGN getHandonUser(String id)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		return adminCampaignDao.getHandonUser(map);
	}
	
	@Override
	public List<Map<String, Object>> excelHandon(String startm, String endm)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startm", startm);
		map.put("endm", endm);
		return adminCampaignDao.excelHandon(map);
	}
	
}
