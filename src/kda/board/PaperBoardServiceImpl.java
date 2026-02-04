package kda.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDCOMMENTS;
import kda.board.data.PAPERBOARDSETTINGS;
import kda.main.data.SEARCH;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaperBoardServiceImpl implements PaperBoardService {
	private Log log = LogFactory.getLog(PaperBoardServiceImpl.class);

	@Autowired
	PaperBoardDao dao;

	private List<Integer> makeCodeList(String bbs_board_code)
	{
		List<Integer> code_list = new ArrayList<Integer>();
	
		String [] bbs_board_code_split = bbs_board_code.split(",");
		if ( bbs_board_code_split.length > 1 ) {
			for ( int i = 0 ; i < bbs_board_code_split.length; i++ )
				code_list.add( Integer.parseInt(bbs_board_code_split[i] ) );	
		}
		else
		{
			code_list.add( Integer.parseInt( bbs_board_code ) );	
		}
		
		return code_list;
	}
	
	@Override
	public int count(String bbs_board_code
				   , String bbs_category
				   , int board_search
				   , String board_keyword
				   , String g_userid
				   ) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bbs_board_code"	, bbs_board_code);		
		paramMap.put("bbs_category"		, bbs_category);		
		paramMap.put("board_search"		, board_search);
		paramMap.put("board_keyword"	, board_keyword);
		paramMap.put("g_userid"			, g_userid);
		
		List<Integer> code_list = makeCodeList(bbs_board_code);
		paramMap.put("code_list"		, code_list);
		
		return dao.count(paramMap);
	}

	@Override
	public List<PAPERBOARD> list(String bbs_board_code
							   , String bbs_category
							   , int board_search
							   , String board_keyword
							   , int board_page
							   , String g_userid
							   )  throws Exception{
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		log.info("Service g_userid:"+ g_userid);
		
		paramMap.put("bbs_board_code"	, bbs_board_code);		
		paramMap.put("bbs_category"		, bbs_category);
		paramMap.put("board_search"		, board_search);
		paramMap.put("board_keyword"	, board_keyword);
		paramMap.put("board_page"		, board_page);		
		paramMap.put("g_userid"		, g_userid);
		
		List<Integer> code_list = makeCodeList(bbs_board_code);
		paramMap.put("code_list"		, code_list);
		
		return dao.list(paramMap);
		
	}
	
	
	
	@Override
	public List<PAPERBOARD>  select(int bbs_idx, String bbs_board_code ) throws Exception {
		return select(bbs_idx, bbs_board_code, null);
	}	
	
	@Override
	public List<PAPERBOARD> select(int bbs_idx, String bbs_board_code,
			String order) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_idx"			, bbs_idx);
		paramMap.put("bbs_board_code"	, bbs_board_code);
		paramMap.put("order", order);
		return dao.select(paramMap);
	}	
		
	@Override
	public PAPERBOARD  selectIdx(int bbs_idx) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_idx", bbs_idx);
		return dao.selectIdx(paramMap);
	}
	
	@Override
	public void insert(PAPERBOARD row) throws Exception {
		
		float number = dao.createNumber();		
		row.setBbs_m_number(number);		
		int key = dao.insert(row);
	}

	@Override
	public void update(PAPERBOARD row)  throws Exception
	{		
		dao.update(row);		
	}
	
	@Override
	public void update_filedown_count(int bbs_idx, int num) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_idx", bbs_idx);
		paramMap.put("num", num);
		dao.update_filedown_count(paramMap);
	}
	
	@Override
	public void update_view_count(int bbs_idx) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_idx", bbs_idx);
		dao.update_view_count(paramMap);
	}	
	
	@Override
	public void delete(int bbs_idx) throws Exception {
		dao.delete(bbs_idx);
	}	

	@Override
	public List<PAPERBOARDCOMMENTS> list_comments(int bbs_idx) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_idx", bbs_idx);		
		return dao.list_comments(paramMap);
	}
	
	@Override
	public boolean insert_comments(PAPERBOARDCOMMENTS row) throws Exception
	{	
		return dao.insert_comments(row);		
	}	
	

	@Override
	public void delete_comments(int bbs_idx, int bbc_idx) throws Exception
	{
		dao.delete_comments(bbs_idx, bbc_idx);
	}
	
	@Override
	public  PAPERBOARDSETTINGS   settings(String  bbs_board_code) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bs_code", bbs_board_code);
		return dao.settings(paramMap);
	}

	@Override
	public List<PAPERBOARD> list(String bbs_board_code, String bbs_category,
			String order, int bbs_search, String bbs_keyword, int board_page, String g_userid)
			throws Exception {
			
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bbs_board_code"	, bbs_board_code);		
		paramMap.put("bbs_category"		, bbs_category);
		paramMap.put("order", order);
		paramMap.put("board_search"		, bbs_search);
		paramMap.put("board_keyword"	, bbs_keyword);
		paramMap.put("board_page"		, board_page);		
		paramMap.put("g_userid"		, g_userid);
		
		List<Integer> code_list = makeCodeList(bbs_board_code);
		paramMap.put("code_list"		, code_list);
		
		return dao.list(paramMap);
	}

	
	
	@Override
	public List<Map> getSearchList(SEARCH search) throws Exception {
		return dao.selectSearchList(search);
	}

	@Override
	public int getSearchCount(SEARCH search) throws Exception {
		return dao.selectSearchCount(search);
	}

	@Override
	public List<PAPERBOARD> getBoardTop(int bbs_board_code, String bbs_category) {
		return dao.selectBoardTop( bbs_board_code, bbs_category );
	}
	
	@Override
	public void pointUpt(PAPERBOARD row) throws Exception {
		dao.pointUpt(row);
	}
 
	@Override
	public int getChkTeacher(String code_pers) throws Exception {
		// TODO Auto-generated method stub
		return dao.chkTeacher(code_pers);
	}
 
 
}
