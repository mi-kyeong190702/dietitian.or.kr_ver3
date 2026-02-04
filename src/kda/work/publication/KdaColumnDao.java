package kda.work.publication;

import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.publication.data.KDA_COLUMN;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("kdaColumnDao")
public class KdaColumnDao extends KdaAbstractMapper {

	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	public LIST_HELPER selectKdaColumnListHelper(LIST_HELPER listHelper) throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "kdaColumn.selectKdaColumnCount", "kdaColumn.selectKdaColumnListHelper", listHelper);
	}
	
	public KDA_COLUMN selectKdaColumn(int idx) throws PersistenceException {
		return (KDA_COLUMN)selectOne(sqlSessionFactory1, "kdaColumn.selectKdaColumn", idx);
	}
		
	public void insertKdaColumn(KDA_COLUMN kdaColumn) throws PersistenceException {
		insert(sqlSessionFactory1, "kdaColumn.insertKdaColumn", kdaColumn);
	}

	public void updateKdaColumn(KDA_COLUMN kdaColumn) throws PersistenceException {
		insert(sqlSessionFactory1, "kdaColumn.updateKdaColumn", kdaColumn);
	}
	
	public void deleteKdaColumn(int idx) throws PersistenceException {
		delete(sqlSessionFactory1, "kdaColumn.deleteKdaColumn", idx);
	}
	
	/* E-Book 추가 */
	public LIST_HELPER selectEbookColumnListHelper(LIST_HELPER listHelper) throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "kdaColumn.selectEbookColumnCount", "kdaColumn.selectEbookColumnListHelper", listHelper);
	}
	
	public KDA_COLUMN selectEbookColumn(int idx) throws PersistenceException {
		return (KDA_COLUMN)selectOne(sqlSessionFactory1, "kdaColumn.selectEbookColumn", idx);
	}
		
	public void insertEbookColumn(KDA_COLUMN kdaColumn) throws PersistenceException {
		insert(sqlSessionFactory1, "kdaColumn.insertEbookColumn", kdaColumn);
	}

	public void updateEbookColumn(KDA_COLUMN kdaColumn) throws PersistenceException {
		insert(sqlSessionFactory1, "kdaColumn.updateEbookColumn", kdaColumn);
	}
	
	public void deleteEbookColumn(int idx) throws PersistenceException {
		delete(sqlSessionFactory1, "kdaColumn.deleteEbookColumn", idx);
	}

	public PTB_BUYADDRESS selectpublishingLogin(HashMap<String, Object> paramMap) {
		return (PTB_BUYADDRESS)selectOne(sqlSessionFactory1, "kdaColumn.selectpublishingLogin", paramMap);
	}
}
