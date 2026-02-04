package kda.admin.contest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.contest.data.SCIENCEMEETINGDELLIST;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminContestService")
public class AdminContestServiceImpl implements AdminContestService{
	
	@Autowired
	AdminContestDao adminContestDao;
	
	@Override
	public LIST_HELPER getContestListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminContestDao.selectContestListHelper(listHelper);
	}
	
	@Override
	public SCIENCEMEETINGACTIVE getContest(String idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		return adminContestDao.getContest(map);
	}
	
	@Override
	public void deleteContest(List<String> idxList)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idxList", idxList);
		adminContestDao.deleteContest(map);
	}
	
	@Override
	public LIST_HELPER getContestCancelListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminContestDao.selectContestCancelListHelper(listHelper);
	}
	
	@Override
	public SCIENCEMEETINGDELLIST getContestCancel(int idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		return adminContestDao.getContestCancel(map);
	}
	
	@Override
	public void deleteContestCancel(List<Integer> idxList)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idxList", idxList);
		adminContestDao.deleteContestCancel(map);
	}
	
	@Override
	public void updateContestCancel(int idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		adminContestDao.updateContestCancel(map);
	}
	
	@Override
	public List<Map<String, Object>> excelContest()
			throws Exception {
		return adminContestDao.excelContest();
	}
	
	@Override
	public List<Map<String, Object>> excelContestCancel()
			throws Exception {
		return adminContestDao.excelContestCancel();
	}
	
}
