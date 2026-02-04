<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>  
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);   
%>
<div class="tab t1 div5 mb30">
	<ul>
		<li class="kb_main"><a href="./ka_school_notice.do?bbs_board_code=133" <% if( "ka_school_notice.do".contains(uri) ) { %> class="on" <% } %>>공지사항</a>
		</li>
		<li class="kb_man"><a href="./ka_school_data.do?bbs_board_code=134" <% if( "ka_school_data.do".contains(uri) ) { %> class="on" <% } %>>자료실</a>
		</li>
		<li class="kb_main"><a href="./ka_school_info.do?bbs_board_code=135" <% if( "ka_school_info.do".contains(uri) ) { %> class="on" <% } %>>정보나눔방</a>
		</li>
		<li class="kb_main"><a href="./ka_school_rcp.do?bbs_board_code=136" <% if( "ka_school_rcp.do".contains(uri) ) { %> class="on" <% } %>>식단 및 레시피</a>
		</li>
		<li class="kb_main"><a href="./ka_school_area.do?bbs_board_code=137" <% if( "ka_school_area.do".contains(uri) ) { %> class="on" <% } %>>시도소식</a>
		</li>
	</ul>
</div>