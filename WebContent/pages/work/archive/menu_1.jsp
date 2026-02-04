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
								<li><a href="/work/archive/ka_hotnews.do?bbs_board_code=91&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_hotnews")) {%> class="on" <%}%>>식품영양 핫뉴스</a></li>
								<li><a href="/work/archive/ka_management.do?bbs_board_code=63&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_management")) {%> class="on" <%}%>>급식경영</a></li>
								<li><a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}" <% if( file_path.equals("ka_recipe")) {%> class="on" <%}%>>식단 및 레시피</a></li>
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
						<li <% if( file_path.equals("ka_club") || file_path.contains("ka_industry") 
								|| file_path.contains("ka_hospital") || file_path.contains("ka_school") 
								|| file_path.contains("ka_kda") || file_path.contains("ka_counsel")
								|| file_path.contains("ka_child") || file_path.contains("ka_center")) {%> class="on" <%}%>><a href="/work/archive/ka_club.do">분과별 게시판</a>
							<ul class="sm_depth2">
								<li><a href="/work/archive/ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_industry")) {%> class="on" <%}%>>산업체</a></li>
								<li><a href="/work/archive/ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_hospital")) {%> class="on" <%}%>>병원</a></li> 
								<li><a href="/work/archive/ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_kda")) {%> class="on" <%}%>>영양교사</a></li>
								<li><a href="/work/archive/ka_school_notice.do?bbs_board_code=138&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_school")) {%> class="on" <%}%>>학교영양사</a></li>
								<li><a href="/work/archive/ka_center_notice.do?bbs_board_code=143&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_center")) {%> class="on" <%}%>>보건복지시설</a></li>
								<li><a href="/work/archive/ka_counsel_notice.do?bbs_board_code=148&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_counsel")) {%> class="on" <%}%>>건강상담</a></li>
								<li><a href="/work/archive/ka_child_notice.do?bbs_board_code=152&g_userid=${g_encoded_userid}" <% if( file_path.contains("ka_child")) {%> class="on" <%}%>>어린이급식관리지원센터</a></li>
							 </ul>
						</li>
						<li <% if( file_path.equals("ka_freeboard")) {%> class="on" <%}%>><a href="/work/archive/ka_freeboard.do?bbs_board_code=34&g_userid=${g_encoded_userid}">회원게시판</a></li>
						<li <% if( file_path.equals("ka_sinmungo_check")) {%> class="on" <%}%>><a href="/work/archive/ka_sinmungo_check.do">영양사신문고</a></li>
					</ul>
				</div>
			</div>
