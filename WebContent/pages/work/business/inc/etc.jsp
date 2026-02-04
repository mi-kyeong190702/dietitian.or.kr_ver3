<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>	
<div class="tab_2 div4 mb30">
	<ul>
		<li><a href="/work/business/kb_c_etc_osteoporosis.do" <% if( "kb_c_etc_osteoporosis.do".contains(uri) ) { %> class="on" <% } %>>골다공증</a></li>
		<li><a href="/work/business/kb_c_etc_gout.do" <% if( "kb_c_etc_gout.do".contains(uri) ) { %> class="on" <% } %>>통풍</a></li>
		<li><a href="/work/business/kb_c_etc_anemia.do" <% if( "kb_c_etc_anemia.do".contains(uri) ) { %> class="on" <% } %>>빈혈</a></li>
		<li><a href="/work/business/kb_c_etc_constipation.do" <% if( "kb_c_etc_constipation.do".contains(uri) ) { %> class="on" <% } %>>변비</a></li>
		<li><a href="/work/business/kb_c_etc_stroke.do" <% if( "kb_c_etc_stroke.do".contains(uri) ) { %> class="on" <% } %>>뇌졸중</a></li>
		<li><a href="/work/business/kb_c_etc_kidneystone.do" <% if( "kb_c_etc_kidneystone.do".contains(uri) ) { %> class="on" <% } %>>신결석</a></li>
		<li><a href="/work/business/kb_c_etc_diet.do?bbs_board_code=67&bbs_category=기타질환식단" <% if( "kb_c_etc_diet.do".contains(uri) ) { %> class="on" <% } %>>식단</a></li>
	</ul>
</div>