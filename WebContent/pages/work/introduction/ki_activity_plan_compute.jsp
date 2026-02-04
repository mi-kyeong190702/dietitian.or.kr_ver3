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
					        <jsp:param name="idx" value="3"/>
					</jsp:include>
						<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">전산</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">회원·교육관리프로그램 운영</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원·교육관리프로그램 운영 및 유지보수</li>
							<li class="pb20">2) 13개 시·도영양사회 대상 회원·교육관리프로그램 운영 지원</li>
							<li class="pb20">3) 회원 개인정보보호를 위한 SSL 기능 지속화</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">CMS 프로그램 개발·운영</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) CMS 프로그램 운영 및 유지보수</li>
							<li class="pb20">2) 13개 시·도영양사회 대상 CMS 프로그램 운영 지원</li>
							<li class="pb20">3) 편의성·지속성 증대</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">DB 관리</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원 개인정보, 교육 등 DB 관리</li>
							<li class="pb20">2) 개인정보 업데이트 이벤트 실시</li>
							<li class="pb20">3) 영양사 교육 참가자 DB 관리</li>
							<li class="pb20">4) 신규 영양사 면허취득자 DB 관리</li>
							<li class="pb20">5) 회원데이터 및 통계 오류 보완</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">사무국 내부 네트워크 관리</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 회원·교육관리프로그램 내 네트워크 강화</li>
							<li class="pb20">2) 소프트웨어 관리(한글, MS-Office, OS 등)</li>
							<li class="pb20">3) 사내 네트워크 설정 및 환경관리</li>
							<li class="pb20">4) 프로그램을 통한 사내 문서 관리, 시스템 관리</li>
							<li class="pb20">5) 사무국 PC 관리(컴퓨터, 프린터, 스캐너, 인터넷 등)</li>
							<li class="pb20">6) 전화 시스템 관리</li>
						</ol>
					</div>				
				</div>
			</div>
