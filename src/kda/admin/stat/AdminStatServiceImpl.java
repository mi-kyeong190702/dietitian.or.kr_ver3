package kda.admin.stat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminStatService")
public class AdminStatServiceImpl implements AdminStatService {

	@Resource(name="adminStatDao")
	private AdminStatDao adminStatDao;
	
	@Override
	public List<Map> getStat(String kind, String stDate, String endDate)
			throws Exception {
		return adminStatDao.selectLogList(kind, stDate, endDate);
	}

	@Override
	public int getTotalStat(String kind, String stDate, String endDate)
			throws Exception {
		
		return adminStatDao.selectSumLog(kind, stDate, endDate);
	}

	@Override
	public int getTotalBannerStat(String kind, String stDate, String endDate, String srch)
			throws Exception {
		return adminStatDao.selectSumBannerLog(kind, stDate, endDate, srch);
	}

	@Override
	public List<Map> getBannerStat(String kind, String stDate, String endDate, String srch)
			throws Exception {
		
		return adminStatDao.selectBannerLogList(kind, stDate, endDate, srch);
	}

	@Override
	public int getTotalMemberStat(String kind, String stDate, String endDate,
			String srch) throws Exception {
	
		return adminStatDao.selectSumMemberLog(kind, stDate, endDate, srch);
	}

	@Override
	public List<Map> getMemberStat(String kind, String stDate, String endDate,
			String srch) throws Exception {
		// TODO Auto-generated method stub
		return adminStatDao.selectMemberLogList(kind, stDate, endDate, srch);
	}

	@Override
	public Map searchMember(String id, String name) throws Exception {
		
		return adminStatDao.selectSearchMember(id, name);
	}
	
	@Override
	public int getTotalSinmungoStat(String kind, String stDate, String endDate,
			String srch) throws Exception {
	
		return adminStatDao.selectSumSinmungoLog(kind, stDate, endDate, srch);
	}

	@Override
	public List<Map> getSinmungoStat(String kind, String stDate, String endDate,
			String srch) throws Exception {
		// TODO Auto-generated method stub
		return adminStatDao.selectSinmungoLogList(kind, stDate, endDate, srch);
	}
	
	@Override
	public List<Map<String, Object>> excelSinmungo() throws Exception {
		return adminStatDao.excelSinmungo();
	}
}
