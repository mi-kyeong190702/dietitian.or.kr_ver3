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
					        <jsp:param name="idx" value="2"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">회원</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">다양한 회원 서비스 개발</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원 서비스 체계화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 회원 현황 및 요구도 분석</li>
									<li class="mb5">(2) 이메일, 웹, 모바일 앱, SMS, 직접 방문 등 온·오프라인 다양한 채널을 통한 회원 서비스 관리</li>
									<li class="mb5">(3) 회원·비회원의 차등화된 서비스 제공</li>
									<li class="mb5">(4) 회원 인프라 환경 최적화</li>
								</ul> 
							</li>
							<li class="pb20">2) 회원 서비스 전문화
								<ul class="text small pl15">
									<li class="mb5 mb5">(1) 다양한 채널 서비스 활성화</li>
									<li class="mb5">(2) 분야별 실무자료 제공</li>
								</ul>
							</li>
							<li class="pb20">3) 회원 서비스 신속화
								<ul class="text small pl15">
									<li class="mb5 mb5">(1) 홈페이지 효율적 개선을 통한 회원 서비스 만족도 향상</li>
									<li class="mb5">(2) 회원 중심의 스마트 전문 서비스 제공 : E-mail, SMS, 유선 등</li>
									<li class="mb5">(3) 회원 민원 신속 접수 및 처리</li>
								</ul>
							</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">지속적인 회원관리</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원관리
								<ul class="text small pl15">
									<li class="mb5 mb5">(1) 회원별 분석 및 세분화 관리</li>
									<li class="mb5">(2) 기존회원(장기회원) 유지 및 신규회원 유치 모색</li>
									<li class="mb5">(3) 산하조직 등 통합 회비 관리</li>
								</ul>
							</li>
							<li class="pb20">2) 평생회원 관리
								<ul class="text small pl15">
									<li class="i_b_t7 mt5 mb5">연령별 평생회비 차등화</li>
								</ul>
							</li>
							<li class="pb20">3) CMS 회비 활성화 홍보</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">회원 확대</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원배가 활동
								<ul class="text small pl15">
									<li class="mb5">(1) 대상별 회원배가 전개
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">분과 및 지역별 회원배가</li>
											<li class="i_b_t7 mb5">신규 분야 회원배가<br />: 소방서, 군대, 어린이·사회복지급식관리지원센터, 신규 영양교사, 건강상담 영양사 등
																			 <br />: 신규 배치 연수 시 협회 홍보 및 회원가입 독려, 납부 편의사항 제공</li>																			 
											<li class="i_b_t7 mb5">영양사(임상영양사, 영양교사 등) 준비생 및 재학생 대상 회원가입 독려</li>
											<li class="i_b_t7 mb5">신규 면허취득자 및 식품영양(학)과 학생 대상 회원가입 독려</li>
											<li class="i_b_t7 mb5">식품영양(학)과 교수 대상 회원가입 독려<br />: 전식협, 한식협, 관련 학회 등</li>
										</ul>
									</li>
									<li class="mb5">(2) 다양한 방법을 통한 회원배가
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">캠페인 및 특별이벤트 실시</li>
											<li class="i_b_t7 mb5">회원공감(共感) 주간 운영<br />: “걸어서 영양사 속으로” 토크콘서트 개최
																				   <br />: 선배영양사 및 회원과의 공감대 형성을 통한 유대감 증대 및 결속력 강화주간 운영</li>
											<li class="i_b_t7 mb5">회원배가 홍보 활성화<br />: 온라인 회원가입 안내 카드뉴스 배포, 회원배가 활동 모바일 접근성 강화</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="pb20">2) 회원종류별 가입 독려 활동
								<ul class="text small pl15">
									<li class="mt5  mb5">(1) 신규 가입 독려
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">신규 면허취득자 및 미취업자 대상 홍보 강화 : 인&인 캠페인, 회원공감주간 연계</li>
											<li class="i_b_t7 mb5">비회원대상 회원가입 독려</li>
											<li class="i_b_t7 mb5">신규 배치 영양사 및 영양교사 중점 가입 독려</li>
											<li class="i_b_t7 mb5">전식협, 한식협 회원가입 독려</li>
										</ul>
									</li>
									<li class="mt5  mb5">(2) 재가입 독려
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">재가입률 분석을 통한 재가입 회원관리 : 회원가입 유지 관리</li>
											<li class="i_b_t7 mb5">장기 미가입 후 재가입 회원에 대한 웰컴 행사</li>
											<li class="i_b_t7 mb5">회원 재가입 안내 시스템 강화</li>
											<li class="i_b_t7 mb5">재가입하지 않은 기회원 독려</li>
											<li class="i_b_t7 mb5">시·도영양사회를 통한 독려</li>
											<li class="i_b_t7 mb5">분과별 독려</li>
											<li class="i_b_t7 mb5">분야회별 독려</li>
										</ul>
									</li>
									<li class="mt5  mb5">(3) 특별회원 가입 독려</li>
									<li class="mt5  mb5">(4) 학생회원 가입 독려</li>
								</ul>
							</li>
							<li class="pb20">3) 조직을 이용한 독려 활동 집중 실시
								<ul class="text small pl15">
									<li class="mt5  mb5">(1) 시·도영양사회를 통한 회원가입 독려</li>
									<li class="mt5  mb5">(2) 분과 및 분야회를 통한 회원가입 독려</li>
									<li class="mt5  mb5">(3) 신규 영양사 배치 분야를 통한 회원가입 독려
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">군대, 소방서, 어린이·사회복지급식관리지원센터 등</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="pb20">4) 기타 회원가입 독려
								<ul class="text small pl15">
									<li class="mt5  mb5">(1) 각종 매체를 통한 회원가입 독려</li>
									<li class="mt5  mb5">(2) 지부별, 분과별, 연령별 등 통계분석을 통한 취약분야 집중분석 및 확대 방안모색</li>
									<li class="mt5  mb5">(3) 회원가입 독려 시 모바일 접근성 강화 방안 모색</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">회원포상</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 정기대의원총회 시 회원 포상</li>
							<li class="pb20">2) 정부 및 외부단체 포상 확대 추진</li>
							<li class="pb20">3) 우수 회원에게 포상 기회 부여</li>
							<li class="pb20">4) 2025년도 식품·영양 관련 학과 졸업생 대상 협회장 표창 수여 추진</li>
						</ol>
					</div>
											
				</div>
			</div>
