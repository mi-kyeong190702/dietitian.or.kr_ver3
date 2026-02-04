<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">암</mark>과 영양</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_cancer.do" class="cm">암과 영양</a></li>
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
				<div class="tab_2 div4 mb10">
					<ul>
						<li><a href="/work/business/kb_c_cancer.do" class="on">암의 이해</a></li>
						<li><a href="/work/business/kb_c_cancer_factors.do">식사요인</a></li>
						<li><a href="/work/business/kb_c_cancer_habit.do">생활습관</a></li>
						<li><a href="/work/business/kb_c_cancer_life.do">식생활지침</a></li>
					</ul>
				</div>
				<div class="text s1 mb50">
								<h4 class="title bold cm t2 i_b_t2 mt50">암의 이해</h4><br />
									<h5 class="title bold t3 i_b_t3 mt40">암의 이해</h5><br />
										<p class="mt10 pl15">우리 몸을 구성하고 있는 세포는 세포내 조절기능에 의해 분열하며 성장하고 죽어 없어지기도 하면서 세포수의 균형을 유지한다.
										암이란 이러한 조절기능이 없는 비정상적인 세포들이 과다하게 증식하는 상태를 말하며, 악성종양이라고도 한다.
										비교적 서서히 성장하면서 신체 여러 부위에 확산 전이하지 않는 양성종양과는 달리 악성종양이라고 불리는 암은 빠르게 증식할 뿐만 아니라 주위 장기조직을 침입하거나 체내 각 부위로 확산,
										전이되어 정상조직을 파괴하기 때문에 생명에 위협을 주게 된다. 암은 인간의 신체 중 어느 부위에서든지 발생할 수 있으며, 인종, 국가, 성별, 나이, 생활습관, 식사습관 등에 따라서 다양한 부위에 발생할 수 있다.
										한국인에서 가장 흔히 발생하는 암으로는 위암, 폐암, 간암, 대장암, 유방암, 자궁경부암 등이 있다. 
										</p>
									<div class="area center mt50 mb50">
										<div class="link ssmall bold ca p10">그림 1). 한국인 10대 암 발생분율 (2007년)</div>
										<img src="/images/sub/kb_cancer01.png" alt="한국인 10대 암 발생분율 그래프" />
										<div class="bold">&lt;성별 암발생 분율 2007년&gt;</div>
										<div class="link small ca fr">(출처:국가암정보센터 <a href="http://www.cancer.go.kr" target="_blank">http://www.cancer.go.kr</a>)</div>
									</div>
										<p class="mt10 pl15">암의 원인은 아직 정확하게 밝혀지지 않았지만 여러 역학연구들에서 발암요인과 암발생 간의 인과관계를 근거로 하여 위험요인들을 밝혀내고 있다. 
										세계보건기구(WHO)의 산하기관인 국제암연구소(IARC) 및 미국 국립암협회지(JNCI)에서는 전체 암의 70% 정도가 흡연, 감염, 음식 등 환경적 요인에 의하여 발생한다고 발표하였는데(표1), 
										한국인에서 주로 발생하는 암의 원인 또한 환경적인 요인이 대부분인 것으로 밝혀지고 있다(표2).
										</p>
										<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">표1. 암의 원인</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="*" />
													<col width="250" />
													<col width="250" />
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">원인</th>
													<th scope="col" class="bold cm">국제암 연구소</th>
													<th scope="col" class="bold cm">미국 국립암협회지</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7 bold ca">흡연</td>
													<td>15~30%</td>
													<td>30%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">만성감염</td>
													<td>10~25%</td>
													<td>10%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">음식</td>
													<td>30%</td>
													<td>35% </td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">직업</td>
													<td>5%</td>
													<td>4%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">유전</td>
													<td>5%</td>
													<td> - </td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">생식</td>
													<td>5%</td>
													<td>7%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">음주</td>
													<td>3%</td>
													<td>3%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">환경오염</td>
													<td>3%</td>
													<td>2%</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">방사선</td>
													<td>3%</td>
													<td>3%</td>
												</tr>
												</tbody>
											</table>
											<span class="ssmall ca">(출처 : 암정보 제2판, 국립암센터, 2006)</span>
										</div>
										<div class="w680 ac mt20 mb30"><span class="bold i_b_t6">표2. 한국인에서 흔한 암의 일반적인 원인</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="180" />
													<col width="*" />
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">암발생부위</th>
													<th scope="col" class="bold cm">일반적인 원인 </th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7 bold ca">위암</td>
													<td>식생활(염장식품-짠 음식, 탄 음식, 질산염 등), 헬리코박터균</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">폐암</td>
													<td>흡연, 직업력(비소, 석면 노출 등), 대기오염</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">간암</td>
													<td>간염 바이러스(B형, C형), 간경변증, 아플라톡신</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">대장암</td>
													<td>비만, 고지방식, 과다한 육류 섭취, 저섬유소 식사, 유전적인 요인</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">유방암</td>
													<td>비만, 고지방식, 음주, 여성호르몬, 유전적 요인</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">자궁경부암</td>
													<td>인유두종 바이러스, 성관계</td>
												</tr>
												</tbody>
											</table>
											<span class="ssmall ca">(출처 : 암정보 제2판, 국립암센터 2006)</span>
										</div>
										<p class="mt10 pl15">암의 증상은 암의 종류와 크기, 위치에 따라 다양하다. 일반적으로 암의 초기 단계에는 특별한 증상이 없는 경우가 많고, 증상이 있다 하더라도 비특이적이기 때문에 다른 질환과의 구별이 어렵다. 
										그러나 암이 자라면서 주위 장기와 조직, 혈관, 신경을 압박하게 되면 여러 징후와 증상이 나타나게 되는데, 위암이나 대장암처럼 장기내강을 막아서 생기는 증상이 있고, 췌장암과 담도암처럼 담관을 막아 황달 등의 징후를 보이기도 한다. 
										폐암 등은 기관지를 자극하여 기침을 유발하기도 하며, 암이 신경, 혈관을 누르거나, 뼈 등으로 전이 된 경우에는 통증을 일으킬 수도 있다. 암의 성장으로 조직에서 출혈을 하는 경우 위암과 대장암에서는 
										혈변과 빈혈, 폐암은 객혈, 방광암에서는 혈뇨 등이 생기게 된다. 암은 또한 체중감소, 발열, 피로, 전신쇠약, 식욕저하 등의 전신적인 증상을 일으키는데, 
										이는 암세포에서 만들어진 물질들이 혈관을 통해 전신으로 퍼지면서 신체대사에 영향을 주기 때문이다. 
										</p>
										<p class="mt10 pl15">암이 의심 될 경우에는 정확한 진단을 위해 의사의 진찰, 조직검사, 세포검사, 내시경검사, 암표지자검사, 영상진단검사, 핵의학검사 등 여러 가지 검사를 실시하게 된다. 
										하나의 검사로 암을 확진하고 병기를 결정할 수 있는 방법은 아직 없기 때문에 여러 가지 검사결과를 종합하여 진단이 내려지게 된다. 
										</p>
										<p class="mt10 pl15">암 치료는 진단된 암의 종류, 진행 정도(병기), 환자의 전신상태 등에 따라 결정된다. 암을 치료하는 방법은 크게 수술, 항암화학요법, 방사선치료 세 가지로 구분이 되며, 
										이외에 국소치료법, 호르몬요법, 광역학치료법, 레이저치료법 등이 있으며, 최근에는 면역요법, 유전자요법까지 포함시키기도 한다. 
										초기에 진단된 경우에는 다양한 치료법을 통하여 완치가 가능하지만, 암이 많이 진행된 상태이거나 다른 조직으로 전이 된 경우에는 대부분 완치가 불가능하다. 
										따라서 완치가 불가능한 경우에는 더 이상의 암을 진행을 막고 암으로 인한 증상을 완화시키는 목적으로 치료를 진행하게 된다.
										</p>
										<p class="mt10 pl15">암은 조기에 나타나는 특이적인 증상이 없고, 증상이 나타났을 때는 상당히 많이 진행된 상태여서 완치가 어려운 경우가 많으므로, 정기적인 암 검진을 통하여 조기에 발견하는 것이 매우 중요하다. 
										한국인에게 많이 발생하는 위암, 간암, 대장암, 유방암, 자궁경부암 등은 비교적 쉽게 검진을 받을 수 있으며, 조기에 발견하여 치료를 받을 경우 대부분 완치가 가능하다. 
										이에 국가에서는 1999년부터 건강보험가입자를 대상으로 ‘국가암검진사업'을 진행하고 있다(표3). 
										</p>
										<div class="w680 ac mt30 mb30"><span class="bold i_b_t6">표3. 국가암검진사업 암종별 대상자 기준 및 검진주기(2010년 기준)</span>
											<table class="table t2 mt10 text ssmall s1 ca center">
												<colgroup>
													<col width="80" />
													<col width="150" />
													<col width="200" />
													<col width="150" />
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">암의 종류</th>
													<th scope="col" class="bold cm">검진대상</th>
													<th scope="col" class="bold cm">의료보장</th>
													<th scope="col" class="bold cm">검진주기</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7 bold ca">위 암</td>
													<td>만 40세 이상 남녀</td>
													<td>의료급여 및 건강보험</td>
													<td>2년<sup>3)</sup></td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">유 방 암</td>
													<td>만 40세 이상 여성</td>
													<td>의료급여 및 건강보험<sup>2)</sup></td>
													<td>2년</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">자궁경부암</td>
													<td>만 30세 이상 여성</td>
													<td>의료급여</td>
													<td>2년</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">간 암</td>
													<td>만 40세 이상 남녀 고위험군<sup>1)</sup><br />C형 간염항체 양성</td>
													<td class="left"><mark class="bold ca">의료급여</mark>: 고위험군 미확인자는 ALT검사, B형 간염바이러스 표면항원검사 및 C형 간염바이러스 항체검사 시행<br />
													<mark class="bold ca">건강보험</mark>: 해당년도 전 2년간 간암 발생 고위험군<sup>1)</sup>
													</td>
													<td>6개월</td>
												</tr>
												<tr>
													<td class="bgf7 bold ca">대장암</td>
													<td>만 50세 이상 남녀</td>
													<td>의료급여 및 건강보험</td>
													<td>1년</td>
												</tr> 
												</tbody>
											</table>
											<span class="ssmall ca">(출처:국가암정보센터 <a href="http://www.cancer.go.kr" target="_black" class="link">http://www.cancer.go.kr</a>)</span>
											<ul class="ssmall ca pt10">
												<li>1) 고위험군: 간경변증이나 B형 간염 바이러스 항원(HBsAg) 양성, B형 또는 C형 간염 바이러스 (anti-HCV Ab)에 의한 만성 간질환 환자 </li>
												<li>2) 건강보험 대상자: 당해연도 검진대상자 중 보험료 부과 기준 하위 50%</li>
												<li>3) 간암과 대장암 검진은 의료급여수급권자인 경우에는 권고안에 따라 검진을 받을 수 있고 건강보험 대상자인 경우에는 비사무직인 경우 1년에 1회, 사무직과 지역가입자 및 피부양자는 2년에 1회 검진 가능</li>
											</ul>
										</div>
							</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
