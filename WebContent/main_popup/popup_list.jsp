<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>한돈 쿠킹타임</title>	
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/layout.css">
	<script src="/js/jquery-1.11.2.min.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.timepicker.js"></script>
	<script type="text/javascript" src="/js/html5.js"></script>
	<script src="/js/jquery.PrintArea.js_4.js"></script>
	<script src="/js/jquery.printElement.js"></script>
	<script src="/js/jquery.mb.browser.min.js"></script>
	<script src="/js/jquery.bpopup.min.js"></script>	
	<script src="/js/dietitan.js"></script>
	
	
</head>
<body>
<div class="sp_body">

	<div class="area mt20 ml20 mb20" style="width:90% !important;">
		<table width="98%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td align="center" valign="top">
		<c:if test="${ param.bbs_board_code == '89' }">
		<table width="840" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td colspan="2" align="center"><img src="images/t01.gif" width="400" height="163"></td>
	      </tr>
	      </table>
		</c:if>
		
		<c:if test="${ param.bbs_board_code == '6' }">
		<table width="780" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center"><img src="images/banner004_t_1.gif" width="500" height="100"></td>
			</tr>
		</table>
	    </c:if>
		
		<div class="area mt20">
		<%@ include file ="/pages/board/paper_board.jsp"%>
		</div>
	</div>
</div>
</body>
</html>														