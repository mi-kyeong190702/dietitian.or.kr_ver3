package kda.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERS_COMPANY;
import kda.mypage.data.MYEDUINFO;
import kda.mypage.data.MYLICENSEINFO;
import kda.mypage.data.MYMEMBEREVENT;
import kda.mypage.data.MYMEMBERINFO;
import kda.spring.abstr.KdaAbstractMapper;
import kda.utils.KdaStringUtil;

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
public class MyPageHDaoImpl extends KdaAbstractMapper implements MyPageHDao {
	private Log log = LogFactory.getLog(MyPageHDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory4;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;
	
	public List<MYEDUINFO> getMyEduSituation(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduSituation", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduLicense(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduLicense", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduOlderly(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduOlderly", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduOlderly2(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduOlderly2", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduSport(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduSport", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduSport2(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList2 = null;
		try {
			infoList2 = session.selectList("getMyEduSport2", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList2;
	}
	
	public List<MYEDUINFO> getMyEduFeed(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduFeed", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduFeed2(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduFeed2", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduHealth(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduHealth", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduHealth2(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduHealth2", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduHygiene(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduHygiene", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyEduRepair(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyEduRepair", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyLicence(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyLicence", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public List<MYEDUINFO> getMyPayment(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		List<MYEDUINFO> infoList = null;
		try {
			infoList = session.selectList("getMyPayment", paramMap);
		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return infoList;
	}
	
	public void setPointAply(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		try {
			session.selectOne("setPointAply", paramMap);

		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
	public String getDocName(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		String doc_name = "";
		try {
			doc_name = session.selectOne("getDocName", paramMap);

		} catch (Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return doc_name;
	}
	
	public MYMEMBERINFO getMyMagazine(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory4.openSession();

		MYMEMBERINFO info = null;
		try {
			info = session.selectOne("getMyMagazine", paramMap);
		} catch (Exception e) {
			log.error("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return info;
	}
	
	/*
	 * 마이페이지 > 회원정보관리 > 기본정보 수정
	 * (non-Javadoc)
	 * @see kda.mypage.MyPageHDao#getMyMemberInfo(java.util.HashMap)
	 */
	public MYMEMBERINFO getMyMemberInfo(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory4.openSession();

		MYMEMBERINFO info = null;
		try {
			info = session.selectOne("select_person_m_tbl_member", paramMap);
		} catch (Exception e) {
			log.error("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return info;
	}
	
	public boolean setMyPassword(MYMEMBERINFO memberInfo)
			throws PersistenceException {
		boolean result = false;
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("update_mymember_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager2.getTransaction(def);

		SqlSession session = sqlSessionFactory2.openSession();
 
		try {
			if ( !KdaStringUtil.isEmpty(memberInfo.getPasswd()) ) {

				session.update("update_ib_tbl_pw", memberInfo);

				if (session.selectOne("select_user_master_id", memberInfo) != null) {
					session.update("update_user_master_pw", memberInfo);
				}
			}
			transactionManager2.commit(status);

			result = true;

		} catch (PersistenceException e) {
			transactionManager2.rollback(status);
			log.info(e.toString());
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}

		return result;
	}
	
	public boolean setMyMemberInfo(MYMEMBERINFO memberInfo)
			throws PersistenceException {
		boolean result = false;

		// transaction
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("update_mymember_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager2.getTransaction(def);

		SqlSession session = sqlSessionFactory2.openSession();

		PERS_COMPANY pers_company = null;  

		try {
			// 비밀번호가 널이 아닌 경우만 비밀번호 수정처리
		 
			if ( !KdaStringUtil.isEmpty(memberInfo.getPasswd()) ) {

				session.update("update_ib_tbl_pw", memberInfo);

				if (session.selectOne("select_user_master_id", memberInfo) != null) {
					session.update("update_user_master_pw", memberInfo);
				}
			}		 
			session.update("update_person_m_tbl_member", memberInfo);
			session.update("insert_person_m_history_mypage", memberInfo);

			if (memberInfo.getCompany_name_org().equals(
					memberInfo.getCompany_name())) {
				// 근무처명을 제외한 부 정보만 바뀐 경우
				session.update("update_primary_flag", memberInfo);
				session.update("update_pers_company_member", memberInfo);

			} else { // 근무처명 등 전부 바뀜
				//session.update("update_pers_out_dt", memberInfo);
				//session.update("update_primay_flag", memberInfo);
				
				System.out.println("여기 옴");

				pers_company = session.selectOne("select_pers_company", memberInfo);
				if (pers_company == null) {
					pers_company = new PERS_COMPANY();
				}

				pers_company.setPrimary_flag("1");
				pers_company.setRegister("system");

				pers_company.setCompany_name(memberInfo.getCompany_name());
				pers_company.setCode_pers(memberInfo.getCode_pers());
				pers_company.setCode_post(memberInfo.getCpost());
				pers_company.setCompany_add(memberInfo.getCompany_add());
				pers_company.setCompany_add_detail(memberInfo
						.getCompany_add_detail());
				pers_company.setCompany_tel(memberInfo.getCompany_tel());
				pers_company.setJob_dept(memberInfo.getJob_dept());
				pers_company.setJob_level_code(memberInfo.getJob_level_code());
				pers_company.setJob_line_code(memberInfo.getJob_line_code());
				//근무처분류 추가 19.06.27 by areum1
				pers_company.setCode_part(memberInfo.getCode_part());
				pers_company.setCode_great(memberInfo.getCode_great());
				pers_company.setCode_small(memberInfo.getCode_small());
				//session.update("insert_pers_company_mypage", pers_company);
			} 
			transactionManager2.commit(status);

			result = true;

		} catch (PersistenceException e) {
			transactionManager2.rollback(status);
			log.info(e.toString());
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}

		return result;
	}
	
	
	
	/*	
	 * 마이페이지 > 회원정보 관리 > 면허정보 수정 > Form
	 * (non-Javadoc)
	 * @see kda.mypage.MyPageHDao#setMyLicenseInfo(kda.mypage.data.MYLICENSEINFO)
	 */
	
	public MYLICENSEINFO getMyLicenseInfo(HashMap<String, Object> paramMap)
			throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession();

		MYLICENSEINFO info = null;
		try {
			info = session.selectOne("select_person_m_tbl_license", paramMap);
			System.out.println(info.getCode_big()+"1111111111111111");
		} catch (Exception e) {
			log.error("error!", e);
			throw e;
		} finally {
			session.close();
		}

		return info;
	}

	/**
	 * Usage :
	 * 	1) 마이페이지 > 면허정보 수정 Action
	 */
	public boolean setMyLicenseInfo(MYLICENSEINFO licenseInfo)
			throws PersistenceException {
		boolean result = false;

		// transaction
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("update_mylicense_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager2.getTransaction(def);
		SqlSession session = sqlSessionFactory2.openSession();
		
		try {
			session.update("update_pers_company_license", licenseInfo);
			session.update("update_person_m_tbl_license", licenseInfo);
			session.insert("insert_person_m_history_mypage", licenseInfo);
			
			/*
			//회원정보 수정 이벤트 19.07.05 by areum1 ------------start
			MYMEMBEREVENT pers_info_event = new MYMEMBEREVENT();
			pers_info_event.setCode_pers(licenseInfo.getCode_pers());
			pers_info_event.setPers_name(licenseInfo.getPers_name());
			pers_info_event.setRegister(licenseInfo.getRegister());
			
			if(!licenseInfo.getCode_great().equals(licenseInfo.getCode_great_org())) {
				pers_info_event.setCode_great(licenseInfo.getCode_great());
				pers_info_event.setCode_great_org(licenseInfo.getCode_great_org());
			}
			
			if(!licenseInfo.getCode_part().equals(licenseInfo.getCode_part_org())) {
				pers_info_event.setCode_part(licenseInfo.getCode_part());
				pers_info_event.setCode_part_org(licenseInfo.getCode_part_org());
			}
	
			if(!licenseInfo.getCode_small().equals(licenseInfo.getCode_small_org())) {
				pers_info_event.setCode_small(licenseInfo.getCode_small());
				pers_info_event.setCode_small_org(licenseInfo.getCode_small_org());
			}
			
			session.update("insert_person_info_event", pers_info_event);
			//회원정보 수정 이벤트 19.07.05 by areum1 ------------end
			*/
			transactionManager2.commit(status);
			result = true;
		} catch (PersistenceException e) {
			transactionManager2.rollback(status);
			log.info(e.toString());
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public boolean updateTrainees(MEMBER_JOIN join) throws PersistenceException {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("update_mymember_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager2.getTransaction(def);
		SqlSession session = sqlSessionFactory2.openSession();
		
		PERS_COMPANY pers_company = null;
		int max_comp_seq = 0;
		boolean result = false;
		try {	
			//비밀번호가 널이 아닌 경우만 비밀번호 수정처리
			if( join.getPasswd() != "" ){
				session.update("update_ib_tbl_pw", join);	
				if( session.selectOne("select_user_master_id", join) != null ){
					session.update("update_user_master_pw", join);
				}
			}
			
			session.update("update_person_m_tbl_member", join);	
			session.update("insert_person_m_history_mypage", join);
			
			if(join.getCompany_name_org().equals(join.getCompany_name())){
				//근무처명을 제외한 부 정보만 바뀐 경우
				session.update("update_primary_flag", join);	
				session.update("update_pers_company_member", join);
				
			}else{ //근무처명 등 전부 바뀜
				session.update("update_pers_out_dt", join);	
				session.update("update_primay_flag", join);	
				
				pers_company = session.selectOne("select_pers_company", join);
				if( pers_company == null ) {
					pers_company = new PERS_COMPANY();
				}
				pers_company.setPrimary_flag("1");
				pers_company.setRegister("system");
				pers_company.setCompany_name(join.getCompany_name());
				pers_company.setCode_pers(join.getCode_pers());
				pers_company.setCode_post(join.getCompany_code_post());
				pers_company.setCompany_add(join.getCompany_add());
				pers_company.setCompany_add_detail(join.getCompany_add_detail());
				pers_company.setCompany_tel(join.getCompany_tel());
				pers_company.setJob_dept(join.getJob_dept());
				pers_company.setJob_level_code(join.getJob_level_code());
				pers_company.setJob_line_code(join.getJob_line_code());
				
				session.update("insert_pers_company_mypage", pers_company);
			}
			
			transactionManager2.commit(status);
			result = true;
		} catch (Exception e) {						
			transactionManager2.rollback(status);
			log.info(e.toString());
			throw new PersistenceException(e);
		} finally {			
			session.close();
		}
		return result;
	}

	@Override
	public List<Map> selectMyCerifiList(String code_pers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("code_pers", code_pers);
		
		List<Map> cerifiList = selectList(sqlSessionFactory2, "mypage.selectMyCertiList", paramMap );
		return cerifiList;
	}

	@Override
	public Map getMyPayment_print(HashMap<String, Object> paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession(); 
		 	 
		return (Map)selectOne(sqlSessionFactory2,  "mypage.getMyPayment_print", paramMap);
	}
	
	@Override
	public Map getMyPayment_user(HashMap<String, Object> paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession(); 
		 	 
		return (Map)selectOne(sqlSessionFactory2,  "mypage.getMyPayment_user", paramMap);
	}
	
	@Override
	public Map getRcp_print(HashMap<String, Object> paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession(); 
		 	 
		return (Map)selectOne(sqlSessionFactory2,  "mypage.getRcp_print", paramMap);
	}

	@Override
	public List<Map> getCerti_print(HashMap<String, Object> paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession(); 
		List<Map> list =  selectList(sqlSessionFactory2,  "mypage.getCerti_print", paramMap);
		return list;
	}

	@Override
	public Map getCertiName_print(HashMap<String, Object> paramMap) throws PersistenceException {
		SqlSession session = sqlSessionFactory2.openSession(); 
	 	 
		return (Map)selectOne(sqlSessionFactory2,  "mypage.getCertiName_print", paramMap);
	}

	@Override
	public int getMyPaymentCount(HashMap<String, Object> paramMap) throws PersistenceException {
		// TODO Auto-generated method stub
		return selectInt(sqlSessionFactory2,  "mypage.getMyPaymentCount", paramMap);
	}

	@Override
	public void insertLog_print(HashMap<String, Object> paramMap) throws PersistenceException {
		insert(sqlSessionFactory2, "mypage.insertLog_print", paramMap);
	}

	@Override
	public Map getSituation_print(HashMap<String, Object> paramMap) throws PersistenceException {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory2.openSession(); 
	 	 
		return (Map)selectOne(sqlSessionFactory2,  "mypage.getSituation_print", paramMap);
	}
	
}