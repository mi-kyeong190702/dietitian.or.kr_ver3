package kda.board;

import kda.board.data.QNABOARD;
import kda.common.data.LIST_HELPER;

public interface QNAService {

	public LIST_HELPER getQNAListHelper(LIST_HELPER listHelper) throws Exception;
	
	public QNABOARD getQNA(int bbs_idx) throws Exception;
	
	public void updateBbsView(int bbs_idx) throws Exception;
	
	public void insertQNA(QNABOARD qnaborad) throws Exception;
	
	public void updateQNA(QNABOARD qnaboard) throws Exception;
	
	public void updateReplyQNA(QNABOARD qnaboard) throws Exception;
	
	public void deleteQNA(int bbs_idx) throws Exception;
}
