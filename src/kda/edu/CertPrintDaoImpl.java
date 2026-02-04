package kda.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.edu.data.CertPrint;
import kda.member.data.MEMBER;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;

@Repository
public class CertPrintDaoImpl extends KdaAbstractMapper implements CertPrintDao{
	private Log log = LogFactory.getLog(CertPrintDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;

	@Override
	public List<Map> selectCertPrintview(Map paramMap) throws PersistenceException
	{
	
				SqlSession session = sqlSessionFactory4.openSession();
				
				List<Map> CertPrint = null;
				
				try{
					CertPrint = session.selectList("selectCertPrintview", paramMap);
				}
				catch(Exception e)
				{
					log.info("selectCertPrintview error!!! " + e);
					throw e;
				} finally {
					session.close();
				}
				return CertPrint;
			}
			
	}
