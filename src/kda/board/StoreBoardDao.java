package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.BOOKBOARD;
import kda.board.data.CARTBOARD;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

import org.apache.ibatis.exceptions.PersistenceException;

public interface StoreBoardDao
{
	// ****************************************************************************//
	// ********************************BOOK BOARD**********************************//
	// ****************************************************************************//
	
	int count_book() throws PersistenceException; 
	List<BOOKBOARD> list_book(HashMap<String, Object> paramMap) throws PersistenceException;
	BOOKBOARD select_book(HashMap<String, Object> paramMap) throws PersistenceException;
//	BOOKBOARD select_book_index(HashMap<String, Object> paramMap);
	int insert_book(BOOKBOARD row) throws PersistenceException;
	void update_book(BOOKBOARD row) throws PersistenceException;
	void delete_book(int oindex) throws PersistenceException;
	
	// ****************************************************************************//
	// ********************************CART BOARD**********************************//
	// ****************************************************************************//
	
	int count_cart(HashMap<String, Object> paramMap) throws PersistenceException;
	List<CARTBOARD> list_cart(HashMap<String, Object> paramMap) throws PersistenceException;
	CARTBOARD select_cart(HashMap<String, Object> paramMap) throws PersistenceException;
	int insert_cart(CARTBOARD row) throws PersistenceException;
	int update_cart(CARTBOARD row) throws PersistenceException;
	void delete_cart(int ctIndex) throws PersistenceException;
	
}