package kda.admin.schedule;

import java.util.List;

import kda.admin.schedule.data.SCHEDULEX;

public interface AdminScheduleService {
	
	public List<SCHEDULEX> getScheduleList(String yy, String mm) throws Exception;
	
	public SCHEDULEX getSchedule(int num) throws Exception;
	
	public void insertSchedule(SCHEDULEX vo) throws Exception;
	
	public void updateSchedule(SCHEDULEX vo) throws Exception;
	
	public void deleteSchedule(int num) throws Exception;

}
