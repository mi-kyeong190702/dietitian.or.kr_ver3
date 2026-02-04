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
			
			
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">고혈압</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압이란</h5>
								<p class="mt10 pl15">혈압은 사람의 활동상태에 따라서 오르내리지만 혈압이 지속적으로 정상 이상으로 올라가 있는 상태를 고혈압이라 한다.
									고혈압은 발생 원인이 밝혀지지 않은 본태성 고혈압(1차성 고혈압)과 신장 등의 호르몬계의 이상, 약제 복용 등으로
									발병원인이 뚜렷한 2차성 고혈압으로 구분하며 90%이상의 고혈압이 본태성 고혈압에 해당된다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압의 진단기준</h5>
								<p class="mt10 pl15">18세 이상의 성인에서 정상적인 혈압은 120/80mmHg 미만이다. 혈압이 120- 130mm Hg/ 80-90mmHg인 경우 고혈압 전단계로 분류되며, 
									향후 고혈압이 발생될 수 있는 확률이 높으므로 생활 습관 수정( 식이 조절, 운동, 체중 조절 )이 요구된다.
								</p>
								<div class="w600 ac mt20">
									<table class="table t3 text ssmall s1 ca center">
										<colgroup>
											<col width="300">
											<col width="300">
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">구분</th>
											<th scope="col" class="bold cm">수축기 혈압(mmHg)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확장기 혈압(mmHg)</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td scope="row" class="bgf7 bold">정상(Normal)</td>
											<td>&lt;120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ml20 mr20">그리고</span>&lt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold">고혈압 전단계(PreHypertension)</td>
											<td>120~139&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ml20 mr20"> 또는</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 80~89</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold">제1기 고혈압(Stage 1 Hypertension)</td>
											<td>140~159&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ml20 mr20">또는 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;90~99</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold">제2기 고혈압(Stage 2 Hypertension)</td>
											<td>≥ 160&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ml20 mr20">또는</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ≥100</td>
										</tr>
										</tbody>
									</table>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압의 합병증</h5>
								<p class="mt10 pl15">고혈압은 특별한 증상이 없기 때문에 모르고 몇 년을 지내는 경우가 많다. 고혈압을 치료하지 않고 방치할 경우 오랜 세월이 지나면서 심장(협심증, 심근경색증, 심부전, 부정맥),
								 뇌혈관(뇌출혈, 뇌경색), 신장(신부전, 신경화증), 눈(고혈압성안저, 고혈압성 망막증), 기타 혈관의 동맥경화증 등 여러 질환이 발생한다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압의 증상</h5>
								<p class="mt10 pl15">고혈압의 경우 증상은 전혀 없이 혈압만 높은 경우도 상당히 있으나 크게 혈압 상승 자체로 인한 증상, 고혈압 합병증에 의한 증상, 2차성 고혈압인 경우 일차적 질환에 의한 증상으로 구분할 수 있다.</p>
								<p class="mt10 pl15">혈압 상승 자체로 인한 증상 중 대표적인 것은 두통, 현기증, 코피 등이다. 고혈압 합병증에 의한 것은 심장의 문제로 오는 호흡 곤란, 협심증, 통증, 부종이 있고, 
								콩팥 기능 부전으로 역시 부종, 빈혈, 구토 등이 오기도 한다. 눈의 망막 병변으로는 시력 장애가 있으며, 신경계 증상으로는 뇌경색이 발생되기도 한다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압의 치료</h5>
								<p class="mt10 pl15">고혈압의 치료는 우선적으로 생활 습관 수정( 식이 조절, 운동, 체중 조절 )을 시행하며, 시행 후에도 목표로 하는 혈압 유지가 안 될시 약물 요법을 병행한다. 
								미국의 고혈압 발견, 평가, 치료 합동위원회(Joint National Committee on Prevention, Detection, Evaluation, and Treatment of High Blood Pressure, JNC)에서는 
								고혈압 증상이 가벼우면서 비만인 고혈압 환자의 경우 약물 치료를 하기 전에 적어도 3～6개월 동안은 체중조절과 생활 습관의 조절을 시도하라고 권장하고 있다.
								</p>
								<div class="kb_step p20 pl70">
									<ol class="text">
										<li class="start mr20"><div class="box bw5 bcs w110 h110 r60"><span class="txt mt10">생활 습관<br>수정시행</span></div></li>
										<li class="mr210"><div class="box bw5 bcs w300 h110 r60"><span class="txt">목표 혈압으로 교정 안 될시<br>(당뇨 동반시 &lt;140/90mmHg,<br> 신장질환 동반시 &lt;130/80mmHg)</span></div></li>
										<li class="mr20"><div class="box bw5 bcs w110 h110 r60"><span class="txt">생활 습관 수정<br> 유지 + 약물 치료 병행</span></div></li>
									</ol>
									<span class="ml300"></span><span class="ml280"></span>[JNC.2003]
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압 관리를 위한 생활 습관 수정</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">정상체중을 유지한다.( BMI 18.5~24.5)<br>
										<span class="small ">10kg 체중 감량시 5~20mmHg 수축기 혈압 감소 효과가 있다.</span>
									</li>
									<li class="i_box_t1 mt10">DASH diet 시작한다.<br>
										<span class="small ">총지방과 포화지방을 감소시키고 과일 및 채소 섭취 늘리는 식사로 8~14mmHg 수축기 혈압 감소 효과가 있다.</span>
									</li>
									<li class="i_box_t1 mt10">염분 섭취를 줄인다.<br>
										<span class="small ">하루 소금 6g( 2.4g소디움)이하로 줄일시</span>
									</li>
									<li class="i_box_t1 mt10">술 섭취를 조절한다.<br>
										<span class="small">2~8mmHg 수축기 혈압 감소 효과가 있다.</span>
									</li>
									<li class="i_box_t1 mt10">신체 활동량을 늘린다.<br>
										<span class="small">하루 30분이상 빨리 걷기 와 같은 유산소 운동을 하면 4~9mmHg 수축기 혈압 감소 효과가 있다.</span>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">고혈압 식사요법 (DASH Diet)</h5>
								<p class="mt10 pl15">칼륨, 칼슘 마그네슘 섭취 증량 및 콜레스테롤 및 포화지방산, 염분 섭취를 줄이고 정상적인 체중 유지를 위한 열량 조절을 권장하는  식이요법으로 혈압 강하 효과를 발휘한다.</p>
								<ul class="w320 mt30 pl15 fl">
									<li class="i_box_t1">포화지방산 및 콜레스테롤 , 지방 등의 총량을 줄인다.</li>
									<li class="i_box_t1 mt5">과일, 채소, 저지방 유제품 섭취를 늘린다.</li>
									<li class="i_box_t1 mt5">전곡류를 통하여 식이 섭취를 늘린다.</li>
									<li class="i_box_t1 mt5">소금은 1일 6g 이하로 줄인다.</li>
									<li class="i_box_t1 mt5">단 간식 및 설탕 함유 식품 섭취를 줄인다. </li>
								</ul>
								<div class="box t2 w340 mt10 p20 small fr">
									<p class="bold cm">혈압을 높이지 않는 소금<br>
										<span class="text ssmall cb mt5">원래 혈압을 높이는 물질은 소금안에 있는 '나트륨'이란 성분 때문이다. 그래서 요즘은 고혈압 환자들을 위해 나트륨 대신 칼륨을 넣어 짠맛을 가지면서 
										나트륨을 줄인 소금(소금 대용품)이 시중에 나와 있다. 그러나, 고혈압 치료제에 따라 칼륨이 몸에 축적되는환자들이 있으므로 반드시 의사선생님의 지시에 따라 사용해야 한다. 
										특히, 현재 심장 및 신장질환을 앓고 있는 환자들은 소금 대용품에 들어 있는 칼륨이 문제가 될 수 있으므로 주의한다.</span>
									</p>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt100">콜레스테롤과 고혈압</h5>
								<p class="mt10 pl15">고혈압으로 인해서 동맥경화증의 위험률이 높아지며 죽상경화증, 고지혈증 등의 합병증을 조심해야 한다. 이러한 합병증의 유발을 촉진시키는 콜레스테롤과 포화지방산을 줄이는 것이 좋다.</p>
								<p class="mt10 pl15">콜레스테롤은 간, 곱창 등의 내장류와 오징어류, 달걀노른자, 런천미트 등에 많고 포화지방산은 동물성 기름(소, 돼지기름)과 팜유(라면기름, 분말 커피크림 등), 코코넛유 등에 많이 들어있다.
								가급적이면 식물성 기름을 사용하는 것이 좋다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">섬유소와 고혈압</h5>
								<p class="mt10 pl15">최근 연구에서 식물성 섬유소 섭취 증가가 수축기 혈압을 감소 시키며, 섬유소 섭취가 적은 사람이 많은 섭취하는 사람에 비해 고혈압 발생 위험도가 높은 것으로 알려졌다. 
									또한 섬유소 섭취가 혈액 내 콜레스테롤 수치를 낮추는 효과도 있고 체중조절에도 도움이 되므로 가급적 섬유소가 많은 식품을 이용하는 것이 좋다.
									섬유소는 신선한 채소, 과일, 잡곡, 콩류, 해조류에 많다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">운동과 고혈압</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1"><span class="bold">운동의 이점</span>
										<ul class="small">
											<li class="i_b_t7">혈압을 조절해 준다.</li>
											<li class="i_b_t7">혈중 콜레스테롤치, 중성지방치를 저하시켜 고지혈증을 개선시킨다. </li>
											<li class="i_b_t7">체중을 감소시킨다. </li>
											<li class="i_b_t7">심장, 폐, 혈관 순환기 등의 기능을 향상시킨다.</li>
											<li class="i_b_t7">근육을 더 탄력있고 단단하게, 뼈는 튼튼하게 만들어 준다. </li>
											<li class="i_b_t7">긍정적인 사고력, 집중력, 기민성 등을 향상시켜 준다.</li>
											<li class="i_b_t7">스트레스 해소, 숙면과 정신 건강에 기여한다.</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10"><span class="bold">운동시 주의사항</span>
										<ul class="small">
											<li class="i_b_t7">매일 걷기나 조깅, 자전거타기, 수영등 유산소운동을 20～30분 정도 규칙적으로 한다.</li>
											<li class="i_b_t7">본인의 일상생활이 될 수 있도록 노력한다.</li>
											<li class="i_b_t7">자신의 건강상태와 능력, 흥미, 장소와 시간 문제 등을 고려하여 운동을 선택한다. </li>
											<li class="i_b_t7">역기들기 등의 팔을 사용하는 운동은 혈압을 올리고, 테니스, 축구 등과 같이 경쟁을 요하는 운동은 부상을 초래할 위험이 있으므로 피한다.</li>
										</ul>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">술과 고혈압</h5>
								<p class="mt10 pl15">과량의 술은 혈압을 상승시킬 수 있고, 고혈압 강하제의 복용시는 약의 효과를 떨어뜨리므로 제한하는 것이 좋다. 
								또한 알코올은 열량도 내기 때문에 비만인 경우 체중을 줄이는 데 방해가 되므로 주의해야 한다. 
								따라서, 하루에 소주 기준으로 여자는 1잔, 남자는 2잔 이하로 제한하며, 비만하거나 과음하는 음주습관이 있는 경우에는 금주가 권장된다.
								</p>
					</div>
					
			</c:otherwise>
	    </c:choose>
	
	</div>
</div>
