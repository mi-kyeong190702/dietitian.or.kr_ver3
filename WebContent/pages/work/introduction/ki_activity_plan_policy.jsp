			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">활</mark>동</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
							<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
							<li><a href="/work/introduction/ki_activity.do" class="cm">활동</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
				
					<!-- 상단 tab -->
					<jsp:include page="ki_activity_plan_submenu.jsp" flush="false">
					        <jsp:param name="idx" value="1"/>
					</jsp:include>
					
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">사업계획</h4>
					<jsp:include page="activity_select.jsp" flush="false">
					        <jsp:param name="idx" value="4"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">정책</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">정책</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 영양사 관련 법령 및 제도 제·개정 활동
								<ul class="text small pl15">
									<li class="i_b_t7 mt5 mb5">영양사 관련 법령 및 제도 제·개정에 따른 건의</li>
								</ul>
							</li>
							<li class="pb20">2) 「보건의료인력지원법」상 보건의료인력 수급추계위원회 직종 관련 의견 개진, 보건의료인력종합계획 수립 추진 활동</li>
							<li class="pb20">3) 영양의 날 법정기념일 제정</li>
							<li class="pb20">4) 우수한 영양전문인력 양성체계 개선 및 수급 조절
								<ul class="text small pl15">
									<li class="i_b_t7 mt5 mb5">영양사 교육과정 인증제도 도입</li>
								</ul>
							</li>
							<li class="pb20">5) 영양사 교육 강화
							    <ul class="text small pl15">
                                    <li class="i_b_t7 mt5 mb5">영양사 보수교육 매년 실시</li>
                                    <li class="i_b_t7 mt5 mb5">집단급식소 영양사·조리사 식품위생교육 매년 6시간 실시</li>
                                </ul>
							</li>
							<li class="pb20">6) 영양사 역량 강화를 위한 영양사 취업교육센터 설치·운영</li>
							<li class="pb20">7) 집단급식소 영양사·조리사 각각 고용 강화</li>
							<li class="pb20">8) 영양사 법적 고유업무 보장을 위해 식생활교육 전문인력 양성 반대</li>
							<li class="pb20">9) 정부기관 정책 및 업무 협조
							    <ul class="text small pl15">
                                    <li class="i_b_t7 mt5 mb5">범정부 식중독 종합대응 협의체, 부처별 전문가 자문회의 등</li>
                                </ul>
							</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">정책 추진 지원 활동 강화</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 관련 기관 유대 강화
								<ul class="text small pl15">
									<li class="i_b_t7 mt5 mb5">관련 단체 정책 추진활동 점검 및 대응전략 모색</li>
								</ul>
							</li>
							<li class="pb20">2) 법률 자문 운영</li>
							<li class="pb20">3) 정책 추진 소식 알림
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 홈페이지에 정책 추진 사항 공지</li>
									<li class="mt5 mb5">(2) 회원 및 식품영양관련학과 대상 정책소식 및 분과활동 메일링 서비스</li>
								</ul>
							</li>
							<li class="pb20">4) 정책토론회, 세미나, 간담회 개최</li>
						</ol>
					</div>						
				</div>
			</div>