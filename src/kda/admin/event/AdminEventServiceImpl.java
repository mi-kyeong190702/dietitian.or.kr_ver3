package kda.admin.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kda.common.data.LIST_HELPER;

@Service("adminEventService")
public class AdminEventServiceImpl implements AdminEventService{
	
	@Autowired
	AdminEventDao adminEventDao;
	
	@Override
	public LIST_HELPER getPlusOneListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminEventDao.selectPlusOneListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getSnsListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminEventDao.selectSnsListHelper(listHelper);
	}
	
	@Override
	public List<Map<String, Object>> excelPlusOne()
			throws Exception {
		return adminEventDao.excelPlusOne();
	}
	
	@Override
	public List<Map<String, Object>> excelSns()
			throws Exception {
		return adminEventDao.excelSns();
	}

}
