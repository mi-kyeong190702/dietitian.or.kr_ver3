package kda.admin.schedule;

import java.util.HashMap;
import java.util.List;

import kda.admin.schedule.data.SCHEDULEX;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminScheduleDao")
public class AdminScheduleDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	public List<SCHEDULEX> getScheduleList(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<SCHEDULEX>) selectList(sqlSessionFactory1, "adminSchedule.getScheduleList", map);
	}
	
	public SCHEDULEX getSchedule(HashMap<String, Object> map)
			throws PersistenceException {
		return (SCHEDULEX) selectOne(sqlSessionFactory1, "adminSchedule.getSchedule", map);
	}
	
	public void insertSchedule(SCHEDULEX vo)
			throws PersistenceException {
		insert(sqlSessionFactory1, "adminSchedule.insertSchedule", vo);
	}
	
	public void updateSchedule(SCHEDULEX vo)
			throws PersistenceException {
		update(sqlSessionFactory1, "adminSchedule.updateSchedule", vo);
	}
	
	public void deleteSchedule(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory1, "adminSchedule.deleteSchedule", map);
	}

}
