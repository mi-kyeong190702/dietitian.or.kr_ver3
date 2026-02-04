<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>

<%
	String board_form = ParamUtils.getParameter(request, "board_form", "list");
	int board_page = ParamUtils.getIntParameter(request, "board_page", 1);
	int oindex = ParamUtils.getIntParameter(request, "oindex", -1);
	
	String board_search1 = ParamUtils.getParameter(request, "board_search1", "0");
	String board_search2 = ParamUtils.getParameter(request, "board_search2", "%");
	String board_keyword = ParamUtils.getParameter(request, "board_keyword", "");
	
	
	String include = "";
	if ( board_form.equals("list"))   include = "/book_board_list.do";
	if ( board_form.equals("view"))   include = "/book_board_view.do";
	if ( board_form.equals("write"))  include = "/book_board_write.do";
	if ( board_form.equals("modify")) include = "/book_board_write.do";
	if ( board_form.equals("delete")) include = "/book_board_delete.do";
	
	System.out.println("=========================================  board start ");
	System.out.println("board_form     : " + board_form);
	System.out.println("board_page     : " + board_page);
	System.out.println("oindex         : " + oindex);	
	System.out.println("include        : " + include);	
	System.out.println("=========================================  board start ");
	
%>

<form name="board">
	<input type="hidden" name="board_form" value="<%=board_form%>">
	<input type="hidden" name="board_page" value="<%=board_page%>">
	<input type="hidden" name="board_search1" value="<%=board_search1%>">
	<input type="hidden" name="board_search2" value="<%=board_search2%>">
	<input type="hidden" name="board_keyword" value="<%=board_keyword%>">
	<input type="hidden" name="oindex" value="<%=oindex%>">
</form>

<c:import url="<%=include%>"></c:import>	