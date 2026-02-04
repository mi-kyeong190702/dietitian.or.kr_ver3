package kda.member;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.WorkData;
import kda.common.data.GROUPCODE;
import kda.common.data.LOCAL_ACC;
import kda.member.data.MEMBER;
import kda.member.data.MEMBER_JOIN;
import kda.member.data.PERSON_M_TBL;
import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;
import kda.utils.MailBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService 
{
	private Log log = LogFactory.getLog(MemberServiceImpl.class);
	
	@Autowired
	MemberDao dao;
	
	@Override
	public List<MEMBER> getMemberId(String uname, String pers_birth, String pers_hp) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("uname", uname);
		paramMap.put("pers_birth", pers_birth);
		paramMap.put("pers_hp", pers_hp);
		
		return  dao.getMemberId(paramMap);			
	}
	
	@Override
	public String getMemberHp(String uid, String uname, String pers_birth) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("uname", uname);
		paramMap.put("pers_birth", pers_birth);
		paramMap.put("uid", uid);
		
		return  dao.getMemberHp(paramMap);			
	}
	
	@Override
	public int setInitPw(String hp, String uid) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("pers_hp", hp);		
		paramMap.put("uid", uid);
		
		return  dao.setInitPw(paramMap);			
	}
	
	@Override
	public String getLicNo(String ck_val, String codePers) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();		
		paramMap.put("ck_val", ck_val);	
		paramMap.put("codePers", codePers);
		return  dao.getLicNo(paramMap);			
	}
	
	@Override
	public String getId(String ck_val) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();	
		paramMap.put("ck_val", ck_val);		
		return  dao.getId(paramMap);			
	}	
	
	@Override
	public List<GROUPCODE> getGroupCode(String groupcode)  throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("groupcode", groupcode);
		
		return dao.getGroupCode(paramMap);
	}
	
	@Override
	public String insertMember(MEMBER_JOIN member_join)  throws Exception{
		return dao.insertMember(member_join);
	}


	
	@Override
	public long getSumDues(String code_member, String code_bran) throws Exception
	{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("code_member", code_member);
		paramMap.put("code_bran", code_bran);
		
		return  dao.getSumDues(paramMap);			
	}
	
	@Override
	public void insertReentrance(MEMBER_JOIN member_join) throws Exception {
		dao.insertReentrance(member_join);
	}

	/*
	 * ==== RYU JAE JOON 추가
	 * 
	 */
	@Override
	public PERSON_M_TBL getPersonMTblByCode(String codePers, boolean sp) throws Exception {
		return dao.selectMemberByKey(codePers, sp);
	}

	@Override
	public int getCountPerson(Map paramMap) throws Exception {
		
		return dao.selectCountPerson(paramMap);
	}

	@Override
	public boolean insertEduMember(MEMBER_JOIN member_join) throws Exception {
		return dao.insertEduMember(member_join);
	}

	@Override
	public Map getPersonByCertTemp(String codePers) throws Exception {
		
		return dao.selectPersonByCertTemp(codePers);
	}

	@Override
	public void updateLicNo(String codePers, String licNo) throws Exception {
		dao.updateLicNo(codePers, licNo);
	}

	@Override
	public Map checkMemberPerid(String uid, String compValue) throws Exception {
		Map result = new HashMap();
		
		Map memberMap = dao.selectCheckMemberById(uid, compValue);
		if( memberMap == null || KdaStringUtil.nullToString(memberMap.get("PWCHK")).equals("N") ) {
			result.put("case", 1);
		} else {
			String codePers = KdaStringUtil.nullToString( memberMap.get("code_pers") );
			List<Map> dueList = dao.selectMemberDuePeriodList(codePers);
			if( dueList == null || dueList.size() == 0 ) {
				result.put("case", 2);
			} else {
				result.put("case", 3);
				result.put("due", dueList.get(0));
			}
		}
		
		return result;
	}

	@Override
	public void sendMemberMail(MEMBER_JOIN join) throws Exception {

		String codePayName = KdaUtil.getCodePayName(join.getCode_pay_flag());
			
		String mTitle = join.getPers_name() + "님께서 회원 가입을 요청하셨습니다. - " + KdaStringUtil.getTodayString();
		String mbody = "";
		mbody =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>";
		mbody += "<table width='616' border='0' cellpadding='4' cellspacing='1' bgcolor='#CCCCCC'>";
		mbody += "<tr bgcolor='#EFEFEF'>";
		mbody += "<td width='154' height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>";
		mbody += "<div align='center'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>";
		mbody += "</div></td>";
		mbody += "<td width='443' bgcolor='#FFFFFF'><span class='style9'>" + join.getPers_name() + "</span></td>";
		mbody += "</tr>";
			
		long mem_dues = join.getMem_dues();
		if( mem_dues != 8 &&  mem_dues != 7 && mem_dues != 28 && mem_dues != 32 && mem_dues != -1  ) {
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>면허번호</div></td>";
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + join.getLic_no() + "</span></td>";
			mbody += "</tr>";
		}

		if( ( join.getMem_dues() != 10 &&  join.getMem_dues() != 11 && join.getMem_dues() != 12 && join.getMem_dues() != 13 && join.getMem_dues() != 14 
					&&  mem_dues != 15 &&  mem_dues != 16 &&  mem_dues != 17 
					&&  mem_dues != 30 && mem_dues != 31 && mem_dues != 32 && mem_dues != 33 && mem_dues != 34 && mem_dues != 35 && mem_dues != 36 && mem_dues != 37
			) && join.getCode_pay_flag().equals("10") ) {
			
			LOCAL_ACC acc = KdaUtil.getLocalAcc(join.getCode_bran());
			
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>거래은행</div></td>";  
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + acc.getBank() + "</span></td>";
			mbody += "</tr>";
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='30' bgcolor='#EFEFEF'><div align='center' class='style11'>계좌번호</div></td>";
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + acc.getAccount_num() + "</span></td>";
			mbody += "</tr>";
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='30' bgcolor='#EFEFEF'><div align='center' class='style11'>예 금 주</div></td>";
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>(사)대한영양사협회</span></td>";
			mbody += "</tr>";
		}
		
		if(  join.getCode_pay_flag().equals("15") ) {
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>거래은행</div></td>";  
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + join.getCMS_bank() + "</span></td>";
			mbody += "</tr>";
			mbody += "<tr bgcolor='#EFEFEF'>";
			mbody += "<td height='30' bgcolor='#EFEFEF'><div align='center' class='style11'>계좌번호</div></td>";
			mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + join.getCMS_acount() + "</span></td>";
			mbody += "</tr>";
		}
		
		mbody +=  "<tr bgcolor='#EFEFEF'>";
		mbody +=  "<td height='30' bgcolor='#EFEFEF'><div align='center' class='style11'>입금형태</div></td>";
		mbody +=  "<td bgcolor='#FFFFFF'><span class='style9'>" + codePayName  +"</span></td>";
		mbody +=  "</tr>";
		mbody +=  "</table>";
			
		MailBean mail = new MailBean();
		mail.sendMail(WorkData.CENTER_FROM_MAIL, WorkData.CENTER_FROM_MAIL_NAME, WorkData.CMS_MAIL, mTitle, mbody);		
	}

	@Override
	public List<Map> getPersonDuesList(String codePers) throws Exception {
		return dao.selectPersonDuesList(codePers);
	}
}
