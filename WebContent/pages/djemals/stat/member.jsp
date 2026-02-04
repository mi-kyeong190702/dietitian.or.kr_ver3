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

$(document).ready(function(){
	$("#stDate").datepicker();
	$("#endDate").datepicker();
});

function f_Search() {
	if( $("#srch").val() == "" ) {
		alert("회원을 먼저 검색하여 주십시요");
		$("#id").focus();
		return;
	}
	
	
	var kind = $("input[name=kind]:checked").val();
	var stDate = $("#stDate").val();
	var endDate = $("#endDate").val();
	var srch = $("#srch").val();
	location.href="?kind=" + kind + "&stDate=" + stDate + "&endDate=" + endDate + "&srch=" + srch + "&id=" + $("#id").val()
					+ "&pers_name=" + $("#pers_name").val() + "&code_pers=" + $("#code_pers").val();
}

function f_SearchMember() {
	if( $("#id").val() == ""  ) {
		alert("회원ID를 입력하여 주십시요");
		$("#id").focus();
		return;
	}
	
	$.ajax({
		url : "/djemals/stat/search_member_ajax.do",
		data : "id=" + $("#id").val(),
		success : function(member) {
			if( member ) {
				$("#pers_name").val(member.pers_name);
				$("#srch").val(member.code_pers);
				$("#pers_name").show();
			} else {
				alert("검색된 사용자가 존재하지 않습니다");	
			}
		}
	});
}
</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">개인별 접속통계</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#">접속통계</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">배너 클릭통계</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
		
			<h3 class="title t3 bold s1"><mark class="cm">${fn:length(logs)}</mark>건의 데이터가 있습니다.</h3>
			<div class="box t1 pl10 pr10 mt10">
				<div class="form">
					<div class="f_wrap line bb p8">
						<!-- 
						<div class="f_field div3">
							
							<label for="inputid1" class="ff_title"><strong>회원명</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" class="input t1" name="pers_name" id="pers_name" />
								</div>
							</div>
						</div>
						 -->
						<div class="f_field div3">
							<label for="inputid2" class="ff_title"><strong>회원ID</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" class="input t1 fl w150" name="id" id="id" value="${param.id }" />
									
									<input type="text" class="input t1 fl w100 ml5" name="pers_name" id="pers_name" <c:if test="${ param.pers_name eq null  }">style="display:none;" </c:if> value="${param.pers_name }" />
									<input type="hidden" id="srch" name="srch" value="${param.srch}" />
									<a href="javascript:f_SearchMember()" class="btn form t1 fl ml5">검색</a>
								</div>
							</div>
						</div>
						
					</div>
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
									<a href="./banner.do" class="btn form fl ml5">취소</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			
			<c:if test="${param.srch eq null }">
			<table class="table t3 text small center mt10">
				<colgroup>
					<col width="100%">
				</colgroup>
				<tbody>
				<tr>
					<td class="center">회원명 또는 아이디로 검색 후 이용하여 주십시요.</td>
				</tr>
				</tbody>
			</table>
			</c:if>
			<c:if test="${param.srch ne null }">	
			<table class="table t3 text small center mt10">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="10%">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">구분</th>
					<th scope="col" class="bold cm">메뉴명</th>
					<th scope="col" class="bold cm">건수</th>
					<th scope="col" class="bold cm">그래프</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${fn:length(logs) == 0 }">
				<tr>
					<td colspan="4">접속기록이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				<c:forEach items="${logs}" var="log">
				<fmt:parseNumber var="perc" value="${ (log.hit) div total * 100  }" integerOnly="true" />
				<tr>
					<c:choose>
						<c:when test="${param.kind == '1' }">
						<td>${log.time} 시</td>
						</c:when>
						<c:otherwise>
						<td>${log.date}</td>
						</c:otherwise>
					</c:choose>
					<td class="left">${log.page_title}</td>
					<td>${log.hit}</td>
					<td><div class="graph"><span style="width:${perc}%;"></span></div></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			</c:if>
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
		
