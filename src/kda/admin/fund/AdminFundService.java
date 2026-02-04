package kda.admin.fund;

import kda.admin.fund.data.TBLFURN;
import kda.common.data.LIST_HELPER;

public interface AdminFundService {
	
	public LIST_HELPER getFundListHelper(LIST_HELPER listHelper) throws Exception;
	
	public TBLFURN getFund(int fund_key) throws Exception;
	
	public LIST_HELPER getFundraisingListHelper(LIST_HELPER listHelper) throws Exception;
	
	public TBLFURN getFundraising(int fund_key) throws Exception;
	
	public void deleteFund(int fund_key) throws Exception;
	
	public void deleteFundraising(int fund_key) throws Exception;

}
