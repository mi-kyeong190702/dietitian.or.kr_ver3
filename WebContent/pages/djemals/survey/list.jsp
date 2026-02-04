<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
function f_search() {
	
	location.href="?mainTmsCnt=" + $("#mainTmsCnt").val() + "&srch=" + $("#srch").val();
}

</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">설문 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">설문 관리</a></li>
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
									
									<select class="select t2 fl w20p ml5" id="mainTmsCnt" name="mainTmsCnt">
										<option value="">대상[전체]</option>
										<c:forEach items="${mainList}" var="main">
										<option value="${main.tms_cnt}" <c:if test="${param.mainTmsCnt == main.tms_cnt }">selected</c:if>>${main.tms_title}</option>
										</c:forEach>
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
					<col width="80">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">분류번호</th>
					<th scope="col" class="bold cm">설문번호</th>
					<th scope="col" class="bold cm">설문제목</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="subject">
				<tr>
					<td class="cm">${subject.tms_cnt}</td>
					<td class="ssmall">${subject.tms_idx }</td>
					<td class="left link"><a href="./result.do?curPage=${listHelper.curPage}&mainTmsCnt=${param.mainTmsCnt}&srch=${param.srch}&tms_idx=${subject.tms_idx}">${subject.tms_title}</a></td>					
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
			
			<kda:paging listHelper="${listHelper}" />
			 
		</div>
	</div>
</div>
