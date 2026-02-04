package kda.work.research.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.work.research.recipient.data.ACTULSUBJECTS;
import kda.work.research.report.data.ACTULPERSON;
import kda.work.research.report.data.ACTULSTATUS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao dao;

	@Override
	public ACTULPERSON getReportUser(String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULPERSON  result = dao.getReportUser(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getReportState(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getReportState(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getReportState2013(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getReportState2013(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getReportState2015(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getReportState2015(map);
		
		return result;
		
	}
	
	@Override
	public List<ACTULSTATUS> getReportEdu(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		List<ACTULSTATUS>  result = dao.getReportEdu(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getReportHistory(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getReportHistory(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getReportHistory2(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getReportHistory2(map);
		
		return result;
		
	}
	
	@Override
	public void passwdInsert(String pers_name, String lic_no, String user_pw) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("user_pw", user_pw);
		
		dao.passwdInsert(map);
		
	}
	
	@Override
	public ACTULPERSON getInfo(String pers_name, String lic_no, String user_pw) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("user_pw", user_pw);
		
		ACTULPERSON  result = dao.getInfo(map);
		
		return result;
		
	}
	
	@Override
	public ACTULSTATUS getDate(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		ACTULSTATUS  result = dao.getDate(map);
		
		return result;
		
	}
	
	@Override
	public List<ACTULSTATUS> getRecent(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getRecent(map);
		
	}
	
	@Override
	public List<ACTULSTATUS> getRecentYear(String year,String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("year", year);
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getRecentYear(map);
		
	}
	
	@Override
	public void personUpt(ACTULSTATUS actulstatus) throws Exception{
		dao.personUpt(actulstatus);
	}
	
	@Override
	public void statusUpt(ACTULSTATUS actulstatus) throws Exception{
		dao.statusUpt(actulstatus);
	}
	
	@Override 
	public void statusUpt1(ACTULSTATUS actulstatus) throws Exception{ //20160120 2016년실태신고를 위한 수정
		dao.statusUpt1(actulstatus); 
	}
	
	@Override
	public void fileUpt(ACTULSTATUS actulstatus) throws Exception{
		dao.fileUpt(actulstatus);
	}
	
	@Override
	public void personCancel(ACTULSTATUS actulstatus) throws Exception{
		dao.personCancel(actulstatus);
	}
	
	@Override
	public void statusCancel(ACTULSTATUS actulstatus) throws Exception{
		dao.statusCancel(actulstatus);
	}
	
	@Override
	public List<ACTULSTATUS> getEmail() throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return dao.getEmail(map);
		
	}
	
	@Override
	public HashMap<String, Object> getReportState_chk(HashMap<String, Object> param) throws Exception{
		
		HashMap<String, Object>  result = dao.getReportState_chk(param);
		
		return result;
		
	}
	
	public void personInfoUpt(ACTULPERSON actulperson) throws Exception{
		dao.personInfoUpt(actulperson);
	}
	
	@Override
	public List<ACTULSUBJECTS> getRecipientEduList(String pers_name, String lic_no) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		
		return dao.getRecipientEduList(map);
		
	}
	
}
