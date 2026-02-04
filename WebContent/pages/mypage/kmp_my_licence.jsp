<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">MY</mark> 수료증정보</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/kmp_my_licence.do" class="cm">MY 수료증정보</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="box p20">
			<div class="title s1 i_b_t6">
				보유수료증
			</div>
		</div>
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="100">
				<col width="100">
				<col width="*">
				<col width="200">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">수료증명</th>
				<th scope="col" class="bold cm">발급번호</th>
				<th scope="col" class="bold cm">발급 및 갱신일자</th>
				<th scope="col" class="bold cm">유효기간</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${certifiList.size() > 0 }">
					<c:forEach items="${certifiList}" var="certifi">
						<tr>
							<td>${certifi.certifi_name}</td>
							<td>${certifi.result_no}</td>
							<td><fmt:parseDate value="${certifi.result_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
								<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="result_dt" scope="page"/>${result_dt}
							</td>
							<fmt:parseDate value="${certifi.result_start_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
							<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="result_start_dt" scope="page"/>
							<fmt:parseDate value="${certifi.result_end_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
							<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="result_end_dt" scope="page"/>
							<td>${result_start_dt} ~ ${result_end_dt}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">회원님께서는 보유하신 수료증이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
</div>
