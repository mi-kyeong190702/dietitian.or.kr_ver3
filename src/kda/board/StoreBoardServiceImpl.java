package kda.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kda.board.data.PAPERBOARD;
import kda.board.data.BOOKBOARD;
import kda.board.data.CARTBOARD;

import kda.work.publication.payment.data.PTB_BUYADDRESS;

@Service
public class StoreBoardServiceImpl implements StoreBoardService {
	private Log log = LogFactory.getLog(StoreBoardServiceImpl.class);

	@Autowired
	StoreBoardDao dao;
	
	// ****************************************************************************//
	// ********************************BOOK BOARD**********************************//
	// ****************************************************************************//
	
	public int count_book() throws Exception
	{
		return dao.count_book();
	}
	
	@Override
	public List<BOOKBOARD> list_book( int board_search1
									, String board_search2
									, String board_keyword
									, int board_page ) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("board_search1", board_search1);
		paramMap.put("board_search2", board_search2);
		paramMap.put("board_keyword", board_keyword);
		paramMap.put("board_page", board_page);
		
		return dao.list_book(paramMap);
	}
	
	public BOOKBOARD select_book(int oindex) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oindex", oindex);
		return dao.select_book(paramMap);
	}
	
	public void insert_book(BOOKBOARD row) throws Exception
	{
		dao.insert_book(row);
	}
	
	public void update_book(BOOKBOARD row) throws Exception
	{
		dao.update_book(row);
	}
	
	public void delete_book(int oindex) throws Exception
	{
		dao.delete_book(oindex);
	} 
	
	// ****************************************************************************//
	// ********************************CART BOARD**********************************//
	// ****************************************************************************//
	
	public int count_cart(String ctsessionid) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ctsessionid", ctsessionid);		
		return dao.count_cart(paramMap);
	}
	
	public List<CARTBOARD> list_cart(String ctsessionid) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ctsessionid", ctsessionid);
		return dao.list_cart(paramMap);
	}
	
	public CARTBOARD select_cart(String ctsessionid, int oindex) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ctsessionid", ctsessionid);
		paramMap.put("oindex", oindex);
		return dao.select_cart(paramMap);
	}
	
	public void insert_cart(CARTBOARD row) throws Exception
	{
		dao.insert_cart(row);
	}
	
	public void update_cart(CARTBOARD row) throws Exception
	{
		dao.update_cart(row);
	}
	
	public void delete_cart(int ctIndex) throws Exception
	{
		dao.delete_cart(ctIndex);
	}
	
}
