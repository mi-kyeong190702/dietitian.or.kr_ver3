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
						<h4 class="title bold cm t2 i_b_t2 mt50">통풍</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">통풍이란</h5>
								<p class="mt10 pl15"><mark class="cm">통풍은 관절염 증상을 특징으로 나타나는 질환으로 대사 노폐물의 일종인 요산(단백질의 일종인 퓨린이 대사되면서 생성되는 물질)이 혈액 중에 많아져 요산 결정이 작은 관절이나 
								연골 주변에 쌓이고 그 결과 관절을 자극하고 심하면 염증을 일으키게 되는 질환이다.</mark> 신장질환이 흔하고 요산결석도 생길 수 있다. 만성 통풍환자에서 결절이 많이 나타나는 부위는 귓바퀴와 엄지발가락이나 팔꿈치이다. 
								요산 축적으로 관절조직이 파괴되어 만성 관절염 증상을 초래한다.<br>
								통풍의 발병률이 점차 증가하고 있으며, 특히 35세 이상 남자에서 많지만 연령대가 높아지면 남녀 발병률이 비슷하다. 또한 통풍은 비만환자에서 많고 최근에는 20~30대의 환자들을 볼 수 있는데 이는 식생활이 점차 서구화 되는 데서 그 원인을 찾을 수 있다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">통풍의 원인</h5>
								<p class="mt10 pl15">통풍의 원인은 확실히 밝혀지지 않았으나 육류, 지방, 알코올의 다량섭취 등 식이성 요인과 관련되며 비만, 가족력, 성별 등과도 관련되어 나타날 수 있다. 일반적으로 단백질 함량이 높은 육류에는 체내에서 
								요산을 형성하는 퓨린이 많이 함유되어 있어 혈액 중의 요산치를 상승시킬 수 있다. 또한 지방은 소변을 통한 요산의 배설을 억제할 뿐만 아니라 혈중 요산치를 약간 상승시키는 역할을 한다. 알코올 섭취와 통풍과의 상관성이 있을 것으로 생각되었으나, 
								최근 연구에 의하면 알코올 음료의 종류에 따라 영향이 다른 것으로 보인다. 즉, 맥주 섭취는 혈액 내 요산치를 상승시켜 통풍의 위험을 증가시키지만 적정량의 포도주 섭취는 영향을 주지 않았다. (Curr Opin Rheumatol 17(3) :341-345) 
								</p>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10">고요산혈증 유발 요인
										<ul class="small ca">
											<li class="i_b_t7">이뇨제, 면역억제제등 약물을 사용하는 경우</li>
											<li class="i_b_t7">가족 중 통풍이 있는 경우</li>
											<li class="i_b_t7">40세 이상의 남자</li>
											<li class="i_b_t7">비만한 사람</li>
											<li class="i_b_t7">육류과다 섭취</li>
											<li class="i_b_t7">과음</li>
										</ul>
									</li>
								</ul>
								<div class="w650 ac box t2 mt10 mb30 p20 small">
									<h6 class="bold cm mb10">통풍과 비만</h6>
									<ul>
										<li class="i_b_t7">통풍 환자 중에는 체중이 과다한 사람이 많으며, 비만한 통풍 환자는 체중을 감량시키도록 권하고 있다. 그러나 급격한 체중 감소는 혈중에 산성물질을 과다하게 만들어
										통풍의 원인 물질인 요산이 원활히 체외로 빠져나가지 못하여 급성으로 통풍 발작(통증이 유발되고, 연골주위에 결절이 생김)을 유발하는 경우가 있게 된다. <br>
										따라서 체중은 혈중에 산성 물질이 과다하게 생기지 않도록 서서히 감량하여야 하며 모든 영양소를 골고루 포함하는 저열량식으로 계획해야 한다.정상적인 혈중 요산수치는 개인차가 있으나 3~7mg/㎗면 정상이고 7mg/㎗를 초과하면 주의해야 한다.<br> 
										10mg/㎗이 넘게 되면 통풍 증상이 일어날 수 있다. 혈중 요산수치는 혈액 검사를 통해 쉽게 알 수 있는데, 보통 건강진단시 혈액 검사 항목에는 혈중 요산수치를 알 수 있도록 검사가 행해지며, 통풍이 의심스러울 경우 가까운 종합병원 또는
										임상병리 검사기관에서 혈액을 채취하여 혈중의 요산수치를 측정할 수 있다.
										</li>
									</ul>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">식사요법의 원칙</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10">퓨린이 많은 식품을 제한합니다.
										<ul class="text small ca">
											<li class="i_b_t7 mt10">보통 식사나 체내의 합성작용에 의해 생성된 퓨린이 체내에서 분해되어 요산을 생성하기 때문에 요산의 생성을 줄이기 위해 퓨린이 많은 식품(간 및 내장류, 멸치, 진한 고기국물, 등푸른 생선)을 제한한다. 
											또한 단백질 식품에는 대부분 퓨린의 함량이 높으므로 퓨린 함량이 많은 식품을 제외한 나머지 고기류, 생선류, 가금류 등은 1일 120g 내외로 제한하도록 한다.</li>
										</ul>
										<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">퓨린 함량에 따른 식품의 분류(100g기준)</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="80">
													<col width="200">
													<col width="200">
													<col width="200">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">구분</th>
													<th scope="col" class="bold cm">적은 식품(0∼15mg)</th>
													<th scope="col" class="bold cm">중정도 식품(50∼150mg)</th>
													<th scope="col" class="bold cm">많은 식품(150∼800mg)</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td scope="row" class="bgf7 bold ca">곡류군</td>
													<td>곡류(오트밀, 전곡제외)</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">어육류군</td>
													<td>달걀, 치즈</td>
													<td>고기류, 가금류, 생선류, 조개류, 콩류<br>(강낭콩, 잠두류, 완두콩, 편두류)</td>
													<td>내장부위(심장, 간, 지라, 신장, 뇌, 혀),<br> 진한 고기국물, 거위, 가리비조개, 생선(정어리, 청어, 멸치, 고등어)</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">채소군</td>
													<td>중정도 식품을 제외한 모든 채소</td>
													<td>시금치, 버섯, 아스파라거스</td>
													<td></td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">우유군</td>
													<td>우유</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">과일군</td>
													<td>모든 과일</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">섭취기준</td>
													<td>제한하지 않음</td>
													<td>상태에 따라 일정량만큼만 섭취가능-어육류군은 1일120g 내외로 제한-채소군: 1주일에 2회정도</td>
													<td>급성기 또는 증세가심할 경우 <br>섭취를 제한</td>
												</tr>
												</tbody>
											</table>
										</div>
									</li>
									<li class="i_box_t1 mt20">물을 충분히 마십니다.
										<div class="box t2 w250 ac m20 mt40 p20 small fr">
											<h6 class="bold cm mb10">물 10컵을 마시려면</h6>
											<ul class="ssmall ca">
												<li class="i_b_t7">매 식사 시 국 1컵×3회</li>
												<li class="i_b_t7">아침 기상 즉시 물 1컵</li>
												<li class="i_b_t7">우유 1컵s</li>
												<li class="i_b_t7">매 식사 후 물 1컵×3회</li>
												<li class="i_b_t7">오전 10시와 오후 3시 차 1컵씩 </li>
											</ul>
										</div>
										<ul class="text small ca">											
											<li class="i_b_t7 mt10">소변을 통해 요산의 배설을 증가시키기 위해 물을 1일 2리터(10컵) 이상 마신다.</li>
											<li class="i_b_t7 mt10">단순당질이 포함된 주스나 음료 보다는 맑은 차나 생수로 마십니다. 간혹 맥주를 마시면 소변을 많이 보는데, 
												이로 인해 요산 배설이 증가된다고 믿어 맥주를 많이 먹는 경향이 있으나 맥주는 요산 배설을 어렵게 하므로 마시지 않도록 합니다.</li>
											<li class="i_b_t7 mt10">다만 신장질환이 동반되어 부종이 있는 경우는 과도한 수분섭취가 문제될수 있으므로 의료진과 상의하십시오</li>
										</ul>
									</li>
									<li class="i_box_t1 mt20">정상체중을 유지한다.
										<ul class="text small ca">
											<li class="i_b_t7 mt10">비만할 경우 과도한 체중이 관절에 더 많은 무리를 줄 수 있고 통풍의 위험을 증가시킵니다.
											과체중이거나 비만일 경우 체중감소가 통풍 예방에 도움이 될 수 있으나 급격한 체중감소는 혈중의 요산수치를 상승시킬 수 있어 점진적인 체중감소가 요구됩니다. 
											</li>
										</ul>
									</li>
									<li class="i_box_t1 mt20">과음을 피하며 금주하도록 한다.
										<ul class="text small ca">
											<li class="i_b_t7 mt10">술은 비만의 원인이 될 수 있으며 요산이 배설되는 것을 방해하여 혈중 요산치를 상승시켜 통풍의 위험을 증가시킬 수 있다.</li>
										</ul>
									</li>
									<li class="i_box_t1 mt20">지방섭취를 줄입니다.
										<ul class="text small ca">
											<li class="i_b_t7 mt10">지방은 소변으로의 요산 배설을 억제하므로 가급적 기름이 많이 들어가는 튀김, 샐러드 등은 피하는 것이 좋습니다.</li>
										</ul>
										<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">통풍시의 식품 섭취방법</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="140">
													<col width="270">
													<col width="270">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">식품</th>
													<th scope="col" class="bold cm">하루허용량</th>
													<th scope="col" class="bold cm">섭취방법</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td scope="row" class="bgf7 bold ca">우유</td>
													<td>1컵</td>
													<td>아침 식전 또는 간식으로 섭취</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">채소</td>
													<td>삶은 것 1컵=생것 3컵</td>
													<td>매 식사시 반찬으로 섭취 채소 100g<br>(그릇에 담아 1컵) 또는 익힌 채소1/3컵 × 3</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">과일</td>
													<td>사과 1개=배 1/2개 =귤 2개</td>
													<td>후식으로 사과의 경우 1개</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">곡류</td>
													<td>1 공기/끼=식빵 3쪽/끼=국수 1/2공기/끼</td>
													<td>매 식사시 밥은 1공기 정도</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">육류</td>
													<td>쇠고기, 돼지고기 또는 닭고기 40g/끼</td>
													<td>매 식사시 쇠고기로 반찬을 만들 경우<br> 40g(3점)정도 사용</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">달걀</td>
													<td>1개</td>
													<td>1일 1개 정도 반찬으로 사용</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">기름</td>
													<td>3작은술</td>
													<td>매 식사시 전이나 볶음시 기름사용, <br>1 끼당 1작은술씩만 사용</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">당류</td>
													<td>설탕 또는 꿀 20g </td>
													<td>반찬을 만들 경우나 차를 마실 때 설탕 사용</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">음료</td>
													<td>물 2리터 이상<br> 단,설탕이 함유된 음료는 1∼2컵 정도</td>
													<td>물은 충분히 섭취</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">기타</td>
													<td>양념류는 적정량 사용 땅콩, 잣, 호두 등의<br> 견과류는1큰술 미만으로 사용</td>
													<td>소금, 식초, 고춧가루 등의 양념류는 사용할 수 있으나,<br> 땅콩, 잣, 호두는 기름에 해당하므로 별도 섭취 시<br> 1큰술 미만만 사용</td>
												</tr>
												</tbody>
											</table>
										</div>
										<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">통풍의 3일 식단 예 - 열량 1900 kcal내외, 단백질 65-70g 내외</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="80">
													<col width="100">
													<col width="100">
													<col width="100">
													<col width="100">
													<col width="100">
													<col width="100">
												</colgroup>
												<thead>
												<tr>
													<th rowspan="2" scope="col" class="bold cm">구분</th>
													<th colspan="2" scope="colgroup" class="bold cm">1일</th>
													<th colspan="2" scope="colgroup" class="bold cm">2일</th>
													<th colspan="2" scope="colgroup" class="bold cm">3일</th>
												</tr>
												<tr>
													<th scope="col" class="bold cm">음식명</th>
													<th scope="col" class="bold cm">재료 및 분량(g)</th>
													<th scope="col" class="bold cm">음식명</th>
													<th scope="col" class="bold cm">재료 및 분량(g)</th>
													<th scope="col" class="bold cm">음식명</th>
													<th scope="col" class="bold cm">재료 및 분량(g)</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td scope="row" class="bgf7 bold ca">아침</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>근대국</li>
															<li>제육볶음</li>
															<li>파프리카샐러드</li>
															<li>표고버섯볶음</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>근대  70</li>
															<li>된장</li>
															<li>돼지고기  40</li>
															<li>고추장</li>
															<li>파프리카, 마요네즈</li>
															<li>표고버섯</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>콩나물국</li>
															<li>이면수구이</li>
															<li>깻잎찜</li>
															<li>도라지생채</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(201)</li>
															<li>콩나물</li>
															<li>소금</li>
															<li>이면수 50</li>
															<li>단깻잎  20</li>
															<li>간장, 파, 도라지 30</li>
															<li>오이 30 </li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>배추국</li>
															<li>달걀찜</li>
															<li>숙주나물</li>
															<li>무생채</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>배추 70</li>
															<li>된장</li>
															<li>달걀 1개</li>
															<li>쇠고기  30</li>
															<li>무 70</li>
															<li>고추가루</li>
														</ul>
													</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">간식</td>
													<td>두유</td>
													<td>200ml</td>
													<td>저지방우유</td>
													<td>200ml</td>
													<td>두유</td>
													<td>200ml</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">점심</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>미역국</li>
															<li>병어구이</li>
															<li>숙주나물</li>
															<li>미나리나물</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>건미역  5</li>
															<li>참기름</li>
															<li>병어   50</li>
															<li>숙주  70</li>
															<li>소금</li>
															<li>미나리  70</li>
															<li>고추장</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>볶음밥</li>
															<li>실파달걀국</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥(210)</li>
															<li>오이,당근,호박, 양파, 쇠고기40, <br>케첩 30</li>
															<li>실파  50</li>
															<li>달걀  30</li>
															<li>참기름</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>숭늉</li>
															<li>동태조림</li>
															<li>청포묵무침</li>
															<li>취나물</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>누룽지</li>
															<li>동태 50</li>
															<li>무 30</li>
															<li>청포묵  50</li>
															<li>간장, 파, 마늘, 취 70, 마늘, 깨소금,소금</li>
														</ul>
													</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">간식</td>
													<td>토마토</td>
													<td>1개(350)</td>
													<td>주스</td>
													<td>100cc</td>
													<td>사과</td>
													<td>80</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">저녁</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>감자국</li>
															<li>두부양념구이</li>
															<li>치커리겉절이</li>
															<li>호박나물</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>감자 70</li>
															<li>두부 80, 고춧가루, 파, 마늘, 치커리 70, 간장, 설탕, 애호박 70</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>열무국</li>
															<li>조기구이</li>
															<li>상치겉절이</li>
															<li>더덕구이</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>열무  70</li>
															<li>된장</li>
															<li>조기 50</li>
															<li>상치 70, 간장, 파, 마늘</li>
															<li>더덕 50</li>
															<li>고추장</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>흰밥</li>
															<li>무우국</li>
															<li>닭볶음</li>
															<li>참나물</li>
															<li>가지나물</li>
														</ul>
													</td>
													<td>
														<ul>
															<li>1공기(210)</li>
															<li>무우   50</li>
															<li>닭고기 40</li>
															<li>감자 20, 파, 간장</li>
															<li>참나물 70</li>
															<li>고추장</li>
															<li>가지 70</li>
														</ul>
													</td>
												</tr>
												<tr>
													<td scope="row" class="bgf7 bold ca">간식</td>
													<td colspan="2">귤     120</td>
													<td colspan="2">딸기 150</td>
													<td colspan="2">수박   150</td>
												</tr>
												</tbody>
											</table>
										</div>
									</li>
								</ul>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
