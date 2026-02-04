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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양</mark>관련정보</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_archive.do">자료실</a></li>
				<li><a href="/work/archive/ka_story.do?bbs_board_code=22&g_userid=<%=work_userid%>" class="cm">영양관련정보</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
<!-- 		<div class="box t2 mb10 p20"> -->
<!-- 						<h4 class="title bold s1 cb2">대한영양사협회에서는 회원 여러분들의 업무능력 향상을 위한 정보교환의 장을 마련하고자 2004년부터 ‘영양사 이야기’ 코너를 운영해 왔습니다.<br/> 다양한 직역에서 활동하고 계신 회원님들의 생생한 이야기를 곧 새롭게 전해드리겠습니다.</h4> -->
<!-- 						<div class="area mt10"> -->
<!-- 							<div class="fl w180"> -->
								
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
		<hr />
		<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>
