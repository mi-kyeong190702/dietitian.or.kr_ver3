<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">소아</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
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
				
				<div class="h800 text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">비만정도의 판정</h4><br>
						<h5 class=" title bold t3 i_b_t3 mt40">성인비만으로 될 가능성이 높다.</h5>
							<ul class="mt10 pl15">
								<li><mark class="bold">1) 비만도</mark> : 성별 , 연령별 , 신장별 체중 50 백분위수를 표준체중으로 비만도를 계산하여 아래와 같이 분류한다.<br>(2007년 소아 청소년 표준 성장도표 참조)<br>
									<div class="w400 box t2 center mt20 p10 fl"><img src="/images/sub/kb_obesity.png" alt="비만도 계산" title="비만도=실제체중-신장별 표준체중/신장별 표준체중 * 100%"></div>
									<div class="area">
										<ul class="p10 small ca">
											<li class="i_b_t7">10 ~ 20% 과체중</li>
											<li class="i_b_t7">20 ~ 30% 경도 비만</li>
											<li class="i_b_t7">30 ~ 50% 중등도 비만</li>
											<li class="i_b_t7">50% 이상 고도 비만</li>
										</ul>
									</div>
								</li><br>
								<li><mark class="bold">2) 체질량 지수 (BMI, Body Mass Index : kg/m 2 )</mark> 는 체중을 신장의 제곱으로 나눈 것으로 성별, 연령에 비교하여 85~94 백분위수이면 비만 위험군으로 추적 관찰할 대상으로 분류하고, 
								95 백분위수 이상이면 비만으로 분류한다.<br>( 2007년 소아 청소년 표준 성장도표 참조 ) <br>
								체질량 지수는 고위험군의 확인과 정확한 평가가 요구되는 환아의 비만의 판정에 이용한다.
								</li><br>
								<li><mark class="bold">3) 피부두께</mark> : 삼두근과 견갑골 하부의 피부두께가 성별 , 연령에 비교하여 95 백분위수 이상일 때 비만이다.<br>( 2007년 소아 청소년 표준 성장도표 참조 ) <br>
								피부두께는 근육과 뼈가 증가하는 과체중과 비만을 감별하는데 도움을 준다.
								</li><br>
								<li><mark class="bold">4) 신장별 체중</mark> : 신장 , 성별에 비교한 체중이 95 백분위수 이상이면 비만이다.<br>( 1998 년 대한 소아과 학회 측정 , 한국소아의 신장별 체중 참조 ) <br>
								</li>
							</ul>
				</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>
