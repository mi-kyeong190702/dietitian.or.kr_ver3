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
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
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
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">비만의 문제점</h4><br />
						<p class="middle mt20">비만인 경우 비만하지 않은 사람에 비해 사망률이 월등히 높다. 최근 연구에 의하면 25∼34세 남자에 있어서는 12배, 35∼44세 남자는 6배나 사망률이 높다. 
						비만이 병적으로 심각하면 비만증이라 하는데 비만증에 수반되는 의학적 문제점 및 합병증은 매우 다양하나, 그 대부분이 체중조절만 한다면 호전될 수 있는 것들이어서 비만이 꼭 치료해야 하는 질환임을 암시해 주고 있다.
						</p>
							<div class="box t2 w660 ac m20 p20"><span class="bold cm mb10">비만증이 가져오는 병들</span>
								<ul class="text small ca">
									<li class="i_b_t7"><mark class="bold ca">남, 녀 모두에 오는 병적상태</mark> : 정신적 장애, 호흡곤란, 고혈압, 관상동맥질환, 중풍, 당뇨병, 동맥경화, 관절염, 지방간, 담석증, 상처의 치료지연, 신장질환, 변비, 정맥류, 탈장</li>
									<li class="i_b_t7 mt5"><mark class="bold ca">여자에만 오는 병적상태</mark> : 월경불순, 월경과다, 월경과소, 조모증</li>
								</ul>	
							</div>
							<div class="area">
								<ul class="mt10 pl15">
									<li class="i_box_t1">심장질환 및 고혈압
										<span class="small ca">여러 보고에 의하면 비만은 직접, 또는 간접적으로 협심증, 심근경색증을 유발시켜 급사 및 심부전증 등의 순환기계 질환을 유발한다고 한다. 
										또한 비만인중 남자의 경우 체중이 10% 증가하면 혈압이 평균 6.6mmHg 상승되며, 비만인이 비만하지 않은 사람에 비해서 고혈압이 될 가능성은 3배나 높아져 고혈압의 유병률도 높아짐이 보고되고 있다.</span>
									</li>
									<li class="i_box_t1 mt5">고지혈증
										<span class="small ca">비만인 경우 비만하지 않은 사람에 비해서 고중성지방혈증이 될 가능성은 남자 2.2배, 여자 2.8배이며, 고콜레스테롤혈증이 될 가능성도 여자 비만군에 비해서 1.9배에 달한다는 보고가 있다. 
										비만인의 고지혈증은 유전적으로 어떠한 관계가 있는지는 명확하지 않으나 비만이 체내에서 지방대사에 영향을 주는 것으로 알려져 있으며, 특히 중성지방의 증가와 밀접한 연관이 있다고 한다.</span>
									</li>
									<li class="i_box_t1 mt5">당뇨병
										<span class="small ca">비만인의 당뇨병 유병률은 비(非)비만인의 4.5배나 된다. 당뇨병은 여러 원인에 의해 췌장에서 분비되는 인슐린이 부족하거나 제대로 이용되지 못한 경우 발병되는데 
										체지방이 많으면 인슐린 저항력을 높여 인슐린을 제대로 이용시키지 못하기 때문에 비만인 경우 당뇨병의 발생 원인이 될 수 있다.</span>
									</li>
									<li class="i_box_t1 mt5">지방간 및 간 기능 이상
										<span class="small ca">지방간이란 간세포에 간 무게의 5% 이상에 해당되는 지방, 특히 중성지방이 쌓여 간이 경미하게 커져 있는 상태를 의미한다. 처음에는 아무 증상이 없으나, 심해지면 만성 피로와 간 기능 이상을 초래한다. <br />
										실제로 비만인의 90%는 지방간을 가지고 있다고 한다. 또한, 초음파 검사로 진단된 지방간 환자의 60%가 비만과 연관이 있으며, 비만인이 비(非)비만인에 비해 지방간이 생길 확률은 남자의 경우 10.4배, 여자의 경우 5.7배나 된다.</span>
									</li>
									<li class="i_box_t1 mt5">담석증
										<span class="small ca">비만인의 담낭질환 (담석증, 담낭염 등) 유병률은 비(非)비만인에 비해 2.6배에 달한다. 이 현상은 여자 비만인에 있어서 더 뚜렷하다. 
										중증 비만환자의 90%에서 수술시 담낭질환이 발견되었으며, 담낭질환에 의한 사망률도 더 높다고 보고되고 있다.</span>
									</li>
									<li class="i_box_t1 mt5">골격계 질환
										<span class="small ca">비만인 경우 과다한 체중이 몸의 체중을 받는 관절에 무리를 주기 때문에 요통, 골절, 관절염 등을 일으킨다. 관절염 중에는 통풍성 관절염도 나타날 수 있다.</span>
									</li>
									<li class="i_box_t1 mt5">통풍
										<span class="small ca">비만인은 비(非)비만인에 비해 고요산혈증의 빈도가 높다. 이상 체중의 20% 이하인 사람들에게는 3.4%밖에 되지 않는 고요산혈증이 이상 체중 20∼80%인 비만인들에게는
										5.7%로 상승하며, 이상 체중 80% 이상인 고도비만인들에게는 무려 11.4%나 된다. 역으로 통풍환자에서의 체중 과다 비율은 50%에 이른다고 한다.</span>
									</li>
									<li class="i_box_t1 mt5">신장질환
										<span class="small ca">비만인 경우 동맥경화나 고혈압으로 인한 신부전이 올 수 있으며, 신장 주변에 비정상적인 지방이 축적되면서 정상적 신장기능이 저하되는 '지방신장'이 되기도 한다.</span>
									</li>
									<li class="i_box_t1 mt5">정신적 문제
										<span class="small ca">비만인 경우 외모 및 건강의 손상, 각종 합병증으로 인한 결근 빈도의 증가, 대인관계의 감소, 취업의 어려움, 결혼 및 성생활의 제한 등에 기인하여 불안이나 우울증의 소견을 많이 보인다고 한다.</span>
									</li>
								</ul>
							</div>
					</div>
				
			</c:otherwise>
    	</c:choose>
	</div>
</div>
