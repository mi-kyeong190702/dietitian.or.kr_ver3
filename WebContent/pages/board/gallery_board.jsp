<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>

<%
	String board_form = ParamUtils.getParameter(request, "board_form", "list");
	int board_page = ParamUtils.getIntParameter(request, "board_page", 1);
	String board_search = ParamUtils.getParameter(request, "board_search", "0");
	String board_keyword = ParamUtils.getParameter(request, "board_keyword", "");

	int bbs_board_code = ParamUtils.getIntParameter(request, "bbs_board_code", 0);
	int bbs_idx = ParamUtils.getIntParameter(request, "bbs_idx", -1);
	
	String include = "";
	if ( board_form.equals("list"))   include = "/gallery_board_list.do";
	if ( board_form.equals("view"))   include = "/gallery_board_view.do";
	if ( board_form.equals("write"))  include = "/gallery_board_write.do";
	if ( board_form.equals("modify")) include = "/gallery_board_write.do";
	if ( board_form.equals("delete")) include = "/gallery_board_delete.do";
	
	System.out.println("=========================================  board start ");
	System.out.println("board_form       : " + board_form);
	System.out.println("board_page       : " + board_page);
	System.out.println("bbs_board_code : " + bbs_board_code);
	System.out.println("bbs_idx        : " + bbs_idx);	
	System.out.println("include        : " + include);	
	System.out.println("=========================================  board start ");
	
%>

<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/dietitan.js"></script>

<form name="board">
	<input type="hidden" name="board_form" value="<%=board_form%>">
	<input type="hidden" name="board_page" value="<%=board_page%>">
	<input type="hidden" name="board_search" value="<%=board_search%>">
	<input type="hidden" name="board_keyword" value="<%=board_keyword%>">
	<input type="hidden" name="bbs_board_code" value="<%=bbs_board_code%>">
	<input type="hidden" name="bbs_idx" value="<%=bbs_idx%>">
</form>

<c:import url="<%=include%>"></c:import>	