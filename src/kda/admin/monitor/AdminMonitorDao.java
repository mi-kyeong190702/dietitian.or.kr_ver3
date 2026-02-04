package kda.admin.monitor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kda.admin.monitor.data.TBLNUTRITIONMONITOR;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

@Repository("adminMonitorDao")
public class AdminMonitorDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory3;

	public LIST_HELPER selectMonitorListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminMonitor.selectMonitorCount", "adminMonitor.selectMonitorListHelper", listHelper);
	}
	
	public TBLNUTRITIONMONITOR getMonitor(HashMap<String, Object> map)
			throws PersistenceException {
		return (TBLNUTRITIONMONITOR) selectOne(sqlSessionFactory1, "adminMonitor.getMonitor", map);
	}
	
	public List<Map<String, Object>> excelMonitor(HashMap<String, Object> map)
			throws PersistenceException {
		return selectList(sqlSessionFactory3, "adminMonitor.excelMonitor", map);
	}

}
