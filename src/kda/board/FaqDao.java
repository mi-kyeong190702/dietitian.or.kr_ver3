package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.FAQ;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqDao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(FaqDao.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	public List<FAQ> selectFaqList(int faqCategory) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("faqCategory", faqCategory);
		return selectList(sqlSessionFactory1, "faq.selectFaqList", paramMap);
	}
	
	public FAQ selectFaq(int idx) throws PersistenceException {
		return (FAQ)selectOne(sqlSessionFactory1, "faq.selectFaq", idx);
	}
	
	public void insertFaq(FAQ faq) throws PersistenceException {
		insert(sqlSessionFactory1, "faq.insertFaq", faq);
	}
	
	public void updateFaq(FAQ faq) throws PersistenceException {
		update(sqlSessionFactory1, "faq.updateFaq", faq);
	}
	
	public void deleteFaq(int idx) throws PersistenceException {
		delete(sqlSessionFactory1, "faq.deleteFaq", idx);
	}
} 
