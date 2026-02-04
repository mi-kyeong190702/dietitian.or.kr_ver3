package kda.common;

import kda.common.data.TBL_ORDER_LIST;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository("cardOrderDao")
public class CardOrderDao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(CardOrderDao.class);
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;
	
	public boolean insertOrder(TBL_ORDER_LIST order) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("card_order_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager2.getTransaction(def);

		SqlSession session = sqlSessionFactory2.openSession();	
		boolean result = false;
		try
		{	
			log.debug("INSERT : " + order );
			session.insert("payment.insert_order_list", order);
			
			if( order.getO_gubun().equals("STUDY_REA") )  {
				// TODO 학술대회
				insert(sqlSessionFactory2, "ke_edu.insertMeetingByTemp", order.getGoods_code_num());
			}
			
			if( order.getO_gubun().equals("") ) {
				// TODO 판매품
			}
			transactionManager2.commit(status);
			result = true;
		} catch(Exception e) {
			transactionManager2.rollback(status);
			log.error("card Pay Error : " + e);
		} finally {			
			session.close();
		}
		return result;
	}
	
	public void updateStatus(TBL_ORDER_LIST order) {
		update(sqlSessionFactory2, "payment.upadateOrderStatus", order);
	}
	
	
	
	
}
