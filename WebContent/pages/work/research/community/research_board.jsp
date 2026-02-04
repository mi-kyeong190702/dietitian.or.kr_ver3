<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>

<%
	String board_form 		= ParamUtils.getParameter(request, "board_form", "list");
	int board_page 			= ParamUtils.getIntParameter(request, "board_page", 1);
	String board_search 	= ParamUtils.getParameter(request, "board_search", "0");
	String board_keyword 	= ParamUtils.getParameter(request, "board_keyword", "");
	int board_cnt 			= ParamUtils.getIntParameter(request, "board_cnt", 10);

	String bbs_cd		= ParamUtils.getParameter(request, "bbs_cd", "");
	int atc_sno 			= ParamUtils.getIntParameter(request, "atc_sno", -1);
	
	String include = "";
	if ( board_form.equals("list"))   include = "/research_board_list.do";
	if ( board_form.equals("view"))   include = "/research_board_view.do";
	if ( board_form.equals("write"))  include = "/research_board_write.do";
	if ( board_form.equals("modify")) include = "/research_board_write.do";
	if ( board_form.equals("reply")) include = "/research_board_write.do";
	if ( board_form.equals("delete")) include = "/research_board_delete.do";
	
	System.out.println("=========================================  research board start ");
	System.out.println("board_form     : " + board_form);
	System.out.println("board_search   : " + board_search);
	System.out.println("board_keyword  : " + board_keyword);
	System.out.println("board_page     : " + board_page);
	System.out.println("board_cnt     : " + board_cnt);
	System.out.println("bbs_cd     : " + bbs_cd);
	System.out.println("atc_sno        : " + atc_sno);	
	System.out.println("include        : " + include);	
	System.out.println("=========================================  research board start ");
	
%>

<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/dietitan.js"></script>

<form name="board">
	<input type="hidden" name="board_form" 		value="<%=board_form%>">
	<input type="hidden" name="board_page" 		value="<%=board_page%>">
	<input type="hidden" name="board_cnt" 		value="<%=board_cnt%>">
	<input type="hidden" name="board_search" 	value="<%=board_search%>">
	<input type="hidden" name="board_keyword" 	value="<%=board_keyword%>">
	<input type="hidden" name="bbs_cd" 	value="<%=bbs_cd%>">
	<input type="hidden" name="atc_sno" 		value="<%=atc_sno%>">
</form>

<c:import url="<%=include%>"></c:import>	
