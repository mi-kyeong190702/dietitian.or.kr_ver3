package kda.work.business.clinic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.work.business.clinic.data.KB_C_HABITS_DIAGNOSIS;

public interface ClinicService 
{
	List<KB_C_HABITS_DIAGNOSIS> select() throws Exception;
	
	public List<Map> getActM() throws Exception;
	
	public List<Map> getBodM() throws Exception;
	
	public Map getObeM(int gubun, double ll_weight ) throws Exception;
	
	public Map getWhrM(String check, double ll_waist) throws Exception;
	
	public Map getGreM(int fatGubun, int sex, double fat) throws Exception;
	
	public Map getBlpM(int direct, int bloodGubun, double value, int age) throws Exception;
	
	public Map getBlsM( double bloodsa, double bloodsb) throws Exception;
	
	public Map getBlsM2( String bloodgbn ) throws Exception;
	
	public Map getActM(int actSeqno) throws Exception;
	
	public Map getRdaM(int sex, int age) throws Exception;
	
	public Map getStandardWt(String sex, double fhit) throws Exception;	
	
	public Map getGeneralWt(String sex, int fage, double fhit) throws Exception;
	
	public Map getObeTbl(int fatcode) throws Exception;
	
}
