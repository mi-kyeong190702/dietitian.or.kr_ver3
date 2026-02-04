package kda.work.research.mypage;

import java.util.HashMap;
import java.util.List;

import kda.work.research.report.data.ACTULSTATUS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	private Log log = LogFactory.getLog(MyPageServiceImpl.class);
	
	@Autowired
	MyPageDao dao;
	
	
	
	@Override
	public int getMyReportCount(String pers_name,	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getMyReportCount(map);
	}
	
	@Override
	public List<ACTULSTATUS> getMyReport(String pers_name,	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getMyReport(map);
	}
	
	@Override
	public int getMyEduCount(String pers_name,	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getMyEduCount(map);
	}
	
	@Override
	public List<ACTULSTATUS> getMyEdu(String pers_name,	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getMyEdu(map);
	}

	@Override
	public String passwdFind(String pers_name, 	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);

		return dao.passwdFind(map);
	}
	
	
	@Override
	public String passwdChange(String pers_name,	String lic_no, String old_pass, String new_pass) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("old_pass", old_pass);
		map.put("pass_wd", new_pass);
		
		return dao.passwdChange(map);
	}
	
}
