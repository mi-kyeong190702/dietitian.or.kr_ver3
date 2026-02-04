package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.RESIBOARD;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResiBoardDaoImpl implements ResiBoardDao 
{
	private Log log = LogFactory.getLog(ResiBoardDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	// ****************************************************************************//
	// ********************************RESI BOARD**********************************//
	// ****************************************************************************//
	
	public int count(Map paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int cnt = 0;
		try{
			cnt = (Integer)session.selectOne("resi_board_count", paramMap);
		}catch(Exception e){
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return cnt;
	}
	
	public List<RESIBOARD> list(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<RESIBOARD> boardList = null;	
		
		try{
			boardList = session.selectList("resi_board_list",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return boardList;
	}
	
	public List<RESIBOARD> select(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		List<RESIBOARD> boardList = null;	
		try{
			boardList = session.selectList("resi_board_select",paramMap);
		} catch(Exception e) {
			log.debug("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return boardList;
	}
	
	public RESIBOARD select_resi_serial_no(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		RESIBOARD board = null;	
		try
		{
			board = session.selectOne("resi_board_select_serial_no", paramMap);			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return board;
	}
	
	
	public int insert(RESIBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		int oindex = 0;
		try{
			oindex = session.insert("resi_board_insert", row);
						
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		return oindex;
	}
	
	public void update(RESIBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{			
			session.update("resi_board_update", row);
			
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
	public void delete(int oindex) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{
			session.update("resi_board_delete",oindex);
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}
	}
	
	 // 20160411 식단레시피 조회수 update 추가
	public void update_resi_read_no_count(int resi_serial_no) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{			
			session.update("update_resi_read_no_count", resi_serial_no);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
}
