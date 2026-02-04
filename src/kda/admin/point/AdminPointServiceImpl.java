package kda.admin.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.point.data.IDTBL;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminPointService")
public class AdminPointServiceImpl implements AdminPointService{
	
	@Autowired
	AdminPointDao adminPointDao;
	
	
	@Override
	public List<IDTBL> selectTopPoint()
			throws Exception {
		return adminPointDao.selectTopPoint();
	}
	
	@Override
	public LIST_HELPER getPointListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminPointDao.selectPointListHelper(listHelper);
	}
	
	@Override
	public void updatePoint(int point, String id)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("point", point);
		map.put("id", id);
		adminPointDao.updatePoint(map);
	}
	
	@Override
	public List<Map<String, Object>> excelTopPoint()
			throws Exception {
		return adminPointDao.excelTopPoint();
	}
	
}
