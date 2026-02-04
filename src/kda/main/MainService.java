package kda.main;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.common.data.LIST_HELPER;
import kda.main.data.BANNER;
import kda.mypage.data.MYMEMBERINFO;

public interface MainService {

	
	public List<BANNER> getMainBannerList() throws Exception;
	
	/**
	 * 배너 목록 조회
	 * 
	 * @param listHelper
	 * @return
	 * @throws Exception
	 */
	public LIST_HELPER getBannerListHelper(LIST_HELPER listHelper) throws Exception;
	
	/**
	 * 배너 상세 조회
	 * 
	 * @param idx
	 * @return
	 * @throws Exception
	 */
	public BANNER getBanner(int idx) throws Exception;
	
	/**
	 * 배너 입력
	 * 
	 * @param banner
	 * @throws Exception
	 */
	public void insertBanner(BANNER banner) throws Exception;
	
	/**
	 * 배너 수정
	 * 
	 * @param banner
	 * @throws Exception
	 */
	public void updateBanner(BANNER banner) throws Exception;
	
	/**
	 * 배너 삭제
	 * 
	 * @param idx
	 * @throws Exception
	 */
	public void deleteBanner(int idx) throws Exception;
	
	/**
	 * 로그 저장
	 * 
	 * @param date
	 * @param time
	 * @throws Exception
	 */
	public void saveLog(String date, String time) throws Exception;
	
	/**
	 * 배너 로그 저장
	 * 
	 * @param date
	 * @param time
	 * @param bannerIdx
	 * @throws Exception
	 */
	public void saveLogBanner(String date, String time, int bannerIdx) throws Exception;
	
	public void saveLogMember(String code_pers, String pers_name, String date, String time, String page_title) throws Exception;
	
	public MYMEMBERINFO getSend_edu(String id, String gubun) throws Exception;
}
