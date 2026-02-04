package kda.login;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kda.login.data.LOGININFO;

@Service
public class LoginServiceImpl implements LoginService 
{
	private Log log = LogFactory.getLog(LoginServiceImpl.class);
	
	@Autowired
	LoginDao dao;
	
	@Override
	public LOGININFO userLogin(String id, String passwd) throws Exception
	{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		
		paramMap.put("id", id);
		paramMap.put("pass", passwd);

		LOGININFO loginInfo = dao.getUserPassword(paramMap);	
		
		try{
			if ( loginInfo != null )
			{
				String pwchk = loginInfo.getPwchk();
				if ( pwchk.equals("Y"))
				{
					paramMap.put("code_pers", loginInfo.getCode_pers());
					loginInfo = dao.getUserInfo(paramMap);
				}
			}
		}catch(Exception e){
			log.info("userLogin e" + e);
		}
			
		return loginInfo;
	}
	
	public int getPasswdUpateMonth(String codePers) throws Exception {
		return dao.selectPasswdUpateMonth(codePers);
	}
}
