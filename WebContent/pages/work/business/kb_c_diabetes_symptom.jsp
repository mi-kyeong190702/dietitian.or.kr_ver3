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
						<h4 class="title bold cm t2 i_b_t2 mt50">당뇨의 증상</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40">소변을 자주 본다. (다뇨(<span class="small"> 多尿</span>))</h5>
								<p class="mt10 pl15">혈액속에 당이 높아지면 소변으로 포도당이 빠져 나가게 된다. 이때 포도당이 물을 많이 끌고 나가게 되기 때문에 소변의 양이 늘어나고 또 자주 보게 되는 것이다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">물을 많이 마신다. (다음(<span class="small"> 多飮</span>))</h5>
								<p class="mt10 pl15">소변을 많이 자주 보기 때문에 몸 안에 수분이 모자라게 되어 목이 타고 물을 많이 마시게 된다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">음식을 많이 먹게 된다.(다식(<span class="small"> 多食</span>))</h5>
								<p class="mt10 pl15">당뇨환자는 혈액 속의 당은 많이 있지만 인슐린이 부족해서 섭취한 음식물이 열량원으로 충분히 이용되지 않으므로 허기가 져서 자꾸 먹게 된다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">체중감소</h5>
								<p class="mt10 pl15">포도당의 이용은 안되고 소변으로 빠지기 때문에 많이 먹어도 오히려 체중은 줄어든다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">피로감</h5>
								<p class="mt10 pl15">신체는 에너지원인 포도당을 이용하지 못해서 기운이 없게 된다.<br />
									발병 초기에는 아무 증상도 나타나지 않는 경우가 많아 아래의 경우 주기적으로 당뇨병에 대한 검사를 해보는 것이 좋다.
								</p>
							<h5 class=" title t3 i_b_t3 mt40">40세 이상으로 매우 비만한 사람</h5><br />
							<h5 class=" title t3 i_b_t3 mt40">가까운 친척 중에 당뇨병이 있는 사람</h5><br />
							<h5 class=" title t3 i_b_t3 mt40">식욕에 비해 이유없이 체중이 많이 감소한 환자</h5><br />
							<h5 class=" title t3 i_b_t3 mt40">이전의 분만시 4kg 이상의 큰 아이를 낳았던 사람</h5><br />
							<h5 class=" title t3 i_b_t3 mt40">고혈압약(혈압강하제)이나 신경통약을 오랫동안 복용한 사람</h5><br />
					</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>
