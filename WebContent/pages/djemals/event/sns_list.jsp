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
					<col width="100">
					<col width="100">
					<col width="180">
					<col width="350">
					<col width="180">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">신청일</th>
					<th scope="col" class="bold cm">회원구분</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">연락처</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">주소</th>
					<th scope="col" class="bold cm">근무처명</th>
					<th scope="col" class="bold cm">홍보도메인</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="sns">
				<tr>
					<td>${sns.reg_date }</td>
					<td>${sns.detcodename}</td>
					<td>${sns.pers_name }</td>
					<td>${sns.lic_no }</td>
					<td>${sns.pers_hp }</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(sns.email) > 19}">
							${fn:substring(sns.email, 0, 17)}
						</c:when>
						<c:otherwise>
							${sns.email }
						</c:otherwise>
					</c:choose>
					</td>
					<td class="left">
						${fn:substring(sns.code_post, 0, 3) } - ${fn:substring(sns.code_post, 3, 6) }<br>
						${sns.pers_add } 
						<c:choose>
							<c:when test="${fn:length(sns.pers_add_detail) > 10}">
								${fn:substring(sns.pers_add_detail, 0,9)}
							</c:when>
							<c:otherwise>
								${sns.pers_add_detail }
							</c:otherwise>
						</c:choose>
					</td>
					<td>${sns.company_name }</td>
					<td>${sns.sns_domain }</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="snsExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
