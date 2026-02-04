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
	
	String codes = request.getParameter("bbs_board_code");

%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양교사</mark> 급식운영</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/department/ka_club.do">분과별 게시판</a></li>
				<li><a href="/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=<%=work_userid%>">영양교사</a></li>
				<li><a href="/work/department/ka_kda_meal.do?bbs_board_code=134&g_userid=<%=work_userid%>" class="cm">급식운영</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body"> 
		<div class="tab t1 div3 mb30">
			<ul>
				<li class="kb_main"><a href="./ka_kda_meal.do?bbs_board_code=134&g_userid=<%=work_userid%>" <% if( "134".equals(codes) ) { %> class="on" <% } %>>법규 및 지침</a>
				</li>
				<li class="kb_man"><a href="./ka_kda_meal.do?bbs_board_code=135&g_userid=<%=work_userid%>" <% if( "135".equals(codes) ) { %> class="on" <% } %>>자료실</a>
				</li>
				<li class="kb_man"><a href="./ka_kda_meal.do?bbs_board_code=184&g_userid=<%=work_userid%>" <% if( "184".equals(codes) ) { %> class="on" <% } %>>급식위생</a>
				</li>  
			</ul>
		</div>
	<!-- 
	<div class="box t2 mb10 p20">
		<h4 class="title bold s1 cb2"> 새로운 게시판에 오신걸 환영합니다<br/> 잘하지 않아도 되니 따로오세요.</h4>
		<div class="area mt10">
			<div class="fl w180">
				
			</div>							
		</div>
	</div>
	 -->
	 <div class="box t2 mb10 p10">
		<h4 class="title bold s1 cb2">※영양교사 분과 회원만 이용 가능합니다.</h4>		 
	</div>  
	<%@ include file ="/pages/board/paper_board.jsp"%>
</div>
</div>