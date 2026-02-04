<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>EXHIBIT</strong>
					<h2>식품·기기전시회</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if(file_path.equals("keh_summary") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_summary.do">행사개요</a></li>
						<li <% if(file_path.equals("keh_schedule") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_schedule.do">전시회일정</a></li>
						<li <% if(file_path.equals("keh_participation") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_participation.do">참가방법</a></li>
						<li <% if(file_path.equals("keh_past") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_past.do">전년도 행사전경</a></li>
						<li <% if(file_path.equals("keh_inquiry") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_inquiry.do">참가신청 및 문의</a></li>
						<li <% if(file_path.equals("keh_form") ) {%> class="on" <%}%> ><a href="/work/exhibit/keh_form.do">서식</a></li>
					</ul>
				</div>
			</div>


