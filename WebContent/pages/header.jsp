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
    <!-- 2025-02-15 .h_bar 영역 삭제 -->
    <div class="wrap">
      <div class="h_logo"> <a href="/index.jsp" title="메인페이지로 이동">
        <h1 class="ti">사단법인 대한영양사협회</h1>
        </a> </div>
      <div class="h_menu">
        <nav id="nav">
          <ul>
            <li class="n_main introduce"><a href="/work/introduction/ki_intro.do" >협회소개</a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>협회소개</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
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
                          <li><a href="/work/introduction/ki_nutrition.do">영양교사</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main news"> <a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}" >협회소식</a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>협회소식</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="pr ns_depth1">
                      <!-- 하위 li 클래스 다 없앰 예) class="pa l0 t46" 2025-02-15-->
                      <li><a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}">공지사항</a></li>
                      <li><a href="/work/news/kn_area_main.do">시도영양사회 </a>
                        <ul class="ns_depth2">
                          <li><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=${g_encoded_userid}">시도영양사회 공지사항</a></li>
                          <li><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48">시도영양사회게시판</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/news/kn_organ_news.do?bbs_board_code=0">관련기관 소식</a></li>
                      <!-- <li><a href="/work/news/kn_division.do?g_userid=${g_encoded_userid}">학교분과</a></li> -->
                      <li><a href="/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_encoded_userid}">협회 활동 현황</a></li>
                      <li><a href="/work/news/kn_re_license.do?g_userid=${g_encoded_userid}">영양사 면허증 재교부</a></li>
                      <li><a href="/work/news/kn_calendar.do">이달의 일정</a></li>
                      <li><a href="/work/news/kn_careers.do">채용정보</a></li>
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main business"><a href="/work/business/kb_nutrition.do">KDA 영양</a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>KDA 영양</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="ns_depth1">
                      <li><a href="/work/business/kb_nutrition.do">영양의 날</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/business/kb_nutrition.do">개요</a></li>
                          <li><a href="/work/business/kb_nutrition_material.do?bbs_board_code=88&g_userid=${g_encoded_userid}">자료실</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/business/kb_farm.do">우리 농축수산물</br>소비촉진</a>
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
                      <li><a href="/work/business/kb_health.do">국민건강증진사업</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/business/kb_health.do">개요</a></li>
                          <li><a href="/work/business/kb_health_material.do?bbs_board_code=11&g_userid=${g_encoded_userid}">자료실</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
                      <!-- li style 다 없앰 예) class="position:absolute; top:100px; left:205px;" 2025-02-15-->
                      <li><a href="/work/business/kb_ko_site.do">관련사이트</a><!-- li style 다 없앰 예) class="position:absolute; top:100px; left:397px;" 2025-02-15-->
                        <ul class="ns_depth2">
                          <li><a href="/work/business/kb_ko_site.do">국내사이트</a></li>
                          <li><a href="/work/business/kb_fo_site.do">국외사이트</a></li>
                          <li><a href="/work/business/kb_fo_nutrition.do">외국영양사회</a></li>
                        </ul>
                      </li>
                      <li></li>
                      <li></li>
                      <!-- 비어있는 li 두개 추가 2025-02-15-->
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main education"><a href="/work/education/ke_menu.do" >KDA 교육</a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>KDA 교육</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="pr ns_depth1">
                      <!-- 하위 li 클래스 다 없앰 예) class="pa l0 t46" 2025-02-15-->
                      <li><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육&g_userid=${g_encoded_userid}">교육지원센터</a></li>
                      <li><a href="/work/education/ke_law_edu.do">영양사 법정교육</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/education/ke_law_edu.do">영양사 보수교육</a></li>
                          <li><a href="/work/education/ke_law_hygiene.do">영양사 식품위생교육</a></li>
                          <li><a href="/work/education/ke_law_secure.do">맞춤형 건강기능식품 안전위생교육</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/education/ke_elderly_info.do">교육과정 안내</a>
                        <ul class="ns_depth2">
                        	<li><a href="/work/education/ke_elderly_info.do">전문교육과정</a></li>
                          <li><a href="/work/education/ke_health_info.do">직무 교육과정 Ⅰ</a></li>
                          <li><a href="/work/education/ke_coach_info.do">직무 교육과정 Ⅱ</a></li>
                          <li><a href="/work/education/ke_online_info.do">온라인 교육과정</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/education/ke_curriculum.do">교육과정신청</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/education/ke_curriculum.do">교육과정 신청</a></li>
                          <li><a href="/work/education/ke_situation.do">교육과정 신청현황</a></li>
                        </ul>
                      </li>
                      <li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/education/ke_contest_info.do">학술대회 안내</a></li>
                          <li><a href="/work/education/ke_program.do">프로그램</a></li>
                          <li><a href="/work/education/ke_document.do">공문다운받기</a></li>
                          <li><a href="/work/education/ke_receipt.do">등록</a></li>
                          <li><a href="/work/education/ke_green.do">초록접수</a></li>
                          <li><a href="/work/education/ke_ebook.do">e-Book보기</a></li>
                        </ul>
                      </li>
                      <li></li>
                      <li></li>
                      <li></li>
                      <!-- 비어있는 li 세개 추가 2025-02-15-->
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main publication"><a href="/work/publication/kp_magazine.do">KDA 출판</a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>KDA 출판</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="ns_depth1">
                      <li><a href="/work/publication/kp_magazine.do">국민영양</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/publication/kp_participation.do">국민영양참여</a></li>
                          <li> <a href="/work/publication/kp_m_list.do">국민영양검색</a> </li>
                        </ul>
                      </li>
                      <!-- <li><a href="/work/publication/kp_journal.do">학술지</a> -->
                      <li><a href="#">학술지</a>
                        <ul class="ns_depth2">
                          <!-- <li><a href="/work/publication/kp_journal_law01.do">학술지규정</a></li>
                          <li><a href="/work/publication/kp_journal_search.do">학술지검색</a></li>
                          <li><a href="/work/publication/kp_ebook_list.do">학술지검색(e-Book)</a></li> -->
                          <li><a href="https://www.koreascience.or.kr/journal/OOSHB5.page" target="_blank">학술지검색</a></li>
                          <li><a href="https://e-jkda.or.kr" target="_blank">저널 홈페이지</a></li>
                          <li><a href="https://jkda.jams.or.kr" target="_blank">온라인 논문투고</a></li>
                        </ul>
                      </li>
                      <!-- <li><a href="/work/publication/kp_thesis.do">학술지 논문투고</a></li> -->
                      <li><a href="/work/publication/kp_archiveshop.do">교육자료</a></li>
                      <li><a href="/work/publication/kp_publishing_form.do">MY 구매정보</a></li>
                      <li><a href="/work/publication/faq/faq_list.do?faq_category=3">출판 FAQ</a></li>
                      <li></li>
                      <li></li>
                      <!-- 비어있는 li 세개 추가 2025-02-15-->
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main archive"><a href="/work/archive/ka_archive.do">KDA 회원자료실<span class="icon_active"></span></a>
              <div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>KDA 회원자료실</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="pr ns_depth1">
                      <!-- 하위 li 클래스 다 없앰 예) class="pa l0 t46" 2025-02-15-->
                      <li><a href="/work/archive/ka_archive.do">자료실</a>
                        <ul class="ns_depth2">
                          <li><a href="/work/archive/ka_hotnews.do?bbs_board_code=91&g_userid=${g_encoded_userid}">식품·영양 News</a></li>
                          <li><a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}">나의 식단 자랑하기</a></li>
                          <li><a href="/work/archive/ka_management.do?bbs_board_code=63&g_userid=${g_encoded_userid}">급식경영</a></li>
                          <li><a href="/work/archive/ka_hygiene.do?bbs_board_code=86&g_userid=${g_encoded_userid}">급식위생</a></li>
                          <li><a href="/work/archive/ka_education.do?bbs_board_code=65&g_userid=${g_encoded_userid}">영양교육</a></li>
                          <li><a href="/work/archive/ka_clinical.do?bbs_board_code=64&g_userid=${g_encoded_userid}">임상영양</a></li>
                          <li><a href="/work/archive/ka_form.do?bbs_board_code=85&g_userid=${g_encoded_userid}">업무서식</a></li>
                          <li><a href="/work/archive/ka_literature.do?bbs_board_code=66&g_userid=${g_encoded_userid}">국내외문헌정보</a></li>
                          <li><a href="/work/archive/ka_legal.do">법률정보</a></li>
                          <li><a href="/work/archive/ka_govt.do?bbs_board_code=122&g_userid=${g_encoded_userid}">정부지침서</a></li>
                          <li><a href="/work/archive/ka_story.do?bbs_board_code=22&g_userid=${g_encoded_userid}">영양관련정보</a></li>
                        </ul>
                      </li>
                      <!-- 
                      <li><a href="/work/archive/ka_club.do">동호회</a> 
                        <ul class="ns_depth2">
                          <li><a href="/work/archive/ka_health.do?bbs_board_code=24&g_userid=${g_encoded_userid}">건강상담영양사</a></li>
                          <li><a href="/work/archive/ka_hospital.do?bbs_board_code=25&g_userid=${g_encoded_userid}">병원영양사</a></li>
                          <li><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=${g_encoded_userid}">급식전문업체영양사</a></li>
                          <li><a href="/work/archive/ka_center.do?bbs_board_code=28&g_userid=${g_encoded_userid}">보건소영양사</a></li>
                          <li><a href="/work/archive/ka_welfare.do?bbs_board_code=29&g_userid=${g_encoded_userid}">사회복지시설영양사</a></li>
                          <li><a href="/work/archive/ka_school.do?bbs_board_code=30&g_userid=${g_encoded_userid}">학교영양사</a></li>
                          <li><a href="/work/archive/ka_industry.do?bbs_board_code=31&g_userid=${g_encoded_userid}">산업체영양사</a></li>
                          <li><a href="/work/archive/ka_counsel.do?bbs_board_code=32&g_userid=${g_encoded_userid}">상담영양사</a></li>
                          <li><a href="/work/archive/ka_policestation_group.do?bbs_board_code=106&g_userid=${g_encoded_userid}">경찰서·소방서영양사 </a></li>
                          <li><a href="/work/archive/ka_kindergarten_group.do?bbs_board_code=95&g_userid=${g_encoded_userid}">유치원·어린이집영양사</a></li>
                          <li><a href="/work/archive/ka_child_center.do?bbs_board_code=108&g_userid=${g_encoded_userid}">어린이급식관리지원센터</a></li>
                          <li><a href="/work/archive/ka_christianity.do?bbs_board_code=33&g_userid=${g_encoded_userid}">기독영양사</a></li>
                        </ul>
                      </li>
                       -->
                       <li><a href="/work/archive/ka_diet_manage.do?g_userid=${g_encoded_userid}">식단관리프로그램</a></li>
                      <li><a href="/work/archive/ka_freeboard.do?bbs_board_code=34&g_userid=${g_encoded_userid}">회원게시판</a></li>
                      <li><a href="/work/archive/ka_sinmungo_check.do">영양사신문고</a></li>
                    </ul>
                  </div>
                </div>
                <!-- n_sub_inner div영역 감싸기 2025-02-15--> 
              </div>
            </li>
            <li class="n_main archive"><a href="/work/department/ka_club.do">분과별 게시판<span class="icon_active"></span></a>
            	<div class="n_sub">
                <div class="n_sub_inner"><!-- n_sub_inner div영역 감싸기 2025-02-15-->
                  <div class="ns_title"><!-- 2025-02-15 이미지 추가 및 문구변경 -->
                    <h2>분과별 게시판</h2>
                    <p>대한영양사협회 홈페이지에  <br/>방문해 주셔서 감사합니다.</p>
                  </div>
                  <div class="ns_menu">
                    <ul class="pr ns_depth1">
	                   	<li><a href="/work/department/ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}">산업체</a>
	                   		<ul class="ns_depth2">
	                    		<li><a href="/work/department/ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}">공지사항</a></li>
	                    		<li><a href="/work/department/ka_industry_data.do?bbs_board_code=125&g_userid=${g_encoded_userid}">자료실</a></li>
	                    		<li><a href="/work/department/ka_industry_rcp.do?bbs_board_code=127&g_userid=${g_encoded_userid}">식단및레시피</a></li>
	                    		<li><a href="/work/department/ka_industry_info.do?bbs_board_code=126&g_userid=${g_encoded_userid}">정보나눔방</a></li>
	                            <li></li>
	                    	</ul>
	                    </li>
	                    <li><a href="/work/department/ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}">병원</a>
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_hospital_data.do?bbs_board_code=129&g_userid=${g_encoded_userid}">자료실</a></li>
	                        	<li><a href="/work/department/ka_hospital_info.do?bbs_board_code=130&g_userid=${g_encoded_userid}">전문영양사모임</a></li>
	                        	<li><a href="/work/department/ka_hospital_meal.do?bbs_board_code=131&g_userid=${g_encoded_userid}">정보나눔방</a></li>
	                        	<li><a href="/work/department/ka_hospital_question.do?bbs_board_code=132&g_userid=${g_encoded_userid}">질문답하기</a></li>
	                        </ul>
	                    </li>
	                    <li><a href="/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}">영양교사</a>
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_kda_meal.do?bbs_board_code=134&g_userid=${g_encoded_userid}">급식운영</a></li>
	                        	<li><a href="/work/department/ka_kda_diet.do?bbs_board_code=138&g_userid=${g_encoded_userid}">영양교육</a></li>
	                        	<li><a href="/work/department/ka_kda_edu.do?bbs_board_code=136&g_userid=${g_encoded_userid}">학교식단</a></li>	                        	
	                        	<!-- <li><a href="/work/department/ka_kda_area.do?bbs_board_code=140,141,142,143,144,145,146,147,148,149,150,151,152&g_userid=${g_encoded_userid}">시도소식</a></li> -->
	                        </ul>
	                    </li>
	                    <li><a href="/work/department/ka_school_notice.do?bbs_board_code=153&g_userid=${g_encoded_userid}">학교영양사</a><!--/li></li 삭제 -->
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_school_notice.do?bbs_board_code=153&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_school_data.do?bbs_board_code=154&g_userid=${g_encoded_userid}">자료실</a></li>
	                        	<li><a href="/work/department/ka_school_rcp.do?bbs_board_code=156&g_userid=${g_encoded_userid}">식단 및 레시피</a></li>
	                        	<li><a href="/work/department/ka_school_info.do?bbs_board_code=155&g_userid=${g_encoded_userid}">정보나눔방</a></li>
	                        	<!-- <li><a href="/work/department/ka_school_area.do?bbs_board_code=157&g_userid=${g_encoded_userid}">시도소식</a></li> -->
	                        </ul>
	                    </li>
	                    <li><a href="/work/department/ka_center_notice.do?bbs_board_code=170&g_userid=${g_encoded_userid}">보건복지시설</a><!--/li></li 삭제 -->
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_center_notice.do?bbs_board_code=170&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_center_data.do?bbs_board_code=171&g_userid=${g_encoded_userid}">자료실</a></li>
	                        	<li><a href="/work/department/ka_center_meal.do?bbs_board_code=173&g_userid=${g_encoded_userid}">급식운영</a></li>
	                        	<li><a href="/work/department/ka_center_info.do?bbs_board_code=172&g_userid=${g_encoded_userid}">정보나눔방</a></li>	                        	
	                        	<!-- <li><a href="/work/department/ka_center_pr.do?bbs_board_code=174&g_userid=${g_encoded_userid}">홍보하기</a></li> -->
	                        </ul>
	                    </li>
	                    <li><a href="/work/department/ka_counsel_notice.do?bbs_board_code=175&g_userid=${g_encoded_userid}">건강상담</a><!--/li></li 삭제 -->
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_counsel_notice.do?bbs_board_code=175&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_counsel_data.do?bbs_board_code=176&g_userid=${g_encoded_userid}">자료실</a></li>
	                        	<li><a href="/work/department/ka_counsel_info.do?bbs_board_code=177&g_userid=${g_encoded_userid}">정보나눔방</a></li>
	                        	<!-- <li><a href="/work/department/ka_counsel_schedule.do?bbs_board_code=178&g_userid=${g_encoded_userid}">일정표</a></li> -->
	                        </ul>
	                    </li>
	                    <li><a href="/work/department/ka_child_notice.do?bbs_board_code=179&g_userid=${g_encoded_userid}">어린이·사회복지</br>급식관리지원센터</a><!--/li></li 삭제 -->
	                        <ul class="ns_depth2">
	                        	<li><a href="/work/department/ka_child_notice.do?bbs_board_code=179&g_userid=${g_encoded_userid}">공지사항</a></li>
	                        	<li><a href="/work/department/ka_child_data.do?bbs_board_code=180&g_userid=${g_encoded_userid}">자료실</a></li>
	                        	<li><a href="/work/department/ka_child_rcp.do?bbs_board_code=182&g_userid=${g_encoded_userid}">식단 및 레시피</a></li>
	                        	<li><a href="/work/department/ka_child_info.do?bbs_board_code=181&g_userid=${g_encoded_userid}">정보나눔방</a></li>
	                        	<!-- <li><a href="/work/department/ka_child_question.do?bbs_board_code=183&g_userid=${g_encoded_userid}">질문답하기</a></li> -->
	                        </ul>
	                    </li>
            </li>
          </ul>
        </nav>
      </div>
      <div class="h_topmenu" ><!-- 2025-02-14 위치 이동 -->
        <h2 class="ti">상단메뉴</h2>
        <ul>
          <!--li class="start"><a href="/index.jsp">HOME</a></li--><!-- 2025-02-14 주석 처리 -->
          <%  if (!g_isLogin) { %>
          	<li><a href="/login/kl_login_nor.do"><i class="_ico login"></i><span>로그인</span></a></li>
          <%  } else { %> 
          <!-- <li class="point_area">포인트 : <strong><%=g_pers_point %></strong>점</li> -->
	      	<li><a href="/pages/login/kl_logout.jsp"><i class="_ico login"></i><span>로그아웃</span></a></li>
          	<li><a href="/kmp_payment.do?doc_code=0105"><i class="_ico mypage"></i><span>마이페이지</span></a></li>
          <%  } %>
          <li><a href="/work/introduction/ki_location.do"><i class="_ico location"></i><span>협회위치</span></a></li>
          <li><a href="/use/ku_sitemap.do"><i class="_ico sitemap"></i><span>전체메뉴</span></a></li>
          <!--li><a href="/pages/login/kl_logout.jsp">로그아웃(포인트:<%=g_pers_point %> 점)</a></li>
			<li><a href="/kmp_payment.do?doc_code=0105">마이페이지</a></li--> 
          <!--li><a href="/member/km_join.do">회원가입</a></li>
          <li><a href="/use/ku_sitemap.do">이용안내</a></li>
          <li><a href="/work/introduction/ki_location.do">Contact Us</a></li--><!-- 2025-02-14 주석 처리 -->
        </ul>
      </div>
    </div>
  </header>
  <!-- Header E-->  