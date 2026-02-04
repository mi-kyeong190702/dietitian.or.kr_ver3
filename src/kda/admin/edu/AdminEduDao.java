package kda.admin.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.edu.data.EDUGREEN;
import kda.admin.edu.data.ESTABLISHMENT;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminEduDao")
public class AdminEduDao extends KdaAbstractMapper {

	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;

	public LIST_HELPER selectEstListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEdu.selectEstCount", "adminEdu.selectEstListHelper", listHelper);
	}
	
	public LIST_HELPER selectCertListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEdu.selectCertCount", "adminEdu.selectCertListHelper", listHelper);
	}
	
	public LIST_HELPER selectGreenListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEdu.selectGreenCount", "adminEdu.selectGreenListHelper", listHelper);
	}
	
	public LIST_HELPER selectLogListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminEdu.selectLogCount", "adminEdu.selectLogListHelper", listHelper);
	}
	
	public ESTABLISHMENT getCertInfo(HashMap<String, Object> map)
			throws PersistenceException {
		return (ESTABLISHMENT) selectOne(sqlSessionFactory2, "adminEdu.getCertInfo", map);
	}
	
	public void deleteCertInfo(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory2, "adminEdu.deleteCertInfo", map);
	}
	
	public void insertCertInfo(HashMap<String, Object> map)
			throws PersistenceException {
		insert(sqlSessionFactory2, "adminEdu.insertCertInfo", map);
	}
	
	public List<ESTABLISHMENT> getPersBirth(HashMap<String, Object> map)
			throws PersistenceException {
		return (List<ESTABLISHMENT>) selectList(sqlSessionFactory2, "adminEdu.getPersBirth", map);
	}
	
	public ESTABLISHMENT getGroupCode(HashMap<String, Object> map)
			throws PersistenceException {
		return (ESTABLISHMENT) selectOne(sqlSessionFactory2, "adminEdu.getGroupCode", map);
	}
	
	public void insertNewCert(HashMap<String, Object> map)
			throws PersistenceException {
		insert(sqlSessionFactory2, "adminEdu.insertNewCert", map);
	}
	
	public void deleteGreen(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory2, "adminEdu.deleteGreen", map);
	}
	
	public EDUGREEN getFileUrl(HashMap<String, Object> map)
			throws PersistenceException {
		
		EDUGREEN vo = (EDUGREEN) selectOne(sqlSessionFactory2, "adminEdu.getFileUrl", map);
		
		if(vo.getFile_flag()!= null && !"".equals(vo.getFile_flag())){
			update(sqlSessionFactory2, "adminEdu.fileDownYn", map);
		}
		
		return vo;
	}
	
	public List<Map<String, Object>> excelEst()
			throws Exception {
		return selectList(sqlSessionFactory2, "adminEdu.excelEst");
	}
	
	public List<Map<String, Object>> excelGreen()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminEdu.excelGreen");
	}
	
	public List<Map<String, Object>> excelLog()
			throws Exception {
		return selectList(sqlSessionFactory4, "adminEdu.excelLog");
	}
	
	public List<Map<String, Object>> setEduList(Map<String, Object> map)
			throws Exception {
		return selectList(sqlSessionFactory4, "adminEdu.setEduList",map);
	}
}
