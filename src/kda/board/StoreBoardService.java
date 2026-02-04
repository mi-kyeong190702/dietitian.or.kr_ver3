package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.BOARDFILE;
import kda.board.data.BOOKBOARD;
import kda.board.data.CARTBOARD;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

import org.springframework.stereotype.Service;

public interface StoreBoardService 
{
	// ****************************************************************************//
	// ********************************BOOK BOARD**********************************//
	// ****************************************************************************//
	
	int count_book() throws Exception;
	List<BOOKBOARD> list_book(int board_search1, String board_search2, String board_keyword, int board_page) throws Exception;
	BOOKBOARD select_book(int oindex) throws Exception;
//	BOOKBOARD select_book_index(int oindex) throws Exception;
	void insert_book(BOOKBOARD row) throws Exception;
	void update_book(BOOKBOARD row) throws Exception;
	void delete_book(int oindex) throws Exception;
	
	// ****************************************************************************//
	// ********************************CART BOARD**********************************//
	// ****************************************************************************//
	
	int count_cart(String ctsessionid) throws Exception;	
	List<CARTBOARD> list_cart(String ctsessionid) throws Exception;
	CARTBOARD select_cart(String ctsessionid, int oindex) throws Exception;
	void insert_cart(CARTBOARD row) throws Exception;
	void update_cart(CARTBOARD row) throws Exception;
	void delete_cart(int ctIndex) throws Exception;
	
}
