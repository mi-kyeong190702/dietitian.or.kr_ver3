<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
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
		
				<%@ include file="inc/diabetes.jsp" %>
				
				<div class="text s1 mb100">
					<h4 class="title bold cm t2 i_b_t2 mt50">당뇨의 정의</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">당뇨의 정의</h5>
							<p class="mt10 pl15">
								<mark class="cm">당뇨병이란 소변에 포도당이 나온다는데서 그 이름이 유래된 병으로, 췌장에서 만들어지는 인슐린이 부족하거나 혹은 분비되는 인슐린이 체내에서 적절하게 작용되지 못함으로써 초래되는 고혈당증이다.</mark>
								소변으로 포도당이 나오는 것은 혈액 속의 포도당 농도가 높아 걸러내야 하는 포도당의 양이 신장의 재흡수 능력보다 많기 때문이다.
								<br /><br />
								포도당은 우리가 먹는 밥, 빵, 감자 등 탄수화물의 기본 성분인데, 우리가 음식을 먹게 되면 음식 중의 3대 영양소인 탄수화물, 지방, 단백질은 소화관을 통하여 몸 안에 흡수된 후 포도당, 지방산, 아미노산 등의 기본 성분의 상태로 각 세포, 조직에 공급되며, 이중 대표적인 것이 포도당이다. 자동차가 움직이는데 휘발유가 필요하듯이 사람이 일상생활을 하기 위해서는 혈액 속의 포도당이 세포 하나하나에 들어가서 우리 몸을 움직이게 하는 에너지원이 되어야 한다. 포도당이 우리 몸의 각 세포에서 이용되기 위해서는 인슐린이라고 하는 호르몬이 필요한데, 이 인슐린은 우리 몸 안에 있는 췌장의 β-세포에서 만들어 진다. 자동차의 연료 탱크에 휘발유가 많더라도 엔진으로 가는 길이 막혀 있으면 자동차가 움직이지 못하듯이 몸 안에 인슐린이 모자라면 흡수된 포도당은 이용되지 않고 혈액 속에 쌓여 소변으로 넘쳐 나오게 된다.<br /><br />
								당뇨병은 이와 같이 인슐린이 부족하여 포도당의 이용이 잘 안되게 되는 병으로 실제로는 병의 종류에 따라 인슐린이 모자라는 정도가 다를 수도 있으며, 포도당 이외에도 지질과 단백질 등 다른 영양소의 대사에도 이상을 가져오는 만성질병이다.
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">당뇨의 원인</h5>
							<p class="mt10 pl15"> 당뇨병의 근본원인은 아직 확실히 알려져 있지 않으나, 유전적 체질을 갖고 있는 사람이 세상을 살아가는 동안 마주치는 여러 환경의 원인이 더하여져서 발생한다고 한다.
								이러한 환경인자에는 비만, 노화, 임신, 감염, 수술, 스트레스, 약물남용 등을 들 수 있다. <mark class="cm">즉, 당뇨병은 유전적 요인과 환경적 요인이 함께 작용하여 나타나는 것이다.</mark>
								한 연구에 의하면 부모가 모두 당뇨병인 경우 약 30%의 자녀가, 부모 중 한 사람만 당뇨병인 경우 약 15%의 자녀가 당뇨병에 걸린다고 알려져 당뇨병에 유전성이 있음은 분명하다. 
							</p>
				</div>
					
			</c:otherwise>
		</c:choose>		
	</div>
</div>
