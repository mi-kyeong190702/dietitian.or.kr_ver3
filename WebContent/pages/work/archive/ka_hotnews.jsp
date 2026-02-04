<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%	
	String work_userid = ParamUtils.getParameter(request, "g_userid", "0");

	// 정상적인 값으로 넘옴
	System.out.println("story g_userid : " + work_userid);

	work_userid = work_userid.replace("!", "%21");
	work_userid = work_userid.replace("@", "%40");
	work_userid = work_userid.replace("#", "%23");
	work_userid = work_userid.replace("~", "%7E");

%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">식품·영양</mark> News</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_archive.do">자료실</a></li>
				<li><a href="/work/archive/ka_hotnews.do?bbs_board_code=91&g_userid=<%=work_userid%>" class="cm">식품·영양 News</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!-- <div class="tab div3 mb40"> -->
		<div class="tab_2 div2 mb30">
			<ul>
				<li><a href="./ka_hotnews.do?bbs_board_code=91&g_userid=<%=work_userid%>" <c:if test="${param.bbs_board_code == 91 }"> class="on" </c:if>  >식품·영양 News</a></li>
				<%-- <li><a href="./ka_hotnews.do?bbs_board_code=107" <c:if test="${param.bbs_board_code == 107 }"> class="on" </c:if> >'생생'정보</a></li> 20151007 요청으로 인한 삭제--%>
				<li><a href="./ka_hotnews.do?bbs_board_code=87&g_userid=<%=work_userid%>" <c:if test="${param.bbs_board_code == 87 }"> class="on" </c:if> >협회 News</a></li>
				</ul>
			</div>
					
	<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>
