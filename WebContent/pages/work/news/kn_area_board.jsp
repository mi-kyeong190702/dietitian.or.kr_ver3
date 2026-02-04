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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">시도</mark>영양사회 게시판</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="/work/news/kn_area_main.do">시도영양사회</a></li>
				<li><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48&g_userid=<%=work_userid%>" class="cm">시도영양사회 게시판</a></li>
			</ul>
		</div>
	</div>
	<br/><br/>
	<div class="tab t1 div7 mt5">
	<%
		String codes = request.getParameter("bbs_board_code");		
		String all = "";
		String branchName = "";
		if ( codes.split(",").length > 1 ) {
			all = "on";
		} else {
			if( codes.equals("36") ) branchName = "서울특별시";
			if( codes.equals("37") ) branchName = "부산광역시";
			if( codes.equals("38") ) branchName = "인천광역시";
			if( codes.equals("39") ) branchName = "경기도";
			if( codes.equals("40") ) branchName = "강원특별자치도";
			if( codes.equals("41") ) branchName = "충청북도";
			if( codes.equals("42") ) branchName = "대전·충남·세종";
			if( codes.equals("43") ) branchName = "전북특별자치도";
			if( codes.equals("44") ) branchName = "광주·전남";
			if( codes.equals("45") ) branchName = "대구·경북";
			if( codes.equals("46") ) branchName = "경상남도";
			if( codes.equals("47") ) branchName = "울산";
			if( codes.equals("48") ) branchName = "제주특별자치도";
		}
	%>
		<ul>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48&g_userid=<%=work_userid%>" class="<%=all%>">전체</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=36&g_userid=<%=work_userid%>" class="<% if (codes.equals("36")) out.print("on");%>" >서울</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=37&g_userid=<%=work_userid%>" class="<% if (codes.equals("37")) out.print("on");%>" >부산</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=38&g_userid=<%=work_userid%>" class="<% if (codes.equals("38")) out.print("on");%>" >인천</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=39&g_userid=<%=work_userid%>" class="<% if (codes.equals("39")) out.print("on");%>" >경기</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=40&g_userid=<%=work_userid%>" class="<% if (codes.equals("40")) out.print("on");%>" >강원특별자치도</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=41&g_userid=<%=work_userid%>" class="<% if (codes.equals("41")) out.print("on");%>" >충청북도</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=42&g_userid=<%=work_userid%>" class="<% if (codes.equals("42")) out.print("on");%>" >대전·충남·세종</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=43&g_userid=<%=work_userid%>" class="<% if (codes.equals("43")) out.print("on");%>" >전북특별자치도</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=44&g_userid=<%=work_userid%>" class="<% if (codes.equals("44")) out.print("on");%>" >광주·전남</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=45&g_userid=<%=work_userid%>" class="<% if (codes.equals("45")) out.print("on");%>" >대구·경북</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=46&g_userid=<%=work_userid%>" class="<% if (codes.equals("46")) out.print("on");%>" >경상남도</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=47&g_userid=<%=work_userid%>" class="<% if (codes.equals("47")) out.print("on");%>" >울산</a></li>
			<li><a href="/work/news/kn_area_board.do?bbs_board_code=48&g_userid=<%=work_userid%>" class="<% if (codes.equals("48")) out.print("on");%>" >제주특별자치도</a></li>
		</ul>
	</div>
	<hr/>
	<div class="sp_body">
				<% if ( !all.equals("on") ) { %>
					
					<!-- 인사말 -->
					<div class="box t2 mb10 p20">
						
						<h4 class="title bold s1 cb2">
								<%=branchName%> 영양사회에 오신 것을 환영합니다.<br />
								함께 공유하고 싶은 정보 및 어려운점, 나누고 싶은 이야기 등 자유롭게 글을 올려주세요.</h4>
						<div class="area mt10">
							<div class="fl w180">
								
							</div>
						</div>
					</div>
				<% } %>
		
	<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>