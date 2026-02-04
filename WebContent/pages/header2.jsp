<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link type="text/css" href="/css/popup.css" rel="stylesheet" />
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@include file="common.jsp"%>

<%
	String url 		= "index";
	String pageName = "";	
	String fileName = "";
	
 	if ( request.getAttribute("javax.servlet.forward.request_uri") != null  ) {
 		url 		= request.getAttribute("javax.servlet.forward.request_uri").toString();
 		pageName 	= url.substring(url.lastIndexOf("/") + 1, url.length());	
 		fileName 	= pageName.substring(0, pageName.length()-3);
 	}	
%>
<script>
function ck(){
	  test=window.open('','tst','width=720 height=600');
	  test.document.write("<body leftmargin=14 topmargin=14><center>아질산염 (사이즈가 작게나올시 동영상 더블클릭)<br><embed src=http://www.dietitian.or.kr/assets/ver2/media/nitrite/nitrite.wmv></embed>");
	 }
</script>
	<!-- Header S-->
	<header id="header">
		<div class="h_bar">
			<div class="wrap">
				<div class="h_accessibility">
					<h2>화면크기</h2>
					<button onclick="zoomInOut('in');" class="ha_btn plus"><span class="ti">화면확대</span></button>
					<button onclick="zoomInOut('out');" class="ha_btn minus"><span class="ti">화면축소</span></button>
				</div>
				<hr />
				<!-- 2022.07.07 주석처리 -->
				<!-- <div class="h_language">
					<h2 class="ti">언어선택</h2>
					<button title="English" id="btn_english_go" onclick="openEnglishWindow()">ENG</a></button>
					<button title="한국어로 보기">KOR<span class="hl_icon"></span></button> --><!-- 영문페이지의 경우 해당 소스로 교체해주세요.
				</div> -->
				<hr />
				<div class="h_topmenu">
					<h2 class="ti">상단메뉴</h2>
					<ul>
						<li class="start"><a href="/index.jsp">HOME</a></li>
						<%  if (!g_isLogin) { %>
						<li><a href="/login/kl_login_nor.do">로그인</a></li>
						<li><a href="/member/km_join.do">회원가입</a></li>
						<%  } else { %>
							<li><a href="/pages/login/kl_logout.jsp">로그아웃(포인트:<%=g_pers_point %> 점)</a></li>
							<li><a href="/kmp_payment.do?doc_code=0105">마이페이지</a></li>
						<%  } %>
					<li><a href="/use/ku_sitemap.do">이용안내</a></li>
						<li><a href="/work/introduction/ki_location.do">Contact Us</a></li>
					</ul>
				</div>
				<hr />
				<div class="h_search">
					<form method="post" action="/ks_result.do">
						<fieldset>
							<legend><span class="ti">통합검색</span></legend>
							<label for="top_search"><span class="ti">카테고리</span></label>
							<select id="top_search" name="search" class="hs_select">
								<option value="1" selected>회원자료실</option>
								<option value="2">영양관련정보</option>
								<option value="3">국민영양</option>
							</select>
							<label for="top_keyword"><span class="ti">검색어</span></label>
							<input type="text" class="hs_input" name="keyword" id="top_keyword" onkeypress="if( event.keyCode == 13) f_CommonSearch(); " />
							<button class="hs_btn" type="button" onclick="f_CommonSearch();"><span class="ti">검색</span></button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<hr />
		<div class="wrap">
			<div class="h_logo">
				<a href="/index.jsp" title="메인페이지로 이동"><h1 class="ti">사단법인 대한영양사협회</h1></a>
			</div>
			<hr />
			<div class="h_menu">
				<nav id="nav">
					<ul>
						<li class="n_main introduce"><a href="/work/introduction/ki_intro.do" <% if(fileName.equals("introduction")){%> class="on" <%}%>>KDA 소개<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>소개</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/introduction/ki_intro.do">대한영양사협회소개</a>
											<ul class="ns_depth2">
												<li><a href="/work/introduction/ki_intro.do">인사말</a></li>
												<li><a href="/work/introduction/ki_group.do">조직 및 연락처</a></li>
												<li><a href="/work/introduction/ki_activity.do">활동</a></li>
												<li><a href="/work/introduction/ki_location.do">찾아오시는 길</a></li>
												<li><a href="/work/introduction/ki_situation.do">협회 현황</a></li>
											</ul>
										</li>
										<li><a href="/work/introduction/ki_about.do">영양사소개</a>
											<ul class="ns_depth2">
												<li><a href="/work/introduction/ki_about.do">영양사란</a></li>
												<li><a href="/work/introduction/ki_dietitian.do">영양사가 되려면</a></li>
												<li><a href="/work/introduction/ki_us_activity.do">우리나라 영양사 활동</a></li>
												<li><a href="/work/introduction/ki_clinical.do">임상영양사</a></li>
												<!-- 
												<li><a href="/work/introduction/ki_operation.do">급식경영 영양사</a></li>
												<li><a href="/work/introduction/ki_industry.do">산업보건 영양사</a></li>
												 -->
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main news"><a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}" <% if(fileName.equals("news")){%> class="on" <%}%>>KDA 소식<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>소식</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="pr ns_depth1">
										<li class="pa l0 t0"><a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}">공지사항</a></li>
										<li class="pa l0 t46"><a href="/work/news/kn_area_main.do">시도영양사회 </a>
											<ul class="ns_depth2">
												<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=${g_encoded_userid}">시도영양사회 공지사항</a></li>
												<li><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48">시도영양사회게시판</a></li>
											</ul>
										</li>
										<li class="pa l193 t0"><a href="/work/news/kn_organ_news.do?bbs_board_code=0">관련기관 소식</a></li>
										<li class="pa l386 t0"><a href="/work/news/kn_division.do?g_userid=${g_encoded_userid}">학교분과</a></li>
										<!-- <li class="pa l579 t0"><a href="/work/news/kn_senior.do">시니어 직능클럽</a></li> -->
										<li class="pa l579 t0"><a href="/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_encoded_userid}">KDA Gallery</a></li>
										<li class="pa l193 t46"><a href="/work/news/kn_re_license.do?g_userid=${g_encoded_userid}">영양사 면허증 재교부</a></li>
										<!-- 2022.04.01 주석처리
										<li class="pa l193 t92"><a href="/work/news/kn_info_license.do">영양사카드</a>
										-->
											<!-- 
											<ul class="ns_depth2">
												<li><a href="/work/news/kn_info_license.do">영양사카드 발급안내</a></li>
												<li><a href="/work/news/kn_license.do">영양사카드 발급신청</a></li>
											</ul>
											 -->
										</li>
										<li class="pa l386 t46"><a href="/work/news/kn_calendar.do">이달의 일정</a></li>
										<li class="pa l579 t46"><a href="/work/news/kn_careers.do">채용센터</a>
											<ul class="ns_depth2">
												<li><a href="/work/news/kn_careers.do">구인</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main business"><a href="/work/business/kb_nutrition.do" <% if(fileName.equals("business")){%> class="on" <%}%>>KDA 영양<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>영양</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/business/kb_nutrition.do">영양의 날</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_nutrition.do">개요</a></li>
												<li><a href="/work/business/kb_nutrition_material.do?bbs_board_code=88&g_userid=${g_encoded_userid}">자료실</a></li>
											</ul>
										</li>
										<li><a href="/work/business/kb_farm.do">우리 농축수산물소비촉진</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_farm.do">개요</a></li>
												<li><a href="/work/business/kb_farm_material.do?bbs_board_code=6&g_userid=${g_encoded_userid}">자료실</a></li>
											</ul>
										</li>
										<li><a href="/work/business/kb_reduction.do">당류·나트륨 저감 홍보</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_reduction.do">개요</a></li>
											</ul>
										</li>
										<!-- <li><a href="/work/business/kb_safety.do">음식업종 사망사고 예방</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_safety.do">개요</a></li>
											</ul>
										</li> -->
										<li><a href="/work/business/kb_health.do">국민건강증진사업</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_health.do">개요</a></li>
												<li><a href="/work/business/kb_health_material.do?bbs_board_code=11&g_userid=${g_encoded_userid}">자료실</a></li>
											</ul>
										</li>
										<%-- <li style="position:absolute; top:100px; left:590px;"><a href="/work/business/kb_health.do">국민건강증진사업</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_health.do">개요</a></li>
												<li><a href="/work/business/kb_health_material.do?bbs_board_code=11&g_userid=${g_encoded_userid}">자료실</a></li>
											</ul>
										</li> --%>
										<li style="position:absolute; top:100px; left:205px;"><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
										<li style="position:absolute; top:100px; left:397px;"><a href="/work/business/kb_ko_site.do">관련사이트</a>
											<ul class="ns_depth2">
												<li><a href="/work/business/kb_ko_site.do">국내사이트</a></li>
												<li><a href="/work/business/kb_fo_site.do">외국사이트</a></li>
												<li><a href="/work/business/kb_fo_nutrition.do">외국영양사회</a></li>
											</ul>
										</li> 
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main education"><a href="/work/education/ke_menu.do" <% if(fileName.equals("education")){%> class="on" <%}%>>KDA 교육<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>교육</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="pr ns_depth1">
										<li class="pa l0 t0"><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육&g_userid=${g_encoded_userid}">교육지원센터</a></li>
										<li class="pa l579 t0"><a href="/work/education/ke_law_edu.do">영양사 법정교육</a>
											<ul class="ns_depth2">
												<li><a href="/work/education/ke_law_edu.do">영양사 보수교육</a></li>
												<li><a href="/work/education/ke_law_hygiene.do">영양사 식품위생교육</a></li>
												<!-- <li><a href="/work/education/ke_law_special.do">영양사 특별위생교육</a></li> -->
											</ul>
										</li>
										
										<li class="pa l0 t46"><a href="/work/education/ke_elderly_info.do">교육과정 안내</a>
											<ul class="ns_depth2">
												<li><a href="/work/education/ke_elderly_info.do">전문교육과정</a></li>
												<li><a href="/work/education/ke_health_info.do">직무 교육과정 Ⅰ</a></li>
												<li><a href="/work/education/ke_coach_info.do">직무 교육과정 Ⅱ</a></li>
												<li><a href="/work/education/ke_online_info.do">온라인 교육과정</a></li>
											</ul>
										</li>
										
										<li class="pa l193 t0"><a href="/work/education/ke_curriculum.do">교육과정신청</a>
											<ul class="ns_depth2">
												<li><a href="/work/education/ke_curriculum.do">교육과정 신청</a></li>
												<li><a href="/work/education/ke_situation.do">교육과정 신청현황</a></li>
												<!--<li><a href="/work/education/ke_mySituation.do">교육현황</a></li>-->
											</ul>
										</li>
										
										<!--
										<li class="pa l579 t0"><a href="/work/education/ke_about.do">전문영양사 코너</a>
											<ul class="ns_depth2">
												<li><a href="/work/education/ke_about.do">전문영양사란?</a></li>
												<li><a href="/work/education/ke_schedule.do">평점인정 교육일정</a></li>
												<li><a href="/work/education/ke_exam.do">자격시험 신청</a></li>
												<li><a href="/work/education/ke_exam_situation.do">자격시험 신청현황</a></li>
												<li><a href="/work/education/ke_license.do">자격증 신청(신규·갱신)</a></li>
												<li><a href="/work/education/ke_formboard.do?bbs_board_code=83">관련서식 다운로드</a></li>
											</ul>
										</li> 
										-->
										
										<!-- 학술대회 관련 부분 -->
										 <li class="pa l386 t0"><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a>
											<ul class="ns_depth2">
												<li><a href="/work/education/ke_contest_info.do">학술대회 안내</a></li>
												<li><a href="/work/education/ke_program.do">프로그램</a></li>
												<li><a href="/work/education/ke_document.do">공문다운받기</a></li>
												<li><a href="/work/education/ke_receipt.do">등록</a></li>
												<li><a href="/work/education/ke_green.do">초록접수</a></li>
												<li><a href="/work/education/ke_ebook.do">e-Book보기</a></li>
												<!-- <li><a href="/work/education/ke_event_info.do">행사장(숙박) 안내</a></li> -->
											</ul>
										</li> 
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main publication"><a href="/work/publication/kp_magazine.do" <% if(fileName.equals("publication")){%> class="on" <%}%>>KDA 출판<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>출판</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/publication/kp_magazine.do">국민영양</a>
											<ul class="ns_depth2">
												<li><a href="/work/publication/kp_participation.do">국민영양참여</a></li>
												<li>
													<a href="/work/publication/kp_m_list.do">국민영양검색</a>
												</li>
											</ul>
										</li>
										<li><a href="/work/publication/kp_journal.do">학술지</a>
											<ul class="ns_depth2">
												<li><a href="/work/publication/kp_journal_law01.do">학술지규정</a></li>
												<li><a href="https://www.dietitian.or.kr/work/publication/kp_journal_search.do">학술지검색</a></li>
												<li><a href="/work/publication/kp_ebook_list.do">학술지검색(e-Book)</a></li>
												
											</ul>
										</li>
										<li><a href="/work/publication/kp_thesis.do">학술지 논문투고</a></li>
										<li><a href="/work/publication/kp_archiveshop.do">교육자료</a></li>
										<li><a href="/work/publication/faq/faq_list.do?faq_category=3">출판 FAQ</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main archive"><a href="/work/archive/ka_archive.do" <% if(fileName.equals("archive")){%> class="on" <%}%>>KDA 회원자료실<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_title">
									<h2>KDA<br/>회원자료실</h2>
									<a href="/use/ku_sitemap.do">전체메뉴 바로가기</a>
								</div>
								<div class="ns_menu">
									<ul class="pr ns_depth1">
										<li class="pa l0 t0"><a href="/work/archive/ka_archive.do">자료실</a>
											<ul class="ns_depth2">
												<li class="pa l0 t31"><a href="/work/archive/ka_hotnews.do?bbs_board_code=91&g_userid=${g_encoded_userid}">식품영양핫뉴스</a></li>
												<li class="pa l0 t59"><a href="/work/archive/ka_management.do?bbs_board_code=63&g_userid=${g_encoded_userid}">급식경영</a></li>
												<li class="pa l0 t87"><a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}">식단 및 레시피</a></li>
												<li class="pa l0 t115"><a href="/work/archive/ka_hygiene.do?bbs_board_code=86&g_userid=${g_encoded_userid}">급식위생</a></li>
												<li class="pa l0 t143"><a href="/work/archive/ka_education.do?bbs_board_code=65&g_userid=${g_encoded_userid}">영양교육</a></li>
												<li class="pa l0 t171"><a href="/work/archive/ka_clinical.do?bbs_board_code=64&g_userid=${g_encoded_userid}">임상영양</a></li>
												<li class="pa l0 t199"><a href="/work/archive/ka_form.do?bbs_board_code=85&g_userid=${g_encoded_userid}">업무서식</a></li>
												
												<li class="pa l193 t0"><a href="/work/archive/ka_literature.do?bbs_board_code=66&g_userid=${g_encoded_userid}">국내외문헌정보</a></li>
												<li class="pa l193 t31"><a href="/work/archive/ka_legal.do">법률정보</a></li>
												<li class="pa l193 t59"><a href="/work/archive/ka_govt.do?bbs_board_code=122&g_userid=${g_encoded_userid}">정부지침서</a></li>
												<li class="pa l193 t87"><a href="/work/archive/ka_story.do?bbs_board_code=22&g_userid=${g_encoded_userid}">영양관련정보</a></li>
												
											</ul>
										</li>
										<li class="pa l193 t143"><a href="/work/archive/ka_club.do">동호회</a>
										<!-- 	<ul class="ns_depth2">
												<li class="pa l0 t31"><a href="/work/archive/ka_specialist.do?bbs_board_code=27">전문영양사</a>
											</ul> -->
										</li>
										<li class="pa l386 t0">
											<ul class="ns_depth2">
												<li class="pa l0 t0"><a href="/work/archive/ka_health.do?bbs_board_code=24&g_userid=${g_encoded_userid}">건강상담영양사</a></li>
												<li class="pa 10 t31"><a href="/work/archive/ka_hospital.do?bbs_board_code=25&g_userid=${g_encoded_userid}">병원영양사</a></li>
												<li class="pa 10 t59"><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=${g_encoded_userid}">급식전문업체영양사</a></li>
												<li class="pa 10 t87"><a href="/work/archive/ka_center.do?bbs_board_code=28&g_userid=${g_encoded_userid}">보건소영양사</a></li>
												<li class="pa 10 t115"><a href="/work/archive/ka_welfare.do?bbs_board_code=29&g_userid=${g_encoded_userid}">사회복지시설영양사</a></li>
												<li class="pa 10 t143"><a href="/work/archive/ka_school.do?bbs_board_code=30&g_userid=${g_encoded_userid}">학교영양사</a></li>
												<li class="pa 10 t171"><a href="/work/archive/ka_industry.do?bbs_board_code=31&g_userid=${g_encoded_userid}">산업체영양사</a></li>
												<li class="pa 10 t199"><a href="/work/archive/ka_counsel.do?bbs_board_code=32&g_userid=${g_encoded_userid}">상담영양사</a></li>
												
												<li class="pa l193 t0"><a href="/work/archive/ka_policestation_group.do?bbs_board_code=106&g_userid=${g_encoded_userid}">경찰서·소방서영양사 </a></li>
												<li class="pa l193 t31"><a href="/work/archive/ka_kindergarten_group.do?bbs_board_code=95&g_userid=${g_encoded_userid}">유치원·어린이집영양사</a></li>
												<li class="pa l193 t59"><a href="/work/archive/ka_child_center.do?bbs_board_code=108&g_userid=${g_encoded_userid}">어린이급식관리지원센터</a></li>
												<li class="pa l193 t87"><a href="/work/archive/ka_christianity.do?bbs_board_code=33&g_userid=${g_encoded_userid}">기독영양사</a></li>
											</ul>
										</li>
										
										<li class="pa l579 t143"><a href="/work/archive/ka_freeboard.do?bbs_board_code=34&g_userid=${g_encoded_userid}">회원게시판</a></li>
										<li class="pa l579 t189"><a href="/work/archive/ka_sinmungo_check.do">영양사신문고</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header E-->
