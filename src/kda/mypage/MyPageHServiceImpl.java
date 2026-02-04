package kda.mypage;
 
import java.util.List;
import java.util.Map;

import kda.member.MemberDao;
import kda.member.data.MEMBER_JOIN;
import kda.mypage.data.MYLICENSEINFO;
import kda.mypage.data.MYMEMBERINFO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageHServiceImpl implements MyPageHService {
	private Log log = LogFactory.getLog(MyPageHServiceImpl.class);
	
	@Autowired
	MyPageHDao dao;
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean setMyMemberInfo(MYMEMBERINFO memberInfo)  throws Exception{
		return dao.setMyMemberInfo(memberInfo);
	}
	
	@Override
	public boolean setMyLicenseInfo(MYLICENSEINFO licenseInfo)  throws Exception{
		return dao.setMyLicenseInfo(licenseInfo);
	}

	@Override
	public boolean updateTrainees(MEMBER_JOIN join) throws Exception {
		return dao.updateTrainees(join);
	}

	@Override
	public List<Map> getMyCerifiList(String code_pers) throws Exception {
		return dao.selectMyCerifiList(code_pers);
	}

	@Override
	public void insertDepositCms(MEMBER_JOIN member_join) throws Exception {
		memberDao.insert_dues_h_tbl_cms(member_join);
	}

	@Override
	public boolean setMyPassword(MYMEMBERINFO memberInfo) throws Exception {
		return dao.setMyPassword(memberInfo);
	}

	
}
