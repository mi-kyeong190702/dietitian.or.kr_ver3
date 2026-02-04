<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>  
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);   
%>
<div class="tab t1 div5 mb30">
	<ul>
		<li class="kb_main"><a href="./ka_center_notice.do?bbs_board_code=143" <% if( "ka_center_notice.do".contains(uri) ) { %> class="on" <% } %>>공지사항</a>
		</li>
		<li class="kb_man"><a href="./ka_center_info.do?bbs_board_code=144" <% if( "ka_center_info.do".contains(uri) ) { %> class="on" <% } %>>자료실</a>
		</li>
		<li class="kb_main"><a href="./ka_center_info.do?bbs_board_code=145" <% if( "ka_center_info.do".contains(uri) ) { %> class="on" <% } %>>정보나눔방</a>
		</li>
		<li class="kb_main"><a href="./ka_center_meal.do?bbs_board_code=146" <% if( "ka_center_meal.do".contains(uri) ) { %> class="on" <% } %>>급식운영</a>
		</li>
		<li class="kb_main"><a href="./ka_center_pr.do?bbs_board_code=147" <% if( "ka_center_pr.do".contains(uri) ) { %> class="on" <% } %>>시도소식</a>
		</li>
	</ul>
</div>