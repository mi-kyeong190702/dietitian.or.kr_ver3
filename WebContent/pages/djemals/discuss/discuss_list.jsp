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
	
	if( confirm("정말 삭제하시겠습니까?") ) {
		location.href="discussAction.do?bateIndex="+id+"&crud=D";
	}
	
}
	
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<div class="area">
				<div class="ib fl">
					<div class="text mt5">
						지금 생성되어져 있는 토론 주제들
					</div>
				</div>
				<div class="ib fr">
					<div class="ib fl"><a href="discussForm.do" class="btn form">새로 만들기</a></div>
				</div>
			</div>
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="60">
					<col width="*">
					<col width="70">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">코드</th>
					<th scope="col" class="bold cm">주제</th>
					<th scope="col" class="bold cm">수정</th>
					<th scope="col" class="bold cm">삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="discuss">
				<tr>
					<td>${discuss.bateIndex }</td>
					<td class="left">${discuss.bateSubject }</td>
					<td><a href="discussForm.do?bateIndex=${discuss.bateIndex }" class="btn">수정</a></td>
					<td><a href="javascript:f_action(${discuss.bateIndex });" class="btn t3">삭제</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
