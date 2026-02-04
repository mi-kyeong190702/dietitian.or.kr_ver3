package kda.work.news;

import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;
import kda.work.news.data.KN_CALENDAR;
import kda.work.news.data.KN_EMPLOY;

public interface NewsService {
	List<KN_CALENDAR> get_schedulex_list(String yy, String mm) throws Exception;
	
	/* 구인정보 */
	/**
	 * 구인정보 목록 조회
	 * 
	 * @param listHelper
	 * @return
	 * @throws Exception
	 */
	public LIST_HELPER getEmployList(LIST_HELPER listHelper) throws Exception;
	
	/**
	 * 구인정보 상세보기
	 * 
	 * @param idx
	 * @return
	 * @throws Exception
	 */
	public KN_EMPLOY getEmploy(int idx) throws Exception;
	
	/**
	 * 조회수 증가
	 * 
	 * @param idx
	 * @throws Exception
	 */
	public void updateEmployViewCount(int idx) throws Exception;
	
	/**
	 * 이전/다음글 
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public List<Map> getEmployNavi(Map paramMap) throws Exception;
	
	/**
	 * 구인정보 입력
	 * @param employ
	 * @throws Exception
	 */
	public void insertEmploy(KN_EMPLOY employ) throws Exception;
	
	/**
	 * 구인정보 수정
	 * 
	 * @param employ
	 * @throws Exception
	 */
	public void updateEmploy(KN_EMPLOY employ) throws Exception;
	
	/**
	 * 구인정보 삭제
	 * 
	 * @param eindex
	 * @throws Exception
	 */
	public void deleteEmploy(int eindex) throws Exception;
	
	/**
	 * 댓글 가져오기
	 * 
	 * @param idx
	 * @return
	 * @throws Exception
	 */
	public List<Map> getEmployComment(int idx) throws Exception;
	
	public void insertEmployComment(Map requestMap) throws Exception;
	
	public void deleteEmployComment(int cIndex) throws Exception;
	
	public void insertJob(Map paramMap) throws Exception;
}
