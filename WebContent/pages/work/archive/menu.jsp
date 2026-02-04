<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/pages/common.jsp"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
	
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>ARCHIVE</strong>
					<h2>KDA 회원자료실</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if( file_path.equals("ka_archive") || file_path.equals("ka_hotnews")
								|| file_path.equals("ka_management") || file_path.equals("ka_recipe")
								|| file_path.equals("ka_hygiene") || file_path.equals("ka_education")
								|| file_path.equals("ka_clinical") || file_path.equals("ka_form")
								|| file_path.equals("ka_literature") || file_path.equals("ka_legal")
								|| file_path.equals("ka_govt") || file_path.equals("ka_story") ) {%> class="on" <%}%>><a href="/work/archive/ka_archive.do">자료실</a>
							<ul class="sm_depth2">
								<li><a href="/work/archive/ka_hotnews.do?bbs_board_code=91&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hotnews")) {%> class="on" <%}%>>식품·영양 News</a></li>
								<li><a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_recipe")) {%> class="on" <%}%>>나의 식단 자랑하기</a></li>
								<li><a href="/work/archive/ka_management.do?bbs_board_code=63&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_management")) {%> class="on" <%}%>>급식경영</a></li>
								<li><a href="/work/archive/ka_hygiene.do?bbs_board_code=86&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hygiene")) {%> class="on" <%}%>>급식위생</a></li>
								<li><a href="/work/archive/ka_education.do?bbs_board_code=65&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_education")) {%> class="on" <%}%>>영양교육</a></li>
								<li><a href="/work/archive/ka_clinical.do?bbs_board_code=64&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_clinical")) {%> class="on" <%}%>>임상영양</a></li>
								<li><a href="/work/archive/ka_form.do?bbs_board_code=85&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_form")) {%> class="on" <%}%>>업무서식</a></li>
								<li><a href="/work/archive/ka_literature.do?bbs_board_code=66&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_literature")) {%> class="on" <%}%>>국내외 문헌정보</a></li>
								<li><a href="/work/archive/ka_legal.do" <% if( file_path.equals("ka_legal")) {%> class="on" <%}%>>법률정보</a></li>
								<li><a href="/work/archive/ka_govt.do?bbs_board_code=122&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_govt")) {%> class="on" <%}%>>정부지침서</a></li>
								<li><a href="/work/archive/ka_story.do?bbs_board_code=22&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_story")) {%>  <%}%>>영양관련정보</a></li>
							</ul>
						</li>
						<!--// 
						<li <% if( file_path.equals("ka_club") || file_path.equals("ka_specialist")
								|| file_path.equals("ka_hospital") || file_path.equals("ka_company")
								|| file_path.equals("ka_center") || file_path.equals("ka_welfare")
								|| file_path.equals("ka_school") || file_path.equals("ka_industry")
								|| file_path.equals("ka_counsel") || file_path.equals("ka_policestation_group")
								|| file_path.equals("ka_kindergarten_group") || file_path.equals("ka_christianity") || file_path.equals("ka_health")
								|| file_path.equals("ka_child_center") || file_path.equals("ka_test") ) {%> class="on" <%}%>><a href="/work/archive/ka_club.do">동호회</a>
							<ul class="sm_depth2">
								<li><a href="/work/archive/ka_health.do?bbs_board_code=24&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_health")) {%> class="on" <%}%>>건강상담영양사</a></li>
								<li><a href="/work/archive/ka_hospital.do?bbs_board_code=25&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital")) {%> class="on" <%}%>>병원영양사</a></li>
								<li><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_company")) {%> class="on" <%}%>>급식전문업체영양사</a></li>
							    <li><a href="/work/archive/ka_specialist.do?bbs_board_code=27" <% if( file_path.equals("ka_specialist")) {%> class="on" <%}%>>전문영양사</a></li>   
								<li><a href="/work/archive/ka_center.do?bbs_board_code=28&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center")) {%> class="on" <%}%>>보건소영양사</a></li>
								<li><a href="/work/archive/ka_welfare.do?bbs_board_code=29&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_welfare")) {%> class="on" <%}%>>사회복지시설영양사</a></li>
								<li><a href="/work/archive/ka_school.do?bbs_board_code=30&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school")) {%> class="on" <%}%>>학교영양사</a></li>
								<li><a href="/work/archive/ka_industry.do?bbs_board_code=31&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_industry")) {%> class="on" <%}%>>산업체영양사</a></li>
								<li><a href="/work/archive/ka_counsel.do?bbs_board_code=32&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_counsel")) {%> class="on" <%}%>>상담영양사</a></li>
								<li><a href="/work/archive/ka_policestation_group.do?bbs_board_code=106&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_policestation_group")) {%> class="on" <%}%>>경찰서·소방서영양사 </a></li>
								<li><a href="/work/archive/ka_kindergarten_group.do?bbs_board_code=95&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kindergarten_group")) {%> class="on" <%}%>>유치원·어린이집영양사</a></li>
								<li><a href="/work/archive/ka_child_center.do?bbs_board_code=108&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_center")) {%> class="on" <%}%>> 어린이급식관리지원센터</a></li>
							    <li><a href="/work/archive/ka_prodietitian.do?bbs_board_code=108" <% if( file_path.equals("ka_prodietitian")) {%> class="on" <%}%>> 영양지원전문영양사</a></li> 
								<li><a href="/work/archive/ka_christianity.do?bbs_board_code=33&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_christianity")) {%> class="on" <%}%>>기독영양사</a></li>
								<li><a href="/work/archive/ka_test.do?bbs_board_code=123&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_test")) {%> class="on" <%}%>>test 게시판</a></li>
							</ul>
						</li>-->
						<li <% if( file_path.equals("ka_diet_manage")) {%> class="on" <%}%>><a href="/work/archive/ka_diet_manage.do?g_userid=${g_encoded_userid}">식단관리 프로그램</a></li>
						<li <% if( file_path.equals("ka_freeboard")) {%> class="on" <%}%>><a href="/work/archive/ka_freeboard.do?bbs_board_code=34&g_userid=${g_encoded_userid}">회원게시판</a></li>
						<li <% if( file_path.equals("ka_sinmungo") || file_path.equals("ka_sinmungo_list")
							    || file_path.equals("ka_sinmungo_view") || file_path.equals("ka_sinmungo_check") 
							    || file_path.equals("ka_sinmungo_write") || file_path.equals("ka_sinmungo_login") ) {%> class="on" <%}%>><a href="/work/archive/ka_sinmungo_check.do">영양사신문고</a></li>
					</ul>
				</div>
			</div>
