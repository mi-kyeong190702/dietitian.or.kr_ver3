package kda.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.common.data.GROUPCODE;
import kda.member.data.MEMBER;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;

public interface MemberService
{
	List<MEMBER> getMemberId(String uname, String pers_birth, String pers_hp) throws Exception;
	
	int setInitPw(String hp,  String uid) throws Exception;	
	String getMemberHp(String uid, String uname, String pers_birth) throws Exception;
	String getLicNo(String ck_val, String codePers) throws Exception;
	String getId(String ck_val) throws Exception;
	List<GROUPCODE> getGroupCode(String groupcode) throws Exception;
	
	public String insertMember(MEMBER_JOIN member_join) throws Exception;
	
	long getSumDues(String code_member, String code_bran) throws Exception;
	
	public List<Map> getPersonDuesList(String codePers) throws Exception;
	
	
	void insertReentrance(MEMBER_JOIN member_join) throws Exception;
	
	public void sendMemberMail(MEMBER_JOIN member_join) throws Exception;
	
	/* RYU JAE JOON 추가 */
	public PERSON_M_TBL getPersonMTblByCode(String codePers, boolean sp) throws Exception;
	public int getCountPerson(Map paramMap) throws Exception;
	public boolean insertEduMember(MEMBER_JOIN member_join) throws Exception;
	/**
	 * 면허번호 수정
	 * 
	 * @param codePers
	 * @param licNo
	 * @throws Exception
	 */
	public void updateLicNo(String codePers, String licNo) throws Exception;
	
	/* SSO 관련 */
	public Map getPersonByCertTemp(String codePrs) throws Exception;
	
	public Map checkMemberPerid(String uid, String compValue) throws Exception;
}
