<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>

<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
	
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>NEWS</strong>
					<h2>협회 소식</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if(file_path.equals("kn_notice") ) {%> class="on" <%}%>>
							<a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}">공지사항</a>
								
						<li <% if(file_path.equals("kn_area_notice")
						 		|| file_path.equals("kn_area_notice_view")
								|| file_path.equals("kn_area_notice_write")
								|| file_path.equals("kn_area_board_view")
								|| file_path.equals("kn_area_board_write")								
								|| file_path.equals("kn_area_board")
								|| file_path.equals("kn_area_board_view")
								|| file_path.equals("kn_area_board_write") 
								|| file_path.equals("kn_area_main")){%> class="on" <%}%>>
							<a href="/work/news/kn_area_main.do">시도영양사회</a>
							<ul class="sm_depth2">
								<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=${g_encoded_userid}" 
								<% if(file_path.equals("kn_area_notice")
									|| file_path.equals("kn_area_notice_view")
									|| file_path.equals("kn_area_notice_write")) {%> class="on" <%}%>>시도영양사회 공지사항</a></li>
								<li><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48&g_userid=${g_encoded_userid}" 
								<% if(file_path.equals("kn_area_board")
									|| file_path.equals("kn_area_board_view")
									|| file_path.equals("kn_area_board_write")) {%> class="on" <%}%>>시도영양사회 게시판</a></li>
							</ul>
						</li>
						<li <% if(file_path.equals("kn_organ_news")
								|| file_path.equals("kn_organ_news_view")
								|| file_path.equals("kn_organ_news_write")) {%> class="on" <%}%>>
								<a href="/work/news/kn_organ_news.do?bbs_board_code=0&g_userid=${g_encoded_userid}">관련기관 소식</a></li>
						<%-- <li <% if(file_path.equals("kn_division")) {%> class="on" <%}%>><a href="/work/news/kn_division.do?g_userid=${g_encoded_userid}">학교분과</a></li> --%>
						<%-- <li <% if(file_path.equals("kn_senior")) {%> class="on" <%}%>><a href="/work/news/kn_senior.do">시니어직능클럽</a></li> --%>
						<li <% if(file_path.equals("kn_gallery")) {%> class="on" <%}%>><a href="/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_encoded_userid}">협회 활동 현황</a></li>
						<li <% if(file_path.equals("kn_re_license")) {%> class="on" <%}%>><a href="/work/news/kn_re_license.do?g_userid=${g_encoded_userid}">영양사면허증재교부</a></li>
						<!-- 2022.04.01 주석처리
						<li <% if(file_path.equals("kn_info_license") || file_path.equals("kn_license")) {%> class="on" <%}%>><a href="/work/news/kn_info_license.do">영양사 카드</a>
						-->
							<!-- 
							<ul class="sm_depth2">
								<li><a href="/work/news/kn_info_license.do" <% if(file_path.equals("kn_info_license")) {%> class="on" <%}%>>영양사카드발급안내</a></li>
								<li><a href="/work/news/kn_license.do" <% if(file_path.equals("kn_license")) {%> class="on" <%}%>>영양사카드발급신청</a></li>
							</ul>
							 -->
						</li>
						<li <% if(file_path.contains("kn_calendar")) {%> class="on" <%}%>><a href="/work/news/kn_calendar.do">이달의 일정</a></li>
						<li <% if(file_path.contains("kn_careers")) {%> class="on" <%}%>><a href="/work/news/kn_careers.do">채용정보</a></li>
					</ul>
				</div>
			</div>
