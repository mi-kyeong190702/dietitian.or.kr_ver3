package kda.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.member.data.MEMBER_JOIN;
import kda.mypage.data.MYEDUINFO;
import kda.mypage.data.MYLICENSEINFO;
import kda.mypage.data.MYMEMBERINFO;

import org.apache.ibatis.exceptions.PersistenceException;

public interface MyPageHDao
{
	List<MYEDUINFO> getMyEduSituation(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduLicense(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduOlderly(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduOlderly2(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduSport(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduSport2(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduFeed(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduFeed2(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduHealth(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduHealth2(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduHygiene(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyEduRepair(HashMap<String, Object> paramMap) throws PersistenceException;
	List<MYEDUINFO> getMyPayment(HashMap<String, Object> paramMap) throws PersistenceException;
	Map getMyPayment_print(HashMap<String, Object> paramMap) throws PersistenceException;
	Map getMyPayment_user(HashMap<String, Object> paramMap) throws PersistenceException;
	Map getRcp_print(HashMap<String, Object> paramMap) throws PersistenceException;
	Map getSituation_print(HashMap<String, Object> paramMap) throws PersistenceException;
	
	List<Map> getCerti_print(HashMap<String, Object> paramMap) throws PersistenceException;
	Map getCertiName_print(HashMap<String, Object> paramMap) throws PersistenceException;
	void setPointAply(HashMap<String, Object> paramMap) throws PersistenceException;
	String getDocName(HashMap<String, Object> paramMap) throws PersistenceException;
	MYMEMBERINFO getMyMemberInfo(HashMap<String, Object> paramMap) throws PersistenceException;
	MYLICENSEINFO getMyLicenseInfo(HashMap<String, Object> paramMap) throws PersistenceException;
	boolean setMyMemberInfo(MYMEMBERINFO memberInfo) throws PersistenceException;
	boolean setMyLicenseInfo(MYLICENSEINFO licenseInfo) throws PersistenceException;
	MYMEMBERINFO getMyMagazine(HashMap<String, Object> paramMap) throws PersistenceException;
	boolean setMyPassword(MYMEMBERINFO memberInfo) throws PersistenceException;
	
	/* 교육생 관련*/
	public boolean updateTrainees(MEMBER_JOIN join) throws PersistenceException;
	
	/**
	 * 마이페이지 > 자격증 목록 조회
	 * 
	 * @param code_pers
	 * @return
	 * @throws PersistenceException
	 */
	public List<Map> selectMyCerifiList(String code_pers) throws PersistenceException;
	
	int getMyPaymentCount(HashMap<String, Object> paramMap)throws PersistenceException;
	void insertLog_print(HashMap<String, Object> paramMap)throws PersistenceException;
	
}