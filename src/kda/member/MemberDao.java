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

import org.apache.ibatis.exceptions.PersistenceException;

public interface MemberDao
{
	List<MEMBER> getMemberId(HashMap<String, String> pramMap) throws PersistenceException;
	String getMemberHp(HashMap<String, String> pramMap) throws PersistenceException;
	int setInitPw(HashMap<String, String> pramMap) throws PersistenceException;	
	String getLicNo(HashMap<String, String> pramMap) throws PersistenceException;
	String getId(HashMap<String, String> pramMap) throws PersistenceException;
	String getCodePers(HashMap<String, String> pramMap) throws PersistenceException;
	String getMaxCodePers() throws PersistenceException;
	int getMasDuesHSeqCMS() throws PersistenceException;
	List<GROUPCODE> getGroupCode(HashMap<String, String> paramMap) throws PersistenceException;
	List<DUES> getDuesBranList(String code_bran) throws PersistenceException;
	
	/**
	 * 재가입 회비목록 조회
	 * 
	 * @param code_bran
	 * @return
	 * @throws PersistenceException
	 */
	public List<DUES> getReDuesList(String code_bran) throws PersistenceException;
	
	/**
	 * 회원가입
	 * 
	 * @param member_join
	 * @throws PersistenceException
	 */
	public String insertMember(MEMBER_JOIN member_join) throws PersistenceException;

	/**
	 * 회비내역 전체 조회
	 * 
	 * @param paramMap
	 * @return
	 * @throws PersistenceException
	 */
	public List<Map> selectPersonDuesList(String codePers) throws PersistenceException;
	
	public long getSumDues(HashMap<String, String> paramMap ) throws PersistenceException;
	
	public void insertReentrance(MEMBER_JOIN member_join) throws PersistenceException;
	
	String getDuesMonth() throws PersistenceException;
	List<TRUST_COMPANY> getTrustCompanyList(String trust_name) throws PersistenceException;
	int insert_trust_company(HashMap<String, String> pramMap)  throws PersistenceException;
	
	/**
	 * 면허 번호 수정
	 * 
	 * @param codePers
	 * @param licNo
	 * @throws Exception
	 */
	public void updateLicNo(String codePers, String licNo) throws Exception;
	
	/* 교육 관련 */
	/**
	 * codePers를 통한 회원 조회 
	 *
	 * @param codePers
	 * @param sp
	 * @return
	 * @throws PersistenceException
	 */
	public PERSON_M_TBL selectMemberByKey(String codePers, boolean sp) throws PersistenceException;
	
	/**
	 * 교육생 등록확인
	 * 
	 * @param paramMap
	 * @return
	 * @throws PersistenceException
	 */
	public int selectCountPerson(Map paramMap) throws PersistenceException;
	/**
	 * 교육생 등록
	 * 
	 * @param member_join
	 * @return
	 * @throws PersistenceException
	 */
	public boolean insertEduMember(MEMBER_JOIN member_join) throws PersistenceException;
	
	public Map selectPersonByCertTemp(String codePers) throws PersistenceException;
	
	/**
	 * 회원가입 체크 후 회원 코드 반환
	 * 
	 * @param uid
	 * @param compVal
	 * @return
	 * @throws PersistenceException
	 */
	public Map selectCheckMemberById(String uid, String compVal) throws PersistenceException; 
	
	/**
	 * 회원의 회비 유효기간 목록
	 * 
	 * @param code_pers
	 * @return
	 * @throws PersistenceException
	 */
	public List<Map> selectMemberDuePeriodList(String code_pers) throws PersistenceException;
	
	/**
	 * CMS 재가입 저장
	 * 
	 * @param member_join
	 * @throws PersistenceException
	 */
	public void insert_dues_h_tbl_cms(MEMBER_JOIN member_join) throws PersistenceException;
	
}