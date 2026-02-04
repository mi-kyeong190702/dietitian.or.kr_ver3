<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="kda.SessionInfo" %>

<%
	String board_form 		= ParamUtils.getParameter(request	, "board_form", "list");
	int board_page 			= ParamUtils.getIntParameter(request, "board_page", 1);
	String board_search 	= ParamUtils.getParameter(request, "board_search", "0");
	String board_keyword 	= ParamUtils.getParameter(request, "board_keyword", "");
	
	String bbs_board_code	= ParamUtils.getParameter(request, "bbs_board_code", "0");
	int bbs_idx 			= ParamUtils.getIntParameter(request, "bbs_idx", -1);
	String bbs_category 	= ParamUtils.getParameter(request, "bbs_category", "");

 	SessionInfo sessionInfo = new SessionInfo ( session );
	
 	String g_userid 		= sessionInfo.getUserId();
	String g_board_userid	= ParamUtils.getParameter(request, "g_userid", "0");
	 
//	String g_encoded_userid	= sessionInfo.getUserId();
	

	// 정상적인 값으로 넘ㅇ옴
	//System.out.println("paper_board -  g_userid : " + g_userid);
	System.out.println("paper_board -  g_board_userid : " + g_board_userid);
	
	String include = "";
	if ( board_form.equals("list"))   include = "/paper_board_list.do";
	if ( board_form.equals("view"))   include = "/paper_board_view.do";
	if ( board_form.equals("write"))  include = "/paper_board_write.do";
	if ( board_form.equals("modify")) include = "/paper_board_write.do";
	if ( board_form.equals("delete")) include = "/paper_board_delete.do";
	
	System.out.println("=========================================  board start ");
	System.out.println("board_form     : " + board_form);
	System.out.println("board_search   : " + board_search);
	System.out.println("board_keyword  : " + board_keyword);
	System.out.println("board_page     : " + board_page);
	System.out.println("bbs_board_code : " + bbs_board_code);
	System.out.println("bbs_category   : " + bbs_category);
	System.out.println("bbs_idx        : " + bbs_idx);	
	System.out.println("include        : " + include);	
	
	System.out.println("g_userid  	   : " + g_userid);
	System.out.println("=========================================  board start ");
	
%>

<form name="board">
	<input type="hidden" name="board_form" 		value="<%=board_form%>">
	<input type="hidden" name="board_page" 		value="<%=board_page%>">
	<input type="hidden" name="board_search" 	value="<%=board_search%>">
	<input type="hidden" name="board_keyword" 	value="<%=board_keyword%>">
	<input type="hidden" name="bbs_board_code" 	value="<%=bbs_board_code%>">
	<input type="hidden" name="bbs_category" 	value="<%=bbs_category%>">
	<input type="hidden" name="bbs_idx" 		value="<%=bbs_idx%>">
	
	<input type="hidden" name="g_userid" 		value="<%=g_userid%>">
</form>

<c:import url="<%=include%>"></c:import>	
