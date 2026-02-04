package kda.admin.signature;

import java.util.HashMap;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminSignatureDao")
public class AdminSignatureDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	public LIST_HELPER selectSignatureListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminSignature.selectSignatureCount", "adminSignature.selectSignatureListHelper", listHelper);
	}
	
	public void deleteSignature(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory1, "adminSignature.deleteSignature", map);
	}

}
