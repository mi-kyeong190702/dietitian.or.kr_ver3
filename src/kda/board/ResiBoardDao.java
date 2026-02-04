package kda.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.board.data.RESIBOARD;


public interface ResiBoardDao
{
	int count(Map paramMap) throws PersistenceException; 
	List<RESIBOARD> list(HashMap<String, Object> paramMap) throws PersistenceException;
	List<RESIBOARD> select(HashMap<String, Object> paramMap) throws PersistenceException;
	RESIBOARD select_resi_serial_no(HashMap<String, Object> paramMap) throws PersistenceException;
	int insert(RESIBOARD row) throws PersistenceException;
	void update(RESIBOARD row) throws PersistenceException;
	void delete(int oindex) throws PersistenceException;	
	
	void update_resi_read_no_count(int resi_serial_no) throws PersistenceException;   // 20160411 식단레시피 조회수 update 추가
}