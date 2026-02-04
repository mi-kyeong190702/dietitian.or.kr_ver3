package kda.work.archive;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;

import kda.SessionInfo;
import kda.common.data.GROUPCODE;
import kda.member.MemberDao;
import kda.spring.abstr.KdaAbstractMapper;
import kda.work.archive.data.SIN_PAPER_BOARD;
import kda.work.archive.data.SIN_PAPER_BOARD_COMMENT;
import kda.work.archive.data.SIN_PERSON_INFO;

@Repository
public class ArchiveImpl extends KdaAbstractMapper implements ArchiveDAO{
	
	private Log log=LogFactory.getLog(ArchiveImpl.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;

	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager2;
	
	
	public int insert_sin_person_info(SIN_PERSON_INFO sin_person_info){
		
		SqlSession session = sqlSessionFactory2.openSession();
		int result=session.insert("insert_sin_person_info", sin_person_info);
		
		return result;
	}
	
	public List<SIN_PERSON_INFO> select_sin_person_info(String id){
		
		SqlSession session = sqlSessionFactory2.openSession();
		List<SIN_PERSON_INFO> list=session.selectList("select_sin_person_info", id);
		
		return list;
	}
	
	public SIN_PERSON_INFO select_sin_person_info2(String id){
		
		SqlSession session = sqlSessionFactory2.openSession();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		
		SIN_PERSON_INFO info =session.selectOne("select_sin_person_info2", paramMap);
		return info;
	}
	
	public int update_sin_paper_board(SIN_PAPER_BOARD sin_paper_board){
		SqlSession session =sqlSessionFactory2.openSession();
		int result=session.update("update_sin_paper_board", sin_paper_board);
		return result;
		
	}
	
	public int insert_sin_paper_board(SIN_PAPER_BOARD sin_paper_board){
		SqlSession session =sqlSessionFactory2.openSession();
		int result=session.insert("insert_sin_paper_board", sin_paper_board);
		
		return result;
		
	}
	
	public List<SIN_PAPER_BOARD> select_sin_paper_board(String id){
		HashMap<String, String> hmap=new HashMap<String, String>();
		hmap.put("id", id);
		/*hmap.put("search", search);*/
		log.debug(hmap);
		SqlSession session = sqlSessionFactory2.openSession();
		List list=session.selectList("select_sin_paper_board", id);	
		log.debug(session.selectList("select_sin_paper_board"));
		return list;
	}
	public List<SIN_PAPER_BOARD> select_all_paper_board(int cp,int list_size,int totalCount){
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int endnum=totalCount-((cp-1)*list_size+1);
		int startnum=totalCount-(cp*list_size);
		map.put("startnum", startnum);
		map.put("endnum", endnum);		
		
		SqlSession session = sqlSessionFactory2.openSession();
		List list=session.selectList("select_all_paper_board",map);
		return list;
	}
	
	public int cnt_select_all_paper_board(){
		SqlSession session = sqlSessionFactory2.openSession();
		int count=session.selectOne("cnt_select_all_paper_board");
		return count;
	}
	
	
	public List<SIN_PAPER_BOARD> select_paper_board_view(int idx){
		SqlSession session = sqlSessionFactory2.openSession();
		List list=session.selectList("select_paper_board_view",idx);
		return list;
	}
	
	public int insert_sin_paper_board_comment(SIN_PAPER_BOARD_COMMENT sin_paper_board_comment){
		SqlSession session =sqlSessionFactory2.openSession();
		int result=session.insert("insert_board_comment", sin_paper_board_comment);
		
		return result;
	}
	
	public int cnt_select_search_all_sin_paper_board(String search_keyword, String search){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("search_keyword", search_keyword);
		map.put("search", search);
		int count=session.selectOne("cnt_select_search_all_sin_paper_board", map);
		return count;
	}
	
	public List<SIN_PAPER_BOARD> select_search_all_sin_paper_board(String search_keyword, String search,int cp, int list_size){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, Object> map=new HashMap<String, Object>();
		int startnum=(cp-1)*list_size+1;
		int endnum=cp*list_size;
		map.put("startnum", startnum);
		map.put("endnum", endnum);	
		map.put("search_keyword", search_keyword);
		map.put("search", search);
		List list=session.selectList("select_search_all_sin_paper_board", map);
		return list;
	}
	
	public List<SIN_PAPER_BOARD> select_search_all_sin_paper_board2(String search, String search_keyword, int board_page){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("search_keyword", search_keyword);
		map.put("search", search);
		map.put("board_page", board_page);
		List list=session.selectList("select_search_all_sin_paper_board2", map);
		return list;
	}
	
	public int update_sin_paper_board_handling(int idx){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, String> map=new HashMap<String, String>();
		String board_handling="답변";
		map.put("idx", String.valueOf(idx));
		map.put("board_handling", board_handling);
		int result=session.update("update_sin_paper_board_handling", map);
		return result;
	}
	
	public int update_sin_paper_board_After(int idx,String board_handling){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("idx", String.valueOf(idx));
		map.put("board_handling", board_handling);
		int result=session.update("update_sin_paper_board_After", map);
		return result;
	}
	
	public int update_sin_paper_board_dept(int idx, String board_dept){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("idx", String.valueOf(idx));
		map.put("board_dept", board_dept);
		int result=session.update("update_sin_paper_board_dept", map);
		return result;
	}
	
	public int delete_sin_paper_board(int idx){
		SqlSession session=sqlSessionFactory2.openSession();
		int result=session.update("delete_sin_paper_board", idx);
		return result;
	}
	
	public int delete_sin_paper_board_comment(int idx){
		SqlSession session=sqlSessionFactory2.openSession();
		int result=session.update("delete_sin_paper_board_comment", idx);
		return result;
	}
	
	public int update_sin_paper_board_com(int idx, String board_dept_com){
		log.debug(board_dept_com);
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("idx", String.valueOf(idx));
		map.put("board_dept_com", board_dept_com);
		int result=session.update("update_sin_paper_board_com", map);
		return result;
	}
	
	public int update_paper_board_mail(int idx){
		SqlSession session=sqlSessionFactory2.openSession();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("idx", String.valueOf(idx));
		int result=session.update("update_paper_board_mail", map);
		return result;
	}
	
	public int ka_sinmungo_person_update(SIN_PERSON_INFO info){
		SqlSession session =sqlSessionFactory2.openSession();
		int result=session.update("update_sinmungo_person", info);
		return result;
		
	}
}


