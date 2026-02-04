package kda.board;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.exceptions.PersistenceException;

import kda.board.data.BOOKBOARD;
import kda.board.data.CARTBOARD;
import kda.board.data.PAPERBOARD;
import kda.work.publication.payment.data.PTB_BUYADDRESS;

@Repository
public class StoreBoardDaoImpl implements StoreBoardDao 
{
	private Log log = LogFactory.getLog(StoreBoardDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory3;
	
	
	// ****************************************************************************//
	// ********************************BOOK BOARD**********************************//
	// ****************************************************************************//
	
	public int count_book() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int cnt = 0;
		try{
			cnt = (Integer)session.selectOne("book_board_count");
		}catch(Exception e){
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return cnt;
	}
	
	public List<BOOKBOARD> list_book(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<BOOKBOARD> boardList = null;	
		
		try{
			boardList = session.selectList("book_board_list",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return boardList;
	}
	
	public BOOKBOARD select_book(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		BOOKBOARD board = null;	
		try{
			board = session.selectOne("book_board_select",paramMap);
			log.info("select_book  board :"+ board );
			
		} catch(Exception e) {
			log.debug("select_book error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return board;
	}
		
	public int insert_book(BOOKBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int oindex = 0;
		try{
			oindex = session.insert("book_board_insert", row);
						
		} catch(Exception e) {
			log.info("insert_book error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return oindex;
	}
	
	public void update_book(BOOKBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		log.info("===================================================[update_book]");
		try{			
			session.update("book_board_update", row);
			
		} catch(Exception e) {
			log.info("update_book error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
	public void delete_book(int oindex) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{
			session.update("book_board_delete",oindex);
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}
	}
	
	// ****************************************************************************//
	// ********************************CART BOARD**********************************//
	// ****************************************************************************//
		
	public int count_cart(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int cnt = 0;
		try{
			cnt = (Integer)session.selectOne("cart_board_count", paramMap);
		}catch(Exception e){
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return cnt;
	}
	
	public List<CARTBOARD> list_cart(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<CARTBOARD> boardList = null;	
		
		try{
			boardList = session.selectList("cart_board_list",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return boardList;
	}
	
	public CARTBOARD select_cart(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		CARTBOARD board = null;	
		try{
			board = session.selectOne("cart_board_select",paramMap);
		} catch(Exception e) {
			log.debug("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return board;
	}
	
	public int insert_cart(CARTBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int ctindex = 0;
		try{
			ctindex = session.insert("cart_board_insert", row);
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return ctindex;
	}
	
	public int update_cart(CARTBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int ctindex = 0;
		try{
			ctindex = session.update("cart_board_update", row);
		} catch(Exception e) {
			log.info("update_cart error!", e);
			throw e;
		} finally {
			session.close();
		}
		return ctindex;
	}	
	
	public void delete_cart(int ctIndex) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{
			session.update("cart_board_delete",ctIndex);
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}
	}
}
