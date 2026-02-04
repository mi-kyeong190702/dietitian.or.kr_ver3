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
					        <jsp:param name="idx" value="1"/>
					</jsp:include>
					
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">조직</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">체계적인 조직 관리</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 탄탄한 조직 강화</li>
							<li class="pb20">2) 조직 운영 내실화를 위한 활동 지원</li>
							<li class="pb20">3) 시·도영양사회 그룹별 맞춤형 활동 지원</li>
							<li class="pb20">4) 체계적인 산하조직의 운영·관리</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">조직 역량 강화</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 인프라 구축
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 임원의 역할 및 자질 향상을 위한 워크숍 실시</li>
									<li class="mb5">(2) 업무 능력 및 전문성 향상을 위한 직원교육 실시</li>
									<li class="mb5">(3) 외부 전문가 활용(회계, 노무, 법률 등)</li>
								</ul>
							</li>
							<li class="pb20">2) 조직 경쟁력 제고
								<ul class="text small pl15">
									<li class="i_b_t7 mt5 mb5">조직의 뉴 트렌드 현황 조사 및 분석을 통한 경쟁력 개발</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">조직 협업 강화</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 유기적인 조직 문화 구축
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 배려와 소통을 통한 협조적인 조직 문화 및 활력 제고</li>
									<li class="mb5">(2) 상호 협력 체계 강화</li>
								</ul>
							</li>
							<li class="pb20">2) 조직 결속력 강화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 회원공감주간 운영을 통한 회원 참여 활동 확대</li>
									<li class="mb5">(2) 회원과의 정확·신속한 정보 공유</li>
									<li class="mb5">(3) 시·도영양사회 및 산하조직과의 네트워크 강화</li>
									<li class="mb5">(4) 중앙회 이슈 및 소식 등 공유를 통한 협력 및 조직 내부 결속화</li>
									<li class="mb5">(5) 시·도영양사회 소통이사제 운영</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">외부단체 교류 협력</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 외부단체 교류를 통한 정책, 정보 공유 및 영양사직 홍보</li>
							<li class="pb20">2) 보건의료단체, 유관 기관 등 관련 단체 사업, 행사 참석 및 협조체계 형성</li>
							<li class="pb20">3) 심사(평가)위원 추천을 통한 영양사 입지 강화</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">조직관련 회의 개최</h6>
						</div>
					</div>
				</div>
			</div>
