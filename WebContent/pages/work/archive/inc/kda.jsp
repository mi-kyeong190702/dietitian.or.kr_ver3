<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>  
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);   
%>
<div class="tab t1 div5 mb30">
	<ul>
		<li class="kb_main"><a href="./ka_kda_notice.do?bbs_board_code=133" <% if( "ka_kda_notice.do".contains(uri) ) { %> class="on" <% } %>>공지사항</a>
		</li>
		<li class="kb_man"><a href="./ka_kda_meal.do?bbs_board_code=134" <% if( "ka_kda_meal.do".contains(uri) ) { %> class="on" <% } %>>급식운영</a>
		</li>
		<li class="kb_main"><a href="./ka_kda_edu.do?bbs_board_code=135" <% if( "ka_kda_edu.do".contains(uri) ) { %> class="on" <% } %>>영양교육</a>
		</li>
		<li class="kb_main"><a href="./ka_kda_diet.do?bbs_board_code=136" <% if( "ka_kda_diet.do".contains(uri) ) { %> class="on" <% } %>>학교식단</a>
		</li>
		<li class="kb_main"><a href="./ka_kda_area.do?bbs_board_code=137" <% if( "ka_kda_area.do".contains(uri) ) { %> class="on" <% } %>>시도소식</a>
		</li>
	</ul>
</div>
<br />
<% if( "ka_kda_area.do".contains(uri) ) { %> 
<div class="tab t1 div7 mt5">
<ul>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&board_keyword=전체" class="">전체</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&board_keyword=서울" class="">서울</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">부산</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">인천</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">경기</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">강원특별자치도</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">충청북도</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">대전·충남·세종</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">전북특별자치도</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">광주·전남</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">대구·경북</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">경상남도</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">울산</a></li>
   <li><a href="./ka_kda_area.do?bbs_board_code=137&g_userid=" class="">제주특별자치도</a></li> 
   
</ul>
</div>	
<% } %>
<br />