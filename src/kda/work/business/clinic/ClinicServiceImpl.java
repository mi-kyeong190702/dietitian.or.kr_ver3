package kda.work.business.clinic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.work.business.clinic.data.KB_C_HABITS_DIAGNOSIS;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ClinicServiceImpl implements ClinicService {
	private Log log = LogFactory.getLog(ClinicServiceImpl.class);

	@Autowired
	ClinicDao dao;

	@Override
	public List<KB_C_HABITS_DIAGNOSIS> select()  throws Exception{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		return dao.select(paramMap);
	}

	@Override
	public List<Map> getActM() throws Exception {
		return dao.selectActList();
	}

	@Override
	public List<Map> getBodM() throws Exception {
		return dao.selectBodList();
	}

	@Override
	public Map getObeM(int gubun, double ll_weight) throws Exception {
		return dao.selectObeM(gubun, ll_weight);
	}

	@Override
	public Map getWhrM(String check, double ll_waist) throws Exception {
		return dao.selectWhrM(check, ll_waist);
	}	
	
	public Map getGreM(int fatGubun, int sex, double fat) throws Exception {
		return dao.selectGreM( fatGubun, sex, fat );
	}

	@Override
	public Map getBlpM(int direct, int bloodGubun, double value, int age)
			throws Exception {
		return dao.selectBlpM(direct, bloodGubun, value, age);
	}

	@Override
	public Map getBlsM(double bloodsa, double bloodsb) throws Exception {
		return dao.selectBlsM(bloodsa, bloodsb);
	}
	
	@Override
	public Map getBlsM2( String bloodgbn ) throws Exception {
		return dao.selectBlsM2(bloodgbn);
	}

	@Override
	public Map getActM(int actSeqno) throws Exception {
		return dao.selectActM(actSeqno);
	}

	@Override
	public Map getRdaM(int sex, int age) throws Exception {
		return dao.selectRdaM(sex, age);
	}

	@Override
	public Map getStandardWt(String sex, double fhit)
			throws Exception {
		return dao.selectStandardWt(sex, fhit);
	}
	
	@Override
	public Map getGeneralWt(String sex, int fage, double fhit) throws Exception {
		return dao.selectGeneralWt(sex, fage, fhit);
	}

	@Override
	public Map getObeTbl(int fatcode) throws Exception {
		return dao.selectObeTbl(fatcode);
	}
	
	
}
