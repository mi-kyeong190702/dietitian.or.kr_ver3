<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">활</mark>동</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
				<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
				<li><a href="/work/introduction/ki_activity.do" class="cm">활동</a></li>
			</ul>
		</div>
	</div>
	
	<hr />
			
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
		
				<div class="tab t2 div5">
					<ul>
						<li><a href="/work/introduction/ki_activity.do">대한영양사협회 활동</a></li>
						<li><a href="/work/introduction/ki_activity_history.do">대한영양사협회 회관</a></li>
						<li><a href="/work/introduction/ki_activity_transition.do">연혁</a></li>
						<li><a href="/work/introduction/ki_activity_plan.do" class="on">사업계획</a></li>
						<li><a href="/work/introduction/ki_activity_articles.do">정관</a></li>
					</ul>
				</div>
				
				<h4 class="title bold t2 cm s1 i_b_t2 mt50">사업계획</h4>
				
				<jsp:include page="activity_select.jsp" flush="false">
				        <jsp:param name="idx" value="0"/>
				</jsp:include>
		
				<!-- 
				<div class="area text s1 mb50">
					<h5 class="title bold t3 s1 i_b_t3 mt50">2022년도 사업계획</h5><br />
					
					<div class="box bgs r5 mt40 ml10 p10 pl20">
						<p class="title bold i_b_t6">목표</p>
					</div>
						<ul class="mt20 ml30">
							<li class="i_box_t1">탄탄한 조직 확립 및 회원 커뮤니케이션 강화</li>
							<li class="i_box_t1 mt5">영양사 권익 보호 및 법령 개정 추진</li>
							<li class="i_box_t1 mt5">직무 전문성 강화를 위한 현장 중심 인재 양성</li>
							<li class="i_box_t1 mt5">대국민, 대영양사 인식 제고 및 홍보 활동 강화</li>
							<li class="i_box_t1 mt5">견실하고 안정적인 운영기반 구축</li>
						</ul>
				</div>
				-->
				<img src="/images/sub/ki_activity_plan.png" class="mt50" />
			</c:otherwise>
		</c:choose>
	</div>
</div>
