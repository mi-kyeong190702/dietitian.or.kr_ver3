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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">시도</mark>영양사회 공지사항</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="/work/news/kn_area_main.do">시도영양사회</a></li>
				<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=<%=work_userid%>" class="cm">시도영양사회 공지사항</a></li>
			</ul>
		</div>
	</div>
	<br/><br/>
	<div class="tab t1 div7 mt5">
	<%
		String codes = request.getParameter("bbs_board_code");		
		String all = "";
		if ( codes.split(",").length > 1 )
			all = "on";
	%>
		<ul>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=<%=work_userid%>" class="<%=all%>">전체</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69&g_userid=<%=work_userid%>" class="<% if (codes.equals("69")) out.print("on");%>" >서울</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=70&g_userid=<%=work_userid%>" class="<% if (codes.equals("70")) out.print("on");%>" >부산</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=71&g_userid=<%=work_userid%>" class="<% if (codes.equals("71")) out.print("on");%>" >인천</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=72&g_userid=<%=work_userid%>" class="<% if (codes.equals("72")) out.print("on");%>" >경기</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=73&g_userid=<%=work_userid%>" class="<% if (codes.equals("73")) out.print("on");%>" >강원특별자치도</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=74&g_userid=<%=work_userid%>" class="<% if (codes.equals("74")) out.print("on");%>" >충청북도</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=75&g_userid=<%=work_userid%>" class="<% if (codes.equals("75")) out.print("on");%>" >대전·충남·세종</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=76&g_userid=<%=work_userid%>" class="<% if (codes.equals("76")) out.print("on");%>" >전북특별자치도</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=77&g_userid=<%=work_userid%>" class="<% if (codes.equals("77")) out.print("on");%>" >광주·전남</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=78&g_userid=<%=work_userid%>" class="<% if (codes.equals("78")) out.print("on");%>" >대구·경북</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=79&g_userid=<%=work_userid%>" class="<% if (codes.equals("79")) out.print("on");%>" >경상남도</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=80&g_userid=<%=work_userid%>" class="<% if (codes.equals("80")) out.print("on");%>" >울산</a></li>
			<li><a href="/work/news/kn_area_notice.do?bbs_board_code=81&g_userid=<%=work_userid%>" class="<% if (codes.equals("81")) out.print("on");%>" >제주특별자치도</a></li>
		</ul>
	</div>				
	<hr/>
	<div class="sp_body">
<%-- <%		if ( work_userid == "" ) { %>
			<div class="w600 ac">
				<div class="box t2 p20 mt20">
					<div class="box p50 text big s1 center">
						<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
						<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
					</div>
				</div>
			</div>
<%		} else { %> --%>
		
			<!-- 시도별 어린이급식관리지원센터 배너 -->
			<% if( codes.equals("69") ) {  %>
			<!-- 서울 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/dongjak/" target="_blank"><img src="/images/news/kn_area_notice_69_1.JPG" width="240" alt="동작구어린이급식관리지원센터"></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/guro/" target="_blank"><img src="/images/news/kn_area_notice_69_2.JPG" width="240" alt="구로구어린이급식관리지원센터"></a></li>
						<li class="box fl mb7"><a href="https://dietary4u.mfds.go.kr/gwangjin/" target="_blank"><img src="/images/news/kn_area_notice_69_3.jpg" width="240" alt="광진구어린이급식관리지원센터"></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/gwanak/" target="_blank"><img src="/images/news/kn_area_notice_69_4.jpg" width="240" alt="관악구어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("70") ) {  %>
			<!-- 부산 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/dongnae/" target="_blank"><img src="/images/news/kn_area_notice_70_1.JPG" width="240" alt="동래구어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("71") ) {  %>
			<!-- 인천 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/gumdan/" target="_blank"><img src="/images/news/kn_area_notice_71_1.JPG" width="240" alt="인천서구검단어린이급식관리지원센터"></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/ichdonggu/" target="_blank"><img src="/images/news/kn_area_notice_71_2.JPG" width="240" alt="인천동구어린이급식관리지원센터"></a></li>
						<li class="box fl mb7"><a href="https://dietary4u.mfds.go.kr/incheonnamdong/" target="_blank"><img src="/images/news/kn_area_notice_71_3.JPG" width="240" alt="인천남동구어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("72") ) {  %>
			<!-- 경기 -->
			<% } %>
			
			<% if( codes.equals("73") ) {  %>
			<!-- 강원 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/hongcheon/" target="_blank"><img src="/images/news/kn_area_notice_73_1.jpg" width="240" alt="홍천군어린이급식관리지원센터"></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/chuncheon/" target="_blank"><img src="/images/news/kn_area_notice_73_2.jpg" width="240" alt="춘천시어린이급식관리지원센터"></a></li>
						<li class="box fl mb7"><a href="https://dietary4u.mfds.go.kr/hwacheon/" target="_blank"><img src="/images/news/kn_area_notice_73_3.jpg" width="240" alt="화천군어린이급식관리지원센터"></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/taebaek/" target="_blank"><img src="/images/news/kn_area_notice_73_4.jpg" width="240" alt="태백시어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("74") ) {  %>
			<!-- 충청북도 -->
			<% } %>
			
			<% if( codes.equals("75") ) {  %>
			<!-- 대전·충남·세종 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/junggudj/" target="_blank"><img src="/images/news/kn_area_notice_75_1.jpg" width="240" alt="대전광역시중구어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("76") ) {  %>
			<!-- 전라북도 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/jangsu/" target="_blank"><img src="/images/news/kn_area_notice_76_1.JPG" width="240" alt="장수군어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("77") ) {  %>
			<!-- 광주·전남 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/gwangju/" target="_blank"><img src="/images/news/kn_area_notice_77_1.JPG" width="240" alt="광주광역시북구어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("78") ) {  %>
			<!-- 대구·경북 -->
			<% } %>
			
			<% if( codes.equals("79") ) {  %>
			<!-- 경상남도 -->
				<div class="area">
					<ul>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/geoje/" target="_blank"><img src="/images/news/kn_area_notice_79_1.JPG" width="240" alt="거제시어린이급식관리지원센터 "></a></li>
						<li class="box fl mr7 mb7"><a href="https://dietary4u.mfds.go.kr/namhae/" target="_blank"><img src="/images/news/kn_area_notice_79_2.JPG" width="240" alt="남해군어린이급식관리지원센터"></a></li>
						<li class="box fl mb7"><a href="https://dietary4u.mfds.go.kr/hadong/" target="_blank"><img src="/images/news/kn_area_notice_79_3.JPG" width="240" alt="하동군어린이급식관리지원센터"></a></li>
					</ul>
				</div>
			<% } %>
			
			<% if( codes.equals("80") ) {  %>
			<!-- 울산 -->
			<% } %>
			
			<% if( codes.equals("81") ) {  %>
			<!-- 제주특별자치도 -->
			<% } %>
						
			<%@ include file ="/pages/board/paper_board.jsp"%>
<%-- <%		} %>	 --%>
	</div>
</div>