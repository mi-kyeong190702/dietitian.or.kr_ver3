package kda.work.business.clinic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.spring.abstr.KdaAbstractMapper;
import kda.work.business.clinic.ClinicDao;
import kda.work.business.clinic.data.KB_C_HABITS_DIAGNOSIS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.exceptions.PersistenceException;

@Repository
public class ClinicDaoImpl extends KdaAbstractMapper implements ClinicDao
{
	private Log log = LogFactory.getLog(ClinicDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Override
	public List<KB_C_HABITS_DIAGNOSIS> select(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		log.info("================================ ClinicDaoImpl [KB_C_HABITS_DIAGNOSIS]");
		
		List<KB_C_HABITS_DIAGNOSIS> list = null;	
		try{
			list = session.selectList("selectHques",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<Map> selectBodList() throws PersistenceException {
		return selectList(sqlSessionFactory1, "diagnosis.selectBodList");
	}

	@Override
	public List<Map> selectActList() throws PersistenceException {
		return selectList(sqlSessionFactory1, "diagnosis.selectActList");
	}

	@Override
	public Map selectObeM(int gubun, double ll_weight)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("gubun", gubun);
		paramMap.put("ll_weight", ll_weight);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectObeM", paramMap);
	}

	@Override
	public Map selectWhrM(String check, double ll_waist) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("check", check);
		paramMap.put("ll_waist", ll_waist);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectWhrM", paramMap);
	}

	@Override
	public Map selectGreM(int fatGubun, int sex, double fat)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("fatGubun", fatGubun);
		paramMap.put("sex", sex);
		paramMap.put("fat", fat);
		
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectGreM", paramMap);
	}

	@Override
	public Map selectBlpM(int direct, int bloodGubun, double value, int age)
			throws Exception {
		Map paramMap = new HashMap();
		paramMap.put("direct", direct);
		paramMap.put("bloodGubun", bloodGubun);
		paramMap.put("value", value);
		paramMap.put("age", age);
			
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectBlpM", paramMap);
	}

	@Override
	public Map selectBlsM( double bloodsa, double bloodsb) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("bloodsa", bloodsa);
		paramMap.put("bloodsb", bloodsb);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectBlsM", paramMap);
	}
	
	
	@Override
	public Map selectBlsM2( String bloodgbn ) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("bloodgbn", bloodgbn);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectBlsM2", paramMap);
	}
	
	@Override
	public Map selectActM(int actSeqno) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("actSeqno", actSeqno);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectActM", paramMap);
	}

	@Override
	public Map selectRdaM(int sex, int age) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("sex", sex);
		paramMap.put("age", age);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectRdaM", paramMap);
	}

	@Override
	public Map selectStandardWt(String sex,  double fhit)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("sex", sex);
		paramMap.put("fhit", fhit);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectStandardWt", paramMap);
	}

	@Override
	public Map selectGeneralWt(String sex, int fage, double fhit)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("sex", sex);
		paramMap.put("fage", fage);
		paramMap.put("fhit", fhit);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectGeneralWt", paramMap);
	}
	
	@Override
	public Map selectObeTbl(int fatcode) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("fatcode", fatcode);
		return (Map)selectOne(sqlSessionFactory1, "diagnosis.selectObeTbl", paramMap);
	}
	
}
