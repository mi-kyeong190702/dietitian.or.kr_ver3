<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
	<div class="s_menu">
		<div class="sm_title">
					<strong>ABOUT</strong>
					<h2>면허신고 소개</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li <% if(file_path.equals("kr_intro")){%> class="on" <%}%>><a href="/work/research/about/kr_intro.do">면허신고 소개</a></li>
				<li <% if(file_path.equals("kr_basis")){%> class="on" <%}%>><a href="/work/research/about/kr_basis.do">근거법령</a></li>
				<li <% if(file_path.equals("kr_period")){%> class="on" <%}%>><a href="/work/research/about/kr_period.do">면허신고 주기 및 내용</a></li>
				<li <% if(file_path.equals("kr_procedure")){%> class="on" <%}%>><a href="/work/research/about/kr_procedure.do">면허신고 절차</a></li>
			</ul>
		</div>
	</div>
