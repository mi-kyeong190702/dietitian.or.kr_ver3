<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(id){
	
	if( confirm("정말 삭제하시겠습니까?\n한번더 생각해 보세요.") ) {
		location.href="jobAction.do?tb_idx="+id+"&crud=D";
	}
	
}
	
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
					<col width="120">
					<col width="70">
					<col width="170">
					<col width="150">
					<col width="170">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">신청일</th>
					<th scope="col" class="bold cm">회원구분</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">생년월일</th>
					<th scope="col" class="bold cm">연락처</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">주소</th>
					<th scope="col" class="bold cm">학교명</th>
					<th scope="col" class="bold cm">학과</th>
					<th scope="col" class="bold cm">삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="job">
				<tr>
					<td>${job.tb_date }</td>
					<td>
					<c:choose>
						<c:when test="${job.member_flag == '1'}">회원</c:when>
						<c:when test="${job.member_flag == '0'}">비회원</c:when>
						<c:otherwise>미선택</c:otherwise>						
					</c:choose>
					</td>
					<td>${job.tb_name}</td>
					<td>${job.tb_birth }</td>
					<td>${job.tb_hp}</td>
					<td class="link"><a href="mailto:${job.tb_email}">${job.tb_email}</a></td>
					<td>${job.tb_zip},<br>${job.tb_addr}</td>
					<td>${job.school }</td>
					<td>${job.major }</td>
					<td><a href="javascript:f_action(${job.tb_idx });" class="btn t3">삭제</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="jobExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
		
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
