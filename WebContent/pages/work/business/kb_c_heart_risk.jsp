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
						<h4 class="title bold cm t2 i_b_t2 mt50">위험요인</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">심혈관계질환의 위험요인</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">흡연</li>
									<li class="i_box_t1 mt5">고혈압, 당뇨병 및 비만</li>
									<li class="i_box_t1 mt5">혈중 지질 이상
										<ul class="small ">
											<li class="i_b_t7">혈액내 LDL-콜레스테롤(저밀도 지단백-콜레스테롤)*의 상승</li>
											<li class="i_b_t7">혈액내 HDL-콜레스테롤(고밀도 지단백-콜레스테롤)** 치가 40mg/dl 미만인 경우</li>
										</ul>
									</li>
									<li class="i_box_t1 mt5">관상동맥성 심혈관계질환의 가족력</li>
									<li class="i_box_t1 mt5">나이 : 남자 45세 이상, 여자 55세 이상 또는 조기폐경</li>
									<li class="i_box_t1 mt5">신체 활동 저하</li>
								</ul>
								<ul class="mt10 pl15">
									<li>* LDL-콜레스테롤(저밀도 지단백 콜레스테롤) 은 혈관 벽에 콜레스테롤을 쌓아 혈액순환을 방해하므로 '나쁜 콜레스테롤'이라 한다. 
										이러한 나쁜 콜레스테롤은 가급적 혈중에 낮게 유지되어야 하며 높을 경우 심혈관계질환에 걸릴 위험이 높게 된다. 
										혈액 내 LDL- 콜레스테롤 수치는 관상동맥질환이나 당뇨병, 기타 위험인자 여부에 따라 권장 수치가 달라진다.
									</li>
									<li class="mt10">* HDL-콜레스테롤(고밀도 지단백-콜레스테롤)은 혈액 내에 쌓여 있는 콜레스테롤을 간으로 전달하여 
										우리 몸으로부터 콜레스테롤을 없애 주는 역할을 하므로 '좋은 콜레스테롤'이라 한다.
										HDL - 콜레스테롤 낮은 경우 심혈관계질환에 걸릴 위험이 높게 되므로 수치가 높을수록 좋다.
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">심혈관계질환의 위험요인</h5>
								<p class="mt10 pl15">변화 가능한 요인들을 없애야 한다. 변화 가능한 요인들을 살펴보면 우리들의 생활 습관과 관련되는 요인이다. 
									흡연, 고혈압, 고지혈증, 당뇨병 등의 질병과 비만의 경우, 생활습관을 바르게 고침으로서 개선할 수 있는 요인이므로 금연 및 식사습관을 올바르게 고치고, 
									스트레스를 줄이며 규칙적으로 운동하면서 생활한다면 '위험요인'들을 줄일 수 있다.
								</p>
					</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>
