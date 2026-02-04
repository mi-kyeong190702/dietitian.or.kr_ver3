package kda.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.common.data.GROUPCODE;
import kda.member.data.DUES;
import kda.member.data.MEMBER;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;
import kda.member.data.TRUST_COMPANY;
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

@Repository
public class MemberDaoImpl extends KdaAbstractMapper implements MemberDao{
	private Log log = LogFactory.getLog(MemberDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;
	
	@Override
	public String getMemberHp(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory4.openSession();
		
		String hp = "";
		
		try{
			hp = session.selectOne("getMemberHp", paramMap);
		}
		catch(Exception e)
		{
			log.info("getMemberHp error!!! " + e);
			throw e;
		} finally {
			session.close();
		}
		
		return hp;
	}
	
	@Override
	public int setInitPw(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int result = 0;
		
		try{
			result = session.update("setInitPw", paramMap);
						
			Map paramMap2 = new HashMap();
			paramMap2.put("id", paramMap.get("uid"));
			paramMap2.put("passwd", paramMap.get("pers_hp"));
			session.update("update_user_master_pw", paramMap2);
		}
		catch(Exception e)
		{
			log.info("setInitPw error!!! " + e);
			throw e;
		} finally {
			session.close();
		}
		
		return result;
	}	
	
	@Override
	public String getLicNo(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		String licNo = null;
				
		try{
			licNo = session.selectOne("getLicNo", paramMap);
		}
		catch(Exception e)
		{
			log.error("getLicNo error!!! " + e.toString());
			throw e;
		} finally {
			session.close();
		}
		
		return licNo;
	}
	
	@Override
	public String getId(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		String id = null;
				
		try{
			id = session.selectOne("checkId", paramMap);
		}
		catch(Exception e)
		{
			log.info("getId error!!! " + e.toString());
			throw e;
		} finally {
			session.close();
		}
		
		return id;
	}
	
	@Override
	public List<MEMBER> getMemberId(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory4.openSession();
		
		List<MEMBER> idList = null;
		
		try{
			idList = session.selectList("getMemberId", paramMap);
		}
		catch(Exception e)
		{
			log.info("getMemberId error!!! " + e);
			throw e;
		} finally {
			session.close();
		}
		
		return idList;
	}
	
	public List<GROUPCODE> getGroupCode(HashMap<String, String> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<GROUPCODE> codeList = null;	
		
		try{
			codeList = session.selectList("getGroupcode",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return codeList;
	}
	
	@Override
	public String getCodePers(HashMap<String, String> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		String  code_pers = null;
				
		try{
			code_pers = session.selectOne("getCodePers", paramMap);
		}
		catch(Exception e)
		{
			log.info("getCode_pers error!!! " + e);
			throw e;
		} finally {
			session.close();
		}
		
		return code_pers;
	}
	
	
	@Override
	public String getMaxCodePers() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		String  max_code_pers = "";
					
		try
		{
			max_code_pers = session.selectOne("getMaxCodePers");
			java.util.Calendar cal = java.util.Calendar.getInstance();
			
			
			if(max_code_pers == "")
				max_code_pers =  cal.get ( cal.YEAR ) + "00001";
			else
				max_code_pers = Integer.toString(Integer.parseInt(max_code_pers) + 1);
			
			log.info("max_code_pers:"+ max_code_pers);
			
			
		}
		catch(Exception e)
		{
			log.info("getCode_pers error!!! " + e);
			throw e;
		} finally {
			session.close();
		}
		
		return max_code_pers;
	}
	
	
	@Override
	public int getMasDuesHSeqCMS() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int  maxSeqCMS = 0;
					
		try{
			
			maxSeqCMS = session.selectOne("getMasDuesHSeqCMS");
			
		}
		catch(Exception e)
		{
			log.info("getMasDuesHSeqCMS error!!! " + e );
			throw e;
		} finally {
			session.close();
		}
		
		return maxSeqCMS;
	}
		
	
	public String insertMember(MEMBER_JOIN member_join) throws PersistenceException
	{
		
		String code_pers = null;
		// transaction 
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("insert_member_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager2.getTransaction(def);
		
		SqlSession session = sqlSessionFactory2.openSession();		
		String 	code_pay_name = session.selectOne("getDetCodeNamePay", member_join.getCode_pay_flag());
		
		code_pers = getMaxCodePers();
		
		member_join.setCode_pers(code_pers);
		member_join.setCode_pay_name(code_pay_name);
		member_join.setEmail(member_join.getEmail() + "@" + member_join.getEmail2());
		member_join.setRegister("system");
		
		try {
			session.insert("insert_id_tbl", member_join);
			session.insert("insert_dues_h_tbl", member_join);
			session.insert("insert_dues_b_tbl", member_join);
			session.insert("insert_pers_company", member_join);
			session.insert("insert_person_m_tbl", member_join);
			session.insert("insert_person_m_history", member_join);

			// cms
			if (member_join.getCode_pay_flag().equals("15")) {
				member_join.setDues_h_seq(1);
				session.insert("insert_dues_h_tbl_cms", member_join);
			}
			transactionManager2.commit(status);

		} catch (Exception e) {
			code_pers = null;
			transactionManager2.rollback(status);
			log.info(e.toString());
		} finally {
			session.close();
		}
		return code_pers;
	}
	
	@Override
	public boolean insertEduMember(MEMBER_JOIN member_join) throws PersistenceException
	{
		boolean result = false;
		
		// transaction 
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("insert_member_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager2.getTransaction(def);
		
		SqlSession session = sqlSessionFactory2.openSession();		

		member_join.setCode_pers(getMaxCodePers());
		member_join.setEmail(member_join.getEmail() + "@" + member_join.getEmail2());
		member_join.setRegister("system");
		
		try
		{	
			session.insert("insert_id_tbl", member_join);				
			session.insert("insert_pers_company", member_join);
			session.insert("insert_person_m_tbl", member_join);
			session.insert("insert_person_m_history", member_join);
			
			transactionManager2.commit(status);
			result = true;
			
		} catch (PersistenceException e) {						
			transactionManager2.rollback(status);
			log.info(e.toString());
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		}finally {			
			session.close();
		}
		
		return result;
	}
	
	@Override
	public void insert_dues_h_tbl_cms(MEMBER_JOIN member_join) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		String 	code_pay_name 	= "";
		
		member_join.setDues_h_seq(getMasDuesHSeqCMS());
		
		code_pay_name = session.selectOne("getDetCodeNamePay", member_join.getCode_pay_flag());		
	
		member_join.setCode_pay_name(code_pay_name);
	
		//현재는 신규 가입자/재가입 모두 해당
		member_join.setRegister("system");
		
		try {	
			session.insert("insert_dues_h_tbl_cms", member_join);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
	}
	
	
	@Override
	public long getSumDues(HashMap<String, String> paramMap ) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		long sumdues = 0l;
		
		try{
			sumdues = session.selectOne("getSumDues", paramMap);
		}
		catch(Exception e)
		{
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return sumdues;
	}
	
	
	public void insertReentrance(MEMBER_JOIN member_join) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		String 	code_pay_name 	= "";
		long 	sum_dues 		= 0l;
		
		member_join.setCode_pers(getMaxCodePers());
		
		code_pay_name = session.selectOne("getDetCodeNamePay", member_join.getCode_pay_flag());		
		member_join.setCode_pay_name(code_pay_name);
		
					
		//신규 가입자인 경우
		member_join.setRegister("system");
		
		try
		{	
			
			//session.insert("insert_id_tbl", member_join);	//ver3
			
			//session.insert("insert_dues_h_tbl", member_join);	//ver3
			
			//session.insert("insert_dues_b_tbl", member_join);	//ver3
			
			//session.insert("insert_pers_company", member_join);		//ver3			
			
			//session.insert("insert_person_m_tbl", member_join);		//ver3
			
			//session.insert("insert_person_m_history", member_join);	//ver3
			
			if( member_join.getCode_pay_flag().equals("15")){ //CMS
				insert_dues_h_tbl_cms(member_join);	//ver3
			}
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public String getDuesMonth() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		String month = null;
		
		try{
			month = session.selectOne("getDuesMonth");
		}
		catch(Exception e)
		{
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return month;
	}
	
	@Override
	public List<TRUST_COMPANY> getTrustCompanyList(String ser_keyword) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<TRUST_COMPANY> list = null;	
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		
		try{
			paramMap.put("ser_keyword", ser_keyword);		
			
			list = session.selectList("getTrustCompanyList",paramMap);
		
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int insert_trust_company (HashMap<String, String> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int result = 0;
		try
		{	
			result = session.selectOne("insert_trust_company", paramMap);
		}catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<DUES> getDuesBranList(String code_bran) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<DUES> resultList = null;
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("code_bran", code_bran);
		
		try{
			resultList = session.selectList("getDuesBranList", paramMap);
		}catch(Exception e){
			log.info("error!", e);
			throw e;
		}finally {
			session.close();
		}
		
		return resultList;
	}

	@Override
	public PERSON_M_TBL selectMemberByKey(String codePers, boolean sp)
			throws PersistenceException {
		SqlSession session = null;
		if( !sp ) {
			session = sqlSessionFactory2.openSession();
		} else {
			session = sqlSessionFactory4.openSession();
		}
		
		PERSON_M_TBL person = null;
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("codePers", codePers);
		try {
			person = session.selectOne("member.selectPersonAllByKey", paramMap);
		} catch(PersistenceException pe) {
			log.error(pe);
			throw pe;
		} finally {
			session.close();
		}
		return person;
	}

	@Override
	public int selectCountPerson(Map paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();
		int cnt = 0;
		try {
			cnt = session.selectOne("member.selectCountPerson", paramMap);
		} catch(PersistenceException pe) {
			log.error(pe);
			throw pe;
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public Map selectPersonByCertTemp(String codePers)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory4.openSession();
		Map result = null;
		try {
			result = session.selectOne("member.selectPersonByCertTemp", codePers);
		} catch(PersistenceException pe) {
			throw pe;
		} finally { 
			session.close();
		}
		return result;
	}

	@Override
	public void updateLicNo(String codePers, String licNo) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();
		try {
			Map paramMap = new HashMap();
			paramMap.put("codePers", codePers);
			paramMap.put("licNo", licNo);
			session.update("member.updateLicNo", paramMap);
		} catch(PersistenceException pe) {
			throw pe;
		} finally { 
			session.close();
		}
	}
	
	
	@Override
	public Map selectCheckMemberById(String uid, String compVal) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("uid", uid);
		paramMap.put("compVal", compVal);
		
		return (HashMap)selectOne(sqlSessionFactory2, "member.selectCheckMemberById", paramMap);
	}

	@Override
	public List<Map> selectMemberDuePeriodList(String code_pers)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("code_pers", code_pers);
		return selectList(sqlSessionFactory2, "member.selectMemberDuePeriodList", paramMap);
	}

	@Override
	public List<Map> selectPersonDuesList(String codePers) throws PersistenceException {
		return (List<Map>)selectList(sqlSessionFactory2, "member.selectDuesByCodePers", codePers);
		
	}

	@Override
	public List<DUES> getReDuesList(String code_bran)
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("code_bran", code_bran);
		return (List<DUES>)selectList(sqlSessionFactory2, "member.selectReDuesList", paramMap);
	}
	
	
}
