<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">경관</mark>급식</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_tube_feeding.do" class="cm">경관급식</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="h900 w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<%@ include file="inc/tubefeeding.jsp" %>
				<div class="h800 text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">경관급식용 영양액의 종류</h4><br />
								<p class="middle mt20">국내 사용 가능한 상업용 경장 영양액 영양성분을 정리해 보면 다음과 같다.</p>
					<a href="/assets/ver2/down/data/2011_경장영양액영양성분.xls" class="btn t1 big mt30">상업용 경장 영양액 영양성분 다운로드</a>
				</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
