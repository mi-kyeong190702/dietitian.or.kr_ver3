<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">성인</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_c_info118.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_adult_obesity.do" class="cm">성인비만관리</a></li>
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
				<%@include file="inc/adult_obesity.jsp" %>
				
				<div class="h800 text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">비만의 정의</h4><br />
					<h5 class=" title bold t3 i_b_t3 mt40">비만의 정의</h5>
					<p class="mt10 pl15">비만은 만성질환의 하나이며 , 그 유병률이 전세계적으로 점차 증가하고 있는 추세이다 .<br />
					한국에서도 비만유병률(20 세이상 ) 이 1998 년 26.3%, 2001 년 30.6% 였으나 , 2005 년 국민건강 영양조사결과에 따르면 전체 31.8%, 남자 35.2%, 여자 28.3% 로 증가하였다.</p>
					<p class="mt10 pl15"><mark class="cm">비만이란 단순하게 체중이 증가하는 것이 아니라 지방세포의 비정상적인 증가에 의해 체중이 증가된 상태</mark>를 말한다.
					풍요롭고 복잡한 생활을 하게 되면서 과식, 신체활동의 부족, 과음, 식사 패턴의 불규칙 등 다양한 요인들이 복합적으로 작용하여 섭취한 열량보다 소비하는 열량이 적은 경우에 나타난다.</p>
					<p class="mt10 pl15">과거에는 뚱뚱한 것을 건강해 보인다고 생각하는 경향이 있었는데 근래에는 <mark class="cm">비만한 경우에 고혈압, 심장병, 당뇨병 등의 질환에 걸릴 위험이 크다는 것이 알려져 주의를 요하고 있다.</mark>
					또한 어렸을 때 비만하면 건강하고 활달한 어린시절을 보내기 힘들며 어른이 된 후에도 비만이 될 가능성이 높으므로 주의해야 한다.</p>
					<p class="mt10 pl15">건강하고 아름다운 모습을 위하여 식사요법, 운동요법, 식습관의 개선을 적극적으로 꾸준히 할 필요가 있다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>