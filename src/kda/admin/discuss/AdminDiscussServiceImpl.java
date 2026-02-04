package kda.admin.discuss;

import java.util.HashMap;

import kda.admin.discuss.data.PTBDEBATE;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminDiscussService")
public class AdminDiscussServiceImpl implements AdminDiscussService{
	
	@Autowired
	private AdminDiscussDao adminDiscussDao;
	
	@Override
	public LIST_HELPER getDiscussListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminDiscussDao.selectDiscussListHelper(listHelper);
	}
	
	@Override
	public PTBDEBATE getDiscuss(int bateIndex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bateIndex", bateIndex);
		return adminDiscussDao.getDiscuss(map);
	}
	
	@Override
	public void insertDiscuss(String bateSubject)
				throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bateSubject", bateSubject);
		adminDiscussDao.insertDiscuss(map);
	}
	
	@Override
	public void updateDiscuss(int bateIndex, String bateSubject)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bateIndex", bateIndex);
		map.put("bateSubject", bateSubject);
		adminDiscussDao.updateDiscuss(map);
	}
	
	@Override
	public void deleteDiscuss(int bateIndex)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bateIndex", bateIndex);
		adminDiscussDao.deleteDiscuss(map);
	}
	

}
