<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>  
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);   
%>
<div class="tab t1 div4 mb30">
	<ul>
		<li class="kb_main"><a href="./ka_industry_notice.do?bbs_board_code=124" <% if( "ka_industry_notice.do".contains(uri) ) { %> class="on" <% } %>>공지사항</a>
		</li>
		<li class="kb_man"><a href="./ka_industry_data.do?bbs_board_code=125" <% if( "ka_industry_data.do".contains(uri) ) { %> class="on" <% } %>>자료실</a>
		</li>
		<li class="kb_main"><a href="./ka_industry_info.do?bbs_board_code=126" <% if( "ka_industry_info.do".contains(uri) ) { %> class="on" <% } %>>정보나눔방</a>
		</li>
		<li class="kb_main"><a href="./ka_industry_rcp.do?bbs_board_code=127" <% if( "ka_industry_rcp.do".contains(uri) ) { %> class="on" <% } %>>식단 및 레시피</a>
		</li>
	</ul>
</div>