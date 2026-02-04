package kda.board;

import java.util.List;

import kda.board.data.FAQ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("faqService")
public class FaqServiceImpl implements Faqservice {

	@Autowired
	private FaqDao faqDao;
	
	@Override
	public void insertFaq(FAQ faq) throws Exception {
		faqDao.insertFaq(faq);		
	}
	
	@Override
	public List<FAQ> getFaqList(int faqCategory) throws Exception {
		// TODO Auto-generated method stub
		return faqDao.selectFaqList(faqCategory);
	}

	@Override
	public FAQ getFaq(int idx) throws Exception {
		return faqDao.selectFaq(idx);	
	}

	@Override
	public void updateFaq(FAQ faq) throws Exception {
		faqDao.updateFaq(faq);
		
	}

	@Override
	public void deleteFaq(int idx) throws Exception {
		faqDao.deleteFaq(idx);
	}
	
	
}
