package kda.admin.hunt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.hunt.data.JOBHUNT;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminHuntService")
public class AdminHuntServiceImpl implements AdminHuntService{
	
	@Autowired
	AdminHuntDao adminHuntDao;
	
	@Override
	public LIST_HELPER getHuntListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminHuntDao.selectHuntListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getOfferListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminHuntDao.selectOfferListHelper(listHelper);
	}
	
	@Override
	public JOBHUNT getFileUrl(int idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("eindex", idx);
		return adminHuntDao.getFileUrl(map);
	}
	
	@Override
	public List<Map<String, Object>> excelHunt()
			throws Exception {
		return adminHuntDao.excelHunt();
	}
	
	@Override
	public List<Map<String, Object>> excelOffer()
			throws Exception {
		return adminHuntDao.excelOffer();
	}

}
