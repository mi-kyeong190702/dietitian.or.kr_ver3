package kda.admin.board;

import java.util.HashMap;

import kda.admin.board.data.ADMINPAPERBOARDSETTINGS;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminBoardDao")
public class AdminBoardDao extends KdaAbstractMapper{
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;

	public LIST_HELPER selectBoardListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "adminBoard.selectBoardCount", "adminBoard.selectBoardListHelper", listHelper);
	}
	
	public ADMINPAPERBOARDSETTINGS getBoard(HashMap<String, Object> map)
			throws PersistenceException {
		return (ADMINPAPERBOARDSETTINGS) selectOne(sqlSessionFactory1, "adminBoard.getBoard", map);
	}
	
	public void insertBoard(ADMINPAPERBOARDSETTINGS vo)
			throws PersistenceException {
		insert(sqlSessionFactory1, "adminBoard.insertBoard", vo);
	}
	
	public void updateBoard(ADMINPAPERBOARDSETTINGS vo)
			throws PersistenceException {
		insert(sqlSessionFactory1, "adminBoard.updateBoard", vo);
	}

}
