package kda.admin.hunt;

import java.util.List;
import java.util.Map;

import kda.admin.hunt.data.JOBHUNT;
import kda.common.data.LIST_HELPER;

public interface AdminHuntService {
	
	public LIST_HELPER getHuntListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public LIST_HELPER getOfferListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public JOBHUNT getFileUrl(int idx) throws Exception;
	
	public List<Map<String, Object>> excelHunt() throws Exception;
	
	public List<Map<String, Object>> excelOffer() throws Exception;

}
