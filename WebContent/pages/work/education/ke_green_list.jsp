<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.util.Date date = calendar.getTime();

String today    = new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>

<script>
function send_view(idx) {
	$("#idx").val(idx);
	document.frm.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">초록</mark>접수</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_green.do" class="cm">초록접수</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!-- // Contents Start -->
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_green.do">접수안내</a></li>
				
				<!-- 
					온라인접수 시작/종료 처리시 4군데 수정
					ke_green_list.jsp
					ke_green_online.jsp
					ke_green_verification.jsp
					ke_green.jsp
				 -->
				 
				<!-- 온라인접수 시작시 주석해제 / 종료시 주석처리 start -->
				<li><a href="/work/education/ke_green_online.do">온라인접수</a></li>
				<!-- 온라인접수 시작시 주석해제 / 종료시 주석처리 end -->
				
				<!-- 온라인접수 시작시 주석처리 / 종료시 주석해제 start -->
				<!-- <li><a href="#">온라인접수</a></li> -->
				<!-- 온라인접수 시작시 주석처리 / 종료시 주석해제 end -->
				
				
				<li><a href="/work/education/ke_green_verification.do" class="on">접수확인 및 심사결과</a></li>
			</ul>
		</div>	
	
		
		<h4 class="title bold t2 cm s1 i_b_t2 mt50">접수확인 및 심사결과</h4><br />
		<div class="area">
			<table class="table t1 text s1 ssmall ca center mt20 mb20">
				<colgroup>
					<col width="120">
					<col width="120">
					<col width="*">
					<col width="150">
					<col width="90">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">구분</th>
					<th scope="col" class="bold cm">분야</th>
					<th scope="col" class="bold cm">접수일</th>
					<th scope="col" class="bold cm">심사결과</th>
				</tr>
				</thead>
				<tbody>
		<c:choose>
			<c:when test="${fn:length(greenList) > 0 }">
				<c:forEach items="${greenList}" var="green">
				<tr>
				    <% if( yyyyMMdd >= 20250626 ) { %>
					   <td>${green.name}</td>
					<% } else {%>
					   <td><a href="javascript:send_view('${green.idx }')">${green.name}</a></td>
					<% } %>
					
					<td>
						<c:if test="${green.gubun == '01' }">구연발표</c:if>
						<c:if test="${green.gubun == '02' }">포스터발표</c:if>
					</td>
					<td>
						<c:if test="${green.edu_type == '01' }">급식경영/단체급식</c:if>
						<c:if test="${green.edu_type == '02' }">영양교육</c:if>
						<c:if test="${green.edu_type == '03' }">임상영양</c:if>
						<c:if test="${green.edu_type == '04' }">식품위생</c:if>
						<c:if test="${green.edu_type == '05' }">식품학/식품과학</c:if>
						<c:if test="${green.edu_type == '06' }">식품조리</c:if>
						<c:if test="${green.edu_type == '07' }">지역사회영양(영양조사/식습관)</c:if>
						<c:if test="${green.edu_type == '08' }">기타
							<c:if test='${green.edu_type_etc != "" }'>( ${green.edu_type_etc} )</c:if>
						</c:if>
					</td>
					<td>${green.reg_date}</td>
					<td>심사중</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">신청된 내역이 없습니다.</td>				
				</tr>
			</c:otherwise>
		</c:choose>
				</tbody>
			</table>
		</div>
		<div class="center text s1 small cm">	
			※ 접수기간 중에만 수정 및 취소 가능합니다. (접수기간 이후 절대 불가)</br>
			※ 이름 클릭 시 수정가능합니다.
		</div>
		
		<form name="frm" method="post" action="ke_green_online.do">
			<input type="hidden" name="name" value="${param.name }" />
			<input type="hidden" name="tel_hp" value="${param.tel_hp }" />
			<input type="hidden" name="idx"  id="idx" />
		</form>
	

				
		<!--  // Contents End -->
	</div>
</div>
