package kda.admin.board;

import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.common.data.LIST_HELPER;

public interface AdminBoardService {
	
	public LIST_HELPER getBoardListHelper(LIST_HELPER list_HELPER) throws Exception;
	
	public ADMINPAPERBOARDSETTINGS getBoard(String bs_code) throws Exception;
	
	public void insertBoard(ADMINPAPERBOARDSETTINGS vo) throws Exception;
	
	public void updateBoard(ADMINPAPERBOARDSETTINGS vo) throws Exception;

}
