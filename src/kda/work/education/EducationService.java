package kda.work.education;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.member.data.MEMBER_JOIN;
import kda.work.education.data.KE_EDU_CERTIFI;
import kda.work.education.data.KE_EDU_GREEN;
import kda.work.education.data.KE_EDU_MEETING;
import kda.work.education.data.KE_EDU_MEETING_DEL;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_OPER_ADD_FILE;
import kda.work.education.data.KE_EDU_TEST_NAME;
import kda.work.education.data.PTB_EDUSCHEDULE;

public interface EducationService {
	
	public List<KE_EDU_CERTIFI> getOldCertifiList(Map paramMap) throws Exception; /*20151201 구위생교육 자격증 출력*/

	public List<Map> getEduTestBranList(Map paramMap) throws Exception;
	
	public List<KE_EDU_TEST_NAME> getEduTestNameList(Map paramMap) throws Exception;
	
	public int getEduDupCount(KE_EDU_OPERATOR operator) throws Exception;
	
	public HashMap<String, Integer> getOperatorLimitPersCnt(KE_EDU_OPERATOR operator) throws Exception;
	
	public void regOperator(KE_EDU_OPERATOR operator) throws Exception;
	
	public KE_EDU_TEST_NAME getEduTestName(String eduId) throws Exception;
		
	/**
	 * 교육/테스트 신청 목록
	 * 
	 * @param year
	 * @param codePers
	 * @param operState
	 * @return
	 * @throws Exception
	 */
	public List<KE_EDU_OPERATOR> getOperatorList(String year, String codePers, String operState) throws Exception;
	
	/**
	 * 교육/테스트 신청 상세내역
	 * 
	 * @param year
	 * @param codePers
	 * @param operState
	 * @param operKey
	 * @return
	 * @throws Exception
	 */
	public KE_EDU_OPERATOR getOperator(String year, String codePers, String operState, String operKey) throws Exception;
	
	public void updateOperator(KE_EDU_OPERATOR operator) throws Exception;
	
	public List<KE_EDU_CERTIFI> getCerifiList(Map paramMap) throws Exception;
	
	public int getExamOperatorCount(Map paramMap) throws Exception;
	
	/**
	 * 재시험 검증
	 * 
	 * @param operator
	 * @return
	 * @throws Exception
	 */
	public boolean isExamValidReTest(KE_EDU_OPERATOR operator) throws Exception;
	
	/**
	 * 말소자 검증
	 * 
	 * @param operator
	 * @return 0 : 정상 , 1: 말소자 아님, 2: 합격자
	 * @throws Exception
	 */
	public int isExamValidExpire(KE_EDU_OPERATOR operator) throws Exception;
	
	/**
	 *  해당 시험 합격여부
	 *  
	 * @param operator
	 * @return Y : 합격자
	 * @throws Exception
	 */
	public String isExamPassFlag(KE_EDU_OPERATOR operator) throws Exception;
	
	/**
	 * 자격 시험 입력 
	 * 
	 * @param operator
	 * @throws Exception
	 */
	public String insertExamOperator(KE_EDU_OPERATOR operator) throws Exception;
	
	
	/**
	 * 개인별 자격시험 신청 목록조회
	 * 
	 * @param codePers 회원키
	 * @return
	 * @throws Exception
	 */
	public List<Map> getExamOperatorRegList(String codePers) throws Exception;
	
	/**
	 * 개인 자격시험 신청 취소
	 * 
	 * @param paramMap
	 * @throws Exception
	 */
	public void updateExamCancel(Map paramMap) throws Exception;
	
	
	/**
	 * 자격증 코드목록 조회
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map> getCertifiCodeList() throws Exception;
	
	/**
	 * 최신 자격증 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws Exception
	 */
	public KE_EDU_CERTIFI getMaxCertifi(String codeCertifi, String codePers, String  useYn) throws Exception;

	/**
	 * 자격증별 합격목록 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws Exception
	 */
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(String codeCertifi, String codePers) throws Exception;

	/**
	 * 말소일이후 합격 목록 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @param resultEndDt
	 * @return
	 * @throws Exception
	 */
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(String codeCertifi, String codePers, String resultEndDt) throws Exception;

	
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(String codeCertifi, String codePers,  String resultEndDt, String[] seasonAry) throws Exception;
	
	public List<Map> getLastDuesList(String codePers) throws Exception; 
	
	public List<Map> getChgMarkCheckList(String codeCertifi,  String codePers, String certStartDt, String certEndDt) throws Exception;
	
	/**
	 * 갱신 대상 자격증 조회
	 * 
	 * @param codeCertifi
	 * @param codePers
	 * @return
	 * @throws Exception
	 */
	public KE_EDU_CERTIFI getChgCerti(String codeCertifi, String codePers) throws Exception; 
	
	public void updateResultPrint(KE_EDU_CERTIFI certifi) throws Exception;
	
	/**
	 * 첨부파일 목록 조회
	 * 
	 * @param operKey
	 * @return
	 * @throws Exception
	 */
	public List<KE_EDU_OPER_ADD_FILE> getOperAddFileList(String operKey) throws Exception;
	
	/**
	 * 첨부파일 저장
	 * 
	 * @param addFile
	 * @throws Exception
	 */
	public void insertOperAddFile(KE_EDU_OPER_ADD_FILE operAddFile) throws Exception;
	
	/**
	 * 이전 첨부파일을 신규로 이관처리
	 * 
	 * @param operator
	 * @throws Exception
	 */
	public void moveOperPrevAddFile(KE_EDU_OPERATOR operator) throws Exception;
	
	
	public List<HashMap> getReqResultPrintList(String codePers) throws Exception;
	
	/**
	 * 개설 요청
	 * 
	 * @param paramMap
	 * @throws Exception
	 */
	public void insertEduEstablishment(Map paramMap) throws Exception;
	
	/**
	 * 교육생 수정
	 * 
	 * @param join
	 * @throws Exception
	 */
	public void updateTrainees(MEMBER_JOIN join) throws Exception;
	
	/*
	 * 평점인정 교육 일정
	 */
	List<PTB_EDUSCHEDULE> get_eduschedule_list(String yy, String mm) throws Exception;
	PTB_EDUSCHEDULE get_eduschedule_detail(int ilindex) throws Exception;
	public void insert_eduschedule(PTB_EDUSCHEDULE eduschedule) throws Exception;
	public void delete_eduschedule(int ilindex) throws Exception;
	public void update_eduschedule(PTB_EDUSCHEDULE eduschedule) throws Exception;

	/* --------------학술 대회 ------------------ */
	
	public int getMeetingCount(KE_EDU_MEETING meeting) throws Exception;
	
	public KE_EDU_MEETING insertMeeting(KE_EDU_MEETING meeting) throws Exception;
	
	public void insertMeetingCancel(KE_EDU_MEETING_DEL cancel) throws Exception;
	
	public void insertEduGreen(KE_EDU_GREEN green) throws Exception;
	
	public List<KE_EDU_GREEN> getGreenList(String name, String tel_hp) throws Exception;
	
	public KE_EDU_GREEN getGreen(String idx) throws Exception;
	
	public void updateEduGreen(KE_EDU_GREEN green) throws Exception;
	
	public void deleteEduGreen(KE_EDU_GREEN green) throws Exception;
	
	public List<KE_EDU_MEETING> getMeetingList(String name, String tel_hp, String birth) throws Exception;
}
