<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>	
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격증</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">등록민간자격</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">등록민간자격증 발급 안내</a></li>
				<li><a href="/work/education/ke_application.do">등록민간자격증 발급 신청</a></li>
				<li><a href="/work/education/ke_verification.do" class="on">자격증 신청확인</a></li>
			</ul>
		</div>				
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">자격증 신청확인</h4>					
		
			<div class="area">
				<table class="table t1 text s1 ssmall ca center mt50 mb50">
					<colgroup>
						<col width="50%">
						<col width="50%">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">자격증명</th>
						<th scope="col" class="bold cm">상태</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${fn:length(reqList) == 0 }">
						<tr>
							<td colspan="2">신청한 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${reqList}" var="req">
						<tr>
							<td>${req.certifi_name}</td>
							<td>심사중</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
						
			</div>
	</div>
</div>
