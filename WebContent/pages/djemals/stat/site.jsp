<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.4.custom.min.css" />
<script src="/js/jquery-ui-1.10.4.custom.min.js"></script>
<script src="/js/jquery.ui.datepicker-ko.min.js"></script>
<script>
$("document").ready(function(){
	setDisplay();
	$("#stDate").datepicker();
	$("#endDate").datepicker();
});

function setDisplay() {
	var kind = $("input[name=kind]:checked").val();
	if( kind == '1' ) {
		$(".enddate").hide();
	} else {
		$(".enddate").show();
	}
	
}

function f_Search() {
	var kind = $("input[name=kind]:checked").val();
	var stDate = $("#stDate").val();
	var endDate = $("#endDate").val();
	
	location.href="?kind=" + kind + "&stDate=" + stDate + "&endDate=" + endDate;
}


</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">사이트 접속통계</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#">접속통계</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">사이트 접속통계</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<h3 class="title t3 bold s1"><mark class="cm">${fn:length(logs)}건</mark>의 데이터가 있습니다.</h3>
			<div class="box t1 pl10 pr10 mt10">
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>옵션</strong></label>
							<div class="ff_wrap text ml80">
								<div class="area">
									<input type="radio" class="mr5" name="kind" id="kind1" value="1" <c:if test="${kind eq '1' }"> checked </c:if>  onchange="setDisplay()" />
									<label for="kind1" class="mr20">시간대별</label>
									<input type="radio" class="mr5" name="kind" id="kind2" value="2" <c:if test="${kind eq '2' }"> checked </c:if>  onchange="setDisplay()" />
									<label for="kind2" class="mr20" >일별</label>
									<input type="radio" class="mr5" name="kind" id="kind3" value="3" <c:if test="${kind eq '3' }"> checked </c:if>  onchange="setDisplay()"  />
									<label for="kind3" class="mr20" >월별</label>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap p8">
						<div class="f_field div1">
							<label for="inputid3" class="ff_title"><strong>설정</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" class="input t1 fl w100" id="stDate" name="stDate" value="${stDate}" />	
									<span class="fl text ml10 mr10 enddate">~</span>
									<input type="text" class="input t1 fl w100 enddate" id="endDate" name="endDate" value="${endDate}" />
								
									<a href="javascript:f_Search()" class="btn form t1 fl ml5">검색</a>
									<a href="./site.do" class="btn form fl ml5">취소</a>
									
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table t3 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">구분</th>
					<th scope="col" class="bold cm">접속수</th>
					<th scope="col" class="bold cm">그래프</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${total == 0 }">
					<tr>
						<td colspan="3">데이터가 존재하지 않습니다.</td>
					</tr>
				
					</c:when>
					<c:otherwise>
						<c:forEach items="${logs}" var="log">
				<fmt:parseNumber var="perc" value="${ (log.hit) div total * 100  }" integerOnly="true" />
				<tr>
					<c:if test="${kind == '1' }">
					<td>${log.time}</td>
					</c:if>
					<c:if test="${kind == '2' or kind == '3' }">
					<td>${log.date}</td>
					</c:if>
					<td>${log.hit }</td>
					<td><div class="graph"><span style="width:${perc}%;"></span></div></td>
				</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<!-- 
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="home_board_add.html" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			 -->
		</div>
	</div>
</div>
