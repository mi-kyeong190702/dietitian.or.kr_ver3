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

import kda.board.data.RESIBOARD;

@Service
public class ResiBoardServiceImpl implements ResiBoardService {
	private Log log = LogFactory.getLog(StoreBoardServiceImpl.class);

	@Autowired
	ResiBoardDao dao;
	
	// ****************************************************************************//
	// ********************************RESI BOARD**********************************//
	// ****************************************************************************//
	
	public int count(int board_search , String board_keyword) throws Exception
	{
		Map paramMap = new HashMap();
		paramMap.put("board_search", board_search);
		paramMap.put("board_keyword", board_keyword);
		return dao.count(paramMap);
	}
	
	@Override
	public List<RESIBOARD> list( int board_search
									, String board_keyword
									, int board_page ) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("board_search", board_search);
		paramMap.put("board_keyword", board_keyword);
		paramMap.put("board_page", board_page);
		
		return dao.list(paramMap);
	}
	
	public List<RESIBOARD> select(int resi_serial_no) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("resi_serial_no", resi_serial_no);
		return dao.select(paramMap);
	}
	
	public RESIBOARD select_resi_serial_no(int resi_serial_no) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("resi_serial_no", resi_serial_no);
		return dao.select_resi_serial_no(paramMap);
	}	
	
	public void insert(RESIBOARD row) throws Exception
	{
		dao.insert(row);
	}
	
	public void update(RESIBOARD row) throws Exception
	{
		dao.update(row);
	}
	
	public void delete(int oindex)  throws Exception
	{
		dao.delete(oindex);
	}
	
	@Override   // 20160411 식단레시피 조회수 update 추가
	public void update_resi_read_no_count(int resi_serial_no) throws Exception
	{

		dao.update_resi_read_no_count(resi_serial_no);
	}	
	
	
}
