package kda.board;

import java.util.HashMap;
import java.util.Map;

import kda.board.data.QNABOARD;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("gnaDao")
public class QNADao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(QNADao.class);
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory1;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory3;

	
	public LIST_HELPER selectQNAListHelper(LIST_HELPER listHelper) throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "qna_board.selectQNACount", "qna_board.selectQNAList", listHelper);
	}
	
	public QNABOARD selectQNA(int bbs_idx) throws PersistenceException {
		Map paramMap = new HashMap();
		paramMap.put("bbs_idx", bbs_idx);
		return (QNABOARD)selectOne(sqlSessionFactory3, "qna_board.selectQNA", paramMap);
	}
	
	public void insertQNA(QNABOARD qnaboard) throws PersistenceException {
		insert(sqlSessionFactory1, "qna_board.insertQNA", qnaboard);
	}
	
	public void updateBbsView(int bbs_idx) throws PersistenceException {
		update(sqlSessionFactory1, "qna_board.updateBbsView", bbs_idx);
	}
	
	public void updateQNA(QNABOARD qnaboard) throws PersistenceException {
		update(sqlSessionFactory1, "qna_board.updateQNA", qnaboard );
	}
	
	public void updateReply(QNABOARD qnaboard) throws PersistenceException {
		update( sqlSessionFactory1, "qna_board.updateReply", qnaboard );
	}
	
	public void updateDeleteFlag(int bbs_idx) throws PersistenceException {
		update(sqlSessionFactory1, "qna_board.updateDeleteFlag", bbs_idx);
	}
}
