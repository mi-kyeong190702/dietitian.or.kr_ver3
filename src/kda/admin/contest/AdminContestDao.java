package kda.admin.contest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.contest.data.SCIENCEMEETINGDELLIST;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminContestDao")
public class AdminContestDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	public LIST_HELPER selectContestListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory4, "adminContest.selectContestCount", "adminContest.selectContestListHelper", listHelper);
	}
	
	public SCIENCEMEETINGACTIVE getContest(HashMap<String, Object> map)
			throws PersistenceException {
		return (SCIENCEMEETINGACTIVE) selectOne(sqlSessionFactory4, "adminContest.getContest", map);
	}
	
	public void deleteContest(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory4, "adminContest.deleteContest", map);
	}
	
	public LIST_HELPER selectContestCancelListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory4, "adminContest.selectContestCancelCount", "adminContest.selectContestCancelListHelper", listHelper);
	}
	
	public SCIENCEMEETINGDELLIST getContestCancel(HashMap<String, Object> map)
			throws PersistenceException {
		return (SCIENCEMEETINGDELLIST) selectOne(sqlSessionFactory4, "adminContest.getContestCancel", map);
	}
	
	public void deleteContestCancel(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory4, "adminContest.deleteContestCancel", map);
	}
	
	public void updateContestCancel(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory4, "adminContest.updateContestCancel", map);
	}
	
	public List<Map<String, Object>> excelContest()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminContest.excelContest");
	}
	
	public List<Map<String, Object>> excelContestCancel()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminContest.excelContestCancel");
	}
	
}
