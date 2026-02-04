<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>	
<div class="tab_2 div5">
	<ul>
		<li><a href="/work/business/kb_c_diabetes.do" <% if( "kb_c_diabetes.do".contains(uri) ) { %> class="on" <% } %> >당뇨의 정의</a></li>
		<li><a href="/work/business/kb_c_diabetes_kind.do" <% if( "kb_c_diabetes_kind.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 분류</a></li>
		<li><a href="/work/business/kb_c_diabetes_symptom.do" <% if( "kb_c_diabetes_symptom.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 증상</a></li>
		<li><a href="/work/business/kb_c_diabetes_diagnosis.do" <% if( "kb_c_diabetes_diagnosis.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 진단</a></li>
		<li><a href="/work/business/kb_c_diabetes_cure.do" <% if( "kb_c_diabetes_cure.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 치료</a></li>
		<li><a href="/work/business/kb_c_diabetes_care.do" <% if( "kb_c_diabetes_care.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 관리</a></li>
		<li><a href="/work/business/kb_c_diabetes_disease.do" <% if( "kb_c_diabetes_disease.do".contains(uri) ) { %> class="on" <% } %>>당뇨의 합병증</a></li>
		<li><a href="/work/business/kb_c_diabetes_meal.do" <% if( "kb_c_diabetes_meal.do".contains(uri) ) { %> class="on" <% } %>>식사요법</a></li>
		<li><a href="/work/business/kb_c_diabetes_pregnancy.do" <% if( "kb_c_diabetes_pregnancy.do".contains(uri) ) { %> class="on" <% } %>>임신성 당뇨</a></li>
		<li><a href="/work/business/kb_c_diabetes_diet.do?bbs_board_code=67&bbs_category=당뇨식단" <% if( "kb_c_diabetes_diet.do".contains(uri) ) { %> class="on" <% } %>>식단</a></li>
	</ul>
</div>