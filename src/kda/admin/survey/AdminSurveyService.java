package kda.admin.survey;

import java.util.List;
import java.util.Map;

import kda.admin.survey.data.SURVEY_MAIN;
import kda.admin.survey.data.SURVEY_RESPONSE;
import kda.admin.survey.data.SURVEY_SUBJECT;
import kda.common.data.LIST_HELPER;

public interface AdminSurveyService {

	public LIST_HELPER getSurveySubjectList(LIST_HELPER listHelper) throws Exception;
	
	public int getSurveyResCount(Map paramMap) throws Exception;
	
	public List<SURVEY_RESPONSE> getSurveyResList(Map paramMap) throws Exception;
	
	public SURVEY_SUBJECT getSurveySubject(Map paramMap) throws Exception;
	
	public List<SURVEY_RESPONSE> getSurveyResEtcList(Map paramMap) throws Exception;
	
	public List<SURVEY_MAIN> getSurveyMain(Map paramMap) throws Exception;
	
	public void insertMain(SURVEY_SUBJECT subject) throws Exception;
	
	public void insertSubject(SURVEY_SUBJECT subject) throws Exception;
	
	public void deleteSubject(SURVEY_SUBJECT subject) throws Exception;
	
	
}
