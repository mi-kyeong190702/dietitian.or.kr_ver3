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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">학교영양사</mark> 시도소식</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/department/ka_club.do">분과별 게시판</a></li>
				<li><a href="/work/department/ka_school_notice.do?bbs_board_code=153&g_userid=<%=work_userid%>" >학교영양사</a></li>
				<li><a href="/work/department/ka_school_area.do?bbs_board_code=157,158,159,160,161,162,163,164,165,166,167,168,169&g_userid=<%=work_userid%>" class="cm">시도소식</a></li>
			</ul>
		</div>
	</div> 
	<%
		String codes = request.getParameter("bbs_board_code");		 
	%>  
	<div class="sp_body">   
	<div class="box t2 mb10 p10">
		<h4 class="title bold s1 cb2">※학교영양사 분과 회원만 이용 가능합니다.</h4>		 
	</div>  
	<%@ include file ="/pages/board/paper_board.jsp"%>
	
</div>
</div>