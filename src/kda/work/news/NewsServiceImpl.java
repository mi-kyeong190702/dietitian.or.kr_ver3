package kda.work.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.common.data.LIST_HELPER;
import kda.work.news.data.KN_CALENDAR;
import kda.work.news.data.KN_EMPLOY;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {
	private Log log = LogFactory.getLog(NewsServiceImpl.class);

	@Autowired
	NewsDao dao;	
	
	@Autowired
	private EmployDao employDao;
	
	@Override
	public List<KN_CALENDAR> get_schedulex_list( String yy, String mm ) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("yy", yy);
		paramMap.put("mm", mm);
		return dao.get_schedulex_list(paramMap);
	}

	
	@Override
	public LIST_HELPER getEmployList(LIST_HELPER listHelper) throws Exception {
		return employDao.selectEmployList(listHelper);
	}


	@Override
	public KN_EMPLOY getEmploy(int idx) throws Exception {
		return employDao.selectEmploy(idx);
	}


	@Override
	public List<Map> getEmployNavi(Map paramMap) throws Exception {
		return employDao.selectEmployNavi(paramMap);
	}


	@Override
	public List<Map> getEmployComment(int idx) throws Exception {
		// TODO Auto-generated method stub
		return employDao.selectEmployComment(idx);
	}


	@Override
	public void insertEmployComment(Map requestMap) throws Exception {
		employDao.insertEmployComment(requestMap);
	}


	@Override
	public void deleteEmployComment(int cIndex) throws Exception {
		employDao.deleteEmployComment(cIndex);
		
	}


	@Override
	public void insertEmploy(KN_EMPLOY employ) throws Exception {
		employDao.insertEmploy(employ);
		
	}


	@Override
	public void updateEmploy(KN_EMPLOY employ) throws Exception {
		employDao.updateEmploy(employ);
	}


	@Override
	public void deleteEmploy(int eindex) throws Exception {
		employDao.deleteEmploy(eindex);
	}


	@Override
	public void updateEmployViewCount(int idx) throws Exception {
		employDao.updateEmployViewCount(idx);
		
	}


	@Override
	public void insertJob(Map paramMap) throws Exception {
		dao.insertJob(paramMap);
	}	
	
	
}
