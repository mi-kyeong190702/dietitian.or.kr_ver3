package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDCOMMENTS;
import kda.board.data.PAPERBOARDSETTINGS;
import kda.main.data.SEARCH;

import org.apache.ibatis.exceptions.PersistenceException;

public interface PaperBoardDao
{
	float createNumber();
	int count(HashMap<String,Object> pramMap);
	
	// ****************************************************************************//
	// *******************************PAPER BOARD**********************************//
	// ****************************************************************************//
	
	List<PAPERBOARD> list(HashMap<String, Object> paramMap) throws PersistenceException;
	List<PAPERBOARD> select(HashMap<String, Object> paramMap) throws PersistenceException;
	PAPERBOARD selectIdx(HashMap<String, Object> paramMap) throws PersistenceException;
	int insert(PAPERBOARD row) throws PersistenceException;
	void update(PAPERBOARD row) throws PersistenceException;
	void update_filedown_count(HashMap<String, Object> paramMap) throws PersistenceException;
	void update_view_count(HashMap<String, Object> paramMap) throws PersistenceException;
	void delete(int bbs_idx) throws PersistenceException;
	PAPERBOARDSETTINGS settings(HashMap<String, Object> paramMap) throws PersistenceException;
	
	// ****************************************************************************//
	// ****************************PAPER BOARD_COMMENTS****************************//
	// ****************************************************************************//
	
	List<PAPERBOARDCOMMENTS> list_comments(HashMap<String, Object> paramMap) throws PersistenceException;
	PAPERBOARDCOMMENTS select_comments(HashMap<String, Object> paramMap) throws PersistenceException;
	boolean insert_comments(PAPERBOARDCOMMENTS row) throws PersistenceException;
	void delete_comments(int bbs_idx, int bbc_idx) throws PersistenceException;
	
	public int selectSearchCount(SEARCH search) throws PersistenceException;
	
	public List<Map> selectSearchList(SEARCH search) throws PersistenceException;
	
	public List<PAPERBOARD> selectBoardTop(int bbs_board_no, String bbs_category);
	
	void pointUpt(PAPERBOARD row) throws PersistenceException;
	
	public int chkTeacher(String code_pers) throws PersistenceException;
	
}