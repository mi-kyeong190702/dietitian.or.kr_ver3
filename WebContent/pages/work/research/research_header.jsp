<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" href="/css/popup.css" rel="stylesheet" />
<%@include file="/pages/common.jsp"%>

<%@ page import="kda.utils.KdaStringUtil" %>

<%
	String url 		= "research_index";
	String pageName = "";	
	String fileName = "";

	int curDate = Integer.parseInt(KdaStringUtil.getTodayString());

 	if ( request.getAttribute("javax.servlet.forward.request_uri") != null  ) {
 		url 		= request.getAttribute("javax.servlet.forward.request_uri").toString();
 		pageName		=  url.substring(url.lastIndexOf("research")+9, url.lastIndexOf("/"));
 		fileName 	= pageName.substring(0, pageName.length()-3);

		
 	}	
%>
<!-- <script>
    if(navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)){
    	  alert("모바일 지원을 하지 않습니다");
    	  location.href="/index.jsp";
    }
</script> -->
<script>
function noti(){
	alert("영양사의 면허 등 신고는\n2015년 9월 1일(화)부터 진행됩니다.\n");
	return;
}

</script>
	<!-- Header S-->
	<header id="header">
		<div class="h_bar">
			<div class="wrap">
				<div class="h_accessibility">
					<h2>화면크기</h2>
					<button onclick="zoomInOut('in');" class="ha_btn plus"><span class="ti">화면확대</span></button>
					<button onclick="zoomInOut('out');" class="ha_btn minus"><span class="ti">화면축소</span></button>
				</div>
				<hr />
				<div class="h_topmenu">
					<h2 class="ti">상단메뉴</h2>
					<ul>
						<li class="start"><a href="/research_index.jsp">HOME</a></li>
						<c:choose>
							<c:when test="${null ne loginVo}">
								<li><a href="/research_logout.do">로그아웃</a></li>
								<li><a href="/work/research/mypage/km_report.do">마이페이지</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/work/research/login/kl_login.do">로그인</a></li>
								<!-- <li><a href="/work/research/report/kr_report.do">회원가입</a></li> -->								
							</c:otherwise>
						</c:choose>
						<!-- <li><a href="/work/research/community/kr_faq.do?bbs_cd=002">FAQ</a></li> -->
						<!-- <li><a href="">사이트맵</a></li> -->
					</ul>
				</div>
			</div>
		</div>
		<hr />
		<div class="wrap">
			<div class="h_logo">
				<a href="/research_index.jsp" title="메인페이지로 이동"><h1 class="ti">사단법인 대한영양사협회</h1></a>
			</div>
			<hr />
			<div class="h_menu">
				<nav id="nav">
					<ul>
						<li class="n_main introduce"><a href="/work/research/about/kr_intro.do" <% if(pageName.equals("about")){%> class="on" <%}%>>면허신고 소개<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/research/about/kr_intro.do">면허신고 소개</a></li>										
										<li><a href="/work/research/about/kr_basis.do">근거법령</a></li>
										<li><a href="/work/research/about/kr_period.do">면허신고 주기 및 내용</a></li>
										<li><a href="/work/research/about/kr_procedure.do">면허신고 절차</a></li>		
									</ul>
								</div>
							</div>
						</li>
						

						<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - start  -->
<%-- 						<li class="n_main news"><a href="#" <% if(pageName.equals("report")){%> class="on" <%}%>>면허신고 신청</a></li>	 --%>
<%-- 						<li class="n_main news"><a href="#" <% if(pageName.equals("exemption")){%> class="on" <%}%>>보수교육 면제</a></li> --%>
<%-- 						<li class="n_main news"><a href="#" <% if(pageName.equals("recipient")){%> class="on" <%}%>>보수교육 미대상자<span class="icon_active"></span></a> --%>
<!-- 							<div class="n_sub"> -->
<!-- 								<div class="ns_menu"> -->
<!-- 									<ul class="ns_depth1"> -->
<!-- 										<li><a href="#">보수교육 미대상자</a></li> -->
<!-- 										<li><a href="#">보수교육 미대상자 수정</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</li> -->
<%-- 						<li class="n_main news"><a href="#" <% if(pageName.equals("license")){%> class="on" <%}%>>면허정보 등록</a></li> --%>
						<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - end  -->
						
						<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - start  -->
						<li class="n_main news"><a href="/work/research/report/kr_report.do" <% if(pageName.equals("report")){%> class="on" <%}%>>면허신고 신청</a></li>	
						<li class="n_main news"><a href="/work/research/exemption/kr_exemption.do" <% if(pageName.equals("exemption")){%> class="on" <%}%>>보수교육 면제</a></li>
						<li class="n_main news"><a href="/work/research/recipient/recipient.do" <% if(pageName.equals("recipient")){%> class="on" <%}%>>보수교육 미대상자<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/research/recipient/recipient.do">보수교육 미대상자</a></li>
										<li><a href="/work/research/recipient/recipientModify.do">보수교육 미대상자 수정</a></li>
									</ul>
								</div>
							</div>
						</li>
					<li class="n_main news"><a href="/work/research/license/kr_license_check.do" <% if(pageName.equals("license")){%> class="on" <%}%>>면허정보 등록</a></li>
						<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - end  -->
						
						<li class="n_main news"><a href="/work/research/community/kr_notice.do?bbs_cd=001" <% if(pageName.equals("community")){%> class="on" <%}%>>커뮤니티<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/research/community/kr_notice.do?bbs_cd=001">공지사항</a></li>
										<li><a href="/work/research/community/kr_faq.do?bbs_cd=002">FAQ</a></li>
										<li><a href="/work/research/community/kr_inquiry.do?bbs_cd=003">문의하기</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main news"><a href="/work/research/mypage/km_report.do" <% if(pageName.equals("mypage")){%> class="on" <%}%>>마이페이지<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/work/research/mypage/km_report.do">면허신고 현황</a></li>
										<li><a href="/work/research/mypage/km_update.do">면허신고 수정</a></li>
										<li><a href="/work/research/mypage/km_education.do">보수교육 현황</a></li>
										<li><a href="/work/research/mypage/km_pw_change.do">비밀번호 변경</a></li>
										<c:if test="${null eq loginVo}">
										<li><a href="/work/research/mypage/km_pw_find.do">비밀번호 찾기</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</li>
						
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header E-->
