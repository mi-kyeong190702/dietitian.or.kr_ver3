<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../common.jsp"%>

<script type="text/javascript"> 

function doc_print(detcode, doc_seq)
{
		shape  = "width=750,height=700,";
		shape += "toolbar=no,location=no,directories=no,status=no,";
		shape += "menubar=no,scrollbars=no,resizable=yes";
		path   = "/doc_form/docu_print_user.jsp?gubun=E&print_kind=4&code_kind=4&detcode=" + detcode + "&doc_seq=" + doc_seq;

		xx = screen.availWidth;
		yy = screen.availHeight;
		sxx = 0;
		syy = 0;
		sxx = (xx/2) - 200;
		syy = (yy/2) - 90;

		shape = shape + ", top=" + syy + ", left=" + sxx;
  		window.open(path, "doc_print", shape);
}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">식품위생</mark>교육</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="kmp_situation.do">MY 교육정보</a></li>
				<li><a href="/kmp_hygiene.do" class="cm">식품위생교육</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="70">
				<col width="90">
				<col width="50">
				<col width="*">
				<col width="70">
				<col width="70">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">적용년도</th>
				<th scope="col" class="bold cm">교육일</th>
				<th scope="col" class="bold cm">차수</th>
				<th scope="col" class="bold cm">교육장소</th>
				<th scope="col" class="bold cm">이수여부</th>
				<th scope="col" class="bold cm">출력</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${requestScope.myList.size() >0 }">
					<c:forEach var="i" begin="0" end="${requestScope.myList.size()-1 }">
						<tr>
							<td>${requestScope.myList[i].yyyy}</td>
							<td>
								<fmt:parseDate value="${requestScope.myList[i].oper_end_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
								<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_end_dt" scope="page"/>${oper_end_dt}
							</td>
							<td>${requestScope.myList[i].operation_cnt}</td>
							<td>( ${requestScope.myList[i].operation_place} )</td>
							<td>
								<c:choose>
									<c:when test="${requestScope.myList[i].result_state == '-1'}">${requestScope.myList[i].oper_state_txt}</c:when>
									<c:otherwise>${requestScope.myList[i].result_state_txt}</c:otherwise>
								</c:choose>	
							</td>
							<td>
								<c:if test="${requestScope.myList[i].rt >= 10 && requestScope.myList[i].rt != ''}">
									<a href="javascript:doc_print('${requestScope.myList[i].detcode}','${requestScope.myList[i].result_no}')" class="btn">출력</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">위생 교육 목록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
		
		<div class="area center mb50">
			<p class="text middle bold ca s1 mt50 ml10">2015년 이후 수료증 출력은 KDA 영양사 법정교육센터에서 가능합니다.</p>
			<a class="btn t1 bbig mt20" href="http://dbms.kdaedu.or.kr/web/curriculum/confirm/list" title="새창으로 이동" target="_blank">전년도 교육 조회 바로가기</a>
		</div>
	</div>
</div>
