<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>

<%	
	String work_userid = ParamUtils.getParameter(request, "g_userid", "");

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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">학교분과</mark></h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">KDA 소식</a></li>
				<li><a href="/work/news/kn_division.do" class="cm">학교분과</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<%		if ( work_userid == "" ) { %>
			<div class="w600 ac">
				<div class="box t2 p20 mt20">
					<div class="box p50 text big s1 center">
						<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
						<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
					</div>
				</div>
			</div>
<%		} else { %>
		<div class="fl w300 mt40 ml60 mr20">
			<div class="box t2 mt10 pt40 pb40 kn_kn_division_bg01">
				<div class="h300 center">
					<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">영양교사</mark> 정보관</h4>
					<a href="http://210.127.55.231:8818" class="btn t2 big mt230" title="새창으로 이동" target="black">홈페이지 바로가기</a>
				</div>
			</div>
		</div>				
		<div class="fl w300 h400 mt40">
			<div class="box t2 mt10 pt40 pb40 kn_kn_division_bg02">
				<div class="h300 center">
					<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">학교영양사</mark> 정보관</h4>
					<a href="http://210.127.55.231:8820" class="btn t2 big mt230" title="새창으로 이동" target="black">홈페이지 바로가기</a>
				</div>
			</div>
		</div>
<%		} %>
	</div>
</div>

