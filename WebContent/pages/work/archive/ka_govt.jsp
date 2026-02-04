<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">정부</mark>지침서</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_archive.do">자료실</a></li>
				<li><a href="/work/archive/ka_govt.do?bbs_board_code=122&g_userid=<%=work_userid%>" class="cm">정부지침서</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>
