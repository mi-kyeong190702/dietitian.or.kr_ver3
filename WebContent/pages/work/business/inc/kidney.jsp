<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>

<div class="tab_2 div5 mb30">
	<ul>
		<li><a href="/work/business/kb_c_kidney.do" <% if( "kb_c_kidney.do".contains(uri) ) { %> class="on" <% } %>>신장질환</a></li>
		<li><a href="/work/business/kb_c_kidney_glomerulonephritis.do" <% if( "kb_c_kidney_glomerulonephritis.do".contains(uri) ) { %> class="on" <% } %>>사구체신염</a></li>
		<li><a href="/work/business/kb_c_kidney_syndrome.do" <% if( "kb_c_kidney_syndrome.do".contains(uri) ) { %> class="on" <% } %>>신증후군</a></li>
		<li><a href="/work/business/kb_c_kidney_failure.do" <% if( "kb_c_kidney_failure.do".contains(uri) ) { %> class="on" <% } %>>만성신부전</a></li>
		<li><a href="/work/business/kb_c_kidney_dialysis01.do" <% if( "kb_c_kidney_dialysis01.do".contains(uri) ) { %> class="on" <% } %>>혈액투석</a></li>
		<li><a href="/work/business/kb_c_kidney_dialysis02.do" <% if( "kb_c_kidney_dialysis02.do".contains(uri) ) { %> class="on" <% } %>>복막투석</a></li>
		<li><a href="/work/business/kb_c_kidney_transplant.do" <% if( "kb_c_kidney_transplant.do".contains(uri) ) { %> class="on" <% } %>>신장이식</a></li>
		<li><a href="/work/business/kb_c_kidney_consideration.do" <% if( "kb_c_kidney_consideration.do".contains(uri) ) { %> class="on" <% } %>>염분제한시 고려사항</a></li>
		<li><a href="/work/business/kb_c_kidney_diet.do?bbs_board_code=67&bbs_category=신장질환식단" <% if( "kb_c_kidney_diet.do".contains(uri) ) { %> class="on" <% } %>>식단</a></li>
	</ul>
</div>