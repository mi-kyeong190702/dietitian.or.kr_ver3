package kda.admin.monitor;

import java.util.List;
import java.util.Map;

import kda.admin.monitor.data.TBLNUTRITIONMONITOR;
import kda.common.data.LIST_HELPER;

public interface AdminMonitorService {
	
	public LIST_HELPER getMonitorListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public TBLNUTRITIONMONITOR getMonitor(String mcode) throws Exception;
	
	public List<Map<String, Object>> excelMonitor(String mcode) throws Exception;

}
