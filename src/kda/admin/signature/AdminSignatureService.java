package kda.admin.signature;

import kda.common.data.LIST_HELPER;

public interface AdminSignatureService {
	
	public LIST_HELPER getSignatureListHelper(LIST_HELPER listHelper) throws Exception;
	
	public void deleteSignature(int kn_Code) throws Exception;

}
