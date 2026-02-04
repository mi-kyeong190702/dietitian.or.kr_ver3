package kda.admin.fund;

import java.util.HashMap;

import kda.admin.fund.data.TBLFURN;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminFundService")
public class AdminFundServiceImpl implements AdminFundService{
	
	@Autowired
	AdminFundDao adminFundDao;
	
	@Override
	public LIST_HELPER getFundListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminFundDao.selectFundListHelper(listHelper);
	}
	
	@Override
	public TBLFURN getFund(int fund_key)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("fund_key", fund_key);
		return adminFundDao.getFund(map);
	}
	
	@Override
	public LIST_HELPER getFundraisingListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminFundDao.selectFundraisingListHelper(listHelper);
	}
	
	@Override
	public TBLFURN getFundraising(int fund_key)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("fund_key", fund_key);
		return adminFundDao.getFundraising(map);
	}
	
	@Override
	public void deleteFund(int fund_key)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("fund_key", fund_key);
		adminFundDao.deleteFund(map);
	}
	
	@Override
	public void deleteFundraising(int fund_key)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("fund_key", fund_key);
		adminFundDao.deleteFundraising(map);
	}

}
