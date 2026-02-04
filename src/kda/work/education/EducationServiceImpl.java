package kda.work.education;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import kda.WorkData;
import kda.common.FileUploadService;
import kda.member.data.MEMBER_JOIN;
import kda.mypage.MyPageHDao;
import kda.work.education.data.KE_EDU_CERTIFI;
import kda.work.education.data.KE_EDU_GREEN;
import kda.work.education.data.KE_EDU_MEETING;
import kda.work.education.data.KE_EDU_MEETING_DEL;
import kda.work.education.data.KE_EDU_OPERATOR;
import kda.work.education.data.KE_EDU_OPER_ADD_FILE;
import kda.work.education.data.KE_EDU_TEST_NAME;
import kda.work.education.data.PTB_EDUSCHEDULE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("educationService")
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EducationDao educationDao;
	
	@Autowired
	private MyPageHDao myPageHDao;
	
	@Autowired
	private FileUploadService uploadService;
	
	@Autowired
	private ServletContext servletContext;
	
	@Override
	public List<KE_EDU_CERTIFI> getOldCertifiList(Map paramMap) throws Exception {
		return educationDao.selectOldCertifiList(paramMap);
	}
	
	@Override
	public List<Map> getEduTestBranList(Map paramMap) throws Exception {
		return educationDao.selectEduTestBranList(paramMap);
	}
	
	@Override
	public List<KE_EDU_TEST_NAME> getEduTestNameList(Map paramMap) throws Exception {
		return educationDao.selectEduTestNameList(paramMap);
	}

	@Override
	public int getEduDupCount(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.selectOperatorCount(operator);
	}

	@Override
	public HashMap<String, Integer> getOperatorLimitPersCnt(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.selectOperatorLimitPersCnt(operator);
	}

	@Override
	public void regOperator(KE_EDU_OPERATOR operator) throws Exception {
		educationDao.insertOperator(operator);
	}

	@Override
	public List<KE_EDU_OPERATOR> getOperatorList(String year, String codePers, String operState)
			throws Exception {
		return educationDao.selectOperatorList(year, codePers, operState, null);
	}
	
	@Override 
	public KE_EDU_OPERATOR getOperator(String year, String codePers, String operState, String operKey)
			throws Exception {
		List<KE_EDU_OPERATOR> operList = educationDao.selectOperatorList(year, codePers, operState, operKey);
		KE_EDU_OPERATOR oper = null;
		if( operList.size() > 0 ) {
			oper = operList.get(0);
		}
		return oper;
	}

	@Override
	public List<KE_EDU_CERTIFI> getCerifiList(Map paramMap) throws Exception {
		return educationDao.selectPersonCertifiList(paramMap);
	}

	@Override
	public int getExamOperatorCount(Map paramMap) throws Exception {
		return educationDao.selectExamOperatorCount(paramMap);
	}
	
	@Override
	public boolean isExamValidReTest(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.selectExamValidReTest(operator);
	}

	@Override
	public int isExamValidExpire(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.selectExamValidExpire(operator);
	}

	@Override
	public String isExamPassFlag(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.selectExamPassFlag(operator);
	}

	@Override
	public String insertExamOperator(KE_EDU_OPERATOR operator) throws Exception {
		return educationDao.insertExamOperator(operator);
	}
	
	@Override
	public List<Map> getCertifiCodeList() throws Exception {
		return educationDao.selectCertifiCodeList();
	}
	
	@Override
	public List<PTB_EDUSCHEDULE> get_eduschedule_list( String yy, String mm ) throws Exception 
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();		
		paramMap.put("ilyear", yy);
		paramMap.put("ilmonth", mm);
		return educationDao.get_eduschedule_list(paramMap);
	}
	
	@Override
	public PTB_EDUSCHEDULE get_eduschedule_detail(int ilindex ) throws Exception 
	{
	 	return educationDao.get_eduschedule_detail(ilindex);
	}

	@Override
	public KE_EDU_CERTIFI getMaxCertifi(String codeCertifi, String codePers, String useYn)
			throws Exception {
		return educationDao.selectMaxResultPrint(codeCertifi, codePers, useYn);
	}

	@Override
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(
			String codeCertifi, String codePers) throws Exception {
		return educationDao.selectPassExamListByCertifi(codeCertifi, codePers, null, null);
	}

	@Override
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(String codeCertifi,
			String codePers, String resultEndDt) throws Exception {
			
		return educationDao.selectPassExamListByCertifi(codeCertifi, codePers, resultEndDt, null);
	}

	@Override
	public List<KE_EDU_OPERATOR> getPassExamListByCertifi(String codeCertifi,
			String codePers, String resultEndDt, String[] seasonAry)
			throws Exception {
		return  educationDao.selectPassExamListByCertifi(codeCertifi, codePers, resultEndDt, seasonAry);
	}

	
	@Override
	public void insertOperAddFile(KE_EDU_OPER_ADD_FILE operAddFile) throws Exception {
		educationDao.insertOperAddFile(operAddFile);
	}

	@Override
	public void insertEduEstablishment(Map paramMap) throws Exception {
		educationDao.insertEduEstablishment(paramMap);
	}
	
	@Override
	public void insert_eduschedule( PTB_EDUSCHEDULE eduschedule ) throws Exception 
	{
		educationDao.insert_eduschedule(eduschedule);
	}
	
	@Override
	public void delete_eduschedule(int ilindex ) throws Exception 
	{
		educationDao.delete_eduschedule(ilindex);
	}
	
	@Override
	public void update_eduschedule( PTB_EDUSCHEDULE eduschedule ) throws Exception 
	{
		educationDao.update_eduschedule(eduschedule);
	}

	@Override
	public void updateTrainees(MEMBER_JOIN join) throws Exception {
		myPageHDao.updateTrainees(join);
	}

	@Override
	public List<Map> getExamOperatorRegList(String codePers) throws Exception {
		
		return educationDao.selectExamOperatorRegList(codePers);
	}

	@Override
	public void updateExamCancel(Map paramMap) throws Exception {
		educationDao.updateExamCancel(paramMap);
	}

	@Override
	public int getMeetingCount(KE_EDU_MEETING meeting) throws Exception {
		return educationDao.selectMeetingCount(meeting);
	}

	@Override
	public KE_EDU_MEETING insertMeeting(KE_EDU_MEETING meeting)
			throws Exception {
		// TODO Auto-generated method stub
		return educationDao.insertMeeting(meeting);
	}

	@Override
	public KE_EDU_TEST_NAME getEduTestName(String eduId) throws Exception {
		
		return educationDao.selectEduTestName(eduId);
	}

	@Override
	public void updateOperator(KE_EDU_OPERATOR operator)
			throws Exception {
		educationDao.updateOperator(operator);
	}

	@Override
	public void moveOperPrevAddFile(KE_EDU_OPERATOR operator) throws Exception {
		List<KE_EDU_OPER_ADD_FILE> addFileList = educationDao.selectAddFileList(operator.getOnce_oper_key());
		String code_operation = "7"; // 교육이수 재시험
		for(KE_EDU_OPER_ADD_FILE addFile : addFileList) {
			System.out.println("ADD FILE : " + addFile);
			String targetFile = operator.makeOperKey() + "_" + addFile.getAdd_file_no() + "." + addFile.getExtension();
			
			String sourcePath = WorkData.UPLODAD_LICENSE + addFile.getChang_file_name();
			String targetPath = WorkData.UPLODAD_LICENSE + targetFile;
			
			sourcePath = servletContext.getRealPath(sourcePath);
			targetPath = servletContext.getRealPath(targetPath);

			uploadService.moveFile(sourcePath, targetPath);
			
			KE_EDU_OPER_ADD_FILE insAddFile = new KE_EDU_OPER_ADD_FILE( operator.makeOperKey(), addFile.getAdd_file_no(), targetFile, addFile.getFile_size() );
			insertOperAddFile(insAddFile);
			code_operation = "8"; // 자격시험 재시험
		}
		educationDao.updateCodeOperation(operator.makeOperKey(), code_operation);
	}

	@Override
	public void insertMeetingCancel(KE_EDU_MEETING_DEL cancel)
			throws Exception {
		educationDao.insertMeetingCancel(cancel);
		
	}

	
	@Override
	public void insertEduGreen(KE_EDU_GREEN green) throws Exception {
		educationDao.insertEduGreen(green);
	}

	@Override
	public List<KE_EDU_GREEN> getGreenList(String name, String tel_hp)
			throws Exception {
		return educationDao.selectGreenList(name, tel_hp);
	}

	@Override
	public KE_EDU_GREEN getGreen(String idx) throws Exception {
		
		return educationDao.selectGreen(idx);
	}

	@Override
	public void updateEduGreen(KE_EDU_GREEN green) throws Exception {
		educationDao.updateEduGreen(green);
	}

	@Override
	public void deleteEduGreen(KE_EDU_GREEN green) throws Exception {
		educationDao.deleteEduGreen(green);
	}

	@Override
	public List<KE_EDU_OPER_ADD_FILE> getOperAddFileList(String operKey)
			throws Exception {
		return educationDao.selectAddFileList(operKey);
	}

	@Override
	public List<Map> getLastDuesList(String codePers) throws Exception {
		return educationDao.selectLastDuesList(codePers);
	}
	
	@Override
	public List<Map> getChgMarkCheckList(String codeCertifi,  String codePers, String certStartDt, String certEndDt) 
			throws Exception {
		return educationDao.selectChgMarkCheckList(codeCertifi, codePers, certStartDt, certEndDt);
	}
	
	@Override
	public KE_EDU_CERTIFI getChgCerti(String codeCertifi, String codePers) throws Exception {
		return educationDao.selectChgCerti(codeCertifi, codePers);
	}
	
	@Override
	public void updateResultPrint(KE_EDU_CERTIFI certifi) throws Exception {
		educationDao.updateResultPrint(certifi);
		
	}

	@Override
	public List<HashMap> getReqResultPrintList(String codePers)
			throws Exception {
		return educationDao.selectReqResultPrintList(codePers);
	}
	
	@Override
	public List<KE_EDU_MEETING> getMeetingList(String name, String tel_hp, String birth)
			throws Exception {
		return educationDao.selectMeetingList(name, tel_hp, birth);
	}
	
	
}
