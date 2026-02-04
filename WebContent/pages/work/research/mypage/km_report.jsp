<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${null eq loginVo}">
		<script type="text/javascript"> 
			alert("로그인 후 이용해주세요.");
			location.href="/work/research/login/kl_login.do";
		</script>
	</c:when>
	<c:otherwise>
			
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">면허신고</mark> 현황</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/mypage/km_modify.do">마이페이지</a></li>
							<li><a href="/work/research/mypage/km_report.do" class="cm">면허신고 현황</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<c:import url="/research_mypage_report.do"></c:import>
				</div>
			</div>
			
	</c:otherwise>
</c:choose>