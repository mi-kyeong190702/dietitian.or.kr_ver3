<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">경관</mark>급식</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_tube_feeding.do" class="cm">경관급식</a></li>
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
				<%@ include file="inc/tubefeeding.jsp" %>
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">영양소필요량의 결정</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40">에너지</h5>
								<p class="mt10 pl15"><mark class="cm">환자의 에너지 요구량은 경장영양액의 총 공급량을 결정한다. 대부분의 경장영양액은 1kcal/1cc이나 1.5~2.0kcal/1cc의 농축 영양액도 있다.</mark> 
								총 공급 용량에 대한 환자의 적응도와 수분요구량에 따라 영양액을 농축시키거나 희석하여 공급할 수 있다.
								</p>
								<p class="mt10 pl15">환자의 에너지 <mark class="bold cm">요구량</mark> 을 측정하는 가장 좋은 방법은 indirect calorimetry를 사용하는 것이지만 비용과 절차를 고려할 때 현실적으로 시행하기가 어렵다. 해리슨 베네딕트 공식을 이용하여 기초 대사량을 구하고 여기에 활동량 지수 및 스트레스 지수를 곱하여 에너지 요구랑을 구할 수 있다. 그러나 이 방법은 에너지 필요량을 과다하게 산정하게 되므로 환자의 체중 당 25~30kcal를 공급하는 것이 보다 일반적이며 간편한 방법이다. 물론 환자의 질병 상태, 과대사 상태, 영양불량 상태, 표준체중 백분율 등에 의해 개인별로 에너지 필요량이 조정되어야 한다.</p>
								<div class="w650 ac box bga r5 mt10 p35 small">
									<h6 class="title bold i_b_t6">에너지 필요량 산정의 예</h6>
										<ul class="text small cb p10">
											<li class="bold i_b_t5">기준 체중 당 25~30kcal 공급 고려
												<ul class="text small">
													<li class="i_b_t7">비만하거나 저체중인 경우 영양공급 목표에 따라 개별적 조정이 필요함</li>
													<li class="i_b_t7">인공호흡기 치료로 삽관되어 있는 환자의 경우 기준 체중당 20~25kcal 공급 고려</li>
												</ul>
											</li>
											<li class="bold i_b_t5 mt20">BMR × activity factor × stress factor
												<div class="w630 ac mt5">
													<table class="table t3 text ssmall s1 ca center">
														<colgroup>
															<col width="200" />
															<col width="*" />
														</colgroup>
														<tbody>
														<tr>
															<td colspan="2" scope="col" class="bgs_2 bold cm">BMR : Harris-Benedict 공식</td>
														</tr>
														<tr>
															<td>BMR calculation for men</td>
															<td>BMR = 66 + ( 13.7 x weight in kg ) + ( 5 x height in cm ) - ( 6.76 x age in years )</td>
														</tr>
														<tr>
															<td>BMR calculation for women</td>
															<td>BMR = 655 + ( 9.6 x weight in kg ) + ( 1.8 x height in cm ) - ( 4.7 x age in years ) </td>
														</tr>
														<tr>
															<td colspan="2" scope="col" class="bgs_2 bold cm">Activity factor</td>
														</tr>
														<tr>
															<td>intubated</td>
															<td>1.0-1.1</td>
														</tr>
														<tr>
															<td>confined to bed</td>
															<td>1.2</td>
														</tr>
														<tr>
															<td>out bed</td>
															<td>1.25</td>
														</tr>
														<tr>
															<td colspan="2" scope="col" class="bgs_2 bold cm">Stress factor</td>
														</tr>
														<tr>
															<td>elective operation</td>
															<td>1.05-1.15</td>
														</tr>
														<tr>
															<td>sepsis</td>
															<td>1.20-1.40</td>
														</tr>
														<tr>
															<td>closed head injury</td>
															<td>1.3</td>
														</tr>
														<tr>
															<td>multiple trauma</td>
															<td>1.4</td>
														</tr>
														<tr>
															<td>systemic inflammatory response syndrome</td>
															<td>1.50</td>
														</tr>
														<tr>
															<td>major burn</td>
															<td>2.00 </td>
														</tr>
														</tbody>
													</table>
												</div>
											</li>
											<li class="bold i_b_t5 mt20">Ireton-Jones공식
												<ul class="text small">
													<li class="i_b_t7">EEE(v)=1925-10(A)+5(W)+281(S)+292(T)+851(B)</li>
													<li class="i_b_t7">EEE(s)=629-11(A)+25(W)-609(O)</li>
													<li class="i_b_t7">v=호흡기 의존 환자, s= 자가 호흡 환자, S=sex〔남 = 1, 여=0 〕 T=trauma , B=burns, O=obesity 〔 present =1, absent = 0 </li>
												</ul>
											</li>
										</ul>	
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">단백질</h5>
								<p class="mt10 pl15">단백질 공급량 조절은 영양액의 총 공급량을 조정하거나 단백질 농도가 다른 영양액을 선택 또는 단백질 보충제제(Protein modula)를 첨가함으로써 가능하다. 
								<mark class="bold cm">단백질 공급량의 적절성은 질소평형 검사(Nitrogen balance)결과를 통해 확인하는 것이 가장 바람직하다.</mark> 
								질소평형 검사 결과 (+)2~4 유지를 목표로 <mark class="bold cm">주기적으로 질소평형 검사 결과를 확인하면서 단백질 공급량을 조정해 나가야 한다.</mark>  
								일반적으로 스트레스가 없는 환자의 경우 체중당 0.8~1.0g/kg가 요구되나 수술이나 외상, 감염 등 스트레스가 있고 이화상태일 경우 더 많은 단백질을 필요로 하므로 스트레스 상태의 환자의 경우 1.0~1.5g/kg 공급을 목표로 한다. 
								국내 사용되고 있는 대부분의 영양액은 비단백 에너지:질소 비율이 150:1(100:1-200:1)로 이는 스트레스가 없는 환자들에게 적당한 비율이다. 
								</p>
								<div class="w700 ac mt20"><span class="bold i_b_t6 mb10">단백질 필요량 산정의 예 (g/kg/day)</span>
									<table class="table t3 text ssmall s1 ca center">
										<colgroup>
											<col width="200" />
											<col width="*" />
										</colgroup>
										<tbody>
										<tr>
											<td scope="row" class="bgs_2 bold cm">유지</td>
											<td class="left"> 0.8~1.0 </td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">수술후</td>
											<td class="left">1.0~1.5 </td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">패혈증</td>
											<td class="left">1.2~1.5 </td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">다발성 외상</td>
											<td class="left"> 1.3~1.7 </td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">화상</td>
											<td class="left">1.8-2.5 </td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">신부전</td>
											<td class="left">
												<ul>
													<li class="i_b_t7">0.6~0.8 (투석이 예상되지 않는 경우)</li>
													<li class="i_b_t7">1.0~1.2 (투석이 예상되는 경우)</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">간성혼수</td>
											<td class="left"> 0.6에서 시작하여 호전되면 점차적으로 증가하여 1~1.2 공급을 목표로 함</td>
										</tr>
										</tbody>
									</table>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">비타민, 무기질, 기타 미량 영양소 에너지</h5>
								<p class="mt10 pl15">에너지 요구량에 따라 영양액을 공급 시 비타민, 무기질 함량이 권장량에 비해 적합한지를 확인하여야 한다. 비타민과 무기질 필요량은 한국인 영양섭취 기준을 참고로 한다. 
								상업용 제재의 경우 일반적으로 1500~2000cc 이상 공급 시 비타민과 무기질 권장량의 100% 이상을 공급 할 수가 있다. 
								그러나 총 공급량이 충분치 않을 경우 비타민과 무기질이 결핍될 가능성이 높아지므로 이에 대한 보충이 고려되어야 한다. 
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">수분</h5>
								<p class="mt10 pl15">환자가 탈수되거나 과수화되지 않도록 <mark class="bold cm">수분 균형</mark> 을 잘 유지해야 한다. 환자마다 질병 상태에 따라 수분 요구량의 차이가 있으나 일반적으로 정상 성인의 수분 요구량은 체중 1kg당 30~35cc 정도이다. 
								<mark class="bold cm">1kcal/1cc인 상업용 경장영양액 경우 수분은 75~85% 함유</mark> 되어 있다. 따라서 정맥으로 수분을 공급받지 않는 환자의 경우 환자의 1일 수분 요구량과 경장 영양액을 통해 공급되는 수분량을 비교하여 
								그 차이만큼 추가로 수분 공급을 고려해야 한다. 볼루스 주입 또는 간헐적 주입 시 영양액 공급 전후로 25~50cc씩 <mark class="bold cm">추가로 수분을 공급</mark> 하고, 지속주입의 경우 하루 동안 적당한 간격을 두고 수분을 공급하여야 하며 
								최소 6시간당 30cc이상 <mark class="bold cm">수분</mark> 이 공급되도록 해야 한다.
								</p>
								<div class="w700 ac mt20"><span class="bold i_b_t6 mb10">수분 필요량 산정의 예</span>
									<table class="table t3 text ssmall s1 ca center">
										<colgroup>
											<col width="100" />
											<col width="150" />
											<col width="*" />
										</colgroup>
										<tbody>
										<tr>
											<td rowspan="2" scope="row" class="bgs_2 bold cm">성인</td>
											<td scope="row" class="bgf7 bold cm">18~55세</td>
											<td class="left">
												<ul>
													<li>보통 성인 : 30~35ml/kg </li>
													<li>18~54세 : 35ml/kg </li>
													<li>&gt; 55세 : 25ml/kg </li>
												</ul>
											</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold cm">&lt; 50세<br /> &gt; 50세</td>
											<td class="left">
												<ul>
													<li>1500 + 20ml/kg each additional kg</li>
													<li>1500 + 15ml/kg each additional kg</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2 bold cm">소아</td>
											<td scope="row" class="bgf7 bold cm">1-10kg<br />11-20kg<br />&gt; 20kg</td>
											<td class="left">
												<ul>
													<li>100ml/kg</li>
													<li>1000 + 50ml/kg each kg above 10kg </li>
													<li>1500 + 20ml/kg each kg above 20kg </li>
												</ul>
											</td>
										</tr>
										</tbody>
									</table>
								</div>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
