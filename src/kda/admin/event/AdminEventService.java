package kda.admin.event;

import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;

public interface AdminEventService {
	
	public LIST_HELPER getPlusOneListHelper(LIST_HELPER listHelper) throws Exception;
	
	public LIST_HELPER getSnsListHelper(LIST_HELPER listHelper) throws Exception;
	
	public List<Map<String, Object>> excelPlusOne() throws Exception;
	
	public List<Map<String, Object>> excelSns() throws Exception;

}
