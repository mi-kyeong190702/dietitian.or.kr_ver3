package kda.admin.consult;

import kda.common.data.LIST_HELPER;

public interface AdminConsultService {
	
	public LIST_HELPER getConsultListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public String insertConsult(String cuserId, String cuserName) throws Exception;
	
	public void deleteConsult(String cuserId) throws Exception;

}
