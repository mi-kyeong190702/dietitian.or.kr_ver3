<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());
	String file_path =  pageName.substring(0, pageName.length()-3);
%>

	<div class="s_menu">
		<div class="sm_title">
			<strong>RECIPIENT</strong>
			<h2>보수교육<br>미대상자</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li <% if(file_path.equals("recipient")){%> class="on" <%}%>><a href="/work/research/recipient/recipient.do">보수교육 미대상자</a></li>
				<li <% if(file_path.equals("recipientModify") || file_path.equals("recipientModifyCheck") || file_path.equals("recipientEduChk") || file_path.equals("recipientModifyForm")){%> class="on" <%}%>><a href="/work/research/recipient/recipientModify.do">보수교육 미대상자 수정</a></li>
			</ul>
			<ul class="sm_depth1">
				
			</ul>
		</div>
	</div>
