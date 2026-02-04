package kda.admin.stat;

import java.util.List;
import java.util.Map;

public interface AdminStatService {

	public List<Map> getStat(String kind, String stDate, String endDate) throws Exception;
	
	public int getTotalStat(String kind, String stDate, String endDate) throws Exception;
	
	public int getTotalBannerStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public List<Map> getBannerStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public int getTotalMemberStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public List<Map> getMemberStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public Map searchMember(String id, String name) throws Exception;
	
	public int getTotalSinmungoStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public List<Map> getSinmungoStat(String kind, String stDate, String endDate, String srch) throws Exception;
	
	public List<Map<String, Object>> excelSinmungo() throws Exception;
}
