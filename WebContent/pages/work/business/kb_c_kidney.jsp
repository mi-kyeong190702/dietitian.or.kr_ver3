<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신장</mark>질환관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_kidney.do" class="cm">신장질환관리</a></li>
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
		
				<%@include file="inc/kidney.jsp" %>
				
				<div class="h800 text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">신장질환</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">신장질환</h5>
							<p class="mt10 pl15">신장은 척추의 좌우측에 위치한 장기로 대사과정 중 생긴 노폐물을 배설하고 수분과 전해질의 균형을 유지하며 혈압을 조절한다. 
							이외에도 신장은 조혈작용을 돕고 비타민 D를 활성화하여 칼슘의 재흡수에 관여하는 등의 중요한 역할을 담당하고 있다.
							</p>
							<p class="mt10 pl15">그러므로 신장이 여러 가지 이유로 제 기능을 하지 못하면 소변에 단백질이나 혈액이 빠져 나오기도 하고, 혈액 내에 노폐물이 쌓이며, 
							수분과 전해질의 불균형, 소변량의 감소, 부종, 고혈압 등의 증상이  나타나게 된다.
							</p>
							<p class="mt10 pl15">신장질환은 종류가 많고 증상과 예후도 각기 다르므로 치료방법 및 식사조절도 이에 맞도록 하여야 한다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
