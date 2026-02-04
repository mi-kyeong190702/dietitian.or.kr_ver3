package kda.admin.survey;

import java.util.List;
import java.util.Map;

import kda.admin.survey.data.SURVEY_MAIN;
import kda.admin.survey.data.SURVEY_RESPONSE;
import kda.admin.survey.data.SURVEY_SUBJECT;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminSurveyDao")
public class AdminSurveyDao extends KdaAbstractMapper {

	@Autowired
	SqlSessionFactory sqlSessionFactory2;
	
	public LIST_HELPER selectSurveySubjectList(LIST_HELPER listHelper) throws PersistenceException {
		return selectListHelper(sqlSessionFactory2, "adminSurvey.selectSubjectCount", "adminSurvey.selectSubjectList", listHelper);
	}
	
	public SURVEY_SUBJECT selectSubject(Map paramMap) throws PersistenceException {
		return (SURVEY_SUBJECT)selectOne(sqlSessionFactory2, "adminSurvey.selectSubject", paramMap);
	}
	
	public int selectResCount(Map paramMap) throws PersistenceException {
		return selectInt(sqlSessionFactory2, "adminSurvey.selectResCount", paramMap);
	}
	
	public List<SURVEY_RESPONSE> selectResList(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "adminSurvey.selectResList", paramMap);
	}
	
	public List<SURVEY_RESPONSE> selectResEtcList(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "adminSurvey.selectResEtcList", paramMap);
	}
	

	public List<SURVEY_MAIN> selectMain(Map paramMap) throws PersistenceException {
		return selectList(sqlSessionFactory2, "adminSurvey.selectMain", paramMap);
	}
	

	public SURVEY_SUBJECT insertSurveySubject(SURVEY_SUBJECT subject) throws PersistenceException {
		insert(sqlSessionFactory2, "adminSurvey.insertSubject", subject);
		return subject;
	}
	
	public void insertSurveyChoose(SURVEY_RESPONSE response) throws PersistenceException {
		insert(sqlSessionFactory2, "adminSurvey.insertChoose", response);
	}
	
	public void deleteSurveyChoose(SURVEY_SUBJECT subject) throws PersistenceException {
		delete(sqlSessionFactory2, "adminSurvey.deleteChoose", subject);
		delete(sqlSessionFactory2, "adminSurvey.deleteSubject", subject);
	}
	
	public void insertMain(SURVEY_SUBJECT subject)throws PersistenceException {
		delete(sqlSessionFactory2, "adminSurvey.insertMain", subject);
	}
}

