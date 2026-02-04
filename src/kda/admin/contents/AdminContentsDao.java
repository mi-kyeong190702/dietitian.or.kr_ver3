package kda.admin.contents;



import java.util.HashMap;
import java.util.Map;

import kda.admin.contents.data.CONTENTS;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminContentsDao")
public class AdminContentsDao extends KdaAbstractMapper {

	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	
	public LIST_HELPER selectListHelper(LIST_HELPER listHelper) throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminContents.selectContentsCount", "adminContents.selectContentsList", listHelper);
	}
	
	public CONTENTS selectContents(int idx) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("idx", idx);
		return (CONTENTS)selectOne(sqlSessionFactory1, "adminContents.selectContents", paramMap );
	}
	
	public void insertContents(CONTENTS contents) throws PersistenceException {
		insert(sqlSessionFactory1, "adminContents.insertContents", contents);
	}
	
	public void updateContents(CONTENTS contents) throws PersistenceException {
		update(sqlSessionFactory1, "adminContents.updateContents", contents);
	}
	
	
}
