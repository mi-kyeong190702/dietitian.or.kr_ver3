<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<%@ include file="inc/diabetes.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">식사요법</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">식사의 기본원칙</h5>
								<ul class="mt10 pl15 cm">
									<li class="i_box_t1">식사량과 식사 시간을 지킨다.</li>
									<li class="i_box_t1 mt5">음식을 가리지 않고 골고루 먹는다.</li>
									<li class="i_box_t1 mt5">식사를 천천히 한다.</li>
									<li class="i_box_t1 mt5">설탕, 꿀, 사탕과 같은 단순당과 지방을 제한한다.</li>
									<li class="i_box_t1 mt5">섬유소가 많은 음식을 충분히 섭취하고, 음식을 가능한 싱겁게 먹는다.</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">하루 필요 열량의 산출 </h5>
								<p class="mt10 pl15">나에게 하루에 필요한 음식의 양(하루 총 열량)을 정하기 위해서는 우선 자신의 키에 맞는 ‘표준체중’을 알아야 한다. <br>
									표준체중이란 일상생활 속에서 몸을 건강하게 유지하는데 가장 알맞은 체중을 말합니다. 표준 체중은 다음과 같은 방법으로 계산할 수 있다. 
								</p>
								<ul class="mt20 pl15">
									<li>1) 표준체중 계산하기
										<ul class="box bgs w300 mt10 p10 small">
											<li class="i_b_t7">남자: 표준체중(kg) = 키(m) X 키(m) X 22</li>
											<li class="i_b_t7">여자: 표준체중(kg) = 키(m) X 키(m) X 21</li>
										</ul>
									</li>
								</ul>
								<p class="mt20 pl15">다음으로는 위에서 계산한 표준 체중과 자신의 현재 체중으로 비만도를 정합니다. 
									현재 체중이 과체중이나 비만에 해당할 경우에는 체중이 정상인 사람에 비해 좀 더 적은 열량을 섭취해야 하며 저체중인 경우에는 좀 더 많은 열량 섭취가 필요하다.
								</p>
								<ul class="mt20 pl15">
									<li>2) 비만도 계산하기<br>&nbsp;&nbsp; :  체질량지수(BMI= 체중(kg)/ 키㎡)
										<div class="w500">
											<table class="table t3 text ssmall s1 ca center mt10">
												<colgroup>
													<col width="200">
													<col width="200">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">분류</th>
													<th scope="col" class="bold cm">BMI</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">저체중</td>
													<td>&lt;18.5</td>
												</tr>
												<tr>
													<td class="bgf7">정상</td>
													<td>18.5~22.9</td>
												</tr>
												<tr>
													<td class="bgf7">과체중</td>
													<td>≥23</td>
												</tr>
												<tr>
													<td class="bgf7">비만전단계</td>
													<td>23~24.9</td>
												</tr>
												<tr>
													<td class="bgf7">1단계 비만 (중등도비만)</td>
													<td>25~29.9</td>
												</tr>
												<tr>
													<td class="bgf7">2단계 비만 (고도 비만)</td>
													<td>&gt;30</td>
												</tr>
												</tbody>
											</table>
										</div>
									</li>
								</ul>
								<p class="mt20 pl15">BMI 구하는 공식을 이용하기보다는 아래와 같이 BMI 차트를 이용하여 키와 몸무게를 대입하면 쉽게 알아볼 수 있다.</p>
								<div class="center mt50 mb50">
									<div class="big bold cm m20">BMI를 이용하여 비만도 평가
										<p class="middle cb">체질량 지수표</p>									
										<img src="/images/sub/kb_graph_01.png" alt="체질량 지수 표">
									</div>
									<div class="w550 ac">
										<table class="table t3 text ssmall s1 ca center mt10">
											<colgroup>
												<col width="100">
												<col width="250">
												<col width="250">
											</colgroup>
											<thead>
											<tr>
												<th scope="col" class="bold cm"></th>
												<th scope="col" class="bold cm">체질량 지수</th>
												<th scope="col" class="bold cm"></th>
											</tr>
											</thead>
											<tbody>
											<tr>
												<td class="bgf7">A</td>
												<td>&lt;18.5</td>
												<td>저체중</td>
											</tr>
											<tr>
												<td class="bgf7">B</td>
												<td>18.5~23</td>
												<td>저상체중</td>
											</tr>
											<tr>
												<td class="bgf7">C</td>
												<td>23~25</td>
												<td>과체중</td>
											</tr>
											<tr>
												<td class="bgf7">D</td>
												<td>&gt;25</td>
												<td>비만</td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
								<p class="mt20 pl15">하루에 필요한 총 열량은 활동 정도에 따라 달라지므로 본인의 활동 정도에 따라 아래와 같이 ‘가벼운 활동’,&nbsp; ‘보통 활동’,&nbsp; ‘심한 활동’으로 활동량을 구분한다.</p>
								<ul class="mt20 pl15">
									<li><mark class="bold">3) 활동량 구분</mark>
										<div class="w680">
											<table class="table t3 text ssmall s1 ca center mt10">
												<colgroup>
													<col width="200">
													<col width="480">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">구분</th>
													<th scope="col" class="bold cm">활동정도 예</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">가벼운 활동</td>
													<td class="left">앉아서 하는 일, 사무직, 전문직, 고령자</td>
												</tr>
												<tr>
													<td class="bgf7">보통 활동</td>
													<td class="left">주부, 학생</td>
												</tr>
												<tr>
													<td class="bgf7">힘든 활동</td>
													<td class="left">노동자, 농사일, 운동선수</td>
												</tr>
												</tbody>
											</table>
										</div>
										<p class="mt20">비만도와 활동량에 따른 적정 열량은 아래와 같다.</p>										
									</li>
									<li><mark class="bold">4) 비만도와 활동량에 따른 적정 열량 구하기 (단위 kcal/kg)</mark>
										<div class="w680">
											<table class="table t3 text ssmall s1 ca center mt10">
												<colgroup>
													<col width="*">
													<col width="160">
													<col width="160">
													<col width="160">
												</colgroup>
												<thead>
												<tr>
													<th scope="col" class="bold cm">활동정도</th>
													<th scope="col" class="bold cm">저체중</th>
													<th scope="col" class="bold cm">정상</th>
													<th scope="col" class="bold cm">과체중 혹은 비만</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="bgf7">가벼운 활동</td>
													<td>35</td>
													<td>30</td>
													<td>25</td>
												</tr>
												<tr>
													<td class="bgf7">보통 활동</td>
													<td>40</td>
													<td>35</td>
													<td>30</td>
												</tr>
												<tr>
													<td class="bgf7">심한 활동</td>
													<td>45</td>
													<td>40</td>
													<td>35</td>
												</tr>
												</tbody>
											</table>
										</div>										
										<div class="w620 box bga r5 mt10 mb20 p30 ssmall">
											<h6 class="bold cm">예) 키 166 cm, 체중 65 kg 이고 보통활동을 하는 정상 남자의 경우</h6>
											 <p>표준체중 = 1.66 × 1.66 × 22 = 60.6 kg<br>비만도는 65/60.6 * 100 = 107.6%로 정상이다.</p>
											 <p>하루 필요 열량은<br> 표준체중(kg) × 활동량에 따른 열량(kcal/kg)이므로<br>▶60.6 × 30 = 1,818kcal(약 1800kcal)가 된다.</p>
										</div>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">식품교환표를 이용하여 하루 섭취해야 할 음식의 양과 종류 결정</h5>
								<p class="mt10 pl15"><mark class="bold cm">식품 교환표</mark>는 식품군 별로 서로 바꿔 먹을 수 있는 음식들을 분류해 놓은 표로, 각 식품군에 속한 식품끼리는 영양소의 성분이 비슷하므로 서로 교환해서(바꿔서) 먹을 수 있다.</p>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">식품 교환표</span>
									<table class="table t2 mt10 text small s1 ca center">
										<colgroup>
											<col width="40">
											<col width="40">
											<col width="120">
											<col width="120">
											<col width="120">
											<col width="120">
											<col width="120">
										</colgroup>
										<tbody>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cm">곡류군 열량 : 100 kcal</td>
											<td><img src="/images/sub/rice.png" alt="밥"></td>
											<td><img src="/images/sub/potato.png" alt="감자"></td>
											<td><img src="/images/sub/bread.png" alt="빵"></td>
											<td><img src="/images/sub/noodles.png" alt="국수"></td>
											<td><img src="/images/sub/chestnut.png" alt="밤"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">당질</td>
											<td class="bgf7 bold cm">23g</td>
											<td class="bgs_2">밥1/3공기<br>(70g)</td>
											<td class="bgs_2">감자 중1개(140g)</td>
											<td class="bgs_2">식빵1장(35g)</td>
											<td class="bgs_2">국수1/2공기(90g)</td>
											<td class="bgs_2">밤 대3개/소6개(60g)</td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">단백질</td>
											<td class="bgf7 bold cm">2g</td>
											<td><img src="/images/sub/corn.png" alt="옥수수"></td>
											<td><img src="/images/sub/sweetpotato.png" alt="고구마"></td>
											<td><img src="/images/sub/cracker.png" alt="크래커"></td>
											<td><img src="/images/sub/injeolmi.png" alt="인절미"></td>
											<td><img src="/images/sub/flour.png" alt="미숫가루"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">지방</td>
											<td class="bgf7 bold cm"></td>
											<td class="bgs_2">옥수수1/2개(70g)</td>
											<td class="bgs_2">고구마중1/2개(70g)</td>
											<td class="bgs_2">크래커 5개(20g)</td>
											<td class="bgs_2">인절미 3개(50g)</td>
											<td class="bgs_2">미숫가루(30g)</td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cs">어육류군 열량 : 75kcal</td>
											<td><img src="/images/sub/chicken.png" alt="닭고기"></td>
											<td><img src="/images/sub/beef.png" alt="쇠고기"></td>
											<td><img src="/images/sub/lobster.png" alt="새우"></td>
											<td><img src="/images/sub/anchovy.png" alt="멸치"></td>
											<td><img src="/images/sub/beans.png" alt="검정콩"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">당질</td>
											<td class="bgf7 bold cs"></td>
											<td class="bgs_2">닭고기 1토막(40g)</td>
											<td class="bgs_2">쇠고기 탁구공크기<br>1개 (40g)</td>
											<td class="bgs_2">새우(중하)3마리(50g)</td>
											<td class="bgs_2">멸치(소)1/4컵(15g)</td>
											<td class="bgs_2">검정콩 2큰술(20g)</td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">단백질</td>
											<td class="bgf7 bold cs">8g</td>
											<td><img src="/images/sub/fish.png" alt="생선"></td>
											<td><img src="/images/sub/squid.png" alt="오징어"></td>
											<td><img src="/images/sub/shellfish.png" alt="조개살"></td>
											<td><img src="/images/sub/egg.png" alt="계란"></td>
											<td><img src="/images/sub/tofu.png" alt="두부"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">지방</td>
											<td class="bgf7 bold cs">5g</td>
											<td class="bgs_2">생선 소1토막(50g)</td>
											<td class="bgs_2">오징어 1/3등분(50g)</td>
											<td class="bgs_2">조개살(소)1/3컵</td>
											<td class="bgs_2">계란 중1개(55g)</td>
											<td class="bgs_2">두부 1/5모(80g)</td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cm">채소군 열량 : 20kcal</td>
											<td><img src="/images/sub/branch.png" alt="가지"></td>
											<td><img src="/images/sub/mushroom.png" alt="표고버섯"></td>
											<td><img src="/images/sub/vegetable.png" alt="콩나물"></td>
											<td><img src="/images/sub/kimchi.png" alt="배추김치"></td>
											<td><img src="/images/sub/spinach.png" alt="시금치"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">당질</td>
											<td class="bgf7 bold cm">3g</td>
											<td class="bgs_2">가지 1/2개(70g)</td>
											<td class="bgs_2">표고버섯-생것 대3개(50g)</td>
											<td class="bgs_2">콩나물 익혀서2/5컵(70g)</td>
											<td class="bgs_2">배추김치1접시(50g)</td>
											<td class="bgs_2">시금치 익혀서1/3컵(70g)</td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">단백질</td>
											<td class="bgf7 bold cm">2g</td>
											<td><img src="/images/sub/cabbage_01.png" alt="양배추"></td>
											<td><img src="/images/sub/cabbage_02.png" alt="배추"></td>
											<td><img src="/images/sub/cucumber_01.png" alt="오이"></td>
											<td><img src="/images/sub/cucumber_02.png" alt="오이,상추"></td>
											<td><img src="/images/sub/pepper.png" alt="풋고추"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">지방</td>
											<td class="bgf7 bold cm"></td>
											<td class="bgs_2">양배추 익혀서2/5컵(70g)</td>
											<td class="bgs_2">배추 익혀서1/3컵(70g)</td>
											<td class="bgs_2">오이 썰어서 1/3컵(70g)</td>
											<td class="bgs_2">오이 썰어서1/3컵(70g) 상추 소12장(70g)</td>
											<td class="bgs_2">풋고추 중7~8개(70g)</td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cs">우유군 열량 : 125kcal</td>
											<td><img src="/images/sub/milk01.png" alt="우유"></td>
											<td><img src="/images/sub/milk02.png" alt="두유"></td>
											<td><img src="/images/sub/milk03.png" alt="분유"></td>
											<td scope="row" class="bgs_2 bold cs">저지방 우유 열량  : 80kcal</td>
											<td><img src="/images/sub/milk04.png" alt="저지방우유"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">당질</td>
											<td class="bgf7 bold cs">10g</td>
											<td rowspan="3" class="bgs_2">우유1컵(200㎖)</td>
											<td rowspan="3" class="bgs_2">두유1컵(200㎖)</td>
											<td rowspan="3" class="bgs_2">분유 5큰스푼(25g)</td>
											<td class="bgf7 bold cs">당질</td>
											<td class="bgf7 bold cs">10g</td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">단백질</td>
											<td class="bgf7 bold cs">6g</td>
											<td class="bgf7 bold cs">단백질</td>
											<td class="bgf7 bold cs">6g</td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">지방</td>
											<td class="bgf7 bold cs">7g</td>
											<td class="bgf7 bold cs">지방</td>
											<td class="bgf7 bold cs">2g</td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cm">과일군 열량 : 50kcal</td>
											<td><img src="/images/sub/tangerine.png" alt="귤"></td>
											<td><img src="/images/sub/watermelon.png" alt="수박"></td>
											<td><img src="/images/sub/tomatoes.png" alt="토마토"></td>
											<td><img src="/images/sub/grapes.png" alt="포도"></td>
											<td><img src="/images/sub/bananas.png" alt="바나나"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">당질</td>
											<td class="bgf7 bold cm">12g</td>
											<td class="bgs_2">귤(120g)</td>
											<td class="bgs_2">수박 중1쪽(150g)</td>
											<td class="bgs_2">토마토(350g)</td>
											<td class="bgs_2">포도 소19알(80g)</td>
											<td class="bgs_2">바나나 중1/2개(50g)</td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">단백질</td>
											<td class="bgf7 bold cm"></td>
											<td><img src="/images/sub/pears.png" alt="배"></td>
											<td><img src="/images/sub/apple.png" alt="사과"></td>
											<td><img src="/images/sub/strawberries.png" alt="딸기"></td>
											<td><img src="/images/sub/melons.png" alt="참외"></td>
											<td><img src="/images/sub/juice.png" alt="주스"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cm">지방</td>
											<td class="bgf7 bold cm"></td>
											<td class="bgs_2">배 대1/4개(110g)</td>
											<td class="bgs_2">사과 중1/3개(80g)</td>
											<td class="bgs_2">딸기 중7개(150g)</td>
											<td class="bgs_2">참외 중1/2개(150g)</td>
											<td class="bgs_2">주스 1/2컵(소) (100g)</td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgs_2 bold cs">지방군 열량 : 45kcal</td>
											<td><img src="/images/sub/oil.png" alt="기름"></td>
											<td><img src="/images/sub/margarine.png" alt="마가린"></td>
											<td><img src="/images/sub/peanuts.png" alt="땅콩"></td>
											<td><img src="/images/sub/mayonnaise.png" alt="마요네즈"></td>
											<td><img src="/images/sub/walnuts.png" alt="호두"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">당질</td>
											<td class="bgf7 bold cs"></td>
											<td rowspan="3" class="bgs_2">기름 1작은스푼(5g)</td>
											<td rowspan="3" class="bgs_2">마가린 1작은스푼(5g)</td>
											<td rowspan="3" class="bgs_2">땅콩 8개(8g)</td>
											<td rowspan="3" class="bgs_2">마요네즈 1작은스푼(5g)</td>
											<td rowspan="3" class="bgs_2">호두 중1.5개(8g)</td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">단백질</td>
											<td class="bgf7 bold cs"></td>
										</tr>
										<tr>
											<td class="bgf7 bold cs">지방</td>
											<td class="bgf7 bold cs">5g</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">★ : 콜레스테롤이 높은 음식 (대한당뇨병학회 교육위원회)</span>
								</div>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">식품 교환표</span>
									<table class="table t2 mt10 text small s1 ca center">
										<colgroup>
											<col width="85">
											<col width="85">
											<col width="85">
											<col width="85">
											<col width="85">
											<col width="85">
											<col width="85">
											<col width="85">
										</colgroup>
										<thead>
										<tr>
											<th rowspan="2" scope="col" class="bold cm">열량/식품군</th>
											<th rowspan="2" scope="col" class="bold cm">곡류군</th>
											<th colspan="2" scope="colgroup" class="bold cm">어·육류군</th>
											<th rowspan="2" scope="col" class="bold cm">채소군</th>
											<th rowspan="2" scope="col" class="bold cm">지방군</th>
											<th rowspan="2" scope="col" class="bold cm">우유군</th>
											<th rowspan="2" scope="col" class="bold cm">과일군</th>
										</tr>
										<tr>
											<th scope="col" class="bold cm">저지방</th>
											<th scope="col" class="bold cm">중지방</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td class="bgf7">1,000</td>
											<td>4</td>
											<td>1</td>
											<td>2</td>
											<td>7</td>
											<td>2</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,100</td>
											<td>5</td>
											<td>1</td>
											<td>2</td>
											<td>7</td>
											<td>2</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,200</td>
											<td>5</td>
											<td>1</td>
											<td>3</td>
											<td>6</td>
											<td>3</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,300</td>
											<td>6</td>
											<td>1</td>
											<td>3</td>
											<td>6</td>
											<td>3</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,400</td>
											<td>7</td>
											<td>1</td>
											<td>3</td>
											<td>6</td>
											<td>3</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,500</td>
											<td>7</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,600</td>
											<td>8</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<td class="bgf7">1,700</td>
											<td>8</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">1,800</td>
											<td>8</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">1,900</td>
											<td>9</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,000</td>
											<td>10</td>
											<td>2</td>
											<td>3</td>
											<td>7</td>
											<td>4</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,100</td>
											<td>10</td>
											<td>2</td>
											<td>4</td>
											<td>7</td>
											<td>4</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,200</td>
											<td>11</td>
											<td>2</td>
											<td>4</td>
											<td>7</td>
											<td>4</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,300</td>
											<td>11</td>
											<td>3</td>
											<td>4</td>
											<td>8</td>
											<td>5</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,400</td>
											<td>12</td>
											<td>3</td>
											<td>4</td>
											<td>8</td>
											<td>5</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,500</td>
											<td>13</td>
											<td>3</td>
											<td>4</td>
											<td>7</td>
											<td>5</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,600</td>
											<td>13</td>
											<td>3</td>
											<td>5</td>
											<td>8</td>
											<td>5</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<td class="bgf7">2,700</td>
											<td>13</td>
											<td>3</td>
											<td>5</td>
											<td>9</td>
											<td>6</td>
											<td>2</td>
											<td>3</td>
										</tr>
										<tr>
											<td class="bgf7">2,800</td>
											<td>14</td>
											<td>3</td>
											<td>5</td>
											<td>9</td>
											<td>6</td>
											<td>2</td>
											<td>3</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">(참고 :식품교환표 대한영양사협회, 2010 <br>당뇨병 식품교환표 활용지침 제3판, 2010)</span>
								</div>
								<p class="mt10 pl15">6가지 식품군은 곡류군, 어육류군, 채소군, 지방군, 우유군, 과일군이며 균형 잡힌 식사가 되기 위해서는 6가지 식품군을 골고루 섭취해야 한다. 또한 한끼의 식사량에 맞도록 3번 식사로 나누어 준다.</p>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">예)1500cal 식사의 경우</span>
									<table class="table t3 text ssmall s1 ca center mt10">
										<colgroup>
											<col width="70">
											<col width="70">
											<col width="60">
											<col width="60">
											<col width="60">
											<col width="60">
											<col width="60">
											<col width="60">
											<col width="60">
										</colgroup>
										<thead>
										<tr>
											<th colspan="2" scope="col" class="bold cm"></th>
											<th scope="col" class="bold cm">단위수</th>
											<th scope="col" class="bold cm">아침</th>
											<th scope="col" class="bold cm">간식</th>
											<th scope="col" class="bold cm">점심</th>
											<th scope="col" class="bold cm">간식</th>
											<th scope="col" class="bold cm">저녁</th>
											<th scope="col" class="bold cm">간식</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td colspan="2" scope="row" class="bgf7 bold ca">곡류군</td>
											<td>7</td>
											<td>2</td>
											<td></td>
											<td>2.5</td>
											<td></td>
											<td>2.5</td>
											<td></td>
										</tr>
										<tr>
											<td rowspan="2" scope="row" class="bgf7 bold ca">어육류</td>
											<td scope="row" class="bgf7 bold ca">저지방</td>
											<td>2</td>
											<td></td>
											<td></td>
											<td>1</td>
											<td></td>
											<td>1</td>
											<td></td>
										</tr>
										<tr>
											<td scope="row" class="bgf7 bold ca">중지방</td>
											<td>3</td>
											<td>1</td>
											<td></td>
											<td>1</td>
											<td></td>
											<td>1</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgf7 bold ca">채소군</td>
											<td>7</td>
											<td>2</td>
											<td></td>
											<td>2</td>
											<td></td>
											<td>3</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgf7 bold ca">지방군</td>
											<td>4</td>
											<td>1</td>
											<td></td>
											<td>1.5</td>
											<td></td>
											<td>1.5</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgf7 bold ca">우유군</td>
											<td>1</td>
											<td></td>
											<td>1</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2" scope="row" class="bgf7 bold ca">과일</td>
											<td>1</td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
											<td></td>
											<td></td>
										</tr>
										</tbody>
									</table>
								</div>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">식단의 예 : 1500kcal</span>
									<table class="table t3 text ssmall s1 ca center mt10">
										<colgroup>
											<col width="80">
											<col width="100">
											<col width="80">
											<col width="60">
											<col width="100">
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">구분</th>
											<th scope="col" class="bold cm">식단명</th>
											<th scope="col" class="bold cm">재료명</th>
											<th scope="col" class="bold cm">1인량(g)</th>
											<th scope="col" class="bold cm">비고</th>
											<th scope="col" class="bold cm">식단의 예</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td rowspan="9" scope="row" class="bgf7 bold ca">아침</td>
											<td rowspan="2">보리밥</td>
											<td>쌀</td>
											<td>60</td>
											<td rowspan="9">보리밥 190(g)</td>
											<td rowspan="9"><img src="/images/sub/kb_meal01.png" alt="당뇨식 조식"></td>
										</tr>
										<tr>
											<td>보리</td>
											<td>10</td>
										</tr>
										<tr>
											<td rowspan="2">미역들깨국</td>
											<td>미역(건)</td>
											<td>2</td>
										</tr>
										<tr>
											<td>들깨가루</td>
											<td>3</td>
										</tr>
										<tr>
											<td>연어구이</td>
											<td>연어</td>
											<td>60</td>
										</tr>
										<tr>
											<td>비름나물</td>
											<td>비름</td>
											<td>80</td>
										</tr>
										<tr>
											<td rowspan="2">연근조림</td>
											<td>연근</td>
											<td>60</td>
										</tr>
										<tr>
											<td>마늘</td>
											<td>3</td>
										</tr>
										<tr>
											<td>포기김치</td>
											<td>포기김치</td>
											<td>60</td>
										</tr>
										<tr>
											<td rowspan="21" scope="row" class="bgf7 bold ca">점심</td>
											<td rowspan="2">보리밥</td>
											<td>쌀</td>
											<td>60</td>
											<td rowspan="21">보리밥 190(g)</td>
											<td rowspan="21"><img src="/images/sub/kb_meal02.png" alt="당뇨식 중식"></td>
										</tr>
										<tr>
											<td>보리</td>
											<td>10</td>
										</tr>
										<tr>
											<td rowspan="4">풋고추된장찌개</td>
											<td>풋고추</td>
											<td>2</td>
										</tr>
										<tr>
											<td>양파</td>
											<td>20</td>
										</tr>
										<tr>
											<td>애호박</td>
											<td>50</td>
										</tr>
										<tr>
											<td>표고버섯</td>
											<td>15</td>
										</tr>
										<tr>
											<td rowspan="3">돈육양념구이</td>
											<td>돈육</td>
											<td>40</td>
										</tr>
										<tr>
											<td>생강</td>
											<td>1</td>
										</tr>
										<tr>
											<td>양파</td>
											<td>15</td>
										</tr>
										<tr>
											<td rowspan="6">양배추쌈</td>
											<td>양배추</td>
											<td>85</td>
										</tr>
										<tr>
											<td>풋고추</td>
											<td>0.3</td>
										</tr>
										<tr>
											<td>홍고추</td>
											<td>0.3</td>
										</tr>
										<tr>
											<td>양파</td>
											<td>5</td>
										</tr>
										<tr>
											<td>깐쪽파</td>
											<td>0.3</td>
										</tr>
										<tr>
											<td>다시마</td>
											<td>10</td>
										</tr>
										<tr>
											<td rowspan="4">어묵매운볶음</td>
											<td>어묵</td>
											<td>30</td>
										</tr>
										<tr>
											<td>당근</td>
											<td>10</td>
										</tr>
										<tr>
											<td>양파</td>
											<td>20</td>
										</tr>
										<tr>
											<td>피망</td>
											<td>10</td>
										</tr>
										<tr>
											<td>열무김치</td>
											<td>열무김치</td>
											<td>60</td>
										</tr>
										<tr>
											<td>사과 100g</td>
											<td>사과</td>
											<td>100</td>
										</tr>
										<tr>
											<td rowspan="14" scope="row" class="bgf7 bold ca"> 저녁</td>
											<td rowspan="3">잡곡밥</td>
											<td>쌀</td>
											<td>50</td>
											<td rowspan="14">잡곡밥 190(g)</td>
											<td rowspan="14"><img src="/images/sub/kb_meal03.png" alt="당뇨식 석식"></td>
										</tr>
										<tr>
											<td>3곡</td>
											<td>16</td>
										</tr>
										<tr>
											<td>서리태</td>
											<td>4</td>
										</tr>
										<tr>
											<td>솎음배추된장국</td>
											<td>배추</td>
											<td>70</td>
										</tr>
										<tr>
											<td rowspan="2">심치구이양념장</td>
											<td>삼치</td>
											<td>50</td>
										</tr>
										<tr>
											<td>파</td>
											<td>3</td>
										</tr>
										<tr>
											<td>참나물무침</td>
											<td>참나물</td>
											<td>70</td>
										</tr>
										<tr>
											<td rowspan="4">김구이(조미김)</td>
											<td>재래김</td>
											<td>1장</td>
										</tr>
										<tr>
											<td>들기름</td>
											<td>3</td>
										</tr>
										<tr>
											<td>식용유</td>
											<td>2</td>
										</tr>
										<tr>
											<td>구운소금</td>
											<td>1</td>
										</tr>
										<tr>
											<td rowspan="1">알타리김치</td>
											<td>알타리 김치</td>
											<td>60</td>
										</tr>
										
										<tr>
											<td>우유 200cc</td>
											<td>우유</td>
											<td>200cc</td>
										</tr>
										</tbody>
									</table>
								</div>
								<div class="mt50 ml20 text small s1">
									<h6 class="middle bold cm">[ 올바른 조리방법 ]</h6>
										<ul class="mb20">
											<li class="i_b_t5">조리 시에는 설탕의 사용을 가급적 피하도록 한다.<br>
												<span class="small">설탕은 혈당을 빠르게 올리므로 당뇨병환자들은 조리 시에 설탕을 사용하지 않는 것만으로도 혈당을 낮출 수 있다. 설탕 대신 식초, 겨자, 계피, 후추, 생강 등의 향신료나 양념류를 적당히 이용하여 음식의 맛을 내도록 한다.</span>
											</li>
											<li class="i_b_t5 mt10">다양한 식품을 선택하고 신선한 제철음식을 준비하고 가공식품은 가급적 피하도록 한다. </li>
											<li class="i_b_t5 mt10">고기류는 기름을 떼어내고 닭고기는 껍질을 벗긴 후 조리하도록 한다.</li>
											<li class="i_b_t5 mt10">기름사용이 많은 튀김, 전 대신 가급적이면 구이, 찜등의 조리법을 활용한다.</li>
										</ul>
									<h6 class="middle mt20 bold cm">[ 특별한 경우의 식사법 ]</h6>	
										<ul class="mb20">
											<li class="i_b_t4 mt10"><mark class="bold">외식 시</mark><br>
												<span><mark class="cm">외식 시 주의사항</mark></span><br> : 직장 회식이나 가족/친구 모임 등으로 본인이 원하던, 원치 않던 외식을 해야 하는 경우가 있다. 당뇨인의 경우 외식을 하게 될 때 도대체 무엇을 얼마나, 
													어떻게 먹어야 할지 걱정될 것이다. 하지만 다음과 같은 원칙과 요령을 알고 있으면 외식을 하더라도 크게 걱정하지 않고 즐겁게 외식을 할 수 있다.
												
												<ul class="mt20">
													<li class="i_b_t5"> 하루에 먹어야 할 식사량과 그 끼니에 먹어야 할 식사량 및 교환단위 수를 생각해서 과식하지 않고 적당량을 먹도록 한다.</li>
													<li class="i_b_t5 mt10">외식 전에 식사를 거르지 않습니다. 배가 고파서 과식을 하기 쉽고 저혈당이 생길 수 있다. </li>
													<li class="i_b_t5 mt10">평소 식사시간보다 1시간 이상 벗어나지 않도록 한다. 시간이 늦어지면 간단한 간식을 섭취해서 공복감을 줄이고 저혈당을 예방하도록 한다.</li>
													<li class="i_b_t5 mt10">외식은 가급적 하루 한번 이하로 한다.</li>
													<li class="i_b_t5 mt10">여러 영양소를 섭취할 수 있는 비빔밥, 백반류 등을 고르도록 하고 채소류를 많이 섭취할 수 있는 메뉴(산채정식, 쌈밥, 샤브샤브 등)가 좋다. </li>
													<li class="i_b_t5 mt10">식사의 구성이 한가지 식품에만 치우친 메뉴나 기름기가 많은 음식을 피하고 채소류를 많이 섭취할 수 있는 음식을 고른다.
														<ul class="box bgs w300 mt10 p10 ssmall">
															<li class="i_b_t7">밥과 감자탕 → 곡류군 과잉 섭취</li>
															<li class="i_b_t7">연어 샐러드와 스테이크 → 어육류군 과잉 섭취</li>
															<li class="i_b_t7">기름기가 많은 음식 → 중국음식, 튀김, 피자, 삼겹살 등</li>
														</ul>											
													</li>
													<li class="i_b_t5 mt10">설탕을 많이 함유한 음식, 짜거나 자극적인 음식, 성분을 알 수 없는 음식 등을 피한다.</li>
													<li class="i_b_t5 mt10">후식으로 나오는 커피, 홍차는 하루 1잔만 마신다. <br>설탕대신 대체 감미료를 사용하고 프림은 가능한 적게 넣는다.</li>
													<li class="i_b_t5 mt10">뷔페식은 각각의 음식을 조금씩 먹더라도 모두 합하면 양이 많아지므로 주의한다. </li>
													<li class="i_b_t5 mt10">꼭꼭 씹어서 천천히 식사하면 과식하지 않고 식사량을 지키는데 도움이 된다. </li>
												</ul>												
												<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">외식의 열량 </span>
													<table class="table t2 mt10 text ssmall s1 ca center">
														<colgroup>
															<col width="200">
															<col width="480">
														</colgroup>
														<thead>
														<tr>
															<th scope="col" class="bold cm">열 량 (칼로리)</th>
															<th scope="col" class="bold cm">음 식 명</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td scope="row" class="bgf7 bold ca">250이상 ~ 300 미만</td>
															<td class="left">녹두전, 채소죽</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">300이상 ~ 350 미만</td>
															<td class="left">불고기, 생등심, 고기만두, 김치만두, 해물파전, 영양죽</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">350이상 ~ 400 미만</td>
															<td class="left">김치전, 김밥, 전복죽</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">400이상 ~ 450 미만</td>
															<td class="left">된장찌개, 청국장찌개, 낙지볶음, 생선초밥, 수제비, 장어날치알밥</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">450이상 ~ 500 미만</td>
															<td class="left">김치찌개, 순두부찌개, 비빔냉면, 회냉면, 보쌈, 추어탕, 설렁탕, 진곰탕, 내장탕, 돼지갈비, <br>장터국수, 쇠고기국밥, 대구탕, 메밀국수, 기스면, 탕수육</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">500이상 ~ 550 미만</td>
															<td class="left">채소비빔밥, 물냉면, 불낙전골, 육개장, 회덮밥, 라면, 유부초밥</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">550이상 ~ 600 미만</td>
															<td class="left">비빔밥, 닭볶음, 양념갈비구이, 갈비찜, 삼겹살, 짬뽕, 떡만두국, 돌냄비우동</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">600이상 ~ 650 미만</td>
															<td class="left">꼬리곰탕, 김치볶음밥, 카레라이스, 칼국수</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">650이상 ~ 700 미만</td>
															<td class="left">자장면, 오므라이스</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">700이상 ~ 750 미만</td>
															<td class="left">갈비탕, 일식도시락, 볶음밥</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">750이상 ~ 800 미만</td>
															<td class="left"></td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">800이상 ~ 850 미만</td>
															<td class="left">삼계탕</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">850이상 ~ 900 미만</td>
															<td class="left">안심스테이크, 생선가스, 햄버그스테이크</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">900이상 ~ 950 미만</td>
															<td class="left"></td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">950이상 ~1,000미만</td>
															<td class="left">돈가스</td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">1,000이상 ~ 1,050 미만</td>
															<td class="left"></td>
														</tr>
														<tr>
															<td scope="row" class="bgf7 bold ca">1,050이상 ~ 1100 미만</td>
															<td class="left">정식</td>
														</tr>
														</tbody>
													</table>
													<span class="small ca">(출처: 당뇨병 식품교환표 활용지침, 제3판, 2010)</span>
												</div>
											</li>
											<li class="i_b_t4 mt10"><mark class="bold">아픈 날</mark><br>
												<ul class="mt20">
													<li class="i_b_t5">부드럽고 소화하기 쉬운 음식으로 먹도록 한다.(예: 채소죽, 커스타드크림 등)</li>
													<li class="i_b_t5 mt10">음식을 먹을 수 없다고 하더라도 인슐린이나 경구혈당강하제를 중단하면 안된다. 감기, 감염증, 상처, 고열, 설사는 물론 수술이나 스트레스 등도 혈당에 영향을 미쳐 인슐린 필요량을
														증가시키기 때문이다.</li>
													<li class="i_b_t5 mt10">혈당검사를 4시간 간격으로 하여 고혈당이나 저혈당에 즉각 대처해야 한다.</li>
													<li class="i_b_t5 mt10">제 1형 당뇨병환자라면 소변의 케톤 검사를 4시간 간격으로 한다.</li>
													<li class="i_b_t5 mt10">토하거나 설사가 있는 경우에는 미음이나 음료를 섭취하여 칼로리를 보충하고 탈수 현상을 막도록 한다.<br>(예: 오렌지주스, 탄산음료, 고기국물, 잣미음, 깨미음 등)</li>
													<li class="i_b_t5 mt10">휴식을 취하고, 운동은 삼가한다.</li>
													<li class="i_b_t5 mt10">계속 문제가 되면 의사선생님을 찾아가도록 한다.</li>
												</ul>
											</li>
											<li class="i_b_t4 mt10"><mark class="bold">운동 시</mark><br>
												<span>혈당관리가 어느 정도 이루어지면 규칙적인 운동에 의해 혈당조절이 더욱 효과적일 수 있다.
													매일 일정시간, 같은 정도의 운동은 따로 보충간식을 필요로 하지 않지만 특별한 운동을 할 경우에는 하루 열량만으로는 불충분하므로 운동량, 운동시간에 따라 보충간식을 먹어야 한다.
													간식은 운동 전에 섭취하도록 하고 혈당을 자주 측정하여 보충간식이 적당한지를 점검하도록 한다.
												</span>											
											
													<table class="table t2 mt10 text ssmall s1 ca center">
														<colgroup>
															<col width="80">
															<col width="200">
															<col width="100">
															<col width="150">
															<col width="150">
														</colgroup>
														<thead>
														<tr>
															<th scope="col" class="bold cm">운동형태</th>
															<th scope="col" class="bold cm">운동 예</th>
															<th scope="col" class="bold cm">운동 전 혈당 (mg/dl)</th>
															<th scope="col" class="bold cm">추가로 필요한 당질량</th>
															<th scope="col" class="bold cm">이용식품 (교환단위)</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td rowspan="2" scope="row" class="bgf7 bold ca">가벼운 단시간 운동</td>
															<td rowspan="2">걷기(1km), 천천히 자전거 타기<br>(30분 이하)</td>
															<td>&lt;100</td>
															<td>시간당 10~15g</td>
															<td>과일 1단위<br>(또는 곡류 0.5단위)</td>
														</tr>
														<tr>
															<td>&gt;100</td>
															<td>추가당질 필요없음</td>
															<td></td>
														</tr>
														<tr>
															<td rowspan="4" scope="row" class="bgf7 bold ca">중정도 운동</td>
															<td rowspan="4">1시간 정도의 청소, 테니스, 수영, <br>골프, 자전거, 정원 손질</td>
															<td>&lt;100</td>
															<td>운동 전 25~50g, 후에 운동 1시간 마다 10~15g</td>
															<td>우유 1단위(또는 과일 1단위)에 곡류 0.5단위 추가 가능 </td>
														</tr>
														<tr>
															<td>100~180</td>
															<td>시간당 10~15g</td>
															<td>과일 1단위<br>(또는 곡류 0.5단위)</td>
														</tr>
														<tr>
															<td>180~300</td>
															<td>추가당질 필요없음 </td>
															<td></td>
														</tr>
														<tr>
															<td>&gt; 300</td>
															<td>운동은 위험</td>
															<td></td>
														</tr>
														<tr>
															<td rowspan="4" scope="row" class="bgf7 bold ca">심한 운동</td>
															<td rowspan="4">1~2시간 이상의 축구, 농구, 자전거, <br>수영, 라켓볼 등</td>
															<td>&lt;100</td>
															<td>운동 전 50g 정도 혈당을 자주 측정</td>
															<td>우유 1단위(또는 과일 1단위)와 곡류 1단위</td>
														</tr>
														<tr>
															<td>100~180</td>
															<td>운동 정도와 시간에 따라 25~50g정도</td>
															<td>우유 1단위(또는 과일 1단위)에 곡류 0.5단위</td>
														</tr>
														<tr>
															<td>180~300</td>
															<td>운동시간당 10~15g 정도</td>
															<td>곡류 0.5단위</td>
														</tr>
														<tr>
															<td>&gt; 300</td>
															<td>운동은 위험</td>
															<td></td>
														</tr>
														</tbody>
													</table>
													<span class="small ca">(출처 : 임상영양 관리 지침서, 대한영양사협회, 2008)</span>
													<span class="small cm">혈당이 250mg/dl 이상일 때는 소변에서 케톤이 나오는지 확인하고 케톤 존재시 운동을 하지 않는다. 300mg/dl이상일 때는 혈당이 좋아질 때까지 운동하지 않는다.</span>
												</li></ul></div>
											
											<li class="i_b_t4 mt10"><mark class="bold">여행갈 때</mark><br>
												<span>혈당 관리만 잘 한다면 즐거운 여행이 될 수 있다.</span>
												<ul class="mt20">
													<li class="i_b_t5">함께 가는 사람들에게 당뇨병이 있다는 사실을 알린다.</li>
													<li class="i_b_t5 mt10">담당 의사선생님과 상의하도록 한다.</li>
													<li class="i_b_t5 mt10">외국으로 여행할 때 그 지역의 풍토병에 대한 예방주사를 맞거나 약을 복용한다.</li>
													<li class="i_b_t5 mt10">편안하게 신을 수 있는 신발을 가지고 간다.</li>
													<li class="i_b_t5 mt10">인슐린주사, 혈당검사기구 등 필요한 물건들은 충분히 챙겨 간다.</li>
													<li class="i_b_t5 mt10">여행을 떠나면 식사시간이 늦춰지거나 평상시보다 활동량이 많아져 저혈당이 자주 올 수
													있으므로 저혈당 간식을 충분히 챙겨 가도록 하며 휴대하는 가방에 넣어 가지고 다니도록 한다.</li>
													<li class="i_b_t5 mt10">여행시 물을 바꾸어 먹음으로써 일어날 수 있는 설사를 막기 위해 가능한 한 물은 끓여 먹도록 하며,음료 선택시에도 주의하도록 한다.</li>
													<li class="i_b_t5 mt10">당뇨병이 있음을 알릴 수 있는 명찰을 항상 달고 다닌다.</li>
												</ul>
											</li>
										
								</div>
					
					
					
				</div>
			</div>
