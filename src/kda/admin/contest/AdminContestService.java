package kda.admin.contest;

import java.util.List;
import java.util.Map;

import kda.admin.contest.data.SCIENCEMEETINGACTIVE;
import kda.admin.contest.data.SCIENCEMEETINGDELLIST;
import kda.common.data.LIST_HELPER;

public interface AdminContestService {
	
	public LIST_HELPER getContestListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public SCIENCEMEETINGACTIVE getContest(String idx) throws Exception;
	
	public void deleteContest(List<String> idxList) throws Exception;
	
	public LIST_HELPER getContestCancelListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public SCIENCEMEETINGDELLIST getContestCancel(int idx) throws Exception;
	
	public void deleteContestCancel(List<Integer> idxList) throws Exception;
	
	public void updateContestCancel(int idx) throws Exception;
	
	public List<Map<String, Object>> excelContest() throws Exception;
	
	public List<Map<String, Object>> excelContestCancel() throws Exception;
	

}
