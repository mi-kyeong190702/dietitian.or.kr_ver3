<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">성인</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_adult_obesity.do" class="cm">성인비만관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<%@include file="inc/adult_obesity.jsp" %>
		
		<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">비만의 판정과 분류</h4><br />
						<p class="middle mt20">비만을 평가하는 방법에는 물 속에서 체중을 재어 몸의 비중을 계산한 뒤에 산출하는 비중법, 동위원소를 이용하여 산출하는 중수소이용법, 몸 안의 칼륨을 재어서 구하는 총 칼륨법 등과 같은 직접적이고 전문적인 방법들도 있으나, 흔히 의학적 편리성까지 고려하여 사용하는 방법들과 기준은 다음과 같다.
						</p>
							<h5 class=" title bold t3 i_b_t3 mt40">표준체중과의 비교</h5>
								<ul class="mt10 pl15">
									<li>
										<div class="box bgs w680 r5">
											<ul class="p20 small cb">
												<li class="i_b_t7">신장 160cm 이상 : 표준체중(kg)= [신장(cm)-100] ×0.9 </li>
												<li class="i_b_t7">신장 150∼159cm : 표준체중(kg)= [신장(cm)-150]×0.5 + 50</li>
												<li class="i_b_t7">신장 150cm 이하 : 표준체중(kg)= 신장(cm)-100</li>
											</ul>
										</div>
									</li>
									<li class="mt10">
										<div class="box bgs w680 r5">
											<ul class="p20 small cb">
												<li class="i_b_t7">남자의 표준 체중(kg) = 키(m) × 키(m) × 22 </li>
												<li class="i_b_t7">여자의 표준 체중(kg) = 키(m) × 키(m) × 21</li>
											</ul>
										</div>
									</li>
									<li class="mt10">
										<div class="w400 box t2 center mt20 p10 fl"><img src="/images/sub/kb_obesity.png" alt="비만도 계산" title="비만도=실제체중-신장별 표준체중/신장별 표준체중 * 100%" /></div>
										<div class="area">
											<ul class="p10 small ca">
												<li class="i_b_t7">10 ~ 20% 과체중</li>
												<li class="i_b_t7">20 ~ 30% 경도 비만</li>
												<li class="i_b_t7">30 ~ 50% 중등도 비만</li>
												<li class="i_b_t7">50% 이상 고도 비만</li>
											</ul>
										</div>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">체질량지수 (BMI, Body mass index, kg/㎡ )</h5>
								<p class="mt10 pl15">체질량지수는 환자의 건강위험을 평가하기 위해 사용하는 체중과 신장의 관계를 말한다.
								이는 성인에서 체지방과 상관관계가 있는 수학공식이며 , 체중 (kg) 을 신장 (meter) 의 제곱으로 나눈다.
								WHO(Asia-Pacific Region) 와 대한비만학회에서 과체중의 기준을 체질량지수 23kg/㎡ 이상 , 비만의 기준은 체질량지수 25kg/㎡ 이상으로 정의하였다. 
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">허리둘레</h5>
								<p class="mt10 pl15">허리둘레는 지방분포를 평가하는 방법이다 . 허리 / 엉덩이 둘레비에 대한 자료가 많았지만,
								최근 허리둘레가 복부내장 지방의 적절한 지표가 됨이 확인되어 지금은 허리둘레만으로 복부비만을 진단하고 있다. 
								WHO 아시아 - 태평양 지역의 진단기준은 남자 90cm이상, 여자 80cm이상을 복부비만의 기준치로 삼고 있다. 
								2006년 대한비만학회에서는 남자의 경우 90cm 이상, 여자의 경우 85cm 이상을 기준치로 하였다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">한국인의 체질량지수와 허리둘레에 따른 동반질환 위험도</h5>
							<div class="w600 ac mt20">
								<span class="ssmall ca fr">체중(kg)/[키(m)]2 </span>
								<table class="table t2 text small s1 ca center">
									<colgroup>
										<col width="150" />
										<col width="150" />
										<col width="150" />
										<col width="150" />
									</colgroup>
									<thead>
									<tr>
										<th scope="col" class="bold cm"></th>
										<th scope="col" class="bold cm">체질량지수</th>
										<th colspan="2" scope="col" class="bold cm">동반질환의 위험도</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td></td>
										<td></td>
										<td colspan="2" scope="col" class="bgf7 bold">허리둘레</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td>&lt; 90cm(남성)</td>
										<td>&gt; 90cm(남성)</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td>&lt; 85cm(여자)</td>
										<td>≥ 85cm(여자)</td>
									</tr>
									<tr>
										<td class="bgf7">저체중</td>
										<td>&lt; 18.5 </td>
										<td>낮다</td>
										<td>보통</td>
									</tr>
									<tr>
										<td class="bgf7">정상</td>
										<td>18.5∼22.9</td>
										<td>보통</td>
										<td>증가</td>
									</tr>
									<tr>
										<td class="bgf7">과체중</td>
										<td>≥ 23.0</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="bgf7">위험체중</td>
										<td>23.0 ~ 24.9</td>
										<td>증가</td>
										<td>중등도</td>
									</tr>
									<tr>
										<td class="bgf7">1단계 비만</td>
										<td>25.0 ~ 29.9 </td>
										<td>중등도</td>
										<td>고도</td>
									</tr>
									<tr>
										<td class="bgf7">2단계 비만</td>
										<td>&gt; 30.0</td>
										<td>고도</td>
										<td>매우고도</td>
									</tr>
									</tbody>
								</table>
							</div>
					</div>
	</div>
</div>
