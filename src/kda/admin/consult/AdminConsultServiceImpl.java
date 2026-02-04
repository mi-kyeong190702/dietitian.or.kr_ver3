package kda.admin.consult;

import java.util.HashMap;

import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminConsultService")
public class AdminConsultServiceImpl implements AdminConsultService{
	
	@Autowired
	AdminConsultDao adminConsultDao;
	
	@Override
	public LIST_HELPER getConsultListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminConsultDao.selectConsultListHelper(listHelper);
	}
	
	@Override
	public String insertConsult(String cuserId, String cuserName)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cuserId", cuserId);
		map.put("cuserName", cuserName);
		return adminConsultDao.insertConsult(map);
	}
	
	@Override
	public void deleteConsult(String cuserId)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cuserId", cuserId);
		adminConsultDao.deleteConsult(map);
	}

}
