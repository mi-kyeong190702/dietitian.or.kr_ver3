<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %>
<%@ page import="kda.SessionInfo" %>

<%
	if ( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
		response.setHeader("Pragma", "no-cache");
	} else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
		response.setHeader("Cache-Control", "no-cache");
	}
	
	response.setDateHeader("Expires", 0);

	// ************************ GLOBAL ************************ //
	SessionInfo sessionInfo = new SessionInfo ( session );
	 
	boolean g_isLogin 		= sessionInfo.isLogin();
	String  g_userid  		= sessionInfo.getUserId();
	int  g_user_level  		= sessionInfo.getUserLevel();
	int  g_pers_point		= sessionInfo.getPersPoint();
	String g_encoded_userid	= sessionInfo.getUserId();
	String chk_encoded_userid = sessionInfo.getUserId();
	String g_code_big = sessionInfo.getCodebig();
	String g_pers_state = sessionInfo.getPersState();
	
	if(sessionInfo.getUserId().length() > 9 ){
		chk_encoded_userid = sessionInfo.getUserId().substring(0, 9);
	}
	
	//인코드 encoding Encoder
	g_encoded_userid = sessionInfo.getUserId().replace("!", "%21");
	g_encoded_userid = g_encoded_userid.replace("@", "%40");
	g_encoded_userid = g_encoded_userid.replace("#", "%23");
	g_encoded_userid = g_encoded_userid.replace("~", "%7E");
		
	System.out.println("common g_userid : " + g_userid);
	System.out.println("common g_encoded_userid : " + g_encoded_userid);
	System.out.println("common chk_encoded_userid : " + chk_encoded_userid);
	System.out.println("common g_user_level : " + g_user_level); 
	// ************************ GLOBAL ************************ /
	
	if ( !g_isLogin ) 
	{ 
		session.setAttribute(SessionInfo.LOGIN		, "N");
		session.setAttribute(SessionInfo.USER_ID	, "");
		session.setAttribute(SessionInfo.PERS_NAME	, "손님");
		session.setAttribute(SessionInfo.USER_LEVEL	, 6); 
		//교육생 로그인 체크 정보 때문에 주석 처리함 2025.06.12
		//session.setAttribute(SessionInfo.PERS_STATE   , "0"); 
	}
	
	if ( "ekdldjxm_!@##@!~".equals(g_userid) ) 
    { 
        session.setAttribute(SessionInfo.CODE_BIG      , ""); 
        session.setAttribute(SessionInfo.PERS_STATE   , "05"); 
    }
	
	
%>

<jsp:scriptlet>
 	pageContext.setAttribute("crlf", "\r\n");
	pageContext.setAttribute("lf", "\n");
	pageContext.setAttribute("cr", "\r");
</jsp:scriptlet>

<c:set var="g_userid" 			value="<%=g_userid%>" 		scope="page" />
<c:set var="g_isLogin" 			value="<%=g_isLogin%>" 		scope="page" />
<c:set var="g_user_level" 		value="<%=g_user_level%>" 	scope="page" />
<c:set var="g_pers_name" 		value="<%= session.getAttribute(SessionInfo.PERS_NAME).toString() %>" 	scope="page" />
<c:set var="g_encoded_userid" 	value="<%=g_encoded_userid%>" 			scope="page" />
<c:set var="chk_encoded_userid" 	value="<%=chk_encoded_userid%>" 			scope="page" />
<c:set var="g_code_big" 			value="<%=g_code_big%>" 		scope="page" />
<c:set var="g_pers_state"             value="<%=g_pers_state%>"         scope="page" />