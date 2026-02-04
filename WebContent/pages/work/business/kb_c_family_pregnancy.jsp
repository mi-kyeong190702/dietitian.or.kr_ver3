<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">우리가족</mark>영양관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_family_baby.do" class="cm">우리가족영양관리</a></li>
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
				<%@ include file="inc/family.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">임신수유기</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">임신수유기란</h5>
								<p class="mt10 pl15">임신 중에는 모체의 신체 유지와 아울러 태반과 태아, 자궁의 성장과 출산 후 수유를 위해 영양소의 공급이 필요하다.
								임신 중에 일어나는 혈액량과 체액의 증가 역시 단백질과 무기질의 공급을 필요로 한다. 임신기간 중에 먹는 음식물은 태아의 발육에 매우 중요한 역할을 하며,
								또한 임신 중의 건강과 산후의 회복에 영향을 미치게 된다. 그러므로 균형잡힌 식생활로 아기와 모성의 건강을 지키도록 해야 한다.<br />
								수유부는 자신의 몸을 위생적으로 깨끗하게 유지하고 편안한 마음과 안정된 정신상태를 유지해야 하므로 충분한 휴식, 수면, 적당한 운동을 하는 것이 좋다. 
								이렇게 하기 위해서는 수유부 자신의 노력은 물론 가족과 주위 사람들의 따듯한 배려가 필요하다.
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">임산부 특성</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">혈액 형성에 필요한 영양소 필요량 증가
										<ul class="small ca">
											<li class="i_b_t7">산소, 영양소 공급 을 위해 혈액량이 임신전보다 50% 증가</li>
											<li class="i_b_t7">혈액을 만드는데 필수적인 단백질, 철, 엽산 및 비타민 B6의 공급 중요</li>
											<li class="i_b_t7">육어류 및 채소 섭취 증가 및 철보충제 복용이 필요함</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">수분 필요량 증가
										<ul class="small ca">
											<li class="i_b_t7"><mark class="bold ca">혈액량의 증가</mark> : 모체 및 태아에서의 조혈작용 확대</li>
											<li class="i_b_t7"><mark class="bold ca">양수의 생성</mark> : 자궁 내에서 태아 보호</li>
											<li class="i_b_t7"><mark class="bold ca">소변 배설량 증가</mark> : 모체와 태아 조직의 노폐물 제거</li>
											<li class="i_b_t7">물, 과일, 채소주스 및 우유 등 8컵 이상의 수분을 섭취</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">소화기관 평활근 이완
										<ul class="small ca">
											<li class="i_b_t7">변비의 발생 가능성 높아짐</li>
											<li class="i_b_t7">소화기관 내에서 섭취한 음식물의 이동 속도 저하</li>
											<li class="i_b_t7">소화되기 쉽고 변비를 예방할 수 있는 식품 섭취.</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">영양소가 부족되기 쉬움</mark> : 철, 칼슘, 엽산, 비타민B12, 비타민D
										<div class="box t2 mt20 p20 small">
											<h6 class="bold cm">임신부의 정상적인 체중 증가 정도</h6>
												<p class="text ssmall cb mt5">임신부가 임신하기 전에 저체중이나 비만하였다면 다음과 같이 체중을 증가시키는 것이 바람직하다. 
												즉 저체중이었던 경우에는 정상체중 증가량인 10∼12kg 보다 좀더 증가시키며, 비만인 경우에는 체중증가가 적게 되도록 한다. </p>
											<h6 class="bold cm mt15">표준체중</h6>
												<ul class="small">
													<li class="i_b_t7">남자 : 표준체중(Kg)= 키(m) × 키(m) × 22 </li>
													<li class="i_b_t7">여자 : 표준체중(Kg)= 키(m) × 키(m) × 21</li>
												</ul>
											<h6 class="bold cm mt15">비만도</h6>
												<ul class="small">
													<li class="i_b_t7">10% 이하는 체중미달<br /> 10% 이면 정상체중<br /> 10∼20% 이면 과체중, 비만경향 20% 이상이면 비만으로 판단할 수 있다. </li>
												</ul>
											<h6 class="bold cm mt15">임신전의 체중과 이에 따른 바람직한 체중 증가량 </h6>
												<div class="w630 m10 mb20">
													<table class="table t2 mt10 text ssmall s1 ca center">
														<colgroup>
															<col width="200" />
															<col width="250" />
														</colgroup>
														<thead>
														<tr>
															<th scope="col" class="bold cm">임신하기 전 체중</th>
															<th scope="col" class="bold cm">바람직한 체중 증가량(kg)</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td class="bgf7 bold">정상</td>
															<td>10 ∼ 12kg</td>
														</tr>
														<tr>
															<td class="bgf7 bold">저체중</td>
															<td>12.5∼ 18kg</td>
														</tr>
														<tr>
															<td class="bgf7 bold">비만</td>
															<td>7kg</td>
														</tr>
														<tr>
															<td class="bgf7 bold">쌍태아 임신</td>
															<td>6 ∼ 20.5kg</td>
														</tr>
														</tbody>
													</table>
												</div>
										</div>
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">임신기·유부의 영양권장량</h5>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">임신기·유부의 영양소 섭취기준</span>
									<table class="table t2 mt10 text ssmall s1 ca center">
										<colgroup>
											<col width="150">
											<col width="*">
										</colgroup>
										<thead>
										<tr>
											<th colspan="8" scope="col" class="bold cm">영양소 섭취기준</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td rowspan="2" class="bgf7 bold">연령(세)</td>
											<td>에너지(kcal)</td>
											<td>식이섬유(g)</td>
											<td colspan="2">단백질(g)</td>
											<td>수분(ml)</td>
											<td>칼슘(mg)</td>
											<td>철(mg)</td>
										</tr>
										<tr>
											<td>EAR</td>
											<td>AI</td>
											<td>EAR</td>
											<td>RI</td>
											<td>AI</td>
											<td>RI</td>
											<td>RI</td>
										</tr>
										<tr>
											<td class="bgf7 bold">비임기(19~29세)</td>
											<td>2,100I</td>
											<td>20</td>
											<td>40</td>
											<td>50</td>
											<td>2,100</td>
											<td>650</td>
											<td>14</td>
										</tr>
										<tr>
											<td class="bgf7 bold">임신기(2분기/3분기)</td>
											<td>0</td>
											<td>5</td>
											<td>0.48</td>
											<td>0.5</td>
											<td>200</td>
											<td>280</td>
											<td>10</td>
										</tr>
										<tr>
											<td class="bgf7 bold">수유부</td>
											<td>320</td>
											<td>5</td>
											<td>20</td>
											<td>25</td>
											<td>700</td>
											<td>370</td>
											<td>0</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">EAR: 평균필요량, AI: 충분섭취량, RI: 권장섭취량, UL: 상한섭취량</span>
									<span class="ssmall ca fr">(출처 : 한국인영양섭취기준, 한국영양학회(2010))</span>
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">임신기의 영양관리</h5>
								<p class="mt10 pl15">임신 중의 1일 영양권장량은 기초대사량의 증가, 태아와 태반의 성장, 모체 관련 조직의 증대, 모체 내 지방축적, 모유분비의 준비 등을 감안하여 증가시킨 것이다.
								따라서 아기와 모체, 둘을 위하여 먹는다는 것은 중요하나 이것은 평상시 섭취량의 두배를 먹어야 함을 뜻하는 것은 아니다.
								평상시에 균형잡힌 적절한 식사를 해왔다면 임신 중의 식사수칙을 지키면서 약간의 추가식품만 섭취하면 된다. 
								</p>
								<ul class="mt10 pl15">
									<li class="i_box_t1">에너지
										<ul class="small ca">
											<li class="i_b_t7">아기의 탄생을 위해 총 약 77,000kcal가 필요</li>
											<li class="i_b_t7">임신 중반에는 평상시보다 매일 약 340kcal, 임신후반에는 450kcal가 더 필요</li>
											<li class="i_b_t7">에너지는 영양소가 풍부한 식품을 통해 섭취</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">단백질
										<ul class="small ca">
											<li class="i_b_t7">태아의 성장(태아의 신체 및 뇌세포 재료)에 필요</li>
											<li class="i_b_t7">태반, 자궁, 유방조직의 성장에 필요</li>
											<li class="i_b_t7">혈액 공급에 필요</li>
											<li class="i_b_t7">주요 공급원: 어육류군, 우유와 유제품, 두류</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">칼슘
										<ul class="small ca">
											<li class="i_b_t7">태아의 뼈와 치아구성에 필요 : 임신 6주가 되었을 때 이미 태아의 뼈와 치아형성 시작</li>
											<li class="i_b_t7">신경과 근육의 기능을 위해서도 필요</li>
											<li class="i_b_t7">골다공증의 예방을 위해서도 중요</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">철
										<ul class="small ca">
											<li class="i_b_t7">철은 혈액 중 헤모글로빈 원료 : 임신 중에는 산소와 영양분의 공급을 위해 혈액의 양이 증가함</li>
											<li class="i_b_t7">태아의 철 저장을 위해 필요</li>
											<li class="i_b_t7">육류의 철은 다른 식품 내의 철분보다 더 쉽게 체내에 흡수됨</li>
											<li class="i_b_t7">비타민C가 풍부한 식품들은 철의 흡수를 향상시킴</li>
											<li class="i_b_t7">철보충제 복용은 먼저 반드시 의사와 상의하여야 함</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">엽산
										<ul class="small ca">
											<li class="i_b_t7">태아와 모체 조직의 세포분열과 성장에 필요</li>
											<li class="i_b_t7">따라서 임신 중 필요량이 크게 증가하며, 부족시 유산 혹은 기형아 출산의 위험</li>
										</ul>
									</li>
									<li class="i_box_t1 mt10">식이섬유소
										<ul class="small ca">
											<li class="i_b_t7">식이섬유소는 임신 기간 중 생기는 변비의 문제를 줄이는데 도움을 줄 수 있음</li>
											<li class="i_b_t7">과일, 채소류, 콩류 등에 많이 들어있음</li>
										</ul>
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">수유부의 영양관리</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">충분한 열량을 섭취한다.
										<span class="small ca">모유를 만들기 위해서는 600∼800kcal가 더 필요한데 산후 첫 6개월 동안은 이중 100∼300kcal를
										임신기간에 저장되었던 체지방에서 공급하므로 500kcal를 추가로 섭취해야 한다. 그러나 수유부가 심하게 불균형된 식사를 하고 있다든지,
										모유와 우유를 함께 먹이는 경우에는 개별적인 조절이 필요하다.</span>
									</li>
									<li class="i_box_t1 mt10">식품을 골고루 섭취한다.
										<span class="small ca">모유를 만들기 위해서는 열량 이외에도 단백질, 비타민, 무기질 등의 영양소가 모두 더 필요하므로 
									골고루 더 섭취해야 한다. 수유부가 섭취한 영양소는 모유의 성분에도 영향을 미치며, 부족한 경우 수유부의 체력약화를 초래할 수 있다. 
									우유, 어육류, 채소, 과일을 매일 균형있게 섭취하도록 한다.</span>
									</li>
									<li class="i_box_t1 mt10">수분을 충분히 섭취한다.<br />
										<span class="small ca">수유에 필요한 수분 공급을 위해 적어도 하루 2 L이상의 물을 마신다.</span>
									</li>
									<li class="i_box_t1 mt10">카페인이 함유된 식품(커피, 홍차, 녹차, 코코아, 콜라, 초콜릿)은 가급적 피한다.
										<span class="small ca">섭취된 카페인은 모유로 분비되며 	아기는 이것을 배설하는데 시간이 많이 걸린다. 따라서 아기가 잠을 자지 않거나 흥분 상태로 있을 수 있다.</span>
									</li>
									<li class="i_box_t1 mt10">약물복용, 흡연, 음주는 피한다.
										<span class="small ca">불가피하게 약을 먹어야 하는 경우에는 꼭 주치의와 상의한다. 
										담배의 니코틴과 술의 알콜은 모유로 분비되며 니코틴 독성이나 성장발달 부진을 가져올 수 있다.</span>
									</li>
									<li class="i_box_t1 mt10">긴장을 풀고 휴식을 취하도록 한다.
										<span class="small ca">출산 후에는 매우 피곤하고 긴장된 상태로 기분도 저하되기 쉽다. 
										긴장과 피로는 모유분비를 어렵게 하므로 아기를 생각하며 기분을 풀고 젖이 잘 나오지 않더라도 자주 빨리도록 한다.</span>
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">임신부·수유부를 위한 식생활지침</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1"> 우유 제품을 매일 3회 이상 먹자.</li>
									<li class="i_box_t1 mt10">고기나 생선, 채소, 과일을 매일 먹자.</li>
									<li class="i_box_t1 mt10">청결한 음식을 알맞은 양으로 먹자.</li>
									<li class="i_box_t1 mt10">짠 음식을 피하고, 싱겁게 먹자.</li>
									<li class="i_box_t1 mt10">술은 절대로 마시지 말자.</li>
									<li class="i_box_t1 mt10">활발한 신체활동을 유지하자.</li>
								</ul>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
