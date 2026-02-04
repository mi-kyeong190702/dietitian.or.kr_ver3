package kda.admin.schedule;

import java.util.HashMap;
import java.util.List;

import kda.admin.schedule.data.SCHEDULEX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminScheduleService")
public class AdminScheduleServiceImpl implements AdminScheduleService{
	
	@Autowired
	AdminScheduleDao adminScheduleDao;
	
	@Override
	public List<SCHEDULEX> getScheduleList(String yy, String mm) 
			throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("yy", yy);
		map.put("mm", mm);
		
		return adminScheduleDao.getScheduleList(map);
	}
	
	@Override
	public SCHEDULEX getSchedule(int num) 
			throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		
		return adminScheduleDao.getSchedule(map);
	}
	
	@Override
	public void insertSchedule(SCHEDULEX vo)
			throws Exception{
		adminScheduleDao.insertSchedule(vo);
	}
	
	@Override
	public void updateSchedule(SCHEDULEX vo)
			throws Exception{
		adminScheduleDao.updateSchedule(vo);
	}
	
	@Override
	public void deleteSchedule(int num)
			throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		
		adminScheduleDao.deleteSchedule(map);
	}

}
