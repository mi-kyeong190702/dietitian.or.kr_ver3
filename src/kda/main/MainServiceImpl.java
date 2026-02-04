package kda.main;

import java.util.List;

import kda.common.data.LIST_HELPER;
import kda.main.data.BANNER;
import kda.mypage.data.MYMEMBERINFO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bannerService")
public class MainServiceImpl implements MainService {

	@Autowired
	private BannerDao bannerDao;
	
	@Autowired
	private MainDao mainDao;

	@Override
	public LIST_HELPER getBannerListHelper(LIST_HELPER listHelper)
			throws Exception {
		return bannerDao.selectBannerListHelper(listHelper);
	}
	
	@Override
	public BANNER getBanner(int idx) throws Exception {
		return bannerDao.selectBanner(idx);
	}
	
	@Override
	public void insertBanner(BANNER banner) throws Exception {
		bannerDao.insertBanner(banner);
	}

	@Override
	public void updateBanner(BANNER banner) throws Exception {
		bannerDao.updateBanner(banner);
	}
	
	@Override
	public void deleteBanner(int idx) throws Exception {
		bannerDao.deleteBanner(idx);
	}

	@Override
	public List<BANNER> getMainBannerList() throws Exception {
		// TODO Auto-generated method stub
		return bannerDao.selectMainBannerList();
	}

	@Override
	public void saveLog(String date, String time) throws Exception {
		mainDao.saveLog(date, time);
		
	}

	@Override
	public void saveLogBanner(String date, String time, int bannerIdx)
			throws Exception {
		mainDao.saveLogBanner(date, time, bannerIdx);
		
	}

	@Override
	public void saveLogMember(String code_pers, String pers_name, String date,
			String time, String page_title) throws Exception {
		mainDao.saveLogMember(code_pers, pers_name, date, time, page_title);
	}
	
	@Override
	public MYMEMBERINFO getSend_edu(String id, String gubun) throws Exception {
		return mainDao.getSend_edu(id, gubun);
	}


}
