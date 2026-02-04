<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">우리가족</mark>영양관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_family_baby.do" class="cm">우리가족영양관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<%@ include file="inc/family.jsp" %>
		
		<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">성인기</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">성인기란</h5>
								<p class="mt10 pl15">19세에서 64세까지 넓은 연령층이다. 신체적, 정신적 변화가 끝나고 부분적인 노화가 시작되나 일생동안 가장 안정된 기간으로 성인기의 건강은 
								올바른 식습관뿐만 아니라, 운동여부, 흡연여부, 음주, 스트레스 관리 방법에 따라 좌우된다.
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">성인기의 특성</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">대부분 신체기관은 20세에 생리적 성숙에 도달하지만, 근골격계 발달 중 최대신장은 20세 초반에 완성되나 최대근육 강도는 최대신장 5년후에 나타나고
									골질량은 30대 초반까지도 축적되어 약 35세에 최대골질량에 도달한다.</li>
									<li class="i_box_t1 mt10">제지방량이 10년마다 2-3%가 감소하고, 지방량이 서서히 증가한다.</li>
									<li class="i_box_t1 mt10">기초대사량이 서서히 감소하고 운동량이 증가하지 않으면 체중이 증가한다.</li>
									<li class="i_box_t1 mt10">여성의 경우 45세에서 55세 사이에 폐경기를 경험하고 여러 가지 갱년기 증상을 경험한다.</li>
									<li class="i_box_t1 mt10">특히 에스트로겐 분비 감소는 골다공증이나 심혈관계질환의 위험이 증가한다.</li>
									<li class="i_box_t1 mt10">사회심리적 요인으로 남성은 경쟁체제의 경제활동으로 스트레스가 쌓이고, 여성은 가사노동, 육아와 자녀교육에 대한 부담, 
									특히 직장 여성은 일과 가정을 병행해야 하는 이중부담이 있다.</li>
									<li class="i_box_t1 mt10">음주 및 외식의 기회가 많아 과열량 섭취에 대한 체중증가도 우려되며, 특히 40대 남성의 경우 스트레스와 음주, 흡연 등으로 올바른 영양관리가 
									필요한 시기이다.</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">성인의 영양권장량</h5>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">성인기영양소 섭취기준</span>
									<table class="table t2 mt10 text ssmall s1 ca center">
										<colgroup>
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
										</colgroup>
										<thead>
										<tr>
											<th colspan="10" scope="col" class="bold cm">영양소 섭취기준</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td rowspan="2" colspan="2">연령(세)</td>
											<td rowspan="2">체중(kg)</td>
											<td rowspan="2">에너지(kcal) EAR</td>
											<td>식이섬유(g)</td>
											<td colspan="2">단백질(g)</td>
											<td>수분(ml)</td>
											<td>칼슘(mg)</td>
											<td>철(mg)</td>
										</tr>
										<tr>
											<td>AI</td>
											<td>EAR</td>
											<td>RI</td>
											<td>AI</td>
											<td>RI</td>
											<td>RI</td>
										</tr>
										<tr>
											<td rowspan="3">남자</td>
											<td>19~29</td>
											<td>65.8</td>
											<td>2,600</td>
											<td>25</td>
											<td>45</td>
											<td>55</td>
											<td>2,600</td>
											<td>750</td>
											<td>10</td>
										</tr>
										<tr>
											<td>30~49</td>
											<td>63.6</td>
											<td>2,400</td>
											<td>25</td>
											<td>45</td>
											<td>55</td>
											<td>2,500</td>
											<td>750</td>
											<td>10</td>
										</tr>
										<tr>
											<td>50~64</td>
											<td>60.6</td>
											<td>2,200</td>
											<td>25</td>
											<td>40</td>
											<td>50</td>
											<td>2,200</td>
											<td>700</td>
											<td>9</td>
										</tr>
										<tr>
											<td rowspan="3">여자</td>
											<td>19~29</td>
											<td>56.8</td>
											<td>2,100</td>
											<td>20</td>
											<td>40</td>
											<td>50</td>
											<td>2,100</td>
											<td>650</td>
											<td>14</td>
										</tr>
										<tr>
											<td>30~49</td>
											<td>54.2</td>
											<td>1,900</td>
											<td>20</td>
											<td>40</td>
											<td>45</td>
											<td>2,000</td>
											<td>650</td>
											<td>14</td>
										</tr>
										<tr>
											<td>50~64</td>
											<td>52.2</td>
											<td>1,800</td>
											<td>20</td>
											<td>35</td>
											<td>45</td>
											<td>1,900</td>
											<td>700</td>
											<td>8</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">EAR: 평균필요량, AI: 충분섭취량, RI: 권장섭취량, UL: 상한섭취량</span>
									<span class="ssmall ca fr">출처 : 한국인영양섭취기준, 한국영양학회(2010)</span>
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">성인기의 영양관리</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1"><mark class="bold">식사관리 </mark> : 건강한 일반 성인은 성인을 위한 식생활지침을 활용하고 성인병이 있는 사람은 질환에 따른 식이요법을 한다. 
									중년 성인의 경우 건강기능식품과 보약에 대한 과신으로 많이 복용하는 경우 오히려 건강을 해치는 결과를 가져올 수 있으므로 주의한다.<br />
									직장인들은 결식이나 외식을 많이 해서 영양적으로 문제가 많을 수 있다. 특히 남성들은 육류 위주의 외식으로 열량이 너무 높고 동물성 지방 섭취가 많고 음주로 인한 과잉 열량 섭취 및 불균형적인 식사로 인해 비만이 우려된다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">운동습관 및 스트레스 관리</mark> : 성인기에는 규칙적으로 운동하는 좋은 생활습관을 가지는 것이 건강을 유지하는 길이다.
									규칙적인 운동으로 신체가 단련되면 혈액순환이 좋고 근육량이 증가하여 기초대사량이 증가하고 체지방을 에너지원으로 이용할 수 있다. 또한 심폐기능을 좋게하고,
									총콜레스테롤은 감소시키고, HDL-콜레스테롤을 증가시켜 심혈관계 질환 위험을 낮출 수 있다. 혈압을 조절하고 체중을 줄일 수 있고 당뇨병에도 효과적이고 아울러
									스트레스를 해소시켜 준다.<br />스트레스를 줄이기 위해서 원인을 깨닫고 이해함으로 현실적인 대처 방법을 모색한다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">금연과 영양</mark> : 흡연자는 알코올, 탄수화물 등 고열량식품의 섭취가 높고, 채소류와 과일류 섭취가 낮은 반면 기름진
									음식의 섭취가 높고 특히 커피 등 기호식품의 섭취량이 높다. 흡연자에게는 항산화 영양소 요구량이 증가되므로 특히 비타민 A,C가 풍부한 채소와 과일을 많이 섭취하는 것이
									폐암의 위험도 감소에 도움이 된다. 따라서 흡연자의 항산화 영양상태를 향상시키기 위해서는 금연이 최선의 방법이지만 어려우면 비타민이 풍부한 채소, 
									과일을 충분히 먹는 것이 중요하다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">음주와 영양</mark> : 적당량의 음주를 정의하기에는 음주자의 체질, 연령, 술의 종류 등 여러 요인이 복합적으로 작용하기 
									때문에 안전한 음주량을 결정하기는 어렵다. 일반적으로 여자는 하루에 1잔 이하, 남자는 하루 2잔 이하를 적당한 음주라고 인정한다. 
									술의 양은 달라도 그 안에 포함된 알코올의 양은 비슷하게 약 12-14g이다.<br />음주를 할 때에는 공복시에는 절대로 하지말고 영양가 높은 식품을 함께 먹어야 한다. 
									술은 가급적 알코올 농도가 낮은 것으로 마시고 독한 술은 물 또는 주스와 섞어서 마신다. 만성적인 음주자는 다른 식품의 섭취가 감소되기 쉽고 비타민, 무기질 섭취 부족으로
									일차적인 영양불량을 초래한다.<br />숙취를 해소하기 위해서는 꿀물, 과일과 같은 과당을 섭취하는 것이 좋다. 또한 충분한 단백질을 섭취하고, 열량을 충분히 공급해 주면서 
									비타민과 무기질을 공급해준다. 식사는 탄수화물 위주의 식사를 하며 특히 비타민 C공급을 위해 과일을 먹는 것이 좋다. 아침식사 시 아스파르트산이 많이 든 콩나물국을 먹거나 북어국을 먹으면 숙취해소에 도움이 된다.
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">성인을 위한 식생활지침</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">각 식품군을 매일 골고루 먹자.</li>
									<li class="i_box_t1 mt10">활동량을 늘이고 건강체중을 유지하자.</li>
									<li class="i_box_t1 mt10">청결한 음식을 알맞게 먹자.</li>
									<li class="i_box_t1 mt10">짠음식을 피하고 싱겁게 먹자.</li>
									<li class="i_box_t1 mt10">지방이 많은 고기가 튀긴음식을 적게 먹자.</li>
									<li class="i_box_t1 mt10">술을 마실때는 그 양을 제한하자.</li>
								</ul>
					</div>
	</div>
</div>
