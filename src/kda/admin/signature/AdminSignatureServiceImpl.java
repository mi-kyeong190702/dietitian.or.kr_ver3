package kda.admin.signature;

import java.util.HashMap;

import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminSignatureService")
public class AdminSignatureServiceImpl implements AdminSignatureService {
	
	@Autowired
	AdminSignatureDao adminSignatureDao;
	
	@Override
	public LIST_HELPER getSignatureListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminSignatureDao.selectSignatureListHelper(listHelper);
	}
	
	@Override
	public void deleteSignature(int kn_Code)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("kn_Code", kn_Code);
		adminSignatureDao.deleteSignature(map);
	}

}
