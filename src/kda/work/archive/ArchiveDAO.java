package kda.work.archive;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.common.data.GROUPCODE;
import kda.work.archive.data.SIN_PAPER_BOARD;
import kda.work.archive.data.SIN_PAPER_BOARD_COMMENT;
import kda.work.archive.data.SIN_PERSON_INFO;

public interface ArchiveDAO {
	
	public int insert_sin_person_info(SIN_PERSON_INFO sin_person_info);
	
	public List<SIN_PERSON_INFO> select_sin_person_info(String id);
	
	public SIN_PERSON_INFO select_sin_person_info2(String id);
	
	public int insert_sin_paper_board(SIN_PAPER_BOARD sin_paper_board);
	
	public int update_sin_paper_board(SIN_PAPER_BOARD sin_paper_board);
	
	public List<SIN_PAPER_BOARD> select_sin_paper_board(String id);
	
	public List<SIN_PAPER_BOARD> select_all_paper_board(int cp,int list_size,int totalCount);
	
	public int cnt_select_all_paper_board();
	
	public List<SIN_PAPER_BOARD> select_paper_board_view(int idx);
	
	public int insert_sin_paper_board_comment(SIN_PAPER_BOARD_COMMENT sin_paper_board_comment);
	
	public List<SIN_PAPER_BOARD> select_search_all_sin_paper_board(String search_keyword, String search,int cp,int list_size);
	
	public List<SIN_PAPER_BOARD> select_search_all_sin_paper_board2(String search, String search_keyword, int board_page);
	
	public int cnt_select_search_all_sin_paper_board(String search_keyword, String search);
	
	public int update_sin_paper_board_handling(int idx);
	
	public int update_sin_paper_board_After(int idx, String board_handling);
	
	public int update_sin_paper_board_dept(int idx, String board_dept);
	
	public int update_sin_paper_board_com(int idx, String board_dept_com);
	
	public int delete_sin_paper_board(int idx);
	
	public int delete_sin_paper_board_comment(int idx);
	
	public int update_paper_board_mail(int idx);
	
	public int ka_sinmungo_person_update(SIN_PERSON_INFO info);
	
}
