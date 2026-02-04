<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>	
<div class="tab_2 div4 mb30">
	<ul>
		<li><a href="/work/business/kb_c_family_baby.do" <% if( "kb_c_family_baby.do".contains(uri) ) { %> class="on" <% } %>>영아기</a></li>
		<li><a href="/work/business/kb_c_family_infancy.do" <% if( "kb_c_family_infancy.do".contains(uri) ) { %> class="on" <% } %>>유아기</a></li>
		<li><a href="/work/business/kb_c_family_schoolage.do" <% if( "kb_c_family_schoolage.do".contains(uri) ) { %> class="on" <% } %>>학동기</a></li>
		<li><a href="/work/business/kb_c_family_adolescent.do" <% if( "kb_c_family_adolescent.do".contains(uri) ) { %> class="on" <% } %>>청소년기</a></li>
		<li><a href="/work/business/kb_c_family_adult.do" <% if( "kb_c_family_adult.do".contains(uri) ) { %> class="on" <% } %>>성인기</a></li>
		<li><a href="/work/business/kb_c_family_pregnancy.do" <% if( "kb_c_family_pregnancy.do".contains(uri) ) { %> class="on" <% } %>>임신수유기</a></li>
		<li><a href="/work/business/kb_c_family_elderly.do" <% if( "kb_c_family_elderly.do".contains(uri) ) { %> class="on" <% } %>>노년기</a></li>
	</ul>
</div>