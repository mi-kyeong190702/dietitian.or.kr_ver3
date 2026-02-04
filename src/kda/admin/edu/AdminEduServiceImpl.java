package kda.admin.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.edu.data.EDUGREEN;
import kda.admin.edu.data.ESTABLISHMENT;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminEduService")
public class AdminEduServiceImpl implements AdminEduService {

	@Autowired
	private AdminEduDao adminEduDao;

	@Override
	public LIST_HELPER getEstListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminEduDao.selectEstListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getCertListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminEduDao.selectCertListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getGreenListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminEduDao.selectGreenListHelper(listHelper);
	}
	
	@Override
	public LIST_HELPER getLogListHelper(LIST_HELPER listHelper) throws Exception {
 
		return adminEduDao.selectLogListHelper(listHelper);
	}
	
	@Override
	public ESTABLISHMENT getCertInfo(String pers_name, String lic_no, String code_old)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("code_val", code_old);
		
		return adminEduDao.getCertInfo(map);
	}
	
	@Override
	public void deleteCertInfo(String pers_name, String lic_no, String code_old)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("code_val", code_old);
		
		adminEduDao.deleteCertInfo(map);
	}
	
	@Override
	public void insertCertInfo(String pers_name, String lic_no, String pers_birth, String code_new)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("pers_birth", pers_birth);
		map.put("code_val", code_new);
		
		adminEduDao.insertCertInfo(map);
	}
	
	@Override
	public List<ESTABLISHMENT> getPersBirth(String pers_name, String lic_no)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return adminEduDao.getPersBirth(map);
	}
	
	@Override
	public ESTABLISHMENT getGroupCode(String pers_name, String lic_no)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return adminEduDao.getGroupCode(map);
	}
	
	@Override
	public void insertNewCert(String pers_name, String lic_no, String pers_birth, String code_new)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("pers_birth", pers_birth);
		map.put("code_val", code_new);
		
		adminEduDao.insertNewCert(map);
	}
	
	@Override
	public void deleteGreen(List<String> idxList)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idxList", idxList);
		adminEduDao.deleteGreen(map);
	}
	
	@Override
	public EDUGREEN getFileUrl(String idx)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		return adminEduDao.getFileUrl(map);
	}
	
	@Override
	public List<Map<String, Object>> excelEst()
			throws Exception {
		return adminEduDao.excelEst();
	}
	
	@Override
	public List<Map<String, Object>> excelGreen()
			throws Exception {
		return adminEduDao.excelGreen();
	}
	
	@Override
	public List<Map<String, Object>> excelLog()
			throws Exception {
		return adminEduDao.excelLog();
	}

	@Override
	public List<Map<String, Object>> setEduList(Map<String, Object> map) throws Exception {
		return adminEduDao.setEduList(map);
	}   
}
