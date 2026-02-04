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
				<li><a href="/work/business/kb_c_baby.do" class="cm">우리가족영양관리</a></li>
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
						<h4 class="title bold cm t2 i_b_t2 mt50">노년기</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">노년기란</h5>
								<p class="mt10 pl15">연령대가 65세 이상 되는 시기로 생리적 기능의 감소, 잦은 질병, 사회경제적 위축 등으로 영양 취약 시기이다.</p>
							<h5 class="title bold t3 i_b_t3 mt40">노년기의 특징</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">신체적인 변화 - 치아손상, 의치, 소화불량, 변비, 맛, 냄새를 잘 못느낌</li>
									<li class="i_box_t1 mt10">환경적인 변화 - 활동량 감소, 식사준비 문제, 건강에 대한 염려</li>
									<li class="i_box_t1 mt10">식욕이 줄고, 식사를 거르게 됨, 음식을 골고루 먹지 않음<br />
										<span class="small ca">당뇨병, 고혈압, 암, 심장병, 뇌졸중, 치매, 골다공증, 관절염 발생빈도 높음</span>
									</li>
									<li class="i_box_t1 mt10">여러 가지 약물복용으로 소화기능의 감소와 맛에 대한 민감도가 낮아짐</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">노년기의 영양권장량</h5>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">노년기의 영양소 섭취기준</span>
									<table class="table t2 mt10 text ssmall s1 ca center">
										<colgroup>
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
											<td rowspan="2">남자</td>
											<td>65~74</td>
											<td>59.2</td>
											<td>2,000</td>
											<td>25</td>
											<td>40</td>
											<td>50</td>
											<td>2,100</td>
											<td>700</td>
											<td>9</td>
										</tr>
										<tr>
											<td>75이상</td>
											<td>59.2</td>
											<td>2,000</td>
											<td>25</td>
											<td>40</td>
											<td>50</td>
											<td>2,100</td>
											<td>700</td>
											<td>9</td>
										</tr>
										<tr>
											<td rowspan="2">여자</td>
											<td>65~74</td>
											<td>50.2</td>
											<td>1,600</td>
											<td>20</td>
											<td>35</td>
											<td>45</td>
											<td>1,800</td>
											<td>700</td>
											<td>8</td>
										</tr>
										<tr>
											<td>75이상</td>
											<td>50.2</td>
											<td>1,600</td>
											<td>20</td>
											<td>35</td>
											<td>45</td>
											<td>1,800</td>
											<td>700</td>
											<td>8</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">EAR: 평균필요량, AI: 충분섭취량, RI: 권장섭취량, UL: 상한섭취량</span>
									<span class="ssmall ca fr">(출처 : 한국인영양섭취기준, 한국영양학회(2010))</span>
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">노년기의 영양관리</h5><br />
								<ul>
									<li class=" m10 ml15 mt20">1. 규칙적으로 적은 양을 자주 먹는다.
										<ul class="mt10">
											<li class="i_box_t1">수분<br>
												<span class="small ca">나이가 들수록 수분을 적게 마셔서 변비나 탈수현상이 생기기 쉬우므로 하루 8잔의 물을 섭취한다.</span>
											</li>
											<li class="i_box_t1 mt10">곡류 및 전분류<br>
												<span class="small ca">곡류와 전분류는 생활에서 힘을 내게 한다. 이중 식이섬유소는 변비나 암을 예방하고, 혈당과 혈중 콜레스테롤을 낮추어 준다.</span>
											</li>
											<li class="i_box_t1 mt10">식이섬유소 <br>
												<span class="small ca">흰밥, 흰빵보다 도정이 덜 된 잡곡밥을 먹는다. 채소, 과일, 해조류를 충분히 먹는다.</span>
											</li>
											<li class="i_box_t1 mt10">채소 및 과일류<br>
												<span class="small ca">채소와 과일에는 비타민과 무기질이 많아서 몸의 정상적인 활동에 도움을 준다.</span>
											</li>
											<li class="i_box_t1 mt10">고기, 생선, 달걀,콩류<br>
												<span class="small ca">고기, 생선, 달걀과 콩류는 단백질 식품으로 우리 몸을 만들고 유지하는데 필요하다. 노인들은 질이 좋은 단백질을 충분히 섭취해야 한다.</span>
											</li>
											<li class="i_box_t1 mt10">우유 및 유제품
												<span class="small ca">우유와 유제품에 많은 칼슘은 뼈나 치아를 만드는데 필요하다. 나이가 들수록 뼈에 있는 칼슘이 빠져나가 골다공증에 걸리기 쉽다.
												하루 700mg 정도의 칼슘을 섭취해야 한다.</span>
											</li>
											<li class="i_box_t1 mt10">유지·견과 및 당류
												<span class="small ca">주로 단순당, 지방으로 되어 있어 열량만 제공한다. 당류는 설탕, 꿀, 사탕 등으로 많이 먹으면 식욕이 줄고, 비만이 되기 쉬우므로 조심해야 한다. 
												지방은 열량을 많이 내고 음식 맛을 좋게 하며 포만감을 준다. 동물성 기름과 콜레스테롤을 적게 먹으려면 기름기는 제거하고, 살짝 삶은 후 조리한다.
												삼겹살, 닭껍질 등 기름기가 많은 부위는 자주 먹지 않는다. 육류보다 생선을 즐긴다. 고기요리에는 채소를 곁들이거나 찜, 구이를 이용한다.</span>
											</li>
										</ul>
									</li>
									<li class=" m10 ml15 mt20"> 2. 식사 때마다 영양소 밀도가 높은 음식을 포함시킨다. 노인은 성인과 비교해 에너지 필요량은 적으나 다른 영양소 권장량은 큰 차이가 없으며, 
									한꺼번에 많은 양을 먹지 못하므로 영양밀도가 높은 식단을 짜야 한다. 육류·우유·치즈·달걀·두부 등의 섭취가 중요하다.</li>
									<li class=" m10 ml15 mt20">3. 노인의 기호, 치아상태, 소화능력을 고려하여 식품의 선택과 조리방법에 세심한 배려가 필요하다.
									노인들은 부드럽고 달고 따뜻한 음식을 좋아하고, 맵고 짜고 신 것을 싫어한다. 생선과 육류를 좋아하고 채소 및 과일을 별로 좋아하지 않는 경향이다.</li>
									<li class=" m10 ml15 mt20"> 4. 색,풍미,형태가 다양한 음식을 차리고, 밝고 환한 곳에서 식사를 하여 식욕을 돋군다. 식사전에 간단한 몸 동작을 하거나 걸러보는 것도
									식욕을 돋굴 수 있다.</li>
									<li class=" m10 ml15 mt20"> 5. 노인들은 단맛에 대한 역치의 증가, 또는 외로움을 달래기 위해 단맛이 강한 연질음식이나 음료를 좋아하게 된다. 
									케이크나 과자류·사탕·초콜렛·콜라·사이다 등 'empty calorie'식품이므로 과잉 섭취하지 않도록 한다.</li>
									<li class=" m10 ml15 mt20">6. 변비와 만성 질환의 유병률이 높으므로 가능한 신선한 과일, 채소, 해조류, 두류를 많이 섭취하도록 한다.
									신선한 채소와 과일은 노인에게 부족 되기 쉬운 비타민 A를 비롯한 여러 비타민과 무기질, 식이섬유질의 좋은 급원이다.</li>
									<li class=" m10 ml15 mt20">7. 칼슘 보충을 위해 우유 및 유제품, 뼈째 먹는 생선, 뼈곰국 등을 많이 섭취토록 한다.</li>
									<li class=" m10 ml15 mt20">8. 미각의 둔화로 노인은 더욱 짜게 먹게 되므로 가능한 싱겁게 먹고 가공식품의 섭취를 감소시켜 나트륨 섭취를 줄이도록 한다.</li>
									<li class=" m10 ml15 mt20">9. 편의 식품을 준비해두고 조리 시 작업량을 줄일 수 있는 조리기구들을 마련한다.</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">노인을 위한 식생활지침 </h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">고기나 생선, 콩 제품 반찬을 골고루 먹자.</li>
									<li class="i_box_t1 mt10">우유 제품과 과일을 매일 먹자.</li>
									<li class="i_box_t1 mt10">짠 음식을 피하고, 싱겁게 먹자.</li>
									<li class="i_box_t1 mt10">많이 움직여서 식욕과 적당한 체중을 유지하자.</li>
									<li class="i_box_t1 mt10">술은 절제하고, 물을 충분히 마시자.</li>
									<li class="i_box_t1 mt10">세끼 식사와 간식을 꼭 먹자.</li>
									<li class="i_box_t1 mt10">음식은 먹을 만큼 준비하고, 오래 된 것은 먹지 말자. </li>
								</ul>
					</div>
			</c:otherwise>
	    </c:choose>			
	</div>
</div>
