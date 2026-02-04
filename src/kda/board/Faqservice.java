package kda.board;

import java.util.List;

import kda.board.data.FAQ;

public interface Faqservice {

	public List<FAQ> getFaqList(int faqCategory) throws Exception;
	
	public FAQ getFaq(int idx) throws Exception;
	
	public void insertFaq(FAQ faq) throws Exception;
	
	public void updateFaq(FAQ faq) throws Exception;
	
	public void deleteFaq(int idx) throws Exception;
	
}
