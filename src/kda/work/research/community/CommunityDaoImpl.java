package kda.work.research.community;

import java.util.HashMap;
import java.util.List;

import kda.work.research.community.data.ACTULPAPERBOARD;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	private Log log = LogFactory.getLog(CommunityDaoImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	@Override
	public int getImptCount(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		int cnt = 0;

		try {
			cnt = (Integer) session.selectOne("getImptCount", map);
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ACTULPAPERBOARD> imptList(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		List<ACTULPAPERBOARD> list = null;

		try {

			list = session.selectList("imptList", map);

		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}

		return list;

	}
	
	@Override
	public int getBoardCount(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int cnt = 0;
		
		try {
			cnt = (Integer) session.selectOne("getBoardCount", map);
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		return cnt;
	}
	
	@Override
	public List<ACTULPAPERBOARD> boardList(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULPAPERBOARD> list = null;
		
		try {
			
			list = session.selectList("boardList", map);
			
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public List<ACTULPAPERBOARD> replyList(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		List<ACTULPAPERBOARD> list = null;

		try {

			list = session.selectList("replyList", map);

		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}

		return list;

	}
	
	@Override
	public List<ACTULPAPERBOARD> boardSelect(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		List<ACTULPAPERBOARD> list = null;
		
		try {
			
			session.update("viewCount", map);
			
			list = session.selectList("boardSelect", map);
			
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		
		return list;
		
	}
	
	@Override
	public ACTULPAPERBOARD boardModify(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULPAPERBOARD vo = null;
		
		try {
			
			vo = session.selectOne("boardModify", map);
			
		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}
		
		return vo;
		
	}
	
	@Override
	public float createNum() throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		float number = 0;
		try{
			number = session.selectOne("createNum");
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {		
			session.close();
		}
		
		return number;
	}
	
	@Override
	public int boardInsert(ACTULPAPERBOARD vo) throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		int bbs_idx = 0;
		try{
			bbs_idx = session.insert("boardInsert", vo);
			session.update("ansUpdate", vo);
		} catch(Exception e) {
			log.info("error!", e);			
		} finally {
			session.commit();
			session.close();
		}
		
		return bbs_idx;
	}
	
	@Override
	public void boardDelete(int atc_sno)  throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		try{
			log.info("delete : " + atc_sno);
			session.update("boardDelete", atc_sno);
		} catch(Exception e) {
			log.info(e.toString());
		} finally {
			session.close();
		}
	}
	
	@Override
	public void boardUpdate(ACTULPAPERBOARD vo)  throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		try{
			session.update("boardUpdate", vo);
		} catch(Exception e) {
			log.info(e.toString());
		} finally {
			session.close();
		}
	}
	
	@Override
	public void fileUpdate(ACTULPAPERBOARD vo)  throws PersistenceException
	{
		SqlSession session = sqlSessionFactory2.openSession();
		
		try{
			session.update("fileUpdate", vo);
		} catch(Exception e) {
			log.info(e.toString());
		} finally {
			session.close();
		}
	}
	
	@Override
	public ACTULPAPERBOARD getMail(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULPAPERBOARD vo = null;
		
		try {
			vo = session.selectOne("getMail", map);
		} catch (Exception e) {
			log.info(e.toString());
		} finally {
			session.close();
		}
		return vo;
	}
	
	@Override
	public ACTULPAPERBOARD authCheck(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();
		
		ACTULPAPERBOARD vo = null;
		
		try {
			vo = session.selectOne("authCheck", map);
		} catch (Exception e) {
			log.info(e.toString());
		} finally {
			session.close();
		}
		return vo;
	}
	
	@Override
	public List<ACTULPAPERBOARD> mainBoard() throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		List<ACTULPAPERBOARD> list = null;

		try {

			list = session.selectList("mainBoard");

		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}

		return list;

	}
	
	@Override
	public ACTULPAPERBOARD getBoardSelect(HashMap<String, Object> map) throws PersistenceException{
		SqlSession session = sqlSessionFactory2.openSession();

		ACTULPAPERBOARD board = null;

		try {

			board = session.selectOne("getBoardSelect",map);

		} catch (Exception e) {
			log.info("error!", e);
		} finally {
			session.close();
		}

		return board;

	}

}
