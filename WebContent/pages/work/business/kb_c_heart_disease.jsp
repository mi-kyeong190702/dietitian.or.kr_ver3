<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">심혈계</mark>질환관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_heart.do" class="cm">심혈계질환관리</a></li>
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
				<%@ include file="inc/heart.jsp" %>
				
				<div class="h800 text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">관상동맥질환</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">관상동맥질환이란</h5>
								<p class="mt10 pl15 ">관상동맥질환은 동맥경화나 혈전으로 관상동맥의 일부가 막혀 심근의 모세혈관에 혈액이 제대로 공급되지 못해 심근 허열을 초래하거나 심근의 세포가 죽어 굳어지는 상태를 말하며, 협심증과 심근 경색이 이에 속한다.
								관상동맥 질환 환자의 식사요법의 목적은 심장의 부담을 줄이고 식사와 연관된 심장의 위험요인을 줄이는데 있다. 
								비만, 당뇨, 고혈압, 고지혈증 등의 관리 가능한 관상동맥질환의 원인을 고려하여 식사 관리를 시행하며 일반적으로 열량, 콜레스테롤, 지방, 염분 섭취를 조절하고, 비타민, 무기질, 섬유소 섭취를 늘리도록 권장된다. 
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">관상동맥질환의 식사요법</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">정상체중을 유지한다.</li>
									<li class="i_box_t1 mt5">채소와 과일을 충분하게 섭취한다.</li>
									<li class="i_box_t1 mt5">전곡류와 섬유소 함량이 높은 식품을 선택한다.</li>
									<li class="i_box_t1 mt5">등푸른 생선을 주 2회 이상 자주 섭취한다. </li>
									<li class="i_box_t1 mt5">콜레스테롤이나 포화지방산이 많은 식품의 섭취를 피한다.</li>
									<li class="i_box_t1 mt5">단음료 및 설탕이 첨가된 식품 섭취를 줄인다.</li>
									<li class="i_box_t1 mt5">염분섭취를 줄인다. </li>
									<li class="i_box_t1 mt5">술은 하루 1-2잔 이하로 조절한다.</li>
								</ul>
					</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>
