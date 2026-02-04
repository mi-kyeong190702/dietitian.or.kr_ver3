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
				<li><a href="/work/business/kb_c_etc_osteoporosis.do" class="cm">기타질환</a></li>
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
								<h4 class="title bold cm t2 i_b_t2 mt50">골다공증</h4><br />
									<h5 class=" title bold t3 i_b_t3 mt40">골다공증</h5>
										<p class="mt10 pl15"><mark class="cm">골다공증은 뼈의 구성성분인 칼슘이 서서히 소실되면서 뼈에 구멍이 생기고 뼈 사이의 구조가 엉성해지면서 많이 약해진 상태로 작은 자극에도 쉽게 부러지고 요통, 관절통을 일으킨다.</mark> 
										대개 35~50세 사이에서 시작되어 서서히 진행되며 여성들은 갱년기가 되면서 여성호르몬인 에스트로겐의 부족으로 점차 뼈에서 칼슘이 빠져나가는 것이 빨라져서 65세 이상의 여성에서 많이 나타나게 되며 
										주로 척추, 고관절(골반과 넓적다리가 만나는 지점), 손목에 잘 생긴다.
										</p>
										<div class="ml20"><h6 class="middle mt20 bold">골다공증 증상</h6>
										<ul>
											<li class="i_b_t5">허리통증</li>
											<li class="i_b_t5">등이 구부러지는 등의 자세와 함께 신장(키)의 감소</li>
											<li class="i_b_t5">척추, 손목, 골반등의 뼈 골절</li>
										</ul>
										</div>
									<h5 class=" title bold t3 i_b_t3 mt40">골다공증이 생기기 쉬운경우</h5>
										<ul class="mt10 pl15">
											<li class="i_box_t1 mt10">골질량이 최대로 되는 18∼30세에 칼슘 섭취부족, 운동부족 등으로 뼈가 튼튼해지지 못한 경우
												<span class="small ca">사람의 골격은 유년기를 거쳐 발달하면서 사춘기 후반 또는 20대 초에 최대골질량을 갖게 되었다가 그 후 점차로 골질량의 감소가 나타나게 된다. 
												특히 골질량이 최대로 되는 시기에 골질량을 충분히 형성하지 못하면, 나이가 들면서 뼈는 점점 더 약해진다. 이런 사람은 청년기에 칼슘섭취를 충분히 하여 골질량의 최대량을 늘려 놓은 사람에 비해 훨씬 골다공증이 생기기 쉽다. 
												</span>
												<div class="box t2 mt10 mb30 p20 small">
													<h6 class="bold cm mb10">골다공증 예방</h6>
													<ul>
														<li class="i_b_t7">골격성숙이 완전히 이루어지는 나이(25~35세)까지 골질량을 늘리기 위해 충분한 칼슘 섭취와 적절한 운동을 하여야 한다. 
														이를 위해 식사를 통해 권장량만큼 충분한 칼슘을 섭취하고 골형성에 유해한 알코올 및 카페인을 과다 섭취하지 않도록 해야 한다. 특히, 젊은 여성의 경우 월경이상이 보일 때면 병원을 방문하도록 하고, 
														평소에 충분한 일광과 체중부하 운동을 하는 등 활동적인 생활 습관을 가지고 금연하는 것이 좋다.
														</li>
													</ul>
												</div>
											</li>
											<li class="i_box_t1 mt10">노년기
												<span class="small ca">피부가 매일 탈락되고 다시 재생되는 것처럼 뼈도 소실되고 다시 형성하는 과정이 일어난다. 
												그러나 40세 중반 이후부터는 뼈가 녹아버리는 만큼 다시 형성되지 않기 때문에 점점 나이가 들면서 골다공증이 생기기 쉽다.
												</span>
											</li>
											<li class="i_box_t1 mt10">여성의 경우 폐경 이후
												<span class="small ca">여성호르몬인 에스트로겐의 분비가 부족하면 폐경이 되는데, 에스트로겐 분비의 저하가 골손실을 빠르게 하여 골다공증이 생기기 쉽다.</span>
											</li>
											<li class="i_box_t1 mt10">칼슘 및 비타민 D가 부족한 경우
												<span class="small ca">칼슘은 뼈의 형성과 유지에 필요하며, 비타민 D는 칼슘의 흡수에 필요하므로, 식사내 칼슘과 비타민 D 섭취가 부족한 경우 칼슘의 흡수가 제대로 되지 않아 정상적인 골질량이 유지되기 어렵다.</span>
												<div class="box t2 mt10 mb30 p20 small">
													<h6 class="bold cm mb10">칼슘과 골다공증</h6>
													<ul>
														<li class="i_b_t7">칼슘은 신체기능 유지 뿐만 아니라 뼈의 건강에 매우 중요한 영양소이다.<br />
														칼슘섭취가 부족되면 섭취량이 배설량보다 적어져 체내의 칼슘 균형이 깨지며 혈액내에 칼슘치가 저하되어 부갑상선 호르몬의 분비를 촉진시킨다.<br />
														이 호르몬은 뼈안의 칼슘을 혈액내로 빠져나오게 함으로써 혈액내 칼슘량을 교정하게 된다. 따라서 상대적으로 뼈안의 칼슘량이 줄어들게 되어 뼈에 구멍이 생겨 골다공증을 일으키게 된다.<br />
														그러므로 성장기에는 물론 성인, 노년기에 이르기까지 적절한 양의 칼슘을 섭취하여 폐경 후나 노년기에 생길 수 있는 골다공증을 예방해야 한다.
														</li>
													</ul>
												</div>
											</li>
											<li class="i_box_t1 mt10">운동이 부족한 경우
												<span class="small ca">뼈, 관절, 근육을 이용하는 운동은 골손실을 감소시키며, 오히려 골질량을 증가시키므로 운동부족시 골다공증이 오기 쉽다.<br />
												특히 운동은 노인에 있어서 중요한데 노인의 대부분은 거의 운동량이 없으므로 더 골다공증을 일으키기 쉽다.
												</span>
											</li>
										</ul>
										<div class="w600 ac box bga r5 mt10 p30 small cm">
											<h6 class="bold">골다공증의 위험 인자</h6>
												<ul class="text ssmall cb mt5">
													<li class="i_b_t7">여성</li>
													<li class="i_b_t7">마르고 작은 체격</li>
													<li class="i_b_t7">고령</li>
													<li class="i_b_t7">골다공증 가족력이나 골절을 경험한 사람</li>
													<li class="i_b_t7">폐경 후(자궁적출술도 포함)</li>
													<li class="i_b_t7">월경불순(생리를 거르는 경우)</li>
													<li class="i_b_t7">낮은 칼슘 섭취</li>
													<li class="i_b_t7">약제복용 : 부신피질 호르몬, 갑상선약제, 항경련제, 생리에 영향을 주는 약제</li>
													<li class="i_b_t7">남자 중 저남성호르몬증인 경우</li>
													<li class="i_b_t7">비활동적인 사람</li>
													<li class="i_b_t7">흡연</li>
													<li class="i_b_t7">알코올과 카페인섭취</li>
													<li class="i_b_t7">골다공증과 연관된 질환이 있는 사람 : 갑상선기능항진증, 류마티스 관절염, 부갑상선 질환, 간질환, 흡수장애가 있는 질환, 당뇨병, 만성 폐질환, 부신 질환, 호르몬 결핍 질환 등</li>
												</ul>
										</div>
									<h5 class=" title bold t3 i_b_t3 mt40">식사요법의 원칙</h5>
										<ul class="mt10 pl15">
											<li class="i_box_t1 mt10">균형있는 식사섭취가 필요하다.</li>
											<li class="i_box_t1 mt10">칼슘이 많은 식품을 먹는다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">골다공증 예방과 치료를 위한 칼슘필요량 = 1일 1,000~1,500mg의 칼슘을 섭취를 목표로 칼슘이 많은 식품을 자주 섭취하여야 하며 식품섭취가 어려울 경우 의사의 처방에 따라 칼슘보충제를 사용해야 한다.</li>
													<li class="i_b_t7 mt10">노인의 경우 또는 어렸을 때부터 우유를 많이 먹지 않아 우유를 먹었을 때 잘 소화가 안 되는 경우는 유당분해우유(락토우유)를 이용하거나 요거트나 요구르트로 대체하여 먹을 수 있다.</li>
												</ul>
											</li>
											<li class="i_box_t1 mt10">과음을 피한다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">알코올은 뼈세포 형성에 직접적으로 나쁜 영향을 줄 수 있으며 칼슘 흡수를 감소시킬수 있어 과음을 자주하는 사람에게서 골질량 감소가 나타났다. </li>
												</ul>
											</li>
											<li class="i_box_t1 mt10">카페인을 제한하다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">커피와 탄산음료에 포함된 카페인은 신장과 소장에서의 칼슘 배설을 증가시킨다. 카페인의 영향은 섭취량에 비례하여 카페인 150mg(인스턴트 커피 3작은 술, 홍차 5잔, 콜라 3캔(360cc))섭취 시
													소변으로 배설되는 칼슘량이 5mg이나 증가할 수 있어 골다공증의 유발과 관련이 있는 것으로 보고되고 있다.
													</li>
												</ul>
											</li>
											<li class="i_box_t1 mt10">비타민 D를 충분히 섭취한다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">비타민 D는 장에서 칼슘의 흡수율을 높여주는 영양소로 대부분의 경우 자외선을 쬐면 피부를 통해 흡수되지만 고령이 되면 특히 부족되기 쉬우므로 
													우유, 간, 달걀노른자, 마른 표고버섯, 생선류 등 비타민 D가 많이 들어 있는 식품을 섭취하도록 한다. 필요시 보충을 위해 의사의 처방에 따라 보충제를 사용 할 수 있다.
													</li>
												</ul>
											</li>
										</ul>
									<div class="w600 ac box bga r5 mt10 p30 small cm">
											<h6 class="bold">칼슘 함량이 높은 식품</h6>
												<ul class="text ssmall cb mt5">
													<li class="i_b_t7">우유 200ml(210mg) </li>
													<li class="i_b_t7">멸치 15g(136.6mg)</li>
													<li class="i_b_t7">두부 80g(100.8mg)</li>
													<li class="i_b_t7">치즈 30g(152.4mg)</li>
													<li class="i_b_t7">꽁치통조림 50g(99mg)</li>
													<li class="i_b_t7">아이스크림 80g(104mg)</li>
													<li class="i_b_t7">뱅어포 15g(148.7mg)</li>
													<li class="i_b_t7">냉이 50g(72.5mg)</li>
													<li class="i_b_t7">요플레 1컵(115mg)</li>
													<li class="i_b_t7">달래 70g(75.1mg)</li>
													<li class="i_b_t7">물미역(익힌것) 70g(649.6mg)</li>
													<li class="i_b_t7">무청 50g(124.5mg)</li>
													
												</ul>
										</div>	
									<h5 class=" title bold t3 i_b_t3 mt40">기타 생활 습관 변화</h5>
										<ul class="mt10 pl15">
											<li class="i_box_t1 mt10">규칙적인 체중부하 운동을 한다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">체중부하 운동은 노화를 억제하고 체력과 균형감각을 길러주므로 넘어질 위험을 줄일 수 있으며 골밀도 증가에도 도움이 된다. 
													체중부하 운동에는 산책, 조깅, 계단 오르기, 춤, 테니스 등이 있으며 하루 30분 이상, 일주일에 3회 이상 하는 게 좋다.
													<span class="cm">※ 골다공증이 심한 환자들에서 격렬한 운동은 오히려 골절을 초래하므로 주의한다.</span>
													</li>
												</ul>
											</li>
											<li class="i_box_t1 mt10">금연한다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">흡연과 골다공증의 정확한 관계는 명백하지 않으나 혈중 에스트로겐의 분비를 낮춰 골질량을 감소시킬수 있다고 예측된다.</li>
												</ul>
											</li>
											<li class="i_box_t1 mt10">바람직한 자세를 유지한다.
												<ul class="text small ca">
													<li class="i_b_t7 mt10">바람직한 자세(머리는 높게, 턱은 아래로 허리는 바로 펴는 자세)는 척추에 부담을 덜어준다.
													 예로 책을 읽거나 컴퓨터 작업등 손동작 일을 할 경우 기대지 않는다. 물건을 들어올릴때 손목을 쓰지 말고 무릎을 굽히고 허리를 꽂꽂이 유지하며 일어서면서 들어올린다. 
													 </li>
												</ul>
											</li>
										</ul>
							</div>
			</c:otherwise>
		</c:choose>							
	</div>
</div>
