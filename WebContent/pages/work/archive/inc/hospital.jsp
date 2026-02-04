<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>  
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);   
%>
<div class="tab t1 div5 mb30">
	<ul>
		<li class="kb_main"><a href="./ka_hospital_notice.do?bbs_board_code=128" <% if( "ka_hospital_notice.do".contains(uri) ) { %> class="on" <% } %>>공지사항</a>
		</li>
		<li class="kb_man"><a href="./ka_hospital_data.do?bbs_board_code=129" <% if( "ka_hospital_data.do".contains(uri) ) { %> class="on" <% } %>>자료실</a>
		</li>
		<li class="kb_main"><a href="./ka_hospital_info.do?bbs_board_code=130" <% if( "ka_hospital_info.do".contains(uri) ) { %> class="on" <% } %>>정보나눔방</a>
		</li>
		<li class="kb_main"><a href="./ka_hospital_meal.do?bbs_board_code=131" <% if( "ka_hospital_meal.do".contains(uri) ) { %> class="on" <% } %>>급식 운영</a>
		</li>
		<li class="kb_main"><a href="./ka_hospital_question.do?bbs_board_code=132" <% if( "ka_hospital_question.do".contains(uri) ) { %> class="on" <% } %>>질문 답하기</a>
		</li>
	</ul>
</div>