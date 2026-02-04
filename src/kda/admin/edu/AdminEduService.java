package kda.admin.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.edu.data.EDUGREEN;
import kda.admin.edu.data.ESTABLISHMENT;
import kda.common.data.LIST_HELPER;

public interface AdminEduService {

	
	public LIST_HELPER getEstListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public LIST_HELPER getCertListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public LIST_HELPER getGreenListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public LIST_HELPER getLogListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public ESTABLISHMENT getCertInfo(String pers_name, String lic_no, String code_old) throws Exception;
	
	public void deleteCertInfo(String pers_name, String lic_no, String code_old) throws Exception;
	
	public void insertCertInfo(String pers_name, String lic_no, String pers_birth, String code_new) throws Exception;
	
	public List<ESTABLISHMENT> getPersBirth(String pers_name, String lic_no) throws Exception;
	
	public ESTABLISHMENT getGroupCode(String pers_name, String lic_no) throws Exception;
	
	public void insertNewCert(String pers_name, String lic_no, String pers_birth, String code_new) throws Exception;
	
	public void deleteGreen(List<String> idxList) throws Exception;
	
	public EDUGREEN getFileUrl(String idx) throws Exception;
	
	public List<Map<String, Object>> excelEst() throws Exception;
	
	public List<Map<String, Object>> excelGreen() throws Exception;
	
	public List<Map<String, Object>> excelLog() throws Exception;
	
	public List<Map<String, Object>> setEduList(Map<String, Object> map) throws Exception;
	
	
}
