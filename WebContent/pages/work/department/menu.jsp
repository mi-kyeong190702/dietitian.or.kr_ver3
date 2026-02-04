<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/pages/common.jsp"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
	
	System.out.println(file_path);
	
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>DEPARTMENT</strong>
					<h2>분과별 게시판</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if( file_path.contains("ka_industry") ) {%> class="on" <%}%>><a href="./ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}">산업체</a>
							<ul class="sm_depth2">
								<li><a href="./ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_industry_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_industry_data.do?bbs_board_code=125&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_industry_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_industry_rcp.do?bbs_board_code=127&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_industry_rcp")) {%> class="on" <%}%>>식단 및 레시피</a></li> 
								<li><a href="./ka_industry_info.do?bbs_board_code=126&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_industry_info")) {%> class="on" <%}%>>정보나눔방</a></li>
								
							</ul>
						</li>
						<li <% if( file_path.contains("ka_hospital") ) {%> class="on" <%}%>><a href="./ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}">병원</a>
							<ul class="sm_depth2">
								<li><a href="./ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_hospital_data.do?bbs_board_code=129&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_hospital_info.do?bbs_board_code=130&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital_info")) {%> class="on" <%}%>>전문영양사모임</a></li>
								<li><a href="./ka_hospital_meal.do?bbs_board_code=131&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital_meal")) {%> class="on" <%}%>>정보나눔방</a></li> 
								<li><a href="./ka_hospital_question.do?bbs_board_code=132&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hospital_question")) {%> class="on" <%}%>>질문답하기</a></li>
							</ul>
						</li>						
						<li <% if( file_path.contains("ka_kda") ) {%> class="on" <%}%>><a href="./ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}">영양교사</a>
							<ul class="sm_depth2">
								<li><a href="./ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kda_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_kda_meal.do?bbs_board_code=134&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kda_meal")) {%> class="on" <%}%>>급식운영</a></li>
								<li><a href="./ka_kda_diet.do?bbs_board_code=138&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kda_diet")) {%> class="on" <%}%>>영양교육</a></li>
								<li><a href="./ka_kda_edu.do?bbs_board_code=136&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kda_edu")) {%> class="on" <%}%>>학교식단</a></li>
								<!-- <li><a href="./ka_kda_area.do?bbs_board_code=140,141,142,143,144,145,146,147,148,149,150,151,152,187,188,189,190&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_kda_area")) {%> class="on" <%}%>>시도소식</a></li> -->
							</ul>
						</li>						
						<li <% if( file_path.contains("ka_school") ) {%> class="on" <%}%>><a href="./ka_school_notice.do?bbs_board_code=153&g_userid=${g_encoded_userid}">학교영양사</a>
							<ul class="sm_depth2">
								<li><a href="./ka_school_notice.do?bbs_board_code=153&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_school_data.do?bbs_board_code=154&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_school_rcp.do?bbs_board_code=156&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school_rcp")) {%> class="on" <%}%>>식단 및 레시피</a></li> 
								<li><a href="./ka_school_info.do?bbs_board_code=155&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school_info")) {%> class="on" <%}%>>정보나눔방</a></li>
								<!-- <li><a href="./ka_school_area.do?bbs_board_code=157&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_school_area")) {%> class="on" <%}%>>시도소식</a></li> -->
							</ul>
						</li>
						<li <% if( file_path.contains("ka_center") ) {%> class="on" <%}%>><a href="./ka_center_notice.do?bbs_board_code=170&g_userid=${g_encoded_userid}">보건복지시설</a>
							<ul class="sm_depth2">
								<li><a href="./ka_center_notice.do?bbs_board_code=170&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_center_data.do?bbs_board_code=171&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_center_meal.do?bbs_board_code=173&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center_meal")) {%> class="on" <%}%>>급식운영</a></li>
								<li><a href="./ka_center_info.do?bbs_board_code=172&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center_info")) {%> class="on" <%}%>>정보나눔방</a></li>
								<!-- <li><a href="./ka_center_pr.do?bbs_board_code=174&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_center_pr")) {%> class="on" <%}%>>홍보하기</a></li>-->
							</ul>
						</li> 
						<li <% if( file_path.contains("ka_counsel") ) {%> class="on" <%}%>><a href="./ka_counsel_notice.do?bbs_board_code=175&g_userid=${g_encoded_userid}">건강상담</a>
							<ul class="sm_depth2">
								<li><a href="./ka_counsel_notice.do?bbs_board_code=175&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_counsel_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_counsel_data.do?bbs_board_code=176&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_counsel_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_counsel_info.do?bbs_board_code=177&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_counsel_info")) {%> class="on" <%}%>>정보나눔방</a></li>
								<!-- <li><a href="./ka_counsel_schedule.do?bbs_board_code=178&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_counsel_schedule")) {%> class="on" <%}%>>일정표</a></li> --> 
							</ul>
						</li> 
						<li <% if( file_path.contains("ka_child") ) {%> class="on" <%}%>><a href="./ka_child_notice.do?bbs_board_code=179&g_userid=${g_encoded_userid}">어린이∙사회복지</br>급식관리지원센터</a>
							<ul class="sm_depth2">
								<li><a href="./ka_child_notice.do?bbs_board_code=179&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_notice")) {%> class="on" <%}%>>공지사항</a></li>
								<li><a href="./ka_child_data.do?bbs_board_code=180&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_data")) {%> class="on" <%}%>>자료실</a></li>
								<li><a href="./ka_child_rcp.do?bbs_board_code=182&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_rcp")) {%> class="on" <%}%>>식단 및 레시피</a></li>
								<li><a href="./ka_child_info.do?bbs_board_code=181&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_info")) {%> class="on" <%}%>>정보나눔방</a></li>
								<!--<li><a href="./ka_child_question.do?bbs_board_code=183&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_child_question")) {%> class="on" <%}%>>질문답하기</a></li> -->
							</ul>
						</li> 
					</ul>
				</div>
			</div>
