package kda.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kda.login.data.LOGININFO;

public interface LoginService 
{
	LOGININFO userLogin(String id, String passwd) throws Exception;
	public int getPasswdUpateMonth(String codePers) throws Exception;
}
