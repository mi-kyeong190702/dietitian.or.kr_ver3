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
					<col width="60">
					<col width="*">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="90">
					<col width="90">
					<col width="90">
					<col width="100">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">코드</th>
					<th scope="col" class="bold cm">게시판 명</th>
					<th scope="col" class="bold cm">의견글</th>
					<th scope="col" class="bold cm">자료실</th>
					<th scope="col" class="bold cm">읽기권한</th>
					<th scope="col" class="bold cm">쓰기권한</th>
					<th scope="col" class="bold cm">목록보기권한</th>
					<th scope="col" class="bold cm">제목태그권한</th>
					<th scope="col" class="bold cm">내용태그권한</th>
					<th scope="col" class="bold cm">서브메뉴 인덱스</th>
					<th scope="col" class="bold cm">상세</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="lv" value="${levelName }" />
				<c:set var="tf" value="${truefalse }" />
				<c:forEach items="${listHelper.list}" var="board">
				<tr>
					<td>${board.bs_code}</td>
					<td>${board.bs_name}</td>
					<td>${tf[board.bs_Comments]}</td>
					<td>${tf[board.bs_pds] }</td>
					<td>${lv[board.bs_ViewLevel]}</td>
					<td>${lv[board.bs_WriteLevel]}</td>
					<td>${lv[board.bs_ListLevel]}</td>
					<td>${lv[board.bs_sTagLevel]}</td>
					<td>${lv[board.bs_cTagLevel]}</td>
					<td>${board.bs_SubMenuIndex}</td>
					<td><a href="boardForm.do?bs_code=${board.bs_code }" class="btn">상세</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="boardForm.do" class="btn big t1">게시판 생성</a></li>
				</ul>
			</div>
			
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>
