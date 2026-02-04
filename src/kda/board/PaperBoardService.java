package kda.board;

import java.util.List;
import java.util.Map;

import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDCOMMENTS;
import kda.board.data.PAPERBOARDSETTINGS;
import kda.main.data.SEARCH;

public interface PaperBoardService 
{	
	int count(String bbs_board_code, String bbs_category,  int bbs_search, String bbs_keyword, String g_userid) throws Exception;
 
	/**
	 * 게시판 목록조회 
	 * @param bbs_board_code
	 * @param bbs_category
	 * @param bbs_search
	 * @param bbs_keyword
	 * @param board_page
	 * @return
	 * @throws Exception
	 */
	List<PAPERBOARD> list(String bbs_board_code, String bbs_category,  int bbs_search, String bbs_keyword, int board_page, String g_userid) throws Exception;
	
	/**
	 * 게시판 목록조회 ( order by )
	 * 
	 * @param bbs_board_code
	 * @param bbs_category
	 * @param order
	 * @param bbs_search
	 * @param bbs_keyword
	 * @param board_page
	 * @return
	 * @throws Exception
	 */
	List<PAPERBOARD> list(String bbs_board_code, String bbs_category, String order,  int bbs_search, String bbs_keyword, int board_page, String g_userid) throws Exception;
	
	/**
	 * 게시판 상세보기
	 * 
	 * @param bbs_idx
	 * @param bbs_board_code
	 * @return
	 * @throws Exception
	 */
	List<PAPERBOARD> select(int bbs_idx, String bbs_board_code) throws Exception;
	
	/**
	 * 게시판 상세보기 (order by)
	 * 
	 * @param bbs_idx
	 * @param bbs_board_code
	 * @return
	 * @throws Exception
	 */
	List<PAPERBOARD> select(int bbs_idx, String bbs_board_code, String order) throws Exception;
	
	PAPERBOARD selectIdx(int bbs_idx) throws Exception;
	void insert(PAPERBOARD row) throws Exception;
	void update(PAPERBOARD row) throws Exception;
	void update_filedown_count(int bbs_idx, int num) throws Exception;
	void update_view_count(int bbs_idx) throws Exception;
	void delete(int bbs_idx) throws Exception;
	PAPERBOARDSETTINGS settings(String bbs_board_code) throws Exception;
	
	List<PAPERBOARDCOMMENTS> list_comments(int bbs_idx) throws Exception;	
	boolean insert_comments(PAPERBOARDCOMMENTS row) throws Exception;
	void delete_comments(int bbs_idx, int bbc_idx) throws Exception;
	
	public int getSearchCount(SEARCH search) throws Exception;
	
	public List<Map> getSearchList(SEARCH search) throws Exception;
	
	public List<PAPERBOARD> getBoardTop(int bbs_board_code, String bbs_category);
	
	void pointUpt(PAPERBOARD row) throws Exception;	 

	public int getChkTeacher(String code_pers) throws Exception;
}
