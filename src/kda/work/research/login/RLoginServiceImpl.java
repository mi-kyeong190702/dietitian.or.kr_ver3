package kda.work.research.login;

import java.util.HashMap;

import kda.work.research.report.data.ACTULPERSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RLoginServiceImpl implements RloginService {
	
	private Log log = LogFactory.getLog(RLoginServiceImpl.class);
	
	@Autowired
	RloginDao dao;

	@Override
	public ACTULPERSON passwdCk(String pers_name, 	String lic_no, String user_pw) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("user_pw", user_pw);

		return dao.passwdCk(map);
	}
	
	@Override
	public int insertHistory(String pers_name, 	String lic_no, String ip) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("pers_ip", ip);
		return dao.insertHistory(map);
	}
	
	@Override
	public int loginHistory(String pers_name, 	String lic_no, String ip) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("pers_ip", ip);
		return dao.loginHistory(map);
	}
	
	@Override
	public int logoutHistory(String pers_name, 	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		return dao.logoutHistory(map);
	}
	
	@Override
	public int isUser(String pers_name, 	String lic_no) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		return dao.isUser(map);
	}
	
}
