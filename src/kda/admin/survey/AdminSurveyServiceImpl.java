package kda.admin.survey;

import java.util.List;
import java.util.Map;

import kda.admin.survey.data.SURVEY_MAIN;
import kda.admin.survey.data.SURVEY_RESPONSE;
import kda.admin.survey.data.SURVEY_SUBJECT;
import kda.common.data.LIST_HELPER;
import kda.utils.KdaStringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminSurveyService")
public class AdminSurveyServiceImpl implements AdminSurveyService {

	@Autowired
	private AdminSurveyDao adminSurveyDao;
	
	@Override
	public LIST_HELPER getSurveySubjectList(LIST_HELPER listHelper)
			throws Exception {
		return adminSurveyDao.selectSurveySubjectList(listHelper);
	}

	@Override
	public int getSurveyResCount(Map paramMap) throws Exception {
		return adminSurveyDao.selectResCount(paramMap);
	}

	@Override
	public List<SURVEY_RESPONSE> getSurveyResList(Map paramMap)
			throws Exception {
		return adminSurveyDao.selectResList(paramMap);
	}

	@Override
	public SURVEY_SUBJECT getSurveySubject(Map paramMap) throws Exception {
		return adminSurveyDao.selectSubject(paramMap);
	}

	@Override
	public List<SURVEY_RESPONSE> getSurveyResEtcList(Map paramMap) throws Exception {
		// TODO Auto-generated method stub
		return adminSurveyDao.selectResEtcList(paramMap);
	}

	@Override
	public List<SURVEY_MAIN> getSurveyMain(Map paramMap) throws Exception {
		return adminSurveyDao.selectMain(paramMap);
	}

	@Override
	public void insertSubject(SURVEY_SUBJECT subject) throws Exception {
		subject.setTms_rdate(KdaStringUtil.getCurrentDateTimeAsString());
		subject = adminSurveyDao.insertSurveySubject(subject);
		
		int i = 1;
		for(String tmc_title : subject.getTmc_titles()) {
			SURVEY_RESPONSE response = new SURVEY_RESPONSE(subject);
			response.setTmc_order(i++);
			response.setTmc_title(tmc_title);
			response.setTmc_rdate(KdaStringUtil.getCurrentDateTimeAsString());
			adminSurveyDao.insertSurveyChoose(response);
		}
	}

	@Override
	public void deleteSubject(SURVEY_SUBJECT subject) throws Exception {
		adminSurveyDao.deleteSurveyChoose(subject);
		
	}

	@Override
	public void insertMain(SURVEY_SUBJECT subject) throws Exception {
		adminSurveyDao.insertMain(subject);
		
	}
	
	

	
}
