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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">어린이∙사회복지급식관리지원센터 </mark> 정보나눔방</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/department/ka_club.do">분과별 게시판</a></li>
				<li><a href="/work/department/ka_child_notice.do?bbs_board_code=179&g_userid=<%=work_userid%>" >어린이∙사회복지급식관리지원센터</a></li>
				<li><a href="/work/department/ka_child_info.do?bbs_board_code=181&g_userid=<%=work_userid%>" class="cm">정보나눔방</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body"> 
	<!-- 
	<div class="box t2 mb10 p20">
		<h4 class="title bold s1 cb2"> 새로운 게시판에 오신걸 환영합니다<br/> 잘하지 않아도 되니 따로오세요.</h4>
		<div class="area mt10">
			<div class="fl w180">
				
			</div>							
		</div>
	</div>
	 -->
	<%@ include file ="/pages/board/paper_board.jsp"%>
</div>
</div>