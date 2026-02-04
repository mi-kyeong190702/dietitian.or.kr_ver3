package kda.admin.board;

import java.util.HashMap;

import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService{
	
	@Autowired
	AdminBoardDao adminBoardDao;
	
	@Override
	public LIST_HELPER getBoardListHelper(LIST_HELPER listHelper)
			throws Exception {
		return adminBoardDao.selectBoardListHelper(listHelper);
	}
	
	@Override
	public ADMINPAPERBOARDSETTINGS getBoard(String bs_code)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bs_code", bs_code);
		
		return adminBoardDao.getBoard(map);
	}
	
	@Override
	public void insertBoard(ADMINPAPERBOARDSETTINGS vo)
			throws Exception {
		adminBoardDao.insertBoard(vo);
	}
	
	@Override
	public void updateBoard(ADMINPAPERBOARDSETTINGS vo)
			throws Exception {
		adminBoardDao.updateBoard(vo);
	}

}
