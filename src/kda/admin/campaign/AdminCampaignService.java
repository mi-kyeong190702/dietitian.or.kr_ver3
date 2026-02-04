package kda.admin.campaign;

import java.util.List;
import java.util.Map;

import kda.admin.campaign.data.CAMPAIGN;

public interface AdminCampaignService {
	
	public List<CAMPAIGN> getHandonList(String startm, String endm) throws Exception;
	
	public CAMPAIGN getHandonContent(int bbs_idx) throws Exception;
	
	public CAMPAIGN getHandonUser(String id) throws Exception;
	
	public List<Map<String, Object>> excelHandon(String startm, String endm) throws Exception;
	
}
