<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="100">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">회원ID</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">적립포인트</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="point">
				<tr>
					<td>${point.id }</td>
					<td>${point.pers_name}</td>
					<td>${point.point }</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="pointTopExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
		
		</div>

	</div>
</div>
