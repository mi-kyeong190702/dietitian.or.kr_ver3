<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>	
<div class="tab_2 div4 mb30">
	<ul>
		<li><a href="/work/business/kb_c_tubefeeding.do" <% if( "kb_c_tubefeeding.do".contains(uri) ) { %> class="on" <% } %>>경관급식이란</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_patient.do" <% if( "kb_c_tubefeeding_patient.do".contains(uri) ) { %> class="on" <% } %>>경관급식의 적용과 금기환자</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_supply.do" <% if( "kb_c_tubefeeding_supply.do".contains(uri) ) { %> class="on" <% } %>>경관급식의 공급경로</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_duality.do" <% if( "kb_c_tubefeeding_duality.do".contains(uri) ) { %> class="on" <% } %>>투여경로에 따른 장단점</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_nutrient.do" <% if( "kb_c_tubefeeding_nutrient.do".contains(uri) ) { %> class="on" <% } %>>영양소필요량의 결정</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_manner.do" <% if( "kb_c_tubefeeding_manner.do".contains(uri) ) { %> class="on" <% } %>>주입방법</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_kind.do" <% if( "kb_c_tubefeeding_kind.do".contains(uri) ) { %> class="on" <% } %>>경관급식용 영양액의 종류</a></li>
		<li><a href="/work/business/kb_c_tubefeeding_ingredient.do" <% if( "kb_c_tubefeeding_ingredient.do".contains(uri) ) { %> class="on" <% } %>>영양약의 영양성분</a></li>
	</ul>
</div>
