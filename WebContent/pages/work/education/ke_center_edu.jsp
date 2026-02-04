<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%	
	String edu_userid = ParamUtils.getParameter(request, "g_userid", "0");

	// 정상적인 값으로 넘옴
	System.out.println("edu g_userid : " + edu_userid);

	edu_userid = edu_userid.replace("!", "%21");
	edu_userid = edu_userid.replace("@", "%40");
	edu_userid = edu_userid.replace("#", "%23");
	edu_userid = edu_userid.replace("~", "%7E");

%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육지원</mark>센터</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육&g_userid=<%=edu_userid%>" class="cm">교육지원센터</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육&g_userid=<%=edu_userid%>">공지사항</a></li>
				<li><a href="/work/education/faq/faq_list.do?faq_category=2">FAQ</a></li>
				<li><a href="/work/education/ke_center_edu.do?bbs_board_code=116&g_userid=<%=edu_userid%>" class="on">교육후기</a></li>
			</ul>
		</div>
		<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>
