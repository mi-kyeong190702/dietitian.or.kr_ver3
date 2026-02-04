package kda.admin.stat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.main.BannerDao;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminStatDao")
public class AdminStatDao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(AdminStatDao.class);
	
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	public int selectSumLog( String kind, String stDate, String endDate) { 
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		try {
			return selectInt(sqlSessionFactory1, "adminStat.selectSumLog", paramMap);
		} catch( PersistenceException e ) {
			log.error("Count Error", e);
			return 0;
		}
	}
	
	public List<Map> selectLogList(String kind, String stDate, String endDate) throws PersistenceException { 
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		
		return selectList(sqlSessionFactory1, "adminStat.selectLogList", paramMap);
	}
	
	public int selectSumBannerLog(String kind, String stDate, String endDate, String srch) {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		
		try {
			return selectInt(sqlSessionFactory1, "adminStat.selectSumBannerLog", paramMap);
		} catch( PersistenceException e ) {
			log.error("Count Error", e);
			return 0;
		}
	}
	
	public List<Map> selectBannerLogList(String kind, String stDate, String endDate, String srch) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		return selectList(sqlSessionFactory1, "adminStat.selectBannerLogList", paramMap);
	}
	
	public int selectSumMemberLog(String kind, String stDate, String endDate, String srch) {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		
		try {
			return selectInt(sqlSessionFactory1, "adminStat.selectSumMemberLog", paramMap);
		} catch( PersistenceException e ) {
			log.error("Count Error", e);
			return 0;
		}
	}
	
	public List<Map> selectMemberLogList(String kind, String stDate, String endDate, String srch) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		return selectList(sqlSessionFactory1, "adminStat.selectMemberLogList", paramMap);
	}
	
	public Map selectSearchMember(String id, String name) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("id", id);
		paramMap.put("name", name);
		return (Map)selectOne(sqlSessionFactory2,  "adminStat.selectSearchMember", paramMap);
	}
	
	public int selectSumSinmungoLog(String kind, String stDate, String endDate, String srch) {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		
		try {
			return selectInt(sqlSessionFactory2, "adminStat.selectSumSinmungoLog", paramMap);
		} catch( PersistenceException e ) {
			log.error("Count Error", e);
			return 0;
		}
	}
	
	public List<Map> selectSinmungoLogList(String kind, String stDate, String endDate, String srch) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("kind", kind);
		paramMap.put("stDate", stDate);
		paramMap.put("endDate", endDate);
		paramMap.put("srch", srch);
		return selectList(sqlSessionFactory2, "adminStat.selectSinmungoLogList", paramMap);
	}
	
	public List<Map<String, Object>> excelSinmungo() throws Exception {
		return selectList(sqlSessionFactory2, "adminStat.excelSinmungo");
	}
}
