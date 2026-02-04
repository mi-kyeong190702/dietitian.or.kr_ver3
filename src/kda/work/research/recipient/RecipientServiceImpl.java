package kda.work.research.recipient;

import java.util.HashMap;
import java.util.Map;

import kda.work.research.recipient.data.ACTULSUBJECTS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RecipientServiceImpl implements RecipientService {
	
	@Autowired
	RecipientDao dao;

	
	@Override
	public int personCheck(String pers_name, String lic_no)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		return dao.personCheck(map);
	}
	
	@Override
	public int recipientCheck(String pers_name, String lic_no, String cs_con_education)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("cs_con_education", cs_con_education);
		return dao.recipientCheck(map);
	}

	@Override
	public int recipientCheck1(String pers_name, String lic_no, String cs_con_education)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("cs_con_education", cs_con_education);
		return dao.recipientCheck1(map);
	}
	
	
	@Override
	public void insertRecipient(ACTULSUBJECTS vo)
			throws Exception {
		dao.insertRecipient(vo);
	}
	
	@Override
	public void updateRecipient(ACTULSUBJECTS vo)
			throws Exception {
		dao.updateRecipient(vo);
	}
	
	@Override
	public void updateRecipientDetail(ACTULSUBJECTS vo)
			throws Exception {
		dao.updateRecipientDetail(vo);
	}
	
	@Override
	public Map personInfoCheck(String pers_name, String lic_no, String pers_hp)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pers_name", pers_name);
		map.put("lic_no", lic_no);
		map.put("pers_hp", pers_hp);
		return dao.personInfoCheck(map);
	}
	
}
