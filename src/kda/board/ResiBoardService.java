package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.RESIBOARD;

import org.springframework.stereotype.Service;

public interface ResiBoardService 
{
	// ****************************************************************************//
	// ********************************RESI BOARD**********************************//
	// ****************************************************************************//
	
	public int count(int board_search , String board_keyword) throws Exception;
	
	List<RESIBOARD> list(int board_search, String board_keyword, int board_page) throws Exception;
	List<RESIBOARD> select(int resi_serial_no) throws Exception;
	RESIBOARD select_resi_serial_no(int resi_serial_no) throws Exception;
	void insert(RESIBOARD row) throws Exception;
	void update(RESIBOARD row) throws Exception;
	void delete(int oindex) throws Exception;
	
	void update_resi_read_no_count(int resi_serial_no) throws Exception;  // 20160411 식단레시피 조회수 update 추가
	
}
