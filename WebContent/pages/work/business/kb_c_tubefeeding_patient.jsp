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
						<h4 class="title bold cm t2 i_b_t2 mt50">경관급식의 적용과 금기환자</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">적용환자</h5><br />
								<p class="mt10 pl15"> 경관급식의 적용은 구강으로 충분한 영양 섭취 및 흡수가 불가능한 경우를 전제 조건으로 시행된다. 
								구강 섭취가 불충분하고 영양불량 상태에 처해 있거나 영양불량의 위험이 높은 환자에게 경관 급식의 적용을 고려한다.
								</p>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10">일반적으로 불충분한 구강섭취란, 영양요구량의 약 2/3 또는 3/4 이하 섭취하는 경우를 의미하며, 불충분한 섭취 기간은 환자의 연령, 영양상태, 
									예상되는 질병의 중증도 및 흡수 정도를 근거로 고려되어야 한다.
									</li>
									<li class="i_box_t1 mt10">불충분한 구강 섭취가 7-14일간 이미 지속되었거나 불충분한 구강 섭취가 7-14일 이상 예상되는 경우 경관급식의 시작을 신중히 고려해야 한다.</li>
									<li class="i_box_t1 mt10">한편, 유럽경장정맥영양학회에서는 중환자의 경우 3일 이내 구강 섭취가 불가능하리라 예상되는 모든 중환자에게 초기부터 경관 급식 시행을 계획하고, 
									환자가 혈역학적으로 안정되고 위장관 기능의 사용이 가능하다면 입원 후 24시간 이내 빠른 경관급식을 시행할 것을 권장하고 있다.(Kreymann 2002)
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">금기환자</h5><br />
								<p class="mt10 pl15">경관급식의 금기는 절대적이라기보다는 환자 상태를 고려하여 상대적으로 혹은 일시적으로 적용한다. 경관급식의 일반적인 금기 환자는 다음과 같다.
								</p>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt10"><mark class="bold">말기 질환</mark> : 말기 환자의 경우 경관급식으로 인한 흡인, 설사, 과수화의 위험이 높고, 환자 불편감을 초래할 수 있으므로 
									경관급식 시행 전 경관급식에 따른 장점 및 단점을 평가한 후 시행하여야 한다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">짧은 창자</mark> : 짧은 창자 환자의 경우 수술 후 1-3개월간은 남아 있는 장의 영양소 흡수의 적응력에 따라 정맥영양 시행이 요구된다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">폐색</mark> : 십이지장 아래 부분의 완전 기계적 폐색, 또는 해결이 불가능한 가성 폐색인 경우 경관급식 시행이 불가능하다. 
									그러나 부분 폐색인 경우 위장관의 기능 상태를 면밀히 관찰하면서 경관급식 시행을 우회적으로 시도할 수 있으나 지속적인 모니터링 하에 시행되어야 한다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">위장 출혈</mark> : 즉각적인 위장 기능 평가 및 치료뿐 아니라 출혈의 원인, 위치, 정도에 따라 경관급식 가능여부가 결정된다. 
									만성적인 상부 위장 출혈인 경우에는 꼭 금기는 아니다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">구토 및 설사</mark> : 지속되는 구토 및 설사가 절대적인 금기 사항은 아니나 그 원인에 대해 심도 깊은 평가가 필요하다. 
									설사 및 구토가 심각한 경우 경관급식 시행이 어려울 수 있다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">누공</mark> : 누공의 위치에서 멀리 떨어진 부위로 급식관을 위치시키면 경관급식 시행이 가능할 수도 있다. 
									상부 혹은 하부 위장에 누공이 있으면서 누출량이 적은 경우 소장으로의 경관급식이 가능하나 위장의 중간(공장)에 누공이 있으면서 누출량이 많은 경우는 급식이 보다 어렵다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">위장관 허혈</mark> : 질병으로 장간막 혈류가 감소되어 점막이 변화되면 위장관의 흡수 및 방어벽으로의 기능 저하를 유발한다. 
									그러므로 심폐기능이 불안한 환자에서는 경관급식의 장점이 명확하지 않을 수 있다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">장폐색</mark> : 급성 중환자, 또는 수술후 환자의 경우 마비성 장폐색이 흔히 발생되며 이로 인해 경관급식 시행이 어려워질 수 있다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">위장관 염증</mark> : 염증성 장질환(크론병, 궤양성대장염), 방사선 치료 및 항암 치료 등에 의해 위장관 염증이 심한 경우 
									장 휴식(bowel rest)을 위해 경관급식을 제한하기도 한다.
									</li>
									<li class="i_box_t1 mt10"><mark class="bold">췌장염</mark> : 심한 췌장염인 경우 치료를 목적으로 장 휴식을 위해 경관급식을 제한할 수 있다. 
									그러나 심한 췌장염이 아니라면 경관급식을 성공적으로 시행할 수 있음이 최근 연구를 통해 제시되고 있다(Simpson 1995).
									</li>
								</ul>
							<div class="box t2 w650 ac mt30 p20 small">
								<h6 class="bold cm mb10">경관급식을 통한 경장영양의 장점</h6>
								<p class="bold cb mb10">많은 연구를 통해 경장영양이 정맥영양에 비해 보다 우수한 영양공급 방법이라는 것이 보고되었다. 경장영양의 장점은 다음과 같다.</p>
								<ul>
									<li class="i_b_t7 mt5"><mark class="bold">보다 생리적이다.</mark><br />
									위장관을 사용함으로써 위점막 위축에 따른 면역학적 이상을 방지하며 위장관의 물리적 방어벽으로 작용하는 tight junction을 정상적으로 유지하여 박테리아의 전이를 감소시킨다.
									</li>
									<li class="i_b_t7 mt5"><mark class="bold">합병증이 적다.</mark><br />
									48시간내의 빠른 경장영양 공급은 정맥영양과 비교 시 패혈증 발생이 적으며 위장관 출혈의 위험을 낮추고 담낭수축력 향상 및 수술에 따른 상처회복을 향상시키는데 
									유용한 것으로 알려져 있다.
									</li>
									<li class="i_b_t7 mt5"><mark class="bold">보다 경제적이다.</mark><br />
									경장영양은 유사한 영양상태 유지를 위해 사용되는 비용이 정맥영양에 비해 훨씬 더 저렴하다.<br />
									(미국 연구에 의하면 경장영양 : 정맥영양 비용 = 1 : 3 으로 보고됨)<br />
									→ 따라서 위장관 사용이 가능하다면 정맥영양 보다 경관급식을 통한 경장 영양이 우선적으로 고려되어야 한다. 
									</li>
								</ul>
							</div>
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>
