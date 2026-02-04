<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기타</mark>질환</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_osteoporosis.do" class="cm">기타질환</a></li>
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
				<%@ include file="inc/etc.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">신결석</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40">신결석이란</h5>
								<p class="mt10 pl15"><mark class="cm">신결석은 히포크라테스 시대의 기록에서도 언급될 만큼 인류에게 오랜 역사를 가진 만성적이며 자주 재발되는 질병이다.</mark>
								신결석이란 신장의 내부에 생긴 결석인데 이것이 만들어져 요관 속으로 내려오면 요관결석이라 한다. 따라서 이 신결석과 요관 결석을 합해서 요로결석증이라고도 한다. 
								결석의 크기는 다양하여 쌀알만 한 것부터 상당히 큰 것도 있고, 산호모양이나 사슴뿔 모양의 결석도 있다.<br />
								신장 속에서 결석이 어떻게 만들어지는지 정확하게 밝혀져 있지는 않다. 소변에는 원래 체내 대사 후에 생성되거나 남는 여러 가지 무기염류(인산염, 탄산염, 요산염, 수산염, 암모늄염 등)가 녹아있는데 이것들은 쉽게 고체가 될 수 있는 매우 불안정한 상태이다.
								<mark class="cm">소변 속의 이런 무기염이 과포화상태가 되어 결정을 형성함으로 결석이 생성된다.</mark>
								</p>
								<div class="w640 ac box t2 mt10 mb30 p20 small">
									<h6 class="bold cm mb10">신결석의 증상</h6>
										<p class="i_b_t7">결석이 신우에 있으면 소변이 자주 보고 싶어지며, 소변볼 때 통증이 있고, 결석이 신우의 출구 및 요도로 이동하면 극심한 통증이 일어나서 신장, 허리, 방광까지 아프며 혈뇨가 나온다. 또한 큰 결석이 요관에서 막히면
										소변이 정체되어서 발작을 일으키며 위험한 상태가 된다.<br />
										일반적으로 신우에 박혀 움직이지 않는 큰 산호형 결석은 별로 통증이 없으며 오히려 이동성이 있는 작은 결석이 요관으로 내려갈 때 급작스런 심한 통증을 유발시킨다.<br />
										통증의 특징은 30분이나 1시간 이상 같은 강도로 통증이 계속되는데 이는 결석이 이동할 때 나타나는 통증으로 결석이 걸려서 이동하지 않게 되거나 방광으로 떨어질 때까지 계속된다. 
									</p>
								</div>
								<h6 class="bold ml30">신결석의 위험 인자</h6>
									<ul class="text small cb mt5 ml30">
										<li class="i_b_t5">수분섭취 부족 : 수분섭취 부족으로 소변이 농축되면 결석의 위험이 커진다.</li>
										<li class="i_b_t5">가족력</li>
										<li class="i_b_t5">연령 : 20~70대 중년에게서 많이 발생</li>
										<li class="i_b_t5">성별 : 남성이 여성보다 발생확률이 높다 </li>
										<li class="i_b_t5">질환 : 시스틴뇨증이나 콩팥뇨세뇨관 산증(renal tubular acidosis)과 같은 유전적 질환 또는 통풍, 만성 요로감염, 부갑상선항진증 </li>
										<li class="i_b_t5">식사 : 동물성 단백질(육류, 생선)의 과다한 섭취, 식이섬유소</li>
										<li class="i_b_t5">활동 부족 : 장기간 누워서 지내는 경우나 제한된 활동시 뼈로부터의 더 많은 칼슘용출이 유발될 수 있다.</li>
									</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">신결석의 치료방법</h5>
								<p class="mt10 pl15">X선 검사로 결석의 존재 여부, 크기, 개수, 부위 등을 진단하는데 간혹 결석의 종류에 따라 잘 나타나지 않는 것도 있다.<br />
								치료방법은 우선적으로 자연스럽게 결석의 배출을 촉진하는 것으로 다량의 수분섭취, 식사조절, 약물치료 등을 실시하며, 최근에는 체외충격파쇄석기로 결석을 잘게 부수어 배출을 돕기도 한다.<br />
								심한 경우 수술로 제거하기도 한다. 그러나 재발 가능성이 많으므로 주의해야 하는데 뚜렷한 재발 방지방법은 없으나 식사요법과 충분한 수분공급이 권장되고 있다. 
								재발이 반복되는 경우에는 대사이상(부갑상선기능항진증)에 의한 경우가 있으므로 정밀검사를 하여 원인을 제거할 필요가 있다. 
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">식사의 원칙</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10">1일 3L(15컵) 정도의 수분을 섭취한다.
										<span class="small ca">다량의 수분을 섭취함으로써 소변의 농도를 희석시켜 돌을 형성하는 염류가 결정이 되지 못하도록 하는 것이다. 
										음료의 경우 유제품이나 차류는 염류가 많으므로 적절치 못하며 물이 가장 유용하다. (단, 동반 질환으로 부종이 동반되는 경우 수분조절이 필요할 수 있으므로 이때는 담당 의료진과 상의하도록 한다.) 
										</span>
									</li>
									<li class="i_box_t1 mt10">결석의 종류에 따라 예방을 위한 식사원칙이 다를 수 있다. 
										<ul>
											<li class="mt20"><mark class="bold cm">칼슘결석의 경우</mark>
												<span class="small ca">신결석 환자의 70~80%는 칼슘화합물(수산칼슘, 인산칼슘)로 구성된 결석을 가지고 있는데 주로 중년남자에게서 흔히 발생한다. 
												과잉의 비타민 D, 장기간 누워있는 경우, 갑상선기능항진증, 수산대사의 결함, 동물성 단백질이 많은 식사, 원인 모르게 소변으로 칼슘이 많이 배설되는 경우에 결석이 잘 발생되며 식이섬유소는 칼슘결석의 형성을 예방하는 것으로 알려져 있다.
												</span>
												<ul class="liststyle in decimal small ca mt10">
													<li>
														1일 염분 5-8g 내외의 염분제한이 필요하다. 과도한 염분섭취는 소변으로 더많은 칼슘을 배설시켜 결석을 위험을 높인다.
													</li>
													<li>칼슘결석 예방을 위해 칼슘을 엄격히 제한할 필요는 없다 최근 연구에서 엄격한 칼슘제한이 칼슘결석 예방에 도움이 되지 않으며 오히려 극심한 칼슘섭취제한은 칼슘 균형에 영향을 미쳐 뼈 손실이나 골다공증 등을 초래할 수 있다. 
														따라서 과량의 칼슘보충은 피하되 적절한 칼슘섭취 유지는 필요하며 이를 위하여 담당 의료진과의 충분한 상의가 필요하다.
													</li>
												</ul>
											</li>
											<li class="mt20"><mark class="bold cm">수산칼슘결석의 경우</mark>
												<ul class="liststyle in decimal small ca">
													<li>수산함량이 높은 식품을 제한한다. 수산 함량이 높은 음식을 제한하는 것이 수산결석의 위험을 낮춘다는 보고가 있다. 수산섭취를 하루 40~50mg으로 제한한다.</li>
													<li>비타민 C 보충시 몸에서 대사 후 수산으로 전환되므로 비타민 C 보충제는 피한다.</li>
												</ul>
												<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">식품 중의 수산 함량(1000g당)</span>
													<table class="table t3 mt10 text ssmall s1 ca center">
														<colgroup>
															<col width="120" />
															<col width="140" />
															<col width="140" />
															<col width="140" />
															<col width="140" />
														</colgroup>
														<thead>
														<tr>
															<th scope="col" class="bold cm">식품명</th>
															<th scope="col" class="bold cm">적은 식품(2mg 이하)</th>
															<th scope="col" class="bold cm">보통식품(2~10mg)</th>
															<th scope="col" class="bold cm">많은 식품(10mg 이상)</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td scope="row" class="bgf7 bold ca">음료</td>
															<td>병맥주, 콜라, 위스키, 백포도주, 적포도주 </td>
															<td></td>
															<td>생맥주, 차, 코코아 </td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">우유</td>
															<td>버터밀크, 저지방우유</td>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">육류 및 육가공품</td>
															<td>달걀, 치즈, 쇠고기, 양고기, 돼지고기, 가금류, 생선, 조개류 </td>
															<td>정어리</td>
															<td>토마토소스가 첨가된 구운 육류요리, 땅콩버터, 두부</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">채소류</td>
															<td>콜리플라워, 버섯, 양파, 완두콩(생, 냉동), 감자, 무</td>
															<td>아스파라거스, 브로콜리, 당근, 오이, 완두콩통조림, 양상추</td>
															<td>콩, 겨자, 셀러리, 파슬리, 실차, 부추, 가지, 꽃상추, 근대, 케일, 시금치, 호박</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">과일 및 주스류</td>
															<td>사과주스, 아보카도, 바나나, 자몽, 청포도, 수박, 멜론, 복숭아</td>
															<td>사과, 건포도, 오렌지, 배, 파인애플, 말린자두</td>
															<td>블랙베리, 블루베리, 프루트칵테일, 오렌지껍질, 딸기, 귤</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">빵 및 전분류</td>
															<td>마카로니, 국수, 밥, 스파게티, 빵</td>
															<td>옥수수빵</td>
															<td>옥수수, 밀의 배아</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">유지류</td>
															<td>베이컨, 마요네즈, 샐러드드레싱, 식물성유</td>
															<td></td>
															<td>견과류, 땅콩, 아몬드, 호두</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">기타</td>
															<td>소금, 후추</td>
															<td></td>
															<td>초콜릿, 코코아, 토마토수프</td>
														</tr>
														</tbody>
													</table>
													<span class="ssmall cm fr">(출처 : 임상영양관리 지침서 제 3판, 대한영양사협회(2008))</span>
												</div>
											</li>
											<li class="mt20"><mark class="bold cm">요산결석의 경우</mark>
												<span class="small ca">요산결석은 신결석 발생률의 약 4% 정도를 차지하고 요산은 퓨린의 대사산물로 대사장애나 소모성 질환에서 조직의 분해가 빠를 때 발생된다.<br />
												또한 아스피린과 같은 약제도 요산의 배설을 증가시켜 요산 결석의 형성을 촉진시킨다. 따라서 퓨린 함량이 높은 식품을 제한한다.<br />
												(퓨린 함량이 높은 식품 : 육류의 내장, 육즙, 정어리, 청어, 멸치, 고등어, 가리비 조개). 
												</span>
											</li>
											<li class="mt20"><mark class="bold cm">시스틴 결석의 경우</mark>
												<span class="small ca">시스틴뇨증(아미노산 중의 하나인 시스틴의 신장 재흡수 과정의 결함이 있는 유전적 질환으로 요에 시스틴이 많이 배설됨)으로 인해 결석이 형성된다.</span>
											</li>
										</ul>
									</li>
									<li class="i_box_t1 mt20">고단백식은 피한다.
										<span class="small ca">시스틴은 아미노산 중 메티오닌의 최종 대사산물로 메티오닌을 제한해야 하는데 식품 중에 있는 대부분의 단백질은 메티오닌을 가지고 있으므로 단백질을 적당량, 또는 약간 적은 정도로 섭취한다.</span>
									</li>
								</ul>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
