<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>

	<div class="s_menu">
		<div class="sm_title">
			<strong>REPORT</strong>
			<h2>면허신고 신청</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li class="on"><a href="/work/research/report/kr_report.do">면허신고 신청</a></li>
			</ul>
		</div>
	</div>
