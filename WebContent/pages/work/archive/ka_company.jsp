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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">급식전문업체</mark>영양사</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_club.do">동호회</a></li>
				<li><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=<%=work_userid%>" class="cm">급식전문업체영양사</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<div class="box t2 mb10 p20">
						<h4 class="title bold s1 cb2">급식전문업체영양사 모임에 오신 것을 환영합니다.<br/>함께 공유하고 싶은 정보 및 어려운점, 나누고 싶은 이야기 등 자유롭게 글을 올려주세요.</h4>
						<div class="area mt10">
							<div class="fl w180">
								
							</div>							
						</div>
					</div>
	<%@ include file ="/pages/board/paper_board.jsp"%>
</div>
</div>