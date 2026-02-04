package kda.work.education;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kda.spring.abstr.KdaAbstractMapper;
import kda.utils.KdaStringUtil;
import kda.work.education.data.KE_EDU_GREEN;
import kda.work.education.data.KE_EDU_MEETING;
import kda.work.education.data.KE_EDU_CERTIFI;
import kda.work.education.data.KE_EDU_MEETING_DEL;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_OPER_ADD_FILE;
import kda.work.education.data.KE_EDU_TEST_NAME;
import kda.work.education.data.PTB_EDUSCHEDULE;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("educationDao")
public class EducationDao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(EducationDao.class);
	
	@Resource(name="sqlSessionFactory1")
	private SqlSessionFactory sqlSessionFactory1;
	
	@Resource(name="sqlSessionFactory2")
	private SqlSessionFactory sqlSessionFactory2;
	
	@Resource(name="sqlSessionFactory3")
	private SqlSessionFactory sqlSessionFactory3;
	
	@Resource(name="sqlSessionFactory4")
	private SqlSessionFactory sqlSessionFactory4;
	
	
	@SuppressWarnings("unchecked")
	public List<KE_EDU_TEST_NAME> selectEduTestNameList(Map paramMap) throws PersistenceException {
		List<KE_EDU_TEST_NAME> list = null;
		try {
			list = selectList( sqlSessionFactory2, "ke_edu.selectEduNameList", paramMap);
		} catch(PersistenceException pe) {
			log.error(pe);
			throw pe;
		}
		return list;
	}
	
	public int selectOperatorCount(KE_EDU_OPERATOR operator) throws PersistenceException {
		return selectInt(sqlSessionFactory2, "ke_edu.selectOperatorCount", operator);
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Integer> selectOperatorLimitPersCnt(KE_EDU_OPERATOR operator)  throws PersistenceException {
		return (HashMap<String, Integer>)selectOne(sqlSessionFactory2, "ke_edu.selectOperatorLimitPersCnt", operator);
	}
	
	public void insertOperator(KE_EDU_OPERATOR operator) throws PersistenceException {
		String maxReceiptNoStr = (String)selectOne(sqlSessionFactory2, "ke_edu.selectOperatorMaxReceiptNo", operator);
		int maxReceiptNo = Integer.parseInt(maxReceiptNoStr);
		String receiptNo = KdaStringUtil.lpad( maxReceiptNo + 1, 4);
		operator.setReceipt_no(receiptNo);
		insert( sqlSessionFactory4,  "ke_edu.insertOperator", operator );
	}
	
	public KE_EDU_TEST_NAME selectEduTestName(String eduId) throws PersistenceException {
		return (KE_EDU_TEST_NAME)selectOne(sqlSessionFactory2, "ke_edu.selectEduTestByEduId", eduId);
	}
	
	/**
	 * 교육신청 현황 목록조회
	 *  - 관련 페이지 : work/education/ke_situation.do, work/education/ke_edu_pay_select.do
	 *   
	 * @param year
	 * @param codePers
	 * @param operState
	 * @return
	 * @throws PersistenceException
	 */
	public List<KE_EDU_OPERATOR> selectOperatorList(String year, String codePers, String operState, String operKey) throws PersistenceException {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("year", year);
		paramMap.put("person_yn", codePers);
		paramMap.put("oper_state", operState);
		paramMap.put("oper_key", operKey);
		List<KE_EDU_OPERATOR> operatorList = selectList(sqlSessionFactory4, "ke_edu.selectOperatorList", paramMap );
		return operatorList;
	}
	
	public void updateOperator(KE_EDU_OPERATOR operator) throws PersistenceException {
		update(sqlSessionFactory2, "ke_edu.updateOperator", operator);
	}
	
	public List<Map> selectEduTestBranList(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "ke_edu.selectEduTestBranList", paramMap);
	}
	
	public List<KE_EDU_CERTIFI> selectOldCertifiList(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "ke_edu.selectOldCertifiList", paramMap);
	}
	
	
	/* ==== 자격증 시험 관련 ==*/
	public List<KE_EDU_CERTIFI> selectPersonCertifiList(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "ke_edu.selectPersonCertifiList", paramMap);
	}
	
	/**
	 * 해당 시험에 대한 신청여부 조회
	 * - 사용 : ke_exam.do 
	 * 
	 * @param paramMap
	 * @return
	 * @throws PersistenceException
	 */
	public int selectExamOperatorCount(Map paramMap) throws PersistenceException {
		return selectInt(sqlSessionFactory2, "ke_edu.selectExamOperatorCount", paramMap);
	}
	
	/**
	 * 재시험 검증
	 * 
	 * @param operator
	 * @return
	 * @throws PersistenceException
	 */
	public boolean selectExamValidReTest(KE_EDU_OPERATOR operator) throws PersistenceException {
		//  해당 학기 교육 이수 여부 확인
		String flag1 = (String)selectOne(sqlSessionFactory2, "ke_edu.selectExamCompEduOperaterFlag", operator);
		if( KdaStringUtil.isEmpty(flag1) && !"Y".equals(flag1) ) {
			
			//교육이수여부가 없으면 석사이상인지 확인 필요 - 18.10.31 by areum1
			String flag2 = (String)selectOne(sqlSessionFactory2, "ke_edu.selectExamMasterYn", operator);
			
			//석사이상이 아니면 재시험 불가
			if( KdaStringUtil.isEmpty(flag2) && !"Y".equals(flag2) ) {
				return false;
			}
			
		}
		
		// 해당 학기 시험 응시 여부 확인
		String resultEndDt = (String)selectOne(sqlSessionFactory2, "ke_edu.selectMaxResultEndDt", operator);
		operator.setResult_end_dt(resultEndDt);
		
		String onceOperKey = (String)selectOne(sqlSessionFactory2, "ke_edu.selectExamOnceOperKey", operator);
		if( KdaStringUtil.isEmpty(onceOperKey) ) {
			return false;
		}
		operator.setOnce_oper_key(onceOperKey);
		return true;
	}
	
	/**
	 * 말소자 확인작업
	 * 
	 * @param operator
	 * @return 0 : 정상 , 1: 말소자 아님, 2: 합격자
	 * @throws PersistenceException
	 */
	public int selectExamValidExpire(KE_EDU_OPERATOR operator) throws PersistenceException {
		int result = 0;
		// 자격 말소 이후에 시험 응시 결과 확인하여 응시 가능 여부 노출
		String resultEndDt = (String)selectOne(sqlSessionFactory2, "ke_edu.selectMaxResultEndDt", operator);
		if( KdaStringUtil.isEmpty(resultEndDt) ) {
			// 회원님은 말소자로 응시하실 수 없습니다.
			result = 1;
		} else {
			operator.setResult_end_dt(resultEndDt);
			String passFlag = selectExamPassFlag(operator);
			if( !KdaStringUtil.isEmpty(passFlag) && "Y".equals(passFlag) ) {
				// 선택 학기의 시험은 이미 합격하셨습니다.
				result = 2;
			}
		}
		return result;
	}

	/**
	 * 해당 학기에 합격여부 확인
	 * 
	 * @param operator
	 * @return
	 * @throws PersistenceException
	 */
	public String selectExamPassFlag(KE_EDU_OPERATOR operator) throws PersistenceException {
		String passFlag = (String)selectOne(sqlSessionFactory2, "ke_edu.selectExamPassFlag", operator);
		return passFlag;
	}
	
	/**
	 * 자격시험 저장
	 * 
	 * @param operator
	 * @return
	 * @throws PersistenceException
	 */
	public String insertExamOperator(KE_EDU_OPERATOR operator) throws PersistenceException {
		String maxReceiptNoStr = (String)selectOne(sqlSessionFactory2, "ke_edu.selectOperatorMaxReceiptNo", operator);
		int maxReceiptNo = Integer.parseInt(maxReceiptNoStr);
		String receiptNo = KdaStringUtil.lpad( maxReceiptNo + 1, 4);
		operator.setReceipt_no(receiptNo);
		try {
			insert(sqlSessionFactory2, "ke_edu.insertExamOperator", operator);
		} catch(PersistenceException pe) {
			throw pe;
		} finally {
			
		}
		return receiptNo;
	}
	
	/**
	 * Code Operation 상태변경 
	 * 
	 * @param operKey
	 * @param codeOperation
	 * @throws PersistenceException
	 */
	public void updateCodeOperation(String operKey, String codeOperation) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("operKey", operKey);
		paramMap.put("codeOperation", codeOperation);
		update(sqlSessionFactory2, "ke_edu.updateCodeOperation", paramMap);
	}
	
	
	
	// =======  자격증 발급 관련 =========================
	/**
	 * 자격증 코드 목록 조회
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public List<Map> selectCertifiCodeList() throws PersistenceException {
		return (List<Map>) selectList(sqlSessionFactory2,
				"ke_edu.selectCertifiCodeList", null);
	}

	/**
	 * 최신 자격증 발급 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws PersistenceException
	 */
	public KE_EDU_CERTIFI selectMaxResultPrint(String codeCertifi,
			String codePers, String useYn) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codeCertifi", codeCertifi);
		paramMap.put("codePers", codePers);
		paramMap.put("useYn", useYn);

		return (KE_EDU_CERTIFI) selectOne(sqlSessionFactory2, "ke_edu.selectMaxResultPrint", paramMap);
	}

	public List<KE_EDU_OPERATOR> selectPassExamListByCertifi(
			String codeCertifi, String codePers, String resultEndDt,
			String[] seasonAry) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codeCertifi", codeCertifi);
		paramMap.put("codePers", codePers);
		paramMap.put("resultEndDt", resultEndDt);
		paramMap.put("seasonAry", seasonAry);
		return (List<KE_EDU_OPERATOR>) selectList(sqlSessionFactory2, "ke_edu.selectPassExamListByCertifi", paramMap);
	}
	
	/**
	 * 개인별 자격시험 신청 목록
	 * 
	 * @param codePers
	 * @return
	 * @throws PersistenceException
	 */
	public List<Map> selectExamOperatorRegList(String codePers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codePers", codePers);
		return (List<Map>)selectList(sqlSessionFactory4, "ke_edu.selectExamOperatorRegList", paramMap);
	}
	
	public List<KE_EDU_OPER_ADD_FILE> selectOperAddFileList(String operKey) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("operKey", operKey);
		return (List<KE_EDU_OPER_ADD_FILE>)selectList(sqlSessionFactory2, "ke_edu.selectOperAddFileList", paramMap);
	}

	public void updateExamCancel(Map paramMap) throws PersistenceException {
		update(sqlSessionFactory2, "ke_edu.updateExamCancel", paramMap);
	}
	
	

	/**
	 * 첨부파일 목록조회
	 * 
	 * @param operator
	 * @return
	 * @throws PersistenceException
	 */
	public List<KE_EDU_OPER_ADD_FILE> selectAddFileList(String operKey) 
			throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("operKey", operKey);
		return (List<KE_EDU_OPER_ADD_FILE>)selectList(sqlSessionFactory2, "ke_edu.selectAddFileList", paramMap);
	}
	
	/**
	 * 첨부파일 저장
	 * 
	 * @param operAddFile
	 * @throws PersistenceException
	 */
	public void insertOperAddFile(KE_EDU_OPER_ADD_FILE operAddFile)
			throws PersistenceException {
		insert(sqlSessionFactory2, "ke_edu.insertOperAddFile", operAddFile);
	}

	
	public List<Map> selectLastDuesList(String codePers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codePers", codePers);
		
		return (List<Map>)selectList(sqlSessionFactory2, "selectLastDuesList", paramMap );
	}
	
	public KE_EDU_CERTIFI selectChgCerti(String codeCertifi, String codePers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codeCertifi", codeCertifi);
		paramMap.put("codePers", codePers);
		return (KE_EDU_CERTIFI)selectOne(sqlSessionFactory2, "ke_edu.selectChgCerti", paramMap);
	}
	
	public List<Map> selectChgMarkCheckList(String codeCertifi, String codePers, String certStartDt, String certEndDt ) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codeCertifi", codeCertifi);
		paramMap.put("codePers", codePers);
		paramMap.put("certStartDt", certStartDt);
		paramMap.put("certEndDt", certEndDt);
		
		return (List<Map>)selectList(sqlSessionFactory2, "ke_edu.selectChgMarkCheckList", paramMap);
	}
	
	public void updateResultPrint(KE_EDU_CERTIFI certifi) throws PersistenceException {
		update(sqlSessionFactory2, "ke_edu.updateResultPrint", certifi);
	}
	
	public List<HashMap> selectReqResultPrintList(String codePers) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("codePers", codePers);
		return selectList(sqlSessionFactory2, "ke_edu.selectReqResultPrintList", paramMap);
	}
	
	//=========== 교육개설 신청 ============
	/** 
	 * 교육개설 신청
	 * 
	 * @param paramMap
	 * @throws PersistenceException
	 */
	
	public void insertEduEstablishment(Map paramMap)
			throws PersistenceException {
		insert(sqlSessionFactory2, "ke_edu.insertEduEstablishment", paramMap);
	}



	/* ================== 교육일정 ===================== */
	public List<PTB_EDUSCHEDULE> get_eduschedule_list(
			HashMap<String, Object> paramMap) throws PersistenceException {

		List<PTB_EDUSCHEDULE> schedulexList = null;

		try {
			schedulexList = selectList(sqlSessionFactory1, "ke_schedule.get_eduschedule_list", paramMap);

		} catch (PersistenceException pe) {
			log.error(pe);
			throw pe;
		}
		return schedulexList;
	}
	
	
	public PTB_EDUSCHEDULE get_eduschedule_detail(int ilindex) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("ilindex", ilindex);
		PTB_EDUSCHEDULE detail = (PTB_EDUSCHEDULE) selectOne(sqlSessionFactory3, "ke_schedule.get_eduschedule_detail", paramMap );
		return detail;
	}
	
	public void insert_eduschedule(PTB_EDUSCHEDULE eduschedule) throws PersistenceException {
		selectOne(sqlSessionFactory1, "ke_schedule.insert_eduschedule", eduschedule );
	}
	
	public void update_eduschedule(PTB_EDUSCHEDULE eduschedule) throws PersistenceException {
		selectOne(sqlSessionFactory1, "ke_schedule.update_eduschedule", eduschedule );
	}
	
	public void delete_eduschedule(int ilindex) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("ilindex", ilindex);
		selectOne(sqlSessionFactory1, "ke_schedule.delete_eduschedule", paramMap );
	}

	
	/*------------ 학술대회 관련 --------------*/
	/**
	 * 학술대회 신청수 조회
	 * 
	 * @param meeting
	 * @return
	 * @throws PersistenceException
	 */
	public int selectMeetingCount(KE_EDU_MEETING meeting) throws PersistenceException {
		return selectInt(sqlSessionFactory2, "ke_edu.selectMeetingCount", meeting);
	}
	
	public KE_EDU_MEETING insertMeeting(KE_EDU_MEETING meeting) throws PersistenceException {
		String idx = (String)selectOne(sqlSessionFactory2, "ke_edu.selectMeetingIdx", null);
		meeting.setIdx(idx);
		
		insert(sqlSessionFactory2, "ke_edu.insertMeeting", meeting);
		return meeting;
	}
	
	public void insertMeetingCancel(KE_EDU_MEETING_DEL cancel) throws PersistenceException {
		insert(sqlSessionFactory2, "ke_edu.insertMeetingDellist", cancel);
	}
	
	/*------------ 초록논문 관련 --------------*/
	public void insertEduGreen(KE_EDU_GREEN green) throws PersistenceException {
		insert(sqlSessionFactory2, "ke_edu.insertEduGreen", green);
	}
	
	public List<KE_EDU_GREEN> selectGreenList(String name, String tel_hp) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("name", name);
		paramMap.put("tel_hp", tel_hp);
		return (List<KE_EDU_GREEN>)selectList(sqlSessionFactory4, "ke_edu.selectGreenList", paramMap);
	}
	
	public KE_EDU_GREEN selectGreen(String idx) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("idx", idx);
		return (KE_EDU_GREEN)selectOne(sqlSessionFactory4, "ke_edu.selectGreen", paramMap);
	}
	
	public void updateEduGreen(KE_EDU_GREEN green) throws PersistenceException {
		update(sqlSessionFactory2, "ke_edu.updateEduGreen", green);
	}
	
	public void deleteEduGreen(KE_EDU_GREEN green) throws PersistenceException {
		delete(sqlSessionFactory2, "ke_edu.deleteEduGreen", green);
	}

	public List<KE_EDU_MEETING> selectMeetingList(String name, String tel_hp, String birth) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("name", name);
		paramMap.put("tel_hp", tel_hp);
		paramMap.put("birth", birth);
		return (List<KE_EDU_MEETING>)selectList(sqlSessionFactory4, "ke_edu.selectMeetingList", paramMap);
	}
}
