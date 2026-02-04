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
					        <jsp:param name="idx" value="7"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">출판</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">제34회 학술상 시상</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 대상 : 2024년도 본 협회 학술지 논문(대상, 우수상, 장려상 시상)</li>
							<li class="pb20">2) 발표 : 정기대의원총회</li>
							<li class="pb20">3) 시상 : 전국영양사학술대회</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">자료 발간</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 대한영양사협회지 국민영양(10회)
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 회원 대상 e-Book 웹서비스 제공</li>
									<li class="mt5 mb5">(2) 미리 만나는 국민영양 및 뉴스레터 발송(각 월 1회)</li>
									<li class="mt5 mb5">(3) 이달의 국민영양 및 영양사 소개 영상 제작 및 업로드(각 월 1회)</li>
								</ul>
							</li>
							<li class="pb20">2) 대한영양사협회 학술지(4회)
								<ul class="ml10 mt5">
									<li class="i_b_t7 mb5 text">e-Book 웹서비스 제공</li>
								</ul>
							</li>
							<li class="pb20">3) 영양사 현장실습 지침서 개정판 제작</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">학술지 평가에 따른 업무 수행</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 투고 규정, 심사 규정, 편집 규정, 연구윤리 규정 개정</li>
							<li class="pb20">2) 연구윤리강화 활동 추진(교육 실시, 부정행위 관리 활동 추진)</li>
							<li class="pb20">3) 2025년도 학술지 계속평가</li>
							<li class="pb20">4) 학술지에 연구자들의 고유 인식번호인 "ORCID(Open Researcher and Contributor ID)" 적용</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">학술지의 KoreaMed 등재 유지 관리</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 논문 온라인 검색 서비스 제공</li>
							<li class="pb20">2) 학술지(PDF File) 탑재</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">학술지의 질적 향상을 위한 전문성 강화</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 대한의학학술지편집인 아카데미 전문 교육 참석</li>
							<li class="pb20">2) 관련 심포지엄 및 워크숍 참석</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">한국문학예술저작권협회와의 저작권 관리 보호 사업 실시</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">- 저작권 신탁관리 계약에 따른 저작물 복사 및 전송권 보호</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">관련 기관과의 학회, 협회 지원화 사업 실시</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 한국과학기술정보연구원
								<ul class="ml10 mt5">
									<li class="i_b_t7 mb5 text">대한영양사협회지 국민영양, 학술지의 온라인 검색 서비스 제공</li>
								</ul>
							</li>
							<li class="pb20">2) 한국연구재단
								<ul class="ml10 mt5">
									<li class="i_b_t7 mb5 text">학술지 온라인 논문투고 및 심사에 대한 JAMS 2.0시스템 운영</li>
								</ul>
							</li>
						</ol>
					</div>
				</div>
			</div>
