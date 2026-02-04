<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>

<%
	String board_form = ParamUtils.getParameter(request, "board_form", "list");
	int board_page = ParamUtils.getIntParameter(request, "board_page", 1);
	
	int ctindex = ParamUtils.getIntParameter(request, "ctindex", -1);

	String include = "";
	if ( board_form.equals("list"))   include = "/cart_board_list.do";
	if ( board_form.equals("delete")) include = "/cart_board_delete.do";
	
	System.out.println("=========================================  board start ");
	System.out.println("board_form     : " + board_form);
	System.out.println("ctindex        : " + ctindex);
	System.out.println("board_page     : " + board_page);	
	System.out.println("include        : " + include);	
	System.out.println("=========================================  board start ");
	
%>

<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/dietitan.js"></script>

<form name="board">
	<input type="hidden" name="board_form" value="<%=board_form%>">
	<input type="hidden" name="board_page" value="<%=board_page%>">
	<input type="hidden" name="ctindex" value="<%=ctindex%>">
</form>

<div class="sp_body">
	<c:import url="<%=include%>"></c:import>	
</div>