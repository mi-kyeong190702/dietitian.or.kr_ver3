<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
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
				<%@ include file="inc/diabetes.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">임신성 당뇨</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">임신성 당뇨병이란</h5>
								<ul class="mt10 pl15">
									<li><mark class="bold">1) 임신성 당뇨병의 정의</mark><br> : 임신으로 인한 생리적 변화에 의해서 전에는 없던 당뇨병이 임신 중에 처음 발생하는 경우를 말한다.
										이는 임신 중 태반에서 분비되는 여러 가지 호르몬들이 혈당조절에 필요한 인슐린 작용을 억제하여 혈액 속의 당이 세포 내로 이동되지 못하므로 혈당이 상승하기 때문이다. 
									</li>
									<li><mark class="bold">2) 임신성 당뇨병의 진단</mark><br> : 선별검사는 임신24-28주에 시행하는데 50g 포도당 경구 부하 후 1시간 혈당을 측정하여 140mg/dl 이상인 경우에는 진단검사의 대상이 된다. 
										진단검사는 공복시, 포도당 100g 부하 후 1시간, 2시간, 3시간후의 혈당을 측정하여 4개의 검사 결과 중 2회 이상 기준을 초과할 때 임신성 당뇨병으로 진단하게 된다. 
										<div class="w700 ac mt20 mb20">
											<table class="table t3 text ssmall s1 ca center">
												<colgroup>
													<col width="200">
													<col width="250">
													<col width="250">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">혈당</th>
													<th scope="col" class="bold cm">50g 선별검사</th>
													<th scope="col" class="bold cm">100g 진단검사</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">공복</td>
													<td>-</td>
													<td>105mg/dl</td>
												</tr>
												<tr>
													<td class="bgf7">1시간</td>
													<td>140mg/dl</td>
													<td>190mg/dl</td>
												</tr>
												<tr>
													<td class="bgf7">2시간</td>
													<td>-</td>
													<td>165mg/dl</td>
												</tr>
												<tr>
													<td class="bgf7">3시간</td>
													<td>-</td>
													<td>145mg/dl</td>
												</tr>
												</tbody>
											</table>
											<span class="ssmall ca">(출처 : 김웅진 등. 당뇨병학,고려의학,1998)</span>
										</div>
									</li>
									<li><mark class="bold">3)태아와 임산부에게 미치는 영향</mark>								
										<ul class="mt10 small">
											<li class="i_box_t1 mt5">태아에게 미치는 영향
												<ul class="text small ">
													<li class="i_b_t7">사망률이 높아진다.</li>
													<li class="i_b_t7">기형아와 거대아를 출산할 가능성이 높아진다.</li>
													<li class="i_b_t7">임신중독증으로 조산하는 경우가 2~3배 더 높다.</li>
													<li class="i_b_t7">임신 중 혈당조절 정도는 태어난 아기의 장래 건강상태에 영향을 준다.</li>
												</ul>	
											</li>
											<li class="i_box_t1 mt5">산모에게 미치는 영향
												<ul class="text small ">
													<li class="i_b_t7">분만 후 당뇨병이 될 확률이 높다.</li>
													<li class="i_b_t7">임신중독증의 발생률이 높다.</li>
													<li class="i_b_t7">양수과다증이 자주 발생하게 된다.</li>
													<li class="i_b_t7">분만시 난산의 위험률이 높고 감염이 발생하기 쉽다.</li>
												</ul>	
											</li>
										</ul>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">임신성 당뇨병의 관리</h5>
								<ul class="mt10 pl15">
									<li><mark class="bold">1) 혈당조절의 목표</mark> <br>: 임신으로 인한 생리적 변화에 의해서 전에는 없던 당뇨병이 임신 중에 처음 발생하는 경우를 말한다.
										이는 임신 중 태반에서 분비되는 여러 가지 호르몬들이 혈당조절에 필요한 인슐린 작용을 억제하여 혈액 속의 당이 세포 내로 이동되지 못하므로 혈당이 상승하기 때문이다. 
										<div class="w700 ac mt20 mb20">
											<table class="table t3 text ssmall s1 ca center">
												<colgroup>
													<col width="350">
													<col width="350">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">시간</th>
													<th scope="col" class="bold cm">기준치(mg/dl)</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">공복시</td>
													<td>60~90</td>
												</tr>
												<tr>
													<td class="bgf7">식사1시간후</td>
													<td>110~130</td>
												</tr>
												<tr>
													<td class="bgf7">식사2시간후</td>
													<td>90~120</td>
												</tr>
												<tr>
													<td class="bgf7">새벽 2~6시</td>
													<td>60~120</td>
												</tr>
												</tbody>
											</table>
											
										</div>
										&lt;참고&gt; 임신과 바람직한 체중증가<br>
										<span>태아와 임산부에게 최적의 영양상태를 유지하기 위해서 적절한 체중증가가 매우 중요하다.
											임신전 체중상태와 임신기간에 따라서 임신중에 증가해야 할 체중의 정도가 다르다. 임신초반기
											(-13주)보다는 중반기(14-27주)와 후반기(28-40주)에 주당 체중증가량이 훨씬 높다.
										</span>
										<div class="w700 ac mt20 mb20">
											<table class="table t3 text ssmall s1 ca center">
												<colgroup>
													<col width="350">
													<col width="350">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">임신전 체중상태</th>
													<th scope="col" class="bold cm">체중증가 정도(kg)</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">저체중일때(BMI&lt;19.8)</td>
													<td>12.5~18</td>
												</tr>
												<tr>
													<td class="bgf7">정상일때(BMI 19.8-26)</td>
													<td>11.5~16</td>
												</tr>
												<tr>
													<td class="bgf7">과체중일때(BMI 26-29)</td>
													<td>7~11.5</td>
												</tr>
												<tr>
													<td class="bgf7">비만일때(BMI &gt;29)</td>
													<td>6</td>
												</tr>
												<tr>
													<td class="bgf7">쌍생아일때</td>
													<td>16~20</td>
												</tr>
												</tbody>
											</table>
										
										</div>
									</li>
									<li><mark class="bold">2) 식사요법</mark> <br>: 식사요법은 임신성 당뇨병 관리의 가장 우선적인 치료방법으로 혈당 조절, 적절한 체중증가, 
										양호한 영양상태유지를 통해 태아와 임산부에게 미칠 수 있는 나쁜 영향을 최소화함으로써 정상적인 분만을 하는 것이 목표이다.<br>
										뿐만 아니라 분만후 임산부와 태아의 당뇨병 이환율을 감소시킬 수 있도록 좋은 식습관과 생활습관을 가질 수 있도록 한다.
										<div class="box bgs r5 m10 mb30 p30"><span class="bold cm mb10">임신성 당뇨병의 식사원칙</span>
											<ul class="text small ">
												<li class="i_b_t7">양호한 영양상태를 유지하기 위하여 임산부의 영양필요량에 맞게 섭취하여야 한다.</li>
												<li class="i_b_t7">규칙적인 식사가 필수적이다.</li>
												<li class="i_b_t7">혈당을 정상범위로 유지하기 위하여 3끼의 식사와 3회이상의 간식으로 나누어 식사한다.<br>특히 새벽 저혈당을 방지하고 식사량 부족으로 인한 케톤뇨증을 예방하기 위하여 야식은 꼭 챙겨서 먹는다. </li>
												<li class="i_b_t7">식후혈당을 상승시키는 주요 원인이 되는 단순당을 제한하고 당질 식품의 양을 처방된 양에 맞게 섭취한다. <br>특히 아침 식후에는 고혈당이 되는 경향이 많으므로 아침식사시 당질식품의 양을 정확히 지켜야 한다. </li>
												<li class="i_b_t7">혈당을 서서히 상승시키고 변비를 예방할 수 있는 섬유소의 섭취를 증가시킨다.<br>(섬유소는 잡곡, 채소류에 많이 함유되어 있음) </li>
												<li class="i_b_t7">술, 담배, 카페인은 삼간다.</li>
											</ul>	
										</div>
									</li>
									<li><mark class="bold">3) 운동요법</mark><br> : 규칙적인 운동은 신체 내 인슐린의 작용과 효과를 상승시켜 혈당을 정상범위로 유지하는데 도움을 주므로 매일 꾸준히 적당하게 운동하는 것이 좋다.<br>
										어떤 운동이 좋은지에 대해서는 의사나 당뇨병교육자와 상담하는 것이 바람직하다. 주의할 점은 운동 중 낙상 할 우려가 있거나 큰 충격이 가해지는 것은 피해야 한다.
									</li>
								</ul>
					</div>
			</c:otherwise>
    	</c:choose>		
					
	</div>
</div>
