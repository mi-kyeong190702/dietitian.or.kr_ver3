<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_Delete() {
	<c:if test="${resTotalCount > 0}">
	alert("답변이 있는 항목은 삭제가 불가합니다.");
	</c:if>
	
	<c:if test="${resTotalCount == 0}">
	if( confirm("설문을 삭제하시겠습니까?") ) {
		$("#crud").val("D");
		document.frmSubject.action = "./action.do";
		document.frmSubject.submit();
	}
	</c:if>
}
</script>

<div id="adm_contents">
	<form:form name="frmSubject" modelAttribute="subject">
	<form:hidden path="crud" />
	<form:hidden path="tms_cnt" />
	<form:hidden path="tms_idx" />
	</form:form>
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">설문 결과</h2>
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
			<h3 class="title t2 s1 cm">${subject.main_tms_title}</h3>
			<div class="area mt15">
				<h4 class="title t3 bold s1"><mark class="cm">설문</mark>결과</h4>
			</div>
			<div class="box t2 p10 mt10">
				<div class="area">
					<div class="text middle s1">
						${subject.tms_idx} 번 : ${subject.tms_title}
					</div>
					<div class="box t1 p10 mt10">
						<div class="area text">
							<div class="ib fl">
								<strong class="bold cm">전체 응답자 수</strong>
							</div>
							<div class="ib fr">
								${resTotalCount}명
							</div>
						</div>
						
						<table class="table t3 text small center mt5">
							<colgroup>
								<col width="*">
								<col width="150">
								<col width="150">
								<col width="150">
							</colgroup>
							<thead>
							<tr>
								<th scope="col" class="bold cm">제목</th>
								<th scope="col" class="bold cm">인원수</th>
								<th scope="col" class="bold cm">그래프</th>
								<th scope="col" class="bold cm">비율</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${resList}" var="res">
							<c:if test="${  resTotalCount > 0}">
							<fmt:parseNumber var="perc" value="${ (res.cnt) div resTotalCount * 100  }" integerOnly="true" />
							</c:if>
							<tr>
								<td class="left">${res.tmc_title }</td>
								<td>${res.cnt}명</td>
								<td><div class="graph"><span style="width:${perc}%;"></span></div></td>
								<td>${perc}%</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
			
			<c:if test="${fn:length(resEtcList) > 0 }">
			<div class="box t2 p10 mt10">
				<div class="area">
					<div class="text middle s1">
						${resEtcList[0].tmc_title }
					</div>
					<div class="box t1 mt10">
						<ul class="area text">
							<c:forEach items="${resEtcList}" var="etc">
							<li class="p10 line bt">${etc.tmr_etc}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			</c:if>
			
			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="./list.do?curPage=${param.curPage}&mainTmsCnt=${param.mainTmsCnt}&srch=${param.srch}" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_Delete()" class="btn big t3">삭제</a></li>
					<!-- 
					<li><a href="#" class="btn big">엑셀로 다운받기</a></li>
					 -->
				</ul>
			</div>
		</div>
		
	</div>
</div>
