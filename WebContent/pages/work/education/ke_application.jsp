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
				<li><a href="/work/education/ke_about.do">등록민간자격</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">등록민간자격증 발급 안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">등록민간자격증 발급 신청</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>									
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">등록민간자격증 발급 신청</h4>
		<div class="area text s1 pl30 pt40">
			<div class="bw0 fl mr30">
				<a href="ke_certifi_code.do?classifyCode=1"><span class="bold cw w290 mb5 p15 ke_application">신규 발급 신청 바로가기</span></a>
				<ul class="box w300 h50 r5 small ca p9 ke_application01">
					<li class="i_box_t1">자격시험 합격자</li>
					<li class="i_box_t1">재시험 합격자</li>
				</ul>
			</div>
			<div class="bw0 fl mr30">
				<a href="ke_certifi_code.do?classifyCode=2"><span class="bold cw w290 mb5 p15 ke_application_g">갱신 발급 신청 바로가기</span></a>
				<ul class="box w300 h50 r5 small ca p9 ke_application01">
					<li class="i_box_t1">자격증 유효기간 내에 전문연수교육 이수,<br>회원자격 유지한 갱신 대상자</li>
				</ul>
			</div>
		</div>
	</div>
</div>
	</c:otherwise>
</c:choose>
