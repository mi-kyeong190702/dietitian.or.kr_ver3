package kda.common;

import javax.servlet.http.HttpServletRequest;

import kda.common.data.IPIN;
import kda.member.data.MEMBER_JOIN;

public interface IPINService {

	public IPIN getIPIN(HttpServletRequest request) throws Exception;
	
	public MEMBER_JOIN getResult(HttpServletRequest request) throws Exception;
	
}
