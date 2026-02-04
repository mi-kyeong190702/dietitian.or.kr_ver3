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
			<table class="table t1 text small center">
				<colgroup>
					<col width="100">
					<col width="100">
					<col width="*">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">등록일자</th>
					<th scope="col" class="bold cm">상세보기</th>
					<th scope="col" class="bold cm">삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="monitor">
				<tr>
					<td>${monitor.m_inx}</td>
					<td>${monitor.m_name}</td>
					<td>
					<fmt:parseDate var="dateString" value="${monitor.indate}" pattern="yyyyMMddHHmmss" />
					<fmt:formatDate value="${dateString}"  pattern="yyyy-MM-dd"/>
					</td>
					<td><a href="monitorForm.do?mcode=${monitor.mcode }" class="btn">상세</a></td>
					<td><a href="javascript:f_action('${monitor.mcode }');" class="btn t3">삭제</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>
