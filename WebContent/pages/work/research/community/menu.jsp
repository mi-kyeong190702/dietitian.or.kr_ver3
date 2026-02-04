<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
	<div class="s_menu">
		<div class="sm_title">
					<strong>COMMUNITY</strong>
					<h2>커뮤니티</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li <% if(file_path.equals("kr_notice")){%> class="on" <%}%>><a href="/work/research/community/kr_notice.do?bbs_cd=001">공지사항</a></li>
				<li <% if(file_path.equals("kr_faq")){%> class="on" <%}%>><a href="/work/research/community/kr_faq.do?bbs_cd=002">FAQ</a></li>
				<li <% if(file_path.equals("kr_inquiry")){%> class="on" <%}%>><a href="/work/research/community/kr_inquiry.do?bbs_cd=003">문의하기</a></li>
			</ul>
		</div>
	</div>
