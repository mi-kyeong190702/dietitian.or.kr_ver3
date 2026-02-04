<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">소아</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_child_obesity.do" class="cm">소아비만관리</a></li>
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
				<%@ include file="inc/child_obesity.jsp" %>
	
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">비만의 교정과 교육</h4><br>
						<mark class=" cm">소아 비만은 체중을 줄이는 것도 중요하지만 비만도를 줄이고부적당한 식습관과 생활양식을 바로 잡아 주는 것이 중요하다</mark>(식사요법, 운동요법, 행동요법, 교육).
						<br>성장시기별 비만관리 원칙은 아래와 같다.<br><mark class="">(출처: 소아 청소년 비만 관리지침서, 대한비만학회 소아비만위원회, 2005)</mark>
						<p></p>
							<div class="w700 ac mt20">
								<table class="table t2 text small s1  center">
									<colgroup>
										<col width="100">
										<col width="200">
										<col width="200">
										<col width="200">
									</colgroup>
									<tbody>
									<tr>
										<td scope="row" class="bgs_2">영아기<br>(0~2세)</td>
										<td colspan="3" class="left"><span class="bold">고위험군</span> : 출생시 체중이 2.5kg미만이거나 4.0kg이상인 신생아, 체중증가율이 빠른 영아비만예방을 위해<br>
											모유수유가 중요하며고 형식 이유를 일찍 시작하지 않도록 하고, 단맛을 내는 이유식품은 피한다.
										</td>
									</tr>
									<tr>
										<td rowspan="3" scope="row" class="bgs_2">유아기<br>(3~5세)</td>
										<td colspan="3" class="left"><span class="bold">고위험군</span> : 체지방 반동이 일찍 시작하거나 TV 시청시간이 긴 유아, 수면시간이 짧은 유아</td>
									</tr>
									<tr>
										<td scope="col" class="bgf7">경도비만</td>
										<td scope="col" class="bgf7">중등도 비만</td>
										<td scope="col" class="bgf7">고도 비만</td>
									</tr>
									<tr>
										<td class="left">비만도를 20%미만으로 낮추는데 목표를 두지만 키가 크므로 감량보다 체중을 유지하는 것이 목표이다.</td>
										<td colspan="2" class="left top">식사와 운동상담을 개별적으로 시행한다.<br>합병증 유무를 확인하고 합병증이 동반되어 있으면 감량이 필요하다.</td>
									</tr>
									<tr>
										<td rowspan="2" scope="row" class="bgs_2">학동기<br>(6~11세)</td>
										<td scope="col" class="bgf7">경도비만</td>
										<td scope="col" class="bgf7">중등도 비만</td>
										<td scope="col" class="bgf7">고도 비만</td>
									</tr>
									<tr>
										<td class="left top">목표는 키가 정상적으로 성장하되 체중은 유지하는데 있다. 집단관리 프로그램(학교나 보건소)을 이용한다.</td>
										<td class="left top">합병증 동반 유무를 확인하여 합병증이 동반되어 있지 않으면 체중을 유지하여도 되지만 합병증이 동반되어 있으면 감량이 필요하다. 전문가에 의한 관리가 필요하다.</td>
										<td class="left top">합병증 동반 유무를 확인하여야 하며, 합병증 유무에 상관없이 감량이 필요하다. 전문가에 의한 관리가 필요하다.</td>
									</tr>
									<tr>
										<td scope="row" class="bgs_2">사춘기<br>(12~18세)</td>
										<td colspan="3" class="left">비만 관련 합병증을 확인하여야 하며, 합병증이 동반되어 있으면 치료를 병행한다.</td>
									</tr>
									</tbody>
								</table>
							</div>
							<h5 class=" title bold t3 i_b_t3 mt40">식사요법</h5>
								<p class="mt10 pl15">소아를 위한 칼로리 조절식을 계획할 때는 비만의 정도를 고려하여야 하며, 이때 발육곡선을 이용하여 키, 연령에 대한 적정체중을 구하여 비만도를 구하도록 하며 
								이렇게 평가된 비만도를 고려하여 칼로리를 줄여주는 것이 필요하다.</p>
								<p class="mt10 pl15">경도 비만아는 체중을 적극적으로 줄일 정도로 제한할 필요 없다. 체중감량이 필요하면 6~12 개월에 걸쳐 서서히 한다.</p>
								<p class="mt10 pl15">소아의 체중조절 시 1차목표는 성장과 발달을 위한 적정한 영양을 공급하면서 칼로리 섭취량을 점진적으로 변화시키는 것이다. 체중조절을 위한 칼로리는 평상시의 섭취량을 고려하고 키에 맞는
								연령의 칼로리 권장량을 기초하여 결정한다. 일반적으로 평소 섭취량보다 20∼30% 정도 낮은 수준의 칼로리를 섭취하면서 균형된 식사를 하는 것이 좋다.</p>
								<p class="mt10 pl15">식사조절 시 소아가 좋아하는 음식을 무조건 제외시키거나 식습관을 심하게 변화시키는 것보다는 현재의 식사형태를 수정하거나 대체하도록 하는 것이 바람직하며 
								이와같은 방법은 특히 어린 소아일수록 더욱 효과적이다.
								<mark class="cm">1일 3회의 식사와 식사시간에 따라 1∼3회의 간식을 섭취하도록 하는데 식생활 형태는 각기 다르므로 개인의 생활습관에 적절하도록 식사를 계획한다.</mark>
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">식사요령</h5>
							<div>
								<ul class="mt10 pl15">
									<li class="i_box_t1">하루 세 끼 식사를 균형있게 규칙적으로 먹도록 한다.</li>
									<li class="i_box_t1 mt5">식사시간은 적어도 20∼30분으로 하며 음식은 충분히 씹도록한다. 중추신경계를 자극, 포만감을 느끼는데 최소한 20∼30분이 걸리므로 가급적이면 식사는 천천히 한다.</li>
									<li class="i_box_t1 mt5">간식은 허용된 열량 범위 안에서 섭취한다.</li>
									<li class="i_box_t1 mt5">설탕, 꿀 등의 단순당이 많이 들어 있는 식품이나 음식을 피한다. (사탕, 탄산음료, 케이크, 초콜릿 등)</li>
									<li class="i_box_t1 mt5">비타민과 무기질이 풍부한 채소와 과일을 충분히 섭취한다.</li>
									<li class="i_box_t1 mt5">패스트푸드(피자, 햄버거 등)와 가공 식품은 적게 먹도록 한다. 패스트푸드는 비만의 원인인 열량과 포화지방산의 함량이 많고, 성인병 발병의 원인인 나트륨 함량도 많다.
									또한 함께 먹어야 할 비타민과 무기질이 적어 균형이 맞지 않게된다.</li>
									<li class="i_box_t1 mt5">음식이 짜거나 매우면 식욕이 더 자극되므로 싱겁게 먹도록 한다. </li>
									<li class="i_box_t1 mt5">식사는 정해진 시간에 한다. 그래야만 간식과 과식을 피하게 된다.</li>
									<li class="i_box_t1 mt5">혼자 식사하는 것을 피한다. 다른 사람과 같이 이야기를 하면서 식사하게 되면 먹는 속도를 조절할 수 있어 과식하지 않게 된다.</li>
									<li class="i_box_t1 mt5">식사일기를 쓴다. 매일매일의 식사기록은 체중조절 목표를 위해서 매우 중요하다. 매일 먹은 양을 기록하고 평가하는 것은 스스로를 돌이켜볼 수 있으며 또, 좀 더 바람직한 방향으로 실천 할 수 있도록 해준다.</li>
								</ul>
								<div class="box bgs w250 h140 r5 m10 ml40 mb30 p30 fl"><span class="bold cm mb10">이런 식품을 많이 먹자!</span>
									<ul class="text small ">
										<li class="i_b_t7">설탕이 적은 식품(싱싱한 과일, 채소)</li>
										<li class="i_b_t7">기름이 적은 식품</li>
										<li class="i_b_t7">짜지 않은 식품</li>
										<li class="i_b_t7">섬유소가 많은 식품<br>(채소, 과일, 콩류, 현미, 보리쌀, 감자, 고구마)</li>
									</ul>	
								</div>
								<div class="box bgs w250 h140 r5 m10 mr40 mb30 p30 fr"><span class="bold cm mb10">이런 식품은 조금만 먹자!</span>
									<ul class="text small ">
										<li class="i_b_t7">설탕이 많은 식품(케이크, 캔디, 설탕)</li>
										<li class="i_b_t7">기름이 많은 식품(삼겹살, 튀긴 음식)</li>
										<li class="i_b_t7">소금이 많은 식품</li>
										<li class="i_b_t7">섬유소가 적은 식품(흰빵, 흰국수, 흰쌀밥)</li>
									</ul>	
								</div>
							</div>
							<h5 class=" title bold t3 i_b_t3 mt40">운동요법</h5>
								<p class="mt10 pl15">운동을 하게 되면<br><br>
									<span class="small">첫째, 체내에 저장되었던 지방이 에너지로 사용되어 체중이 줄 뿐만 아니라<br>
									둘째, 체내에서의 신진대사가 증가되어 칼로리 소모가 늘어나며<br>
									셋째, 비만으로 인해 생기는 내과적 문제(예 : 고혈압, 당뇨병, 동맥경화 등)에 대한 위험도를 줄여주며<br>
									넷째, 적절한 운동은 기분이 상쾌해지는 효과와 청소년의 경우 자신감도 얻을 수 있다.</span><br><br>
								</p>
								<p class="mt10 pl15">비만의 치료에는 에너지 섭취의 감소와 에너지 소비의 증가를 같이 병행하게 되는데 운동은 비만 치료에서 에너지 소비를 증가시키는 가장 흔한 방법으로 이용되고 있다. 
								이는 근육 조직을 보전시키면서 체지방을 상대적으로 많이 감소시키는 것으로 알려져 있다. <mark class="cm">일반적으로 건장증진을 위한 운동은 자기의 최대 운동능력의 50∼80% 범위내의 강도로, 
								하루에 30∼60분 정도로 일주일에 3∼5일을 하는 것이 바람직하다. 그러나 비만자에게는 운동강도를 50∼60%로 낮게 하고 운동시간은 60분 이상 장시간 해야하며
								일주일에 5일 이상 하는 것이 체지방 감소에 가장 이상적인 운동부하량이 된다.</mark> 낮은 강도의 운동일수록 체지방을 에너지로 더 많이 이용하기 때문이다.
								</p>
								<p class="mt10 pl15">일부러 시간을 내어 특별한 운동을 하는 것보다 일상생활에서 신체적인 활동을 늘리는 것도 감소된 체중을 유지하는데 도움이 되며 운동의 지속율을 높여줄 수 있다. 
								예를 들어 엘리베이터보다는 계단을 이용한다든지, 짧은 거리는 걷거나 자전거를 타게 하고, 집안에서보다는 학교운동장이나 놀이터에서 놀게 한다. 
								이런 활동은 단순하게 생각될 수 있지만 신체에는 의미있는 변화를 가져올 수 있다. 
								</p>
								<p class="mt10 pl15">또한 어떤 운동을 하고자 할 때는 단순히 반복하는 운동보다는 숙련도에 따라 성취감을 느낄 수 있는 운동을 선택하는 것도 좋은 방법이다(예 : 배드민턴, 자전거, 농구, 수영 등). 
								단지 살만 빼는 것을 목적으로 했을 때는 오래 지속하기 어려울 수 있으므로 운동을 충분히 즐기려는 마음 자세가 필요하다.
								</p>
								<p class="mt10 pl15 cm">매일 운동을 계획하고 실천정도를 기록하는 운동일기 역시 체중조절을 위해 매우 효과적이다.</p>
							<h5 class=" title bold t3 i_b_t3 mt40">행동요법</h5>
								<p class="mt10 pl15">키에 알맞은 체중까지 계속 단계적으로 체중을 줄여 나가고, 줄어든 체중을 유지하기 위해서는 일시적으로 안먹는 것만으로는 충분하지 않다. 
								행동요법이란 현재의 나쁜 습관을 조금씩 바꾸어 나가는 것이라고 할 수 있으며 비만 관리시 식사요법, 운동요법 등과 함께 필수적인 관리방법의 하나로 본인 스스로 지속적으로 실천하여야 한다.
								</p>
								<ul class="mt10 pl15">
									<li class="i_box_t1">나쁜 식습관을 초래하는 원인을 찾는다.<br>
										<span class="small ">먹는 음식의 종류, 양, 장소, 시간, 자세, 감정상태 등을 계속적으로 기록하여 문제장소, 시간, 감정상태 등을 찾아낸다.</span>
									</li>
									<li class="i_box_t1 mt5">과식을 피한다.
										<ul class="small ">
											<li class="i_b_t7">먹을 때는 정해진 곳에서만 먹는다.</li>
											<li class="i_b_t7">먹을 때는 TV, 신문, 만화 등을 보지 않는다.</li>
											<li class="i_b_t7">음식을 천천히 먹게 하기 위하여 충분히 씹는다. 음식을 한 입 먹을 때마다 물잔을 들도록 한다.</li>
										</ul>	
									</li>
									<li class="i_box_t1 mt5">바람직한 행동을 한 경우 보상을 한다.<br>
										<span class="small ">상으로는 운동기구나 운동을 하면서 함께 즐길 수 있는 것이 좋다.</span>
									</li>
								</ul>
							<h5 class=" title bold t3 i_b_t3 mt40">교육</h5>
								<p class="mt10 pl15">식사요법이나 운동요법을 효과적으로 시행하려면 비만 어린이 자신이 자진해서 참여하도록 해야 하며 이를 위해 어린이로 하여금 비만증이 왜 나쁜지 깨우쳐 주어야 한다.
								비만해지는 과정이나 비만을 치료하는 과정에서 가족의 역할은 다양하다. 특히 어린 소아의 경우라면 부모가 소아에게 적절한 제약을 하는 것이 어렵다.
								따라서 부모들이 소아의 행동을 변화시킬 수 있는 기술을 갖도록 해주는 것이 아동의 식사행동에 도움이 된다.
								좀더 큰 소아의 경우라면 비만으로 인해 부모와 의견차이가 생길 수 있으므로 이때는 영양사 또는 의사가 중재자 역할을 해야 한다.
								</p>
								<p class="mt10 pl15">지속적인 추구관리가 반드시 필요하며 이를 위해서는 소아 또는 부모가 영양사나 의사를 주기적으로 방문하여 식사기록과 활동기록을 검토받도록 하는것이 중요하며 
								이때 칼로리 섭취량과 체중의 변화 및 키의 성장을 평가하여 그에 따라 칼로리를 조정하도록 한다. <mark class="cm">체중조절을 위한 식사원칙을 지나치게 강조하기 보다는 
								키와 연령에 적합한 체중에 도달할 수 있도록 활동적인 생활습관의 변화를 유도하는 것 또한 중요하다.</mark>
								</p>
					</div>
			</c:otherwise>
    	</c:choose>		
					
	</div>
</div>
