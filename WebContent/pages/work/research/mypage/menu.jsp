<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
	<div class="s_menu">
		<div class="sm_title">
					<strong>MYPAGE</strong>
					<h2>마이페이지</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li <% if(file_path.equals("km_report")){%> class="on" <%}%>><a href="/work/research/mypage/km_report.do">면허신고 현황</a></li>
				<li <% if(file_path.equals("km_update") || file_path.equals("km_action")){%> class="on" <%}%>><a href="/work/research/mypage/km_update.do">면허신고 수정</a></li>
				<li <% if(file_path.equals("km_education")){%> class="on" <%}%>><a href="/work/research/mypage/km_education.do">보수교육 현황</a></li>
				<li <% if(file_path.equals("km_pw_change")){%> class="on" <%}%>><a href="/work/research/mypage/km_pw_change.do">비밀번호 변경</a></li>
				<c:if test="${null eq loginVo}">
				<li <% if(file_path.equals("km_pw_find")){%> class="on" <%}%>><a href="/work/research/mypage/km_pw_find.do">비밀번호 찾기</a></li>
				</c:if>
			</ul>
		</div>
	</div>
