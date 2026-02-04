<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
	int curDate = Integer.parseInt(KdaStringUtil.getTodayString());
	
%>
<div class="tab t2 div4 mb30">
	<ul>
		<li><a href="/work/education/ke_receipt.do"  <% if( "ke_receipt.do".contains(uri) ) { %>  class="on" <% } %>>등록안내</a></li>
		
		<%if( curDate >= 20250512 && curDate <= 20250725 ) { %>
			<li><a href="/work/education/ke_receipt_application.do" <% if( "ke_receipt_application.do".contains(uri) ) { %>  class="on" <% } %>>등록신청</a></li>
		<% } else if( curDate < 20250512 ) {%>
            <li><a href="#" onclick="alert('등록신청은 추후 안내드릴 예정입니다.')">등록신청</a></li>
		<% } else {%>
			<li><a href="#" onclick="alert('학술대회가 종료되었습니다.')">등록신청</a></li>
		<% } %>
		
		<li>
		
		<%if( curDate >= 20250601 && curDate <= 20250725 ) { %><a href="/xaido/education/2025_gkrtnfeoghl.xlsx" target="_blank">등록확인</a><% } else if( curDate < 20250601 ) { %><a href="#" onclick="alert('등록확인은 추후 안내드릴 예정입니다.')">등록확인</a><% }  else {   %><a href="#" onclick="alert('학술대회가 종료되었습니다.')">등록확인</a><% } %>
		</li>
		
		<li>
		<!-- 등록취소 -->
		<%if( curDate >= 20250512 && curDate <= 20250725 ) { %>
		  <a href="/work/education/ke_receipt_cancel.do" 
		  <% if( "ke_receipt_cancel.do".contains(uri) ) { %> class="on" <% } %>>등록취소</a><% } else if( curDate < 20250512 ) { %><a href="#" onclick="alert('등록취소는 추후 안내드릴 예정입니다.')">등록취소</a><% } else {  %><a href="#" onclick="alert('학술대회가 종료되었습니다.')">등록취소</a><% } %>
		</li>
	</ul>
</div>