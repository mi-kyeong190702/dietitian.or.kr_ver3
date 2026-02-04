<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>
<div class="tab_2 div5 mb30">
	<ul>
		<li><a href="/work/business/kb_c_heart.do" <% if( "kb_c_heart.do".contains(uri) ) { %> class="on" <% } %>>콜레스테롤과 지방</a></li>
		<li><a href="/work/business/kb_c_heart_risk.do" <% if( "kb_c_heart_risk.do".contains(uri) ) { %> class="on" <% } %>>위험요인</a></li>
		<li><a href="/work/business/kb_c_heart_hypertension.do" <% if( "kb_c_heart_hypertension.do".contains(uri) ) { %> class="on" <% } %>>고혈압</a></li>
		<li><a href="/work/business/kb_c_heart_hyperlipidemia.do" <% if( "kb_c_heart_hyperlipidemia.do".contains(uri) ) { %> class="on" <% } %>>고지혈</a></li>
		<li><a href="/work/business/kb_c_heart_disease.do" <% if( "kb_c_heart_disease.do".contains(uri) ) { %> class="on" <% } %>>관상동맥질환</a></li>
		<li><a href="/work/business/kb_c_heart_congestive.do" <% if( "kb_c_heart_congestive.do".contains(uri) ) { %> class="on" <% } %>>울혈성심부전</a></li>
		<li><a href="/work/business/kb_c_heart_surgery.do" <% if( "kb_c_heart_surgery.do".contains(uri) ) { %> class="on" <% } %>>심장수술</a></li>
		<li><a href="/work/business/kb_c_heart_life.do" <% if( "kb_c_heart_life.do".contains(uri) ) { %> class="on" <% } %>>식생활지침</a></li>
		<li><a href="/work/business/kb_c_heart_diet.do?bbs_board_code=67&bbs_category=심혈관계질환식단" <% if( "kb_c_heart_diet.do".contains(uri) ) { %> class="on" <% } %>>식단</a></li>
	</ul>
</div>
	