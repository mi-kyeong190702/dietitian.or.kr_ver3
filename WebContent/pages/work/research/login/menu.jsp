<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>

	<div class="s_menu">
		<div class="sm_title">
			<strong>LOGIN</strong>
			<h2>로그인</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li class="on"><a href="/work/research/login/kl_login.do">로그인</a></li>
			</ul>
		</div>
	</div>
