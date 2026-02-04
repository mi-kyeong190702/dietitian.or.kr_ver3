<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<link href="/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
<script>

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">No</th>
					<th scope="col" class="bold cm">해당지부</th>
					<th scope="col" class="bold cm">로그인 아이디</th>
					<th scope="col" class="bold cm">로그인 패스워드</th>
					<th scope="col" class="bold cm">수정</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="user">
				<form:hidden path="inx" />
				<tr>
					<td>${user.num}</td>
					<td>${user.admin_name}</td>
					<td>${user.admin_id}</td>
					<td>${user.admin_pass}</td>
					<td><a href="userForm.do?inx=${user.inx}" class="btn">수정</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			
			
		</div>

	</div>
</div>
