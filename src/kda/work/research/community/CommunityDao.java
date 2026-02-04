package kda.work.research.community;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.research.community.data.ACTULPAPERBOARD;


public interface CommunityDao {

	int getImptCount(HashMap<String,Object> map) throws PersistenceException;
	
	List<ACTULPAPERBOARD> imptList(HashMap<String, Object> map) throws PersistenceException;
	
	int getBoardCount(HashMap<String,Object> map) throws PersistenceException;
	
	List<ACTULPAPERBOARD> boardList(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULPAPERBOARD> replyList(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULPAPERBOARD> boardSelect(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULPAPERBOARD boardModify(HashMap<String, Object> map) throws PersistenceException;
	
	float createNum() throws PersistenceException;
	
	int boardInsert(ACTULPAPERBOARD vo) throws PersistenceException;
	
	void boardDelete(int atc_sno) throws PersistenceException;
	
	void boardUpdate(ACTULPAPERBOARD vo) throws PersistenceException;
	
	void fileUpdate(ACTULPAPERBOARD vo) throws PersistenceException;
	
	ACTULPAPERBOARD getMail(HashMap<String, Object> map) throws PersistenceException;
	
	ACTULPAPERBOARD authCheck(HashMap<String, Object> map) throws PersistenceException;
	
	List<ACTULPAPERBOARD> mainBoard() throws PersistenceException;
	
	ACTULPAPERBOARD getBoardSelect(HashMap<String,Object> map) throws PersistenceException;

}
