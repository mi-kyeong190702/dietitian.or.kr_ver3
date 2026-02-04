package kda.admin.consult;

import java.util.HashMap;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminConsultDao")
public class AdminConsultDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	
	public LIST_HELPER selectConsultListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminConsult.selectConsultCount", "adminConsult.selectConsultListHelper", listHelper);
	}
	
	public String insertConsult(HashMap<String, Object> map)
			throws PersistenceException {
		
		String msg = "이미 지정된 아이디 입니다.";
		int cnt = (int) selectOne(sqlSessionFactory1, "adminConsult.getConsultCount", map);
		
		if(cnt == 0){
			insert(sqlSessionFactory1, "adminConsult.insertConsult", map);
			msg = "저장 되었습니다.";
		}
		
		return msg;
	}
	
	public void deleteConsult(HashMap<String, Object> map)
			throws PersistenceException {
		delete(sqlSessionFactory1, "adminConsult.deleteConsult", map);
	}

}
