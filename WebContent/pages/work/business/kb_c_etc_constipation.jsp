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
						<h4 class="title bold cm t2 i_b_t2 mt50">변비</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40">변비란</h5>
								<p class="mt10 pl15">변비는 흔한 소화기 증상으로 서구에서는 전체인구의 2~20%의 유병률을 보인다. 이는 내분비 질환이나 대사성 질환과 같은 전신질환, 파킨슨 병, 뇌혈관 질환, 다발성 경화증과 같은 신경학적 질환에서 발생할 수 있으며 
								부적절한 식사습관과 배변습관에 의해서도 야기된다. 또한 골반저, 직장 및 항문의 구조적 이상이나 기능이상으로 인한 배출장애가 있을 때도 발생할 수 있다. 이상의 경우과 같이 원인이 비교적 명확한 경우도 있지만 대부분의 경우는
								원인을 알 수 없는 만성 특발성 변비로 나타나기 때문에 치료가 어렵다.<br />
								배변 횟수가 적어진 상태를 변비로 흔히 정의하지만 환자들은 배변할 때 과도한 힘이 필요하다, 딱딱한 변이다, 대변을 보고 싶지만 배출이 잘 되지 않는다, 배변할 때 불쾌하다, 완전하게 변이 배출되지 않았다, 
								화장실에 머무르는 시간이 길다 등으로 다양하게 변비를 표현한다.(이상 임상영양관리지침서. 2008) <br/>기능성 변비에 대한 로마기준은 다음과 같다.<br />
								</p>
								<div class="box t2 w650 ac m20 mt10 p20 small fr">
									<h6 class="bold cm mb10">기능성 변비의 로마진단 기준 (출처 : Drossman DA et al(1999), Gut 45(suppl II) :1-81</h6>
									<p class="small">지난 12개월 중 연속일 필요는 없으나 적어도 12주 이상 다음 중 2가지 이상이 있는 경우 <br/>배변시 과도한 힘주기가 전체 배변 횟수의 1/4을 초과할 때</p>
									<ul class="p10">
										<li class="i_b_t5">덩어리지거나 단단한 대변이 전체 배변횟수의 1/4을 초과할 때</li>
										<li class="i_b_t5">배변 후 잔변감이 전체 배변횟수의 1/4을 초과할 때</li>
										<li class="i_b_t5">배변시 항문의 폐쇄감이 전체 배변횟수의 1/4을 초과할 때</li>
										<li class="i_b_t5">배변을 돕기 위한 수조작이 필요한 경우가 전체 배변횟수의 1/4을 초과할 때</li>
										<li class="i_b_t5">주 3회 미만의 배변 횟수</li>
									</ul>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">식사요법원칙</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10">규칙적인 식사를 한다.
										<span class="small ca">변비를 호소하는 사람들의 대부분은 식사를 거르거나 폭식을 하거나 일정치 않은 식사시간 등 잘못된 식사습관을 가지고 있다. 불규칙적인 식습관은 신체의 리듬을 엉망으로 만들고
										결국 장의 움직임을 나쁘게 만드는 요인이 된다. <br />특히 현대인은 여러 가지 이유로 아침식사를 거르는 일이 빈번한데 아침을 굶으면 '직장/결장반사' 와 '위/대장반사'라는 두 가지 배변촉진 시스템이 작동하지 못해 장은 연동운동을 
										시작할 수 없게 되고 이것이 거듭되면 변의를 일으키는 자율신경의 움직임이 둔화되어 배변리듬이 깨지고 변비가 습관화된다. <br />
										따라서 규칙적으로 식사하는 것, 특히 아침 식사를 반드시 하는 것이 변비를 방지하는 가장 좋은 방법이다.
										</span>
									</li>
									<li class="i_box_t1 mt20">식사는 충분량 섭취한다.
										<span class="small ca">다이어트를 하는 여성에게서 흔히 변비가 발생되는데 이는 극도로 적은 양의 식사를 하여 변을 만드는 재료인 찌꺼기가 부족하기 때문이다. 또한 변비일때는 식욕부진으로 인해 식사량이 줄어 들기 쉬운데 
										이는 변비를 더욱 악화시키는 요인이 되기도 한다. 변비시에는 일정량의 지방을 섭취하는 것이 도움이 되는데 지방은 변을 부드럽게 할 뿐만 아니라 지방산이 장을 자극하여 장의 연동운동을 촉진하기 때문이다.
										</span>
									</li>
									<li class="i_box_t1 mt20">식이섬유소를 충분히 섭취한다.
										<span class="small ca">식이섬유소란 한마디로 변의 재료가 되는 성분으로 소화 분해되지 않고, 다량의 수분을 흡수하여 대변의 양을 많게 해주므로, 변의가 쉽게 일어나게 도와준다. <br />
										또한 변의 상태가 부드러워지므로 장의 배변운동이 정상적으로 잘 진행된다. 식이섬유소는 하루에 최소 25~30g 정도를 섭취하도록 한다.
										</span>
										<div><h6 class="mt10 bold cm">식이섬유소 섭취를 증가시키기 위한 식사 요령</h6>
										<ul class="small">
											<li class="i_b_t5">쌀밥대신 보리, 콩, 현미 등 잡곡밥을 섭취한다.</li>
											<li class="i_b_t5">식이섬유소가 많이 함유된 채소 및 해조류 반찬을 매끼 세 가지 이상 섭취한다. </li>
											<li class="i_b_t5">신선한 과일을 1일 1회 이상 섭취한다. </li>
											<li class="i_b_t5">만약 식이섬유소를 식품만으로 충분히 섭취할 수 없다면 시판되는 합성 섬유소나 올리고당 등 기능성 식품을 섭취하는 것도 한 방법이 될 수도 있다. </li>
										</ul>
									</li>
									<li class="i_box_t1 mt20">수분을 충분히 섭취한다.
										<span class="small ca">변비의 치료를 위해서는 충분한 양의 수분 섭취가 도움이 된다. 특히 아침식사전 차가운 냉수나 우유를 한잔 마시는 것은 장을 자극하여 대장의 연동운동을 시작하게 하는 계기가 된다. 
										일반적으로 식전에 냉수나 우유를 마시는 것을 권장하지만 이외에도 국이나 스프, 즙, 수분이 많은 과일 등의 섭취를 통해 수분을 충분히 섭취(6~8컵)해야 한다. 
										</span>
									</li>
									<li class="i_box_t1 mt20">즐거운 분위기에서 식사한다.
										<span class="small ca">위와 장은 매우 민감한 장기이다. 고민이나 스트레스등은 소화액의 분비를 저하시키고 위장 기능에 영향을 미치게 된다. 따라서 즐거운 분위기 속에서 식사하는 것은 식욕을 증진시키고 
										위장의 움직임도 부드럽게 하므로 변비를 치료하기 위해서 언제나 식탁은 즐거운 곳이어야 한다. 
										</span>
									</li>
								</ul>								
								<div class="box t2 w650 ac m20 mt10 p20 small fr">
									<h6 class="middle bold cm">변비의 원인</h6>
									<ul class="p10 ca">
										<li class="i_b_t5"><mark class="bold ca">심리적 요소</mark> : 사회가 복잡해짐에 따라 날로 증가되는 근심, 걱정, 스트레스 및 여행 등 생활환경의 변화가 변비의 원인이 되는데 교감신경이 지나치게 긴장하여 대장에 경련을 일으키기도 한다. 
										적당한 휴식과 수면을 취하고 스트레스나 긴장 상태에서 벗어나는 것이 변비를 치료하는 중요한 방법이다.</li>
										<li class="i_b_t5 mt10"><mark class="bold ca">기질적 원인 </mark> : 몸에 이상이 있을 때 변비가 오는 경우이다. 대장암이나 직장암, 장유착증, 탈장으로 변비가 되는 경우처럼 변비의 원인을 한눈에 알아볼 수 있으며, 이때 원인이 제거되면 변비는
										저절로 치유된다. 대장내시경이나 대장조영술을 통해 기질적 변비가 있는지 확인하는 것이 좋다. 장내 종양이나 장이 꼬여있을 때, 선천성 거대 결장 같은 대장의 신경이나 근육의 이상, 파킨슨씨병, 뇌나 척추의 손상 또는 종양,
										디스크가 심한 경우, 골반 수술 후 신경손상, 갑산성 기능저하나 당뇨, 요독증, 납중독 등도 변비의 원인이 될 수 있다.</li>
										<li class="i_b_t5 mt10"><mark class="bold ca">기타</mark> : 임산부의 경우 태아가 커지면서 대장을 압박하거나 배에 힘을 줄 수가 없어서 변비가 생기며 또한 나이가 들거나 비만할수록 장운동이 약해져 변비가 생길 수 있다. <br />
										노령이나 전신질환 등으로 인한 장관운동의 저하도 변비의 원인이 될 수 있고 잦은 음주등으로 설사와 변비가 반복되는 과민성 대장, 고혈압, 심장질환 등 만성 질환으로 약물을 장기간 과다 복용했을 때에도 변비가 생길 수 있다. <br />
										또한 이차적인 원인으로 당뇨병, 류마티스, 대장암 등의 질병에 의해 변비가 생기기도 하며 제산제, 철분제, 신경계 약물 등으로 인해 발생되기도 한다. </li>
									</ul>
								</div>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">식이섬유소가 많이 함유된 식품</span>
									<table class="table t2 mt10 text small s1 ca center">
										<colgroup>
											<col width="180" />
											<col width="500" />
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">식품군</th>
											<th scope="col" class="bold cm">식품</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td scope="row" class="bgf7 bold ca">곡류</td>
											<td class="left">현미, 보리, 옥수수, 오트밀, 통밀, 고구마, 감자, 토란</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">두류</td>
											<td class="left">팥, 대두, 강낭콩, 완두콩, 녹두, 비지</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">견과류</td>
											<td class="left">밤, 호두, 은행, 참(들)깨, 잣, 땅콩, 아몬드, 해바라기씨</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">채소류</td>
											<td class="left">배추, 무청, 양배추, 파, 오이, 미나리, 상추, 부추, 풋고추, 도라지, 고사리, 고비, 버섯</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">해조류</td>
											<td class="left">김, 미역, 미역줄기, 다시마, 파래, 톳</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">과일류</td>
											<td class="left">사과, 배, 수박, 참외, 자두, 살구, 딸기, 키위, 무화과</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">기타</td>
											<td class="left">곤약, 우무묵</td>
										</tr>
										</tbody>
									</table>
								</div>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">변비를 위한 식단구성의 예</span>
									<table class="table t2 mt10 text small s1 ca center">
										<colgroup>
											<col width="180" />
											<col width="200" />
											<col width="300" />
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">구분 </th>
											<th scope="col" class="bold cm">음식명</th>
											<th scope="col" class="bold cm">재료 및 분량</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td scope="row" class="bgf7 bold ca">간식</td>
											<td>우유</td>
											<td class="left">우유 200cc(1팩)</td>
										</tr>
										<tr>
											<td rowspan="5" scope="row" class="bgf7 bold ca">아침</td>
											<td>차조밥</td>
											<td class="left">쌀 100g, 차조 30g(1공기)</td>
										</tr>
										<tr>
											<td>시금치국</td>
											<td class="left">시금치 70g, 된장</td>
										</tr>
										<tr>
											<td>삼치구이</td>
											<td class="left">삼치 50g</td>
										</tr>
										<tr>
											<td>양상치, 샐러드, 미나리나물</td>
											<td class="left">양상치 40g, 샐러리 15g, 적채 15g, 방울 토마토 2개, 돌미나리 70g, 깐대파, 참기름</td>
										</tr>
										<tr>
											<td>배추김치</td>
											<td class="left">김치 70g</td>
										</tr>
										<tr>
											<td rowspan="7" scope="row" class="bgf7 bold ca">점심</td>
											<td>잡곡밥</td>
											<td class="left">쌀 100g, 보리·팥·콩 30g (1공기)</td>
										</tr>
										<tr>
											<td>청국장찌개</td>
											<td class="left">청국장, 두부30g, 김치20g</td>
										</tr>
										<tr>
											<td>버섯불고기</td>
											<td class="left">쇠고기 40g, 표고 15g, 양파 15g, 깐대파, 간장</td>
										</tr>
										<tr>
											<td>상추쌈</td>
											<td class="left">상추 70g, 고추장, 된장, 참기름</td>
										</tr>
										<tr>
											<td>호박전</td>
											<td class="left">애호박 70g</td>
										</tr>
										<tr>
											<td>열무물김치</td>
											<td class="left">김치 70g</td>
										</tr>
										<tr>
											<td>방울토마토</td>
											<td class="left">300g</td>
										</tr>
										<tr>
											<td rowspan="6" scope="row" class="bgf7 bold ca">저녁</td>
											<td>현미밥</td>
											<td class="left">쌀 100g 현미 30g (1공기)</td>
										</tr>
										<tr>
											<td>미역국</td>
											<td class="left">건미역 5g, 참기름</td>
										</tr>
										<tr>
											<td>닭조림</td>
											<td class="left">닭 40g, 밤 10g, 당근 10g, 양파 20g</td>
										</tr>
										<tr>
											<td>콩나물</td>
											<td class="left">콩나물 70g, 고추가루, 깐대파</td>
										</tr>
										<tr>
											<td>깻잎찜</td>
											<td class="left">깻잎 40g, 당근, 깐대파, 간장</td>
										</tr>
										<tr>
											<td>총각김치</td>
											<td class="left">총각무  70g</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">간식</td>
											<td>귤</td>
											<td class="left">120g</td>
										</tr>
										</tbody>
									</table>
								</div>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
