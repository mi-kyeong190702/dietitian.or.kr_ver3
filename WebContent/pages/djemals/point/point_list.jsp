<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

$(document).ready(function(){
	$("input[name=pointVal]").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	$("input[name=pointVal]").focusout(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
});

function f_search() {
	var srchTy = $("#srchTy").val();
	var srchName = $("#srchName").val();
	
	if(srchName.trim() == ""){
		alert("검색어를 입력하세요.");
		$("#srchName").focus();
		return;
	}

	location.href="pointList.do?srchTy=" + srchTy + "&srchName=" + srchName;
}

function f_action(id){
	var point = $("#"+id+"Point").val();
	
	if(point.trim()==""){
		alert("포인트를 입력하세요");
		$("#"+id+"Point").focus();
		return;
	}
	
	location.href="pointAction.do?point="+point+"&id="+id+"&crud=U";
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>검색</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w15p" id="srchTy" name="srchTy">
										<c:forEach items="${pointTy}" var="ty">
										<option value="${ty.key}" <c:if test="${param.srchTy == ty.key }">selected</c:if> >${ty.value}</option>
										</c:forEach>
									</select>
									<input type="text" class="input t1 fl w50p ml5" id="srchName" name="srchName" value="${param.srchName}"/>
									<a href="javascript:f_search();" class="btn form t1 fl ml5">검색</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="200">
					<col width="200">
					<col width="100">
					<col width="150">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">연번</th>
					<th scope="col" class="bold cm">회원ID</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">적립포인트</th>
					<th scope="col" class="bold cm">포인트수정</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="point">
				<tr>
					<td>${point.num }</td>
					<td>${point.id}</td>
					<td>${point.pers_name }</td>
					<td class="cp">${point.point }</td>
					<td class="left">
						<input type="text" name="pointVal" id="${point.id }Point" maxlength="6" class="fl w70 mr5 input t1"/>
						<a href="javascript:f_action('${point.id }');" class="btn form">적용</a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
