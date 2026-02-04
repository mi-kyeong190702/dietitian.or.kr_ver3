package kda.admin.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.admin.point.data.IDTBL;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminPointDao")
public class AdminPointDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@SuppressWarnings("unchecked")
	public List<IDTBL> selectTopPoint()
			throws PersistenceException {
		return selectList(sqlSessionFactory2, "adminPoint.selectTopPoint");
	}
	
	public LIST_HELPER selectPointListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminPoint.selectPointCount", "adminPoint.selectPointListHelper", listHelper);
	}
	
	public void updatePoint(HashMap<String, Object> map)
			throws PersistenceException {
		update(sqlSessionFactory2, "adminPoint.updatePoint", map);
	}
	
	public List<Map<String, Object>> excelTopPoint()
			throws Exception {
		return selectList(sqlSessionFactory2, "adminPoint.excelTopPoint");
	}

}
