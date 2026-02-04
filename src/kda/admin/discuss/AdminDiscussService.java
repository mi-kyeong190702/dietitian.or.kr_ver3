package kda.admin.discuss;

import kda.admin.discuss.data.PTBDEBATE;
import kda.common.data.LIST_HELPER;

public interface AdminDiscussService {
	
	public LIST_HELPER getDiscussListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public PTBDEBATE getDiscuss(int bateIndex) throws Exception;
	
	public void insertDiscuss(String bateSubject) throws Exception;
	
	public void updateDiscuss(int bateIndex, String bateSubject) throws Exception;
	
	public void deleteDiscuss(int bateIndex) throws Exception;

}
