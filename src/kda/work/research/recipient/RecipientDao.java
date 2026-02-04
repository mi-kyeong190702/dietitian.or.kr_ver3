package kda.work.research.recipient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.spring.abstr.KdaAbstractMapper;
import kda.work.research.recipient.data.ACTULSUBJECTS;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RecipientDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	public int personCheck(HashMap<String, Object> map)
			throws PersistenceException {
		return selectInt(sqlSessionFactory2, "researchRecipient.personCheck", map);
	}
	
	public int recipientCheck(HashMap<String, Object> map)
			throws PersistenceException {
		return selectInt(sqlSessionFactory2, "researchRecipient.recipientCheck", map);
	}

	public int recipientCheck1(HashMap<String, Object> map)
			throws PersistenceException {
		return selectInt(sqlSessionFactory2, "researchRecipient.recipientCheck1", map);
	}
	
	
	public void insertRecipient(ACTULSUBJECTS vo)
			throws PersistenceException {
		insert(sqlSessionFactory2, "researchRecipient.insertRecipient", vo);
	}
	
	public void updateRecipient(ACTULSUBJECTS vo)
			throws PersistenceException {
		update(sqlSessionFactory2, "researchRecipient.updateRecipient", vo);
	}

	public void updateRecipientDetail(ACTULSUBJECTS vo)
			throws PersistenceException {
		update(sqlSessionFactory2, "researchRecipient.updateRecipientDetail", vo);
	}
	
	public Map personInfoCheck(HashMap<String, Object> map)
			throws PersistenceException {
		return (Map)selectOne(sqlSessionFactory2, "researchRecipient.personInfoCheck", map);
	}

}
