<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
function f_search() {
	if($("#srch").val() == "" ) {
		alert("검색어를 입력하여 주십시요");
		return;
	}
	
	location.href="?kind=" + $("#kind").val() + "&srch=" + $("#srch").val();
}

</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">콘텐츠 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> 홈페이지 관리</li>
					<li><span>&gt;</span> 콘텐츠 관리</li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<div class="area">
				<div class="ib fl">
					<div class="text mt5">
						<strong class="bold cm">${listHelper.totalCount}건</strong>의 데이터가 있습니다.
					</div>
				</div>
				<div class="ib fr">
					<div class="ib fl"><a href="./form.do" class="btn form">신규등록</a></div>
				</div>
			</div>
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div1">
							<label for="inputid3" class="ff_title"><strong>검색</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w20p ml5" id="kind" name="kind">
										<option value="1" <c:if test="${param.kind == '1' }">selected</c:if>>콘텐츠명</option>
										<option value="2" <c:if test="${param.kind == '2' }">selected</c:if>>파일명</option>
									</select>
									<input type="text" class="input t1 fl w40p ml5" id="srch" name="srch" value="${param.srch}" />
									<a href="javascript:f_search()" class="btn form t1 fl ml5">검색</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table t1 text small center mt5">
				<colgroup>
					<col width="60">
					<col width="150">
					<col width="300">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">대분류</th>
					<th scope="col" class="bold cm">콘텐츠명</th>
					<th scope="col" class="bold cm">파일명</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="contents">
				<tr>
					<td class="cm">${contents.num}</td>
					<td class="left">${contents.depth1}</td>
					<td class="left link"><a href="./form.do?idx=${contents.idx}">${contents.contents_name}</a></td>
					<td class="left">${contents.path}</td>
					
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<!-- 
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="home_survey_add.html" class="btn big t1">신규등록</a></li>
				</ul>
			</div>
			 -->
			
			<kda:paging listHelper="${listHelper}"/>
			 
		</div>
	</div>
</div>
