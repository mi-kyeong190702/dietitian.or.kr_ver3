<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page import="kda.utils.ParamUtils"%>

<%
	String board_form = ParamUtils.getParameter(request, "board_form", "list");
	int board_page = ParamUtils.getIntParameter(request, "board_page", 1);
	String board_search = ParamUtils.getParameter(request, "board_search", "0");
	String board_keyword = ParamUtils.getParameter(request, "board_keyword", "");

	int resi_serial_no = ParamUtils.getIntParameter(request, "resi_serial_no", -1);
	
	String include = "";
	if ( board_form.equals("list"))   include = "/resi_board_list.do";
	if ( board_form.equals("view"))   include = "/resi_board_view.do";
	if ( board_form.equals("write"))  include = "/resi_board_write.do";
	if ( board_form.equals("modify")) include = "/resi_board_write.do";
	if ( board_form.equals("delete")) include = "/resi_board_delete.do";
	
	System.out.println("=========================================  board start ");
	System.out.println("board_form      : " + board_form);
	System.out.println("board_page      : " + board_page);
	System.out.println("resi_serial_no  : " + resi_serial_no);	
	System.out.println("include         : " + include);	
	System.out.println("=========================================  board start ");
	
%>


<form name="board">
	<input type="hidden" name="board_form" value="<%=board_form%>">
	<input type="hidden" name="board_page" value="<%=board_page%>">
	<input type="hidden" name="board_search" value="<%=board_search%>">
	<input type="hidden" name="board_keyword" value="<%=board_keyword%>">
	<input type="hidden" name="resi_serial_no" value="<%=resi_serial_no%>">
</form>

<c:import url="<%=include%>"></c:import>