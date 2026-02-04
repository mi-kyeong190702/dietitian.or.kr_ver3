<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="kda.SessionInfo" %>
<%	
	SessionInfo sessionInfo2 = new SessionInfo ( session );
	String work_userid = ParamUtils.getParameter(request, "g_userid", "0");
	int g_user_level = sessionInfo2.getUserLevel();
	String g_code_big = sessionInfo2.getCodebig();
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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양교사</mark> 시도소식</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/department/ka_club.do">분과별 게시판</a></li>
				<li><a href="/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=<%=work_userid%>">영양교사</a></li>
				<li><a href="/work/department/ka_kda_area.do?bbs_board_code=140,141,142,143,144,145,146,147,148,149,150,151,152,187,188,189,190&g_userid=<%=work_userid%>" class="cm">시도소식</a></li>
			</ul>
		</div>
	</div>
	<br/><br/>
			<div class="tab t1 div6 mt5">
	<%
		String codes = request.getParameter("bbs_board_code");		
		String all = "";
		if ( codes.split(",").length > 1 )
			all = "on";
	%>
	<ul>
	   <li><a href="./ka_kda_area.do?bbs_board_code=140,141,142,143,144,145,146,147,148,149,150,151,152,187,188,189,190&g_userid=<%=work_userid%>" class="<%=all%>">전체</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=140&g_userid=<%=work_userid%>" class="<% if (codes.equals("140")) out.print("on");%>">서울특별시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=141&g_userid=<%=work_userid%>" class="<% if (codes.equals("141")) out.print("on");%>">부산광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=142&g_userid=<%=work_userid%>" class="<% if (codes.equals("142")) out.print("on");%>">인천광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=143&g_userid=<%=work_userid%>" class="<% if (codes.equals("143")) out.print("on");%>">경기도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=144&g_userid=<%=work_userid%>" class="<% if (codes.equals("144")) out.print("on");%>">강원특별자치도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=145&g_userid=<%=work_userid%>" class="<% if (codes.equals("145")) out.print("on");%>">충청북도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=146&g_userid=<%=work_userid%>" class="<% if (codes.equals("146")) out.print("on");%>">대전광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=187&g_userid=<%=work_userid%>" class="<% if (codes.equals("187")) out.print("on");%>">충청남도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=188&g_userid=<%=work_userid%>" class="<% if (codes.equals("188")) out.print("on");%>">세종특별자치시</a></li>
	   
	   
	  <li><a href="./ka_kda_area.do?bbs_board_code=147&g_userid=<%=work_userid%>" class="<% if (codes.equals("147")) out.print("on");%>">전북특별자치도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=148&g_userid=<%=work_userid%>" class="<% if (codes.equals("148")) out.print("on");%>">광주광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=189&g_userid=<%=work_userid%>" class="<% if (codes.equals("189")) out.print("on");%>">전라남도</a></li>
	   
	   <li><a href="./ka_kda_area.do?bbs_board_code=149&g_userid=<%=work_userid%>" class="<% if (codes.equals("149")) out.print("on");%>">대구광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=190&g_userid=<%=work_userid%>" class="<% if (codes.equals("190")) out.print("on");%>">경상북도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=150&g_userid=<%=work_userid%>" class="<% if (codes.equals("150")) out.print("on");%>">경상남도</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=151&g_userid=<%=work_userid%>" class="<% if (codes.equals("151")) out.print("on");%>">울산광역시</a></li>
	   <li><a href="./ka_kda_area.do?bbs_board_code=152&g_userid=<%=work_userid%>" class="<% if (codes.equals("152")) out.print("on");%>">제주특별자치도</a></li> 
	   
	</ul>
</div>
	<hr />
	<div class="box t2 mb10 p10">
		<h4 class="title bold s1 cb2">※영양교사 분과 회원만 이용 가능합니다.</h4>		 
	</div>  
	<%@ include file ="/pages/board/paper_board.jsp"%>
</div>
</div>