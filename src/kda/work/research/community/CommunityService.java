package kda.work.research.community;

import java.util.List;

import kda.work.research.community.data.ACTULPAPERBOARD;


public interface CommunityService {
	
	int getImptCount(String bbs_cd) throws Exception;
	
	List<ACTULPAPERBOARD> imptList(String bbs_cd) throws Exception;
	
	int getBoardCount(String bbs_cd, int bbs_search, String bbs_keyword) throws Exception;
	
	List<ACTULPAPERBOARD> boardList(String bbs_cd,  int bbs_search, String bbs_keyword, int board_page, int board_cnt) throws Exception;
	
	List<ACTULPAPERBOARD> replyList(int atc_sno) throws Exception;
	
	List<ACTULPAPERBOARD> boardSelect(int atc_sno,String bbs_cd) throws Exception;
	
	ACTULPAPERBOARD boardModify(int atc_sno,String bbs_cd) throws Exception;
	
	void boardInsert(ACTULPAPERBOARD vo) throws Exception;
	
	void boardDelete(int atc_sno) throws Exception;
	
	void boardUpdate(ACTULPAPERBOARD vo) throws Exception;
	
	void fileUpdate(ACTULPAPERBOARD vo) throws Exception;
	
	ACTULPAPERBOARD getMail(int atc_sno) throws Exception;
	
	ACTULPAPERBOARD authCheck(String pass,int atc_sno) throws Exception;
	
	List<ACTULPAPERBOARD> mainBoard() throws Exception;
	
	ACTULPAPERBOARD getBoardSelect(int atc_sno,String bbs_cd) throws Exception;

}
