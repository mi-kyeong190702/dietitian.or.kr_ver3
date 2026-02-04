<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function f_search(){
	var srchTy = $("#srchTy").val();

	location.href="handonList.do?srchTy=" + srchTy;
}

function f_alert(id){
	
	$.ajax ( {
        type		: "POST"
		, url		: "handonAlert.do"
		, dataType  : "text"
		, data		: "id=" + id
		, cache		: false
		, success	: handleInsertCart
		, error		: handleInsertCartError				
	});
	
}

function f_excel(){
	var srchTy = $("#srchTy").val();

	location.href="handonExcel.do?srchTy=" + srchTy;
}

function handleInsertCart(data)
{
	alert(data);
}

function handleInsertCartError(){}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		
		<div class="form">
			<div class="box t1 p10 mt5">	
					<div class="f_wrap">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>월별검색</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w10p" id="srchTy" name="srchTy">
										<c:forEach items="${handonTy}" var="ty">
										<option value="${ty.key}" <c:if test="${param.srchTy == ty.key }">selected</c:if> >${ty.value}</option>
										</c:forEach>
									</select>
									<a href="javascript:f_search();" class="btn form t1 fl ml5">검색</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="300">
					<col width="120">
					<col width="70">
					<col width="70">
					<col width="120">
					<col width="70">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">게시물 제목</th>
					<th scope="col" class="bold cm">작성자 ID</th>
					<th scope="col" class="bold cm">작성자 이름</th>
					<th scope="col" class="bold cm">댓글 개수</th>
					<th scope="col" class="bold cm">댓글작성자 ID</th>
					<th scope="col" class="bold cm">댓글작성자 이름</th>
					<th scope="col" class="bold cm">댓글 내용</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="idx" value="1"/>
				<c:forEach items="${list}" var="handon">
				<tr>
				<c:choose>
					<c:when test="${handon.cnt2 < 2}">
						<td class="link"><a href="handonForm.do?bbs_idx=${handon.bbs_idx}">${handon.bbs_subject }</a></td>
						<td class="link"><a href="javascript:f_alert('${handon.bbs_user_id}');">${handon.bbs_user_id}</a></td>
						<td class="link"><a href="javascript:f_alert('${handon.bbs_user_id}');">${handon.bbs_name }</a></td>
						<td>${handon.cnt2 } 개</td>
						<td>${handon.bbc_user_id }</td>
						<td>${handon.bbc_name }</td>
						<td>${handon.bbc_contents }</td>
					</c:when>
					<c:otherwise>
						<c:if test="${idx == 1 }">
						<td class="link" rowspan="${handon.cnt2 }" ><a href="handonForm.do?bbs_idx=${handon.bbs_idx}">${handon.bbs_subject }</a></td>
						<td class="link" rowspan="${handon.cnt2 }" ><a href="javascript:f_alert('${handon.bbs_user_id}');">${handon.bbs_user_id}</a></td>
						<td class="link" rowspan="${handon.cnt2 }" ><a href="javascript:f_alert('${handon.bbs_user_id}');">${handon.bbs_name }</a></td>
						<td rowspan="${handon.cnt2 }" >${handon.cnt2 } 개</td>
						</c:if>
						<td>${handon.bbc_user_id }</td>
						<td>${handon.bbc_name }</td>
						<td>${handon.bbc_contents }</td>
						<c:choose>
							<c:when test="${handon.cnt2 == idx }">
								<c:set var="idx" value="1"/>
							</c:when>
							<c:otherwise>
								<c:set var="idx" value="${idx+1 }"/>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="javascript:f_excel();" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
		</div>

	</div>
</div>
