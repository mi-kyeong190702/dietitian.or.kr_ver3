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
					<h4 class="title bold cm t2 i_b_t2 mt50">경관급식이란</h4><br />
						<h5 class="title bold t3 i_b_t3 mt40">경관급식이란</h5><br />
							<p class="mt10 pl15"> 경관급식이란 위장관 기능은 정상이나 구강으로 충분한 영양섭취가 어려운 환자에게 관(Tube)을 통해 영양을 공급하는 영양지원의 한 방법이다. 
							환자 의식이 감소되거나 연하곤란(Dysphagia)등으로 구강 식사섭취가 불가능하거나 이외에도 다양한 원인으로 구강섭취가 불가능하거나 불충분한 경우 경관급식을 고려하게 된다. 
							</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
