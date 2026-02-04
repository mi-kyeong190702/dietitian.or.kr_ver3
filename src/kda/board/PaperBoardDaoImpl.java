package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDCOMMENTS;
import kda.board.data.PAPERBOARDSETTINGS;
import kda.main.data.SEARCH;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository
public class PaperBoardDaoImpl extends KdaAbstractMapper implements PaperBoardDao{
	private Log log = LogFactory.getLog(PaperBoardDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	@Autowired
	SqlSessionFactory sqlSessionFactory3;
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Autowired
	private DataSourceTransactionManager transactionManager1;
	
	@Override
	public float createNumber() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		float number = 0;
		try{
			number = session.selectOne("paper_board_create_number");
		}  catch(PersistenceException e) {
			log.info("error!", e);	
			throw e;
		} finally {
			session.close();
		}
		
		return number;
	}	
	
	@Override
	public int count(HashMap<String,Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		log.info("g_userid!!:"+ paramMap);
		int cnt = 0;
		try{
			cnt = (Integer)session.selectOne("paper_board_count", paramMap);
		}catch(Exception e){
			log.info("error!", e);	
			throw e;
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	@Override
	public List<PAPERBOARD> list(HashMap<String, Object> paramMap) throws NullPointerException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		List<PAPERBOARD> boardList = null;	
		
		String bbs_board_code = paramMap.get("bbs_board_code").toString();
		
		log.info("DAO paramMap!!:"+ paramMap);
		
		try{
			if( bbs_board_code.equals("89"))
				paramMap.put("page_per_cnt", 8);
				
			
			if( bbs_board_code.equals("25") || bbs_board_code.equals("26") || bbs_board_code.equals("27") || bbs_board_code.equals("2")
					|| bbs_board_code.equals("28") || bbs_board_code.equals("29") || bbs_board_code.equals("30") || bbs_board_code.equals("31") 
					|| bbs_board_code.equals("32") || bbs_board_code.equals("33") || bbs_board_code.equals("95") || bbs_board_code.equals("106") 
					|| bbs_board_code.equals("108")
					||  bbs_board_code.equals("126") ||  bbs_board_code.equals("128")
					){ //공지기능있음
				
				System.out.println("NOTICE ...... 2");
					boardList = session.selectList("paper_board_list_noti",paramMap);
					
			} else {
					if( (paramMap.get("g_userid"))!= null ){
						String chk_userid = paramMap.get("g_userid").toString();
						if(chk_userid.length() >= 9 && chk_userid.substring(0,9) == "ekdldjxm_"){
							chk_userid = chk_userid.substring(0,9);
						}
						log.info("test chk_userid!!:"+ chk_userid);
						paramMap.put("chk_userid", chk_userid);					
					}					
					boardList = session.selectList("paper_board_list",paramMap);
			}
		} catch(Exception e) {
			log.info("error!", e);	
			throw e;
		} finally {
			session.close();
		}
		
		return boardList;
	}
		
	@Override
	public List<PAPERBOARD> select(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		List<PAPERBOARD> boardList = null;	
		try{
			boardList = session.selectList("paper_board_select",paramMap);
			log.info("boardList :"+ boardList);
		} catch(Exception e) {
			log.info("select error e: ", e);
			throw e;
		} finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public PAPERBOARD selectIdx(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		PAPERBOARD board = null;	
		try
		{
			board = session.selectOne("paper_board_select_idx", paramMap);			
		} catch(Exception e) {
			log.info("selectIdx error e : ", e);
			throw e;
		} finally {
			session.close();
		}
		return board;
	}	
	
	@Override
	public int insert(PAPERBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		int bbs_idx = 0;
		try{
			bbs_idx = session.insert("paper_board_insert", row);
			
			if(row.getBbs_board_code().equals("2") || row.getBbs_board_code().equals("91")
					|| row.getBbs_board_code().equals("87")){
				session.update("paper_board_top_update",row);
				session.update("paper_board_top_orderedTop",row);
			}
		} catch(Exception e) {
			log.info("error! : ", e);
			throw e;
		} finally {
			session.commit();
			session.close();
		}
		
		return bbs_idx;
	}	
	
	@Override
	public void update(PAPERBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{			
			session.update("paper_board_update", row); 
			
			if(row.getBbs_board_code().equals("2") || row.getBbs_board_code().equals("91")
					|| row.getBbs_board_code().equals("87")){
				session.update("paper_board_top_update",row);
				session.update("paper_board_top_orderedTop",row);
			}
		} catch(Exception e) {
			log.info("paper_board_update error!", e);
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public void update_filedown_count(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{			
			session.update("paper_board_update_filedown_count", paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
	
	@Override
	public void update_view_count(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{			
			session.update("paper_board_update_view_count", paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}	
	
	@Override
	public void delete(int bbs_idx) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{
			log.info("delete : " + bbs_idx);
			session.update("paper_board_delete", bbs_idx);
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		} finally {
			session.close();
		}
	}			
	
	@Override
	public List<PAPERBOARDCOMMENTS> list_comments(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		List<PAPERBOARDCOMMENTS> boardCommentsList = null;	
		try{
			boardCommentsList = session.selectList("paper_board_comments_list", paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return boardCommentsList;
	}		
	
	@Override
	public PAPERBOARDCOMMENTS select_comments(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		PAPERBOARDCOMMENTS boardComments = null;	
		try{
			boardComments = (PAPERBOARDCOMMENTS) session.selectOne("paper_board_comments_select",paramMap);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
		return boardComments;
	}	
	
	@Override
	public boolean insert_comments(PAPERBOARDCOMMENTS row) throws PersistenceException
	{
		boolean result = false;
		
		// transaction 
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("insert_comments_transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager1.getTransaction(def);
				
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{
			
			session.update("bbs_comments_count_update_insert", row);
			session.insert("paper_board_comments_insert", row);
			
			transactionManager1.commit(status);
			
			result = true;
			
		} catch (PersistenceException e) {
			transactionManager1.rollback(status);
			log.info(e.toString());
		} catch(Exception e) {
			log.info(e.toString());
			throw e;
		}finally {			
			session.close();
		}
		
		return result;
	}
	
	@Override
	public void delete_comments(int bbs_idx, int bbc_idx) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		try{
			session.update("bbs_comments_count_update_delete",bbs_idx);
			session.delete("paper_board_comments_delete",bbc_idx);
		} catch(Exception e) {
			log.info("error!", e);
			throw e;
		} finally {
			session.close();
		}
	}
//		
//	@Override
//	public boolean delete_comments(int bbs_idx, int bbc_idx) throws PersistenceException
//	{
//		boolean result = false;
//		
//		// transaction 
//		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		def.setName("delete_comments_transaction");
//		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//		
//		TransactionStatus status = transactionManager1.getTransaction(def);
//				
//		SqlSession session = sqlSessionFactory3.openSession();
//		
//		try{
//			session.update("bbs_comments_count_update_delete",bbs_idx);
//			session.delete("paper_board_comments_delete",bbc_idx);
//			
//			result = true;
//			
//		} catch (PersistenceException e) {						
//			transactionManager1.rollback(status);
//			log.info(e.toString());
//		} catch(Exception e) {
//			log.info(e.toString());
//			throw e;
//		}finally {			
//			session.close();
//		}
//		
//		return result;
//	}
	
	@Override
	public PAPERBOARDSETTINGS settings(HashMap<String, Object> paramMap) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory3.openSession();
		
		PAPERBOARDSETTINGS settings = null;
		
		try{			
				settings = session.selectOne("paper_board_settings", paramMap);
				settings.setBs_admin((settings.getBs_admin()).replaceAll("\r\n", ",")); //관리자명단				
				settings.setBs_CategoryType((settings.getBs_CategoryType()).replaceAll("\r\n", ","));//분류 종류
				
		} catch(Exception e) {
			log.info("settings error!", e);
			throw e;
		} finally {
			session.close();
		}
		
		return settings;
	}

	@Override
	public int selectSearchCount(SEARCH search) throws PersistenceException {
		return selectInt(sqlSessionFactory1, "board.selectSearchCount", search);
	}
	
	@Override
	public List<Map> selectSearchList(SEARCH search)
			throws PersistenceException {
		return (List<Map>)selectList(sqlSessionFactory1, "board.selectSearchList", search);
	}

	@Override
	public List<PAPERBOARD> selectBoardTop(int bbs_board_no, String bbs_category) {
		Map paramMap = new HashMap();
		paramMap.put("bbs_board_no", bbs_board_no);
		paramMap.put("bbs_category", bbs_category);
		return (List<PAPERBOARD>)selectList(sqlSessionFactory1, "board.selectTopBoardList", paramMap);
	}
	
	@Override
	public void pointUpt(PAPERBOARD row) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		try{			
			if(!"".equals(row.getUpdate_point_pers()) && row.getUpdate_point_pers() !=null){
				session.update("pointUpt", row);
			}
		} catch(Exception e) {
			log.info("pointUpt error!", e);
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public int chkTeacher(String code_pers) throws PersistenceException {
		// TODO Auto-generated method stub
		return selectInt(sqlSessionFactory2, "board.chk_teacher", code_pers);
	}

	
	
}
