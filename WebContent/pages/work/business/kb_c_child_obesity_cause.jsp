<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">소아</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_child_obesity.do" class="cm">소아비만관리</a></li>
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
				<%@ include file="inc/child_obesity.jsp" %>
				
				<div class="text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">비만의 원인</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">과다한 음식 섭취</h5>
							<p class="mt10 pl15">어떤 이유에 의해서든지 <mark class="cm">섭취한 에너지가 소모되는 에너지보다 많으면 초과된 에너지가 지방으로 축적되어 비만이 초래된다.</mark> 
							고도비만아들의 식습관 연구에 의하면 비만하지 않은 아동에 비해 과식하며, 기름기가 많은 음식을 좋아하고 특히 저녁식사를 많이 먹고 식사속도가 빠른 것으로 나타났다.
							영아의 경우 부모가 무분별하게 우유를 섭취시키면 지방세포의 과다증식으로 일생동안 비만이 지속될 수 있으므로 주의를 요한다. 
							또한 심리적 요인으로 정신적인 스트레스가 있는 경우에도 음식물 섭취는 증가하고 신체활동은 감소하게 되어 에너지 대사의 불균형을 초래하여 비만의 원인이 될 수 있다. 
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">운동부족</h5>
							<p class="mt10 pl15">일반적으로 비만한 아동은 비만하지 않은 아동에 비해 비활동적인 성향을 보인다. TV시청과 비만이 중요한 관계가 있다는 연구들이 있는데 
							그것은 TV를 본다거나 컴퓨터 게임같이 장시간 앉아 있게 되면 에너지 소모가 많은 육체적인 활동시간이 줄게 되고 TV를 보는 동안 간식 섭취가 늘어 비만하게 된다는 것이다. 
							또한 질병으로 장시간 누워있는 경우에도 비만이 초래될 수 있다.
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">가족적(유전적) 요인</h5>
							<p class="mt10 pl15">일반적으로 가족 중에 비만한 사람이 있으면 비만아가 될 가능성이 높다. 역학조사에 의하면 부모 모두 비만하지 않은 아동에 비해서 
							부모중 한 사람이라도 비만하거나, 부모 모두 비만한 경우 아동이 비만하게 될 가능성은 3∼4배까지 높다고 알려져 있으며 형제 중 비만아가 있으면 다른 형제도 비만하게 될 확률은 40∼80%에 이른다고 한다.
							여기에는 유전적인 요소가 복합적으로 작용하여 명확히 원인을 분리할 수 없으나 현재 비만의 유전인자에 대한 연구가 활발히 진행되고 있다.
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">사회, 경제적 환경요인</h5>
							<p class="mt10 pl15">환경적 요인은 과식, 운동부족, 가족과 친구들의 모임, 잦은 외식 등 식욕이 자극되는 환경이 비만에 영향을 주고, 
							이외에 심리적, 사회경제적, 문화적 혹은 다른 후천적인 요인에 의해 직·간접적으로 비만을 일으킨다. 
							아직까지 우리나라에서는 학력이 높고 소득이 높은 계층에서 비만아가 될 가능성이 높지만 먹는 것에 대한 걱정이 없는 선진국에서는 반대로 고소득층보다 저소득층에서 비만이 호발되며 우리나라도 그런 경향으로 바뀔 것으로 보인다. 
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">내분비질환</h5>
							<p class="mt10 pl15">소아에서 비만을 일으키는 내분비질환은 드문 편이나 갑상선 기능 저하증, 쿠싱증후군, 성장호르몬 결핍증 같은 경우 비만을 초래할 수 있다.</p>
				</div>
			</c:otherwise>
	    </c:choose>			
	</div>
</div>
