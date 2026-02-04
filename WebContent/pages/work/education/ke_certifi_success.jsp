<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
	<c:otherwise>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격증</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">자격증 발급안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">자격증 신청하기</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>									
	
		<div class="area">
			<!-- // FORM START -->
		
			<div class="text s1 center mt50">		
				<span class="big cm">신청이 접수되었습니다.</span><br />
				<c:if test="${param.classifyCode == '3' }">
				<span class="mt10">전문영양사 재발급비(10,000원) 까지 입금하셔야만 서류접수가 완료됩니다.</span>
				</c:if>
			</div>

			<!-- // FORM END -->	
		</div>
	</div>
</div>
	</c:otherwise>
</c:choose>
