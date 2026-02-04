package kda.work.business.clinic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.business.clinic.data.KB_C_HABITS_DIAGNOSIS;
public interface ClinicDao
{
	List<KB_C_HABITS_DIAGNOSIS> select(HashMap<String, Object> paramMap);
	
	List<Map> selectBodList() throws PersistenceException;
	
	List<Map> selectActList() throws PersistenceException;
	
	public Map selectObeM(int gubun, double ll_weight) throws PersistenceException;
	
	public Map selectWhrM(String check, double ll_waist) throws PersistenceException;
	
	public Map selectGreM(int fatGubun, int sex, double fat) throws PersistenceException;
	
	public Map selectBlpM(int direct, int bloodGubun, double value, int age) throws Exception;
	
	public Map selectBlsM( double bloodsa, double bloodsb) throws PersistenceException;
	
	public Map selectBlsM2( String bloodgbn ) throws PersistenceException;
	
	public Map selectActM(int actSeqno) throws PersistenceException;
	
	public Map selectRdaM(int sex, int age) throws PersistenceException;
	
	public Map selectStandardWt(String sex, double fhit) throws PersistenceException;
	
	public Map selectGeneralWt(String sex, int fage, double fhit) throws PersistenceException;
	
	public Map selectObeTbl(int fatcode) throws PersistenceException;
	
}