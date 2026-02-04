<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<%@ include file="inc/diabetes.jsp" %>
		
		<div class="text s1 mb100">
						<h4 class="title bold cm t2 i_b_t2 mt50">당뇨의 분류</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40"><mark class="cm">제1형 당뇨병</mark>(인슐린의존성 당뇨병)</h5>
								<p class="mt10 pl15">제 1형 당뇨병은 췌장세포의 자가면역성 파괴로 인하여 초래된다
									<mark class="cm">유전적 소인을 가진 사람이 환경적 요인이 있을 때 자가면역이 활성화되어 췌장 베타세포의 파괴가 일어나는 것으로 알려져 있다.</mark> 
									어느 나이에서나 발병할 수 있으나 대부분 30세 이전에 발병하고, 심한 체중감소, 다뇨(多尿), 다음(多飮) 등의 증상이 급격하게 발생하고, <mark class="bold cm">케톤산증(diabetic ketoacidosis)</mark>에 빠지기 쉽다. 
									케톤산증의 예방과 생존을 위해 인슐린 치료가 절대적으로 필요하고 진단과 치료가 늦어지면 혼수와 사망을 초래할 수 있다.
								</p>
								<p class="small ca p10 pl20">※ <span class="box bw0 bgm bold cw pl5 pr5">케톤산증이란?</span> 혈액중에 케톤체가 축적되고 요 중에 나타나는 증상. 호흡에서 달콤한 아세톤 냄새가 나는것이 특징. 에너지원으로 포도당이 사용안되고 지방이 사용되어 그 대사산물로 케톤이 혈액에 쌓여서 나타난다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40"><mark class="cm">제2형 당뇨병</mark>(인슐린  비의존형 당뇨병)</h5>
								<p class="mt10 pl15">
									<mark class="cm">제2형 당뇨병 환자는 대부분 인슐린 저항성이 있고, 상대적 인슐린 결핍을 보인다.</mark><br />
									따라서 인슐린 치료가 꼭 필요하지 않은 경우가 많으며 케톤산 혈증의 발생은 극히 드물며, 감염 등의 심한 스트레스가 있을 경우에 케톤산증이 나타날 수 있다.
									보통 30세 이후에 발병하나 그 이전에도 발생할 수 있으며 전체 당뇨병의 90% 이상을 차지한다. 진단시에 증상이 없는 경우가 흔하며, 이미 합병증이 동반된 경우도 20% 가까이 된다.<br />
									비만이 있는 경우가 많으며 발병 위험도는 나이, 비만도, 운동부족에 비례하여 증가된다.
									제1형 당뇨병에 비하여 더 강한 유전적 소인을 가지나 그 유전적 소인의 자세한 내용은 알려지지 않고 있다.<br />
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">이차성 당뇨병</h5>
								<p class="mt10 pl15">β-세포의 유전적 결함, 인슐린 작용의 유전적 결함, 췌장의 미만성 손상을 초래하는 질환(췌장염, 췌장외상, 췌장암 등), 내분비 질환, 감염증 등에 의해 초래되는 당뇨병이 이에 속하며,
									이 외에 약물 및 화학물질 매개성 당뇨병, 드문 형태의 면역매개 당뇨병, 당뇨병을 동반하는 기타 유전 증후군도 이에 해당한다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">임신성 당뇨병</h5>
								<p class="mt10 pl15">임신중에 처음으로 당뇨병이 발병된 경우로 당뇨병이 있는 여성이 임신한 경우는 임신성 당뇨병에 포함되지 않는다. 임신성 당뇨병은 당뇨병 발생(특히 제2형) 위험을 증가시킨다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">내당능 장애와 공복혈당 장애</h5>
								<p class="mt10 pl15">내당능 장애와 공복혈당 장애는 정상과 당뇨병의 중간을 나타내는 용어이다. 임신기가 아니면 내당능 장애나 공복혈당 장애는 임상적으로 치료가 필요한 질환이라 볼 수는 없으나
									향후 당뇨병과 심혈관 질환 발생의 위험인자로 작용하므로 주의가 필요하다.
								</p>
								<ul class="small p10 pl20">
									<li class="i_b_t7">공복혈당 장애 : 공복혈당이 110~125mg/㎗ (ADA진단기준, 1997)</li>
									<li class="i_b_t7">내당능장애 : 경구당부하 후 2시간혈당이 140~199mg/㎗ (WHO진단기준, 1985)</li>
								</ul>
					</div>
					
					
	</div>
</div>
