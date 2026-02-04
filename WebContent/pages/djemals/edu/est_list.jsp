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
			<h3 class="title t3 bold s1"><mark class="cm">개설요청신청</mark> 리스트</h3>			
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="210">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="100">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">신청일시</th>
					<th scope="col" class="bold cm">교육과정</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">생년월일</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">연락처</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">소속지부</th>
					<th scope="col" class="bold cm">소속분과</th>
					<th scope="col" class="bold cm">근무처명</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${listHelper.list}" var="est">
						<tr>
							<td>${est.regi_date } ${est.regi_time }</td>
							<td>${est.edu_type_text }</td>
							<td>${est.name}</td>
							<td>${est.birth}</td>
							<td>${est.lic_no}</td>
							<td>${est.hp}</td>
							<td>${est.email}</td>
							<td>${est.edu_area }</td>
							<td>${est.big_name }</td>
							<td>${est.company_name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="estExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>
