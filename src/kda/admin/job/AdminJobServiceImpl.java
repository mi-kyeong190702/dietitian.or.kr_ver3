package kda.admin.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminJobService")
public class AdminJobServiceImpl implements AdminJobService{
	
	@Autowired
	AdminJobDao adminJobDao;
	
	@Override
	public LIST_HELPER getJobListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminJobDao.selectJobListHelper(listHelper);
	}
	
	@Override
	public void deleteJob(int tb_idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("tb_idx", tb_idx);		
		adminJobDao.deleteJob(map);
	}
	
	@Override
	public List<Map<String, Object>> excelJob()
			throws Exception {
		return adminJobDao.excelJob();
	}

}
