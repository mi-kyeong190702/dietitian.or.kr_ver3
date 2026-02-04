<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>	
<div class="tab_2 div3 mb10">
	<ul>
		<li><a href="/work/business/kb_c_child_obesity.do" <% if( "kb_c_child_obesity.do".contains(uri) ) { %> class="on" <% } %>>소아비만의 정의</a></li>
		<li><a href="/work/business/kb_c_child_obesity_cause.do" <% if( "kb_c_child_obesity_cause.do".contains(uri) ) { %> class="on" <% } %>>소아비만의 원인</a></li>
		<li><a href="/work/business/kb_c_child_obesity_problem.do" <% if( "kb_c_child_obesity_problem.do".contains(uri) ) { %> class="on" <% } %>>소아비만의 문제점</a></li>
		<li><a href="/work/business/kb_c_child_obesity_verdict.do" <% if( "kb_c_child_obesity_verdict.do".contains(uri) ) { %> class="on" <% } %>>소아비만정도의 판정</a></li>
		<li><a href="/work/business/kb_c_child_obesity_edu.do" <% if( "kb_c_child_obesity_edu.do".contains(uri) ) { %> class="on" <% } %>>소아비만의 교정과 교육</a></li>
		<li><a href="/work/business/kb_c_child_obesity_diet.do?bbs_board_code=67&bbs_category=소아비만식단" <% if( "kb_c_child_obesity_diet.do".contains(uri) ) { %> class="on" <% } %>>식단</a></li>
	</ul>
</div>
