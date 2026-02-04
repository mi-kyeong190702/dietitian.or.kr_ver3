package kda.work.research.community;

import java.util.HashMap;
import java.util.List;

import kda.work.research.community.data.ACTULPAPERBOARD;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	private Log log = LogFactory.getLog(CommunityServiceImpl.class);
	
	@Autowired
	CommunityDao dao;

	@Override
	public int getImptCount(String bbs_cd) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("bbs_cd", bbs_cd);

		return dao.getImptCount(map);

	}
	
	@Override
	public List<ACTULPAPERBOARD> imptList(String bbs_cd) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("bbs_cd", bbs_cd);

		return dao.imptList(map);
	}
	
	@Override
	public int getBoardCount(String bbs_cd, int board_search,
			String board_keyword) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bbs_cd", bbs_cd);
		map.put("board_search", board_search);
		map.put("board_keyword", board_keyword);
		
		return dao.getBoardCount(map);
		
	}
	
	@Override
	public List<ACTULPAPERBOARD> boardList(String bbs_cd, int board_search,
			String board_keyword, int board_page, int board_cnt) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bbs_cd", bbs_cd);
		map.put("board_search", board_search);
		map.put("board_keyword", board_keyword);
		map.put("board_page", board_page);
		map.put("board_cnt", board_cnt);
		
		return dao.boardList(map);
	}
	
	@Override
	public List<ACTULPAPERBOARD> replyList(int atc_sno) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("atc_sno", atc_sno);

		return dao.replyList(map);
	}
	
	@Override
	public List<ACTULPAPERBOARD> boardSelect(int atc_sno,String bbs_cd) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("atc_sno", atc_sno);
		map.put("bbs_cd", bbs_cd);
		
		return dao.boardSelect(map);
	}
	
	@Override
	public ACTULPAPERBOARD boardModify(int atc_sno,String bbs_cd) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("atc_sno", atc_sno);
		map.put("bbs_cd", bbs_cd);
		
		return dao.boardModify(map);
	}
	
	@Override
	public void boardInsert(ACTULPAPERBOARD vo) throws Exception{
		
		float number = dao.createNum();		
		vo.setAtc_no(number);
		dao.boardInsert(vo);
	}
	
	@Override
	public void boardDelete(int atc_sno) throws Exception{
		dao.boardDelete(atc_sno);
	}
	
	@Override
	public void boardUpdate(ACTULPAPERBOARD vo) throws Exception{
		dao.boardUpdate(vo);
	}
	
	@Override
	public void fileUpdate(ACTULPAPERBOARD vo) throws Exception{
		dao.fileUpdate(vo);
	}
	
	@Override
	public ACTULPAPERBOARD getMail(int atc_sno) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("atc_sno", atc_sno);
		return dao.getMail(map);
	}
	
	@Override
	public ACTULPAPERBOARD authCheck(String pass,int atc_sno) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pass", pass);
		map.put("atc_sno", atc_sno);
		
		return dao.authCheck(map);
	}
	
	@Override
	public List<ACTULPAPERBOARD> mainBoard() throws Exception{
		
		return dao.mainBoard();
	}
	
	@Override
	public ACTULPAPERBOARD getBoardSelect(int atc_sno,String bbs_cd) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("atc_sno", atc_sno);
		map.put("bbs_cd", bbs_cd);
		
		return dao.getBoardSelect(map);
	}
	
}
