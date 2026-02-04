package kda.admin.job;

import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;

public interface AdminJobService {
	
	public LIST_HELPER getJobListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public void deleteJob(int tb_idx) throws Exception;
	
	public List<Map<String, Object>> excelJob() throws Exception;

}
