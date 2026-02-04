package kda.admin.monitor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.monitor.data.TBLNUTRITIONMONITOR;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminMonitorService")
public class AdminMonitorServiceImpl implements AdminMonitorService{
	
	@Autowired
	private AdminMonitorDao adminMonitorDao;
	
	@Override
	public LIST_HELPER getMonitorListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminMonitorDao.selectMonitorListHelper(listHelper);
	}
	
	@Override
	public TBLNUTRITIONMONITOR getMonitor(String mcode)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mcode", mcode);
		
		return adminMonitorDao.getMonitor(map);
	}
	
	@Override
	public List<Map<String, Object>> excelMonitor(String mcode)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mcode", mcode);
		
		return adminMonitorDao.excelMonitor(map);
	}

}
