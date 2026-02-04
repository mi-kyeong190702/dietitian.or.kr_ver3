package kda.mypage;
 
import java.util.List;
import java.util.Map;

import kda.member.data.MEMBER_JOIN;
import kda.mypage.data.MYLICENSEINFO;
import kda.mypage.data.MYMEMBERINFO;

public interface MyPageHService
{
	boolean setMyMemberInfo(MYMEMBERINFO memberInfo) throws Exception;
	boolean setMyPassword(MYMEMBERINFO memberInfo) throws Exception; 
	boolean setMyLicenseInfo(MYLICENSEINFO licenseInfo) throws Exception;
	
	public boolean updateTrainees(MEMBER_JOIN join) throws Exception;
	
	/**
	 * 나의 자격증 목록 조회
	 * 
	 * @param code_pers
	 * @return
	 * @throws Exception
	 */
	public List<Map> getMyCerifiList(String code_pers) throws Exception;
	
	/**
	 * 기존회원 재가입/입금 확인 (CMS 입금)
	 * 
	 * @param memberJoin
	 * @throws Exception
	 */
	public void insertDepositCms(MEMBER_JOIN member_join) throws Exception;
}
