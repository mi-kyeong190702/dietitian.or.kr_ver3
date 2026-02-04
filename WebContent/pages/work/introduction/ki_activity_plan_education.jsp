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
					        <jsp:param name="idx" value="6"/>
					</jsp:include>
					
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">교육</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">교육 프로그램 개발 및 운영</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 법정교육
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 2025년도 영양사 식품위생교육
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">교육시간 : 6시간</li>
										</ul>
									</li>
									<li class="mt5 mb5">(2) 2025년도 영양사 보수교육
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">교육시간 : 6시간</li>
										</ul>
									</li>
									<li class="mt5 mb5">(3) 영양사 추가보수교육</li>
								</ul>
							</li>
							<li class="pb20">2) 전문교육
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 시니어푸드코디네이터 전문교육과정</li>
									<li class="mt5 mb5">(2) 다이어트운동컨설턴트 전문교육과정</li>
									<li class="mt5 mb5">(3) 반려동물영양관리사 전문교육과정 개발</li>
								</ul>
							</li>
							<li class="pb20">3) 직무교육
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 재능기부 무료 직무교육</li>
									<li class="mt5 mb5">(2) 영양지원 교육과정</li>
									<li class="mt5 mb5">(3) 당뇨병 영양관리 교육과정</li>
									<li class="mt5 mb5">(4) 의료기관 인증조사 준비 비법노트</li>
									<li class="mt5 mb5">(5) 일차의료 만성질환관리사업 서비스 제공자 교육</li>
									<li class="mt5 mb5">(6) 온라인 영양관리(NCP) 교육</li>
									<li class="mt5 mb5">(7) 온라인 임상영양 직무교육</li>
									<li class="mt5 mb5">(8) 영양교사 원격연수 직무교육 영양수업, 아는 만큼 보인다!</li>
									<li class="mt5 mb5">(9) 어린이·사회복지급식관리지원센터 직무교육</li>
									<li class="mt5 mb5">(10) 외부업체 협약 교육
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">아동요리지도 교육 운영</li>
											<li class="i_b_t7 mb5">식습관코치 교육 운영</li>
											<li class="i_b_t7 mb5">요퍼먼스지도자 교육 운영</li>
											<li class="i_b_t7 mb5">쿠키클레이 교육 운영</li>
											<li class="i_b_t7 mb5">위탁급식 전문업체, 건강기능식품 업체와의 협약을 통한 맞춤형 교육</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="pb20">4) 기타 교육
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 영양사 대상 나트륨·당류 줄이기 온라인 교육 운영</li>
									<li class="mt5 mb5">(2) 영양사 대상 지속가능한 식생활 교육·홍보</li>
									<li class="mt5 mb5">(3) 영양사 대상 친환경농식품 가치확산 교육·홍보</li>
									<li class="mt5 mb5">(4) 초등학생 대상 친환경농식품 가치확산 교육·홍보</li>
								</ul>
							</li>
							<li class="pb20">5) 시·도영양사회 교육 확대를 위한 지원 및 정보공유 강화</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">민간자격증 발급 및 관리</h6>
						</div>
						
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 민간자격 발급 및 관리</li>
							<li class="pb20">2) 시험 관리</li>
							<li class="pb20">3) 교육 온라인 시스템 운영 및 관리</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">전국영양사학술대회</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 전국영양사학술대회 프로그램 개발</li>
							<li class="pb20">2) 전국영양사학술대회 운영(7월 24일 ~ 7월 25일)
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 다양한 주제별 세션, 논문초록 세션, 부대행사 등 구성    </li>
									<li class="mt5 mb5">(2) 온라인-오프라인 하이브리드 운영</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">교육 프로그램의 질 향상 및 서비스 확대</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 교육 프로그램 질 향상
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 교육 모니터링을 통한 교육생 요구도 분석 및 개선</li>
									<li class="mt5 mb5">(2) 최신 관련 분야의 신지식 습득을 위한 정보 수집</li>
									<li class="mt5 mb5">(3) 관련 분과(학교, 병원, 산업체 등)와의 연계를 통한 의견 수렴</li>
									<li class="mt5 mb5">(4) 관련 분야(의료, 보건, 교육 등 전문 분야) 강사 pool 구축</li>
								</ul>
							</li>
							<li class="pb20">2) 교육 서비스 및 참여도 확대
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 교육생에게 다양한 혜택 부여</li>
									<li class="mt5 mb5">(2) 교육생 민원 신속 접수·처리</li>
								</ul>
							</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">교육 서비스 환경 개선</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) KDA 영양사 법정교육센터 및 KDA edu센터 온라인시스템 운영 및 관리</li>
							<li class="pb20">2) 데이터 서버 고도화</li>
							<li class="pb20">3) KDA 영양사 법정교육센터 유지ㆍ개선</li>
							<li class="pb20">4) KDA 영양사 법정교육센터 모바일 시스템 유지ㆍ개선</li>
							<li class="pb20">5) 교육 강사 및 담당자의 역량 강화를 위한 교육 지원</li>
							<li class="pb20">6) 국내외 학회의 교육 현황 동향 분석</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">영양사 면허신고(실태 등의 신고)</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) KDA 영양사 법정교육센터 ‘면허신고’ 페이지 운영 및 관리</li>
							<li class="pb20">2) 영양사 면허신고 홍보 및 실시</li>
						</ol>
					</div>
				</div>
			</div>
