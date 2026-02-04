package kda.work.research.recipient;

import java.util.Map;

import kda.work.research.recipient.data.ACTULSUBJECTS;


public interface RecipientService {
	
	public int personCheck(String pers_name, String lic_no) throws Exception;
	
	public int recipientCheck(String pers_name, String lic_no, String cs_con_education ) throws Exception;
	
	public int recipientCheck1(String pers_name, String lic_no, String cs_con_education ) throws Exception;
	
	public void insertRecipient(ACTULSUBJECTS vo) throws Exception;

	void updateRecipient(ACTULSUBJECTS vo) throws Exception;
	
	void updateRecipientDetail(ACTULSUBJECTS vo) throws Exception;
	
	public Map personInfoCheck(String pers_name, String lic_no, String pers_hp) throws Exception;
	
}
