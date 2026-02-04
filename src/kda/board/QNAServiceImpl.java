package kda.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kda.board.data.QNABOARD;
import kda.common.data.LIST_HELPER;

@Service("qnaService")
public class QNAServiceImpl implements QNAService {

	
	@Autowired
	private QNADao qnaDao;

	@Override
	public LIST_HELPER getQNAListHelper(LIST_HELPER listHelper) throws Exception {
		return qnaDao.selectQNAListHelper(listHelper);
	}

	@Override
	public QNABOARD getQNA(int bbs_idx) throws Exception {
		return qnaDao.selectQNA(bbs_idx);
	}
	
	@Override
	public void insertQNA(QNABOARD qnaboard) throws Exception {
		qnaDao.insertQNA(qnaboard);
	}

	@Override
	public void updateQNA(QNABOARD qnaboard) throws Exception {
		qnaDao.updateQNA(qnaboard);
	}
	
	@Override
	public void deleteQNA(int bbs_idx) throws Exception {
		qnaDao.updateDeleteFlag(bbs_idx);
		
	}

	@Override
	public void updateReplyQNA(QNABOARD qnaboard) throws Exception {
		qnaDao.updateReply(qnaboard);
		
	}

	@Override
	public void updateBbsView(int bbs_idx) throws Exception {
		qnaDao.updateBbsView(bbs_idx);
		
	}
	
	

}
