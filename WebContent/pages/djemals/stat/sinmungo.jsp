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
				<h2 class="title t1 s1">신문고 클릭통계</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#">접속통계</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">신문고 클릭통계</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
		
			<h3 class="title t3 bold s1"><mark class="cm">${fn:length(logs)}</mark>건의 데이터가 있습니다.</h3>
			<div class="box t1 pl10 pr10 mt10">
				<div class="form">
				<!-- 
					<div class="f_wrap line bb p8">
						
						
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
					 -->
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>옵션</strong></label>
							<div class="ff_wrap text ml80">
								<div class="area">
									<input type="radio" class="mr5" name="kind" id="kind1" value="1" <c:if test="${kind eq '1' }"> checked </c:if> />
									<label for="kind1" class="mr20">일자별</label>
									<input type="radio" class="mr5" name="kind" id="kind2" value="2" <c:if test="${kind eq '2' }"> checked </c:if> />
									<label for="kind2" class="mr20" >부서별</label>
									<input type="radio" class="mr5" name="kind" id="kind3" value="3" <c:if test="${kind eq '3' }"> checked </c:if>  />
									<label for="kind3" class="mr20" >지역별</label>
									<input type="radio" class="mr5" name="kind" id="kind4" value="4" <c:if test="${kind eq '4' }"> checked </c:if>  />
									<label for="kind4" class="mr20" >근무처분류별</label>
									<input type="radio" class="mr5" name="kind" id="kind5" value="5" <c:if test="${kind eq '5' }"> checked </c:if>  />
									<label for="kind5" class="mr20" >문의유형별</label>
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
									<!-- <a href="./banner.do" class="btn form fl ml5">취소</a> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<c:choose>
				<c:when test="${total == 0 }">
				<table class="table t3 text small center mt10">
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
					<tr>
						<td class="center">데이터가 존재하지 않습니다.</td>
					</tr>
					</tbody>
				</table>
				</c:when>
				
				<c:otherwise>	
				<table class="table t3 text small center mt10">
					<colgroup>
						<col width="12%">
						<col width="10%">
						<col width="*">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">구분</th>
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
						<td class="left">${log.page_title}</td>
						<td>${log.hit}</td>
						<td><div class="graph"><span style="width:${perc}%;"></span></div></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:otherwise>
			
			</c:choose>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="sinmungoExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
		</div>
	</div>
</div>
		
