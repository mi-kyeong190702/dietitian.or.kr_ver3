<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta property="og:image"              content="https://www.dietitian.or.kr/images/common/logo_kda.png" />
	<title>사단법인 대한영양사협회</title>	
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/layout.css?date=20150630">
	<link rel="stylesheet" href="/css/jquery.simplyscroll.css" media="all" type="text/css">
	<link rel="shortcut icon" href="/css/favicon.ico" />
	
		
    <script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/html5.js"></script>
	<script src="/js/dietitan.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
	
	function change(form) {
		if(form.url.selectedIndex !=0) {
			parent.location = form.url.options[form.url.selectedIndex].value
		}
	}
	
	
	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	
	function getCookie( name ) {
		var nameOfCookie = name + "=";
		var x = 0;
		
		while( x <= document.cookie.length ) {
			var y = (x+nameOfCookie.length);
			if( document.cookie.substring( x, y ) == nameOfCookie ) {
				if((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) {
					endOfCookie = document.cookie.length;
				}
				return unescape( document.cookie.substring( y, endOfCookie ) );
			}
			
			x = document.cookie.indexOf( " ", x ) + 1;
			
			if ( x == 0 ) {
				break;
			}
		}
		return "";
	}
	
	
	/*********************************************************************
	 * 팝업 - START
	 *
	 *  - vNowDt        : Tue Dec 31 2019 13:41:59 GMT+0900 (대한민국 표준시)
	 *  - vPopStartDt_1 : Tue Dec 31 2019 00:00:00 GMT+0900 (대한민국 표준시)
	 *  - vPopEndDt_1   : Fri Jan 31 2020 00:00:00 GMT+0900 (대한민국 표준시)
	 *
	 *********************************************************************/
	var vNowDt = new Date();	 // 현재날짜
	
	
	/* */
	// [신년] 팝업 - 매년 사용
	var tmpPopStartDt_newYear = "2025/01/01 01:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_newYear   = "2025/01/31 18:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	
	var vPopStartDt_newYear = new Date();
	var vPopEndDt_newYear   = new Date();
	
	vPopStartDt_newYear = new Date(tmpPopStartDt_newYear);
	vPopEndDt_newYear   = new Date(tmpPopEndDt_newYear);

	if( getCookie( "notice_newYear" ) != "done" ){
		if( vNowDt >= vPopStartDt_newYear && vNowDt <= vPopEndDt_newYear ) {
			noticeWindow_newYear = window.open('/assets/ver2/popup/popup_newYear_2025.html','notice_newYear','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=423px,height=620px,top=120px,left=100px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_newYear.opener = self;
		}
	}
	
	// [ popup - 1 ]
	//var tmpPopStartDt_1 = "2020/11/23"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopStartDt_1 = "2024/11/20"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_1   = "2025/03/01"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_1 = new Date();
	var vPopEndDt_1   = new Date();
	
	vPopStartDt_1 = new Date(tmpPopStartDt_1);
	vPopEndDt_1   = new Date(tmpPopEndDt_1);
	
	// 조건에 맞으면 팝업_1 을 띄움...
	if( getCookie( "notice_1" ) != "done" ){
		if( vNowDt >= vPopStartDt_1 && vNowDt <= vPopEndDt_1 ) {
			noticeWindow_1 = window.open('/assets/ver2/popup/popup_20241120.html','notice_1','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=423px,height=620px,top=120px,left=550px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_1.opener = self;
		}
	}
	
	
	// [ popup - 2 ]
	//임상영양관리지침서 관련 팝업 2022.05.02
	//영양사 올해의 뉴스 설문 관련 팝업 2022.11.07
	//영양사 올해의 뉴스 설문 관련 팝업 2022.11.21
	//서비스 일시중단 안내 팝업 2023.07.14
	var tmpPopStartDt_2 = "2024/12/05 17:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_2   = "2025/03/01"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_2 = new Date();
	var vPopEndDt_2   = new Date();
	
	vPopStartDt_2 = new Date(tmpPopStartDt_2);
	vPopEndDt_2   = new Date(tmpPopEndDt_2);
	
	// 조건에 맞으면 팝업_2 을 띄움...
	if( getCookie( "notice_2" ) != "done" ){
		// 추가보수교육 일시중단
		if( vNowDt >= vPopStartDt_2 && vNowDt <= vPopEndDt_2 ) {
			noticeWindow_2 = window.open('/assets/ver2/popup/popup_20241205.html','notice_2','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=410px,height=590px,top=120px,left=1000px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_2.opener = self;
		}
	}
	
	// [ popup - 3 ]
	//영양의날 안내 팝업 2022.09.23
	//영양의날 안내 팝업 2023.05.13
	//공모전 안내 팝업 2023.07
	//영양의날 안내 팝업 2023.10.11
	var tmpPopStartDt_3 = "2024/05/13 07:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_3   = "2024/07/18"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_3 = new Date();
	var vPopEndDt_3   = new Date();
	
	vPopStartDt_3 = new Date(tmpPopStartDt_3);
	vPopEndDt_3   = new Date(tmpPopEndDt_3);
	
	// 조건에 맞으면 팝업_3 을 띄움...
	if( getCookie( "notice_3" ) != "done" ){
		if( vNowDt >= vPopStartDt_3 && vNowDt <= vPopEndDt_3 ) {
			noticeWindow_3 = window.open('/assets/ver2/popup/popup_20240513.html','notice_3','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=595px,height=880px,top=80px,left=670px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_3.opener = self;
		}
	}
	
	// [ popup - 4 ]
	var tmpPopStartDt_4 = "2024/07/12"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_4   = "2024/07/13"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_4 = new Date();
	var vPopEndDt_4   = new Date();
	
	vPopStartDt_4 = new Date(tmpPopStartDt_4);
	vPopEndDt_4   = new Date(tmpPopEndDt_4);
	
	// 조건에 맞으면 팝업_4 을 띄움...
	if( getCookie( "notice_4" ) != "done" ){
		if( vNowDt >= vPopStartDt_4 && vNowDt <= vPopEndDt_4 ) {
			noticeWindow_4 = window.open('/assets/ver2/popup/popup_20240712.html','notice_4','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=500px,height=370px,top=150px,left=350px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_4.opener = self;
		}
	}

	/******************
	 * 팝업 - END
	 ******************/
	
	
		var bannerScoller;
		$(document).ready(function()
		{
			// -- 공지사항 리스트
            $.ajax ( {
                  type		: "GET"
				, url		: "/main_getNoticeHtml.do"
				, dataType  : "html"
				, cache		: false
				, success	: handleGetNoticeHtml
				, error		: handleGetNoticeHtmlError				
			});
		});
		
		function handleGetNoticeHtml(data){		
			$("#cb_body").html(data);		
		}
		
		function handleGetNoticeHtmlError(data){}
		function handleGetBannerHtml(data){}
		function handleGetBannerHtmlError(data){}		
		function doClickTabNotice(v)
		{	
			
			$("li[id^='notify_tab']").attr("class", "");
			$("#notify_tab"+v).attr("class", "on");
			
			$("ul[id^='notice_list']").hide();
			$("#notice_list"+v).show();
			
			var userId = $("#userId").val();
			console.log(userId);
			var addr = "";
			if(v==1){
				addr = "/work/news/kn_notice.do?bbs_board_code=2";				
			}else if(v==2){
				addr = "/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=" + userId;
			}else if(v==3){
				addr = "/work/news/kn_organ_news.do?bbs_board_code=0";
			}
						
			$("#plusBbs").attr("href", addr);
		}
		
		function doClickNotice(bbs_idx, bbs_board_code)
		{	
			var userId = $("#userId").val();
			var param = "?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_board_code=" + bbs_board_code + "&bbs_idx=" + bbs_idx;
			var param2 = "?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_board_code=" + bbs_board_code + "&bbs_idx=" + bbs_idx + "&g_userid=" + userId;

			if 		( bbs_board_code == 2 )
				document.location.href = "/work/news/kn_notice.do" + param;
			else if ( bbs_board_code >= 69 && bbs_board_code <= 81 )
				document.location.href = "/work/news/kn_area_notice.do" + param2;
			else 
				document.location.href = "/work/news/kn_organ_news.do" + param;
		}
		
		function doClickTabQuickmenu(v)
		{
			$("#archive_tab").attr("class", "archive");
			$("#business_tab").attr("class", "business");	
			$("#" + v + "_tab").attr("class", v + " on");			
		}
		
		function doClickBanner(idx) {
			$.ajax({
				  type		: "POST"
				, data 		: "bannerIdx=" + idx
				, url		: "/banner_click_ajax.do"
				, success : function(data){
				}
			});
		}
		
	</script>
	
	<style>
	.main_cb_btn {  display: inline-block; margin-right: 5px; vertical-align: middle; width: 20px; height: 20px; border: #cfd1d4 solid 1px; background: #fff url("/images/common/icon_banner_navi.png") no-repeat; }
	.main_cb_btn:hover {border:#939598 solid 1px; background-color:#939598;}
	.main_cb_btn.prev {background-position:0px 0px;}
	.main_cb_btn.stop {background-position:0px -18px;}
	.main_cb_btn.play {background-position:0px -36px;}
	.main_cb_btn.next {background-position:0px -54px;}

	<c:if test="${ fn:length(bannerAry[0]) > 0 }"> 
		.img01	{ background: url( ${bannerAry[0].get(0).banner_img} )  center no-repeat !important; }
	</c:if>

	<c:forEach items="${bannerAry[1]}" var="banner2" varStatus="status">
	#contents .visual .v_quick .icon.vq_${status.count} { background: url( ${banner2.banner_img} )  center no-repeat !important;  }
	</c:forEach>
	</style>	
</head>
	
<body> 

<div id="wrap">

	<%@ include file ="/pages/header.jsp"%>
	
	<!-- Contents S-->
	<div id="contents">
		<div class="visual">
			<h2 class="ti">비주얼 영역</h2>
			<div class="v_img" >
			<ul id='banner1'>
				<c:forEach items="${bannerAry[0]}" var="main">
					<li><img src="${main.banner_img}" /></li>
				</c:forEach>
				</ul>
			
				<div class="wrap">
					<div class="v_navi">
						<ul>
							<li><a href="/work/business/kb_nutrition.do" style="height:20px !important;"><strong>영양사업</strong></a></li>
							<!-- <li><a href="/work/education/ke_contest_info.do">전국영양사<br />학술대회</a></li> -->
							<li><a href="/work/education/ke_menu.do" style="height:20px !important;">KDA교육</a></li>
							<li><a href="/work/archive/ka_legal.do" style="height:20px !important;">법률정보</a></li>
							<li><a href="/member/km_join.do" style="height:20px !important;">회원가입</a></li>
							<li>
								<div class="center mt10">
									<button class="main_cb_btn prev" id="banner1_slider-next"><span class="ti" >이전배너</span></button>
									<button class="main_cb_btn stop" id="banner1_ctrl" onclick="playControl('banner1_ctrl', 1)"><span class="ti">일시정지</span></button>
									<button class="main_cb_btn next" id="banner1_slider-prev"><span class="ti">다음배너</span></button>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="ti">
					<strong>KDA Education</strong>
					<h2>전문인으로서의 능력향상을 위한 교육</h2>
					<p>&quot;영양사는 건강 증진 및 질병치료를 목적으로 연구개발하고 전문적인 영양서비스를 제공하는 영양 전문인입니다.&quot;</p>
				</div>
			</div>
			<hr />
			<div class="v_quick">
				<h2 class="ti">서비스 바로가기</h2>
				<ul>
					 <c:forEach items="${bannerAry[1]}" var="banner2" varStatus="status">
					 	<li>
					 		<a href="${banner2.link_url}<c:if test="${ banner2.banner_name == '회원게시판' || banner2.banner_name == '면허증재교부' }">${g_encoded_userid}</c:if>" <c:if test="${ banner2.link_target != ''}"> target="${banner2.link_target }" title="새창으로 이동" </c:if> >
		        				<c:if test="${status.count eq 2}">
		        					<div style="background:#FAED7D;">
					 				<span class="icon vq_${status.count}"></span>${banner2.banner_name}
					 				</div>
	                			</c:if>
		            			<c:if test="${status.count ne 2}">
					 				<span class="icon vq_${status.count}"></span>${banner2.banner_name}
					 			</c:if>
					 		</a>
					 	</li>
					 </c:forEach>
				</ul>
			</div>
		</div>
		<hr />
		
		<div class="wrap main">
			<div class="c_box latest">
				<h2 class="ti">최근게시물</h2>
				<div class="cb_head">
					<ul>
						<li id="notify_tab1" class="on" ><a href="javascript:doClickTabNotice('1');"><strong>공지사항</strong></a></li>
						<li id="notify_tab2" ><a href="javascript:doClickTabNotice('2')">시도영양사회</a></li>
						<li id="notify_tab3" ><a href="javascript:doClickTabNotice('3')">관련기관소식</a></li>
						<li class="plus"><a href="/work/news/kn_notice.do?bbs_board_code=2" id="plusBbs"><span class=""></span></a></li>
						<input type="hidden" name="userId" id="userId" value="${g_encoded_userid}">
					</ul>
				</div>
				<div id="cb_body" class="cb_body"></div>
			</div>
			<div class="c_box popupzone">
				<h2 class="ti">팝업존</h2>
				<div class="cb_navi" style="z-index:999">
					<!-- >button class="stop"><span class="ti">정지</span></button-->
					<button id="banner4_ctrl" class="stop" onclick="playControl('banner4_ctrl', 4)"><span class="ti">정지</span></button><!-- 정지버튼을 누르면 재생버튼으로 교체해주세요. -->
					<ul id="banner4_pager">
						<c:forEach items="${bannerAry[2]}" var="banner3" varStatus="status">
						<li><a href="javascript:sliderGoTo( 4, ${status.index})" <c:if test="${status.index == 0 }">class="on"</c:if>><strong><span class="ti">${status.count}</span></strong></a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="cb_body">
					<ul id="banner4">
						<c:forEach items="${bannerAry[2]}" var="banner3">
						<li><a href="${banner3.link_url}" title="${banner3.banner_name}" <c:if test="${ banner3.link_target != ''}"> target="${banner3.link_target }" title="새창으로 이동" </c:if> onclick="doClickBanner(${banner3.idx});"><img src="${banner3.banner_img}" alt="${banner3.banner_name}" /></a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="c_box educenter">
				<div class="cb_head">
					<h2>KDA 교육센터</h2>
					<span>전문적인 영양서비스를 제공합니다.</span>
				</div>
				<div class="cb_body" >
					<!--<ul>
						<li><a href="/work/education/ke_law_edu.do"><span class="icon e01"></span>영양사 법정교육</a></li>
						<li><a href="/work/education/ke_law_hygiene.do"><span class="icon e01"></span>영양사 위생교육</a></li>
						<li><a href="/member/sso_login2.do" target="_blank"><span class="icon e02"></span>온라인 교육센터</a></li>
						<li><a href="/work/education/ke_elderly_info.do"><span class="icon e03"></span>교육과정 안내</a></li>
						<li><a href="/work/education/ke_curriculum.do"><span class="icon e04"></span>교육과정 신청</a></li>
						<li><a href="/work/education/ke_about.do"><span class="icon e05"></span>전문영양사 코너</a></li>
						<li><a href="/work/education/ke_contest_info.do"><span class="icon e06"></span>영양사학술대회</a></li>
					</ul>-->
					<ul>
						<li><a href="https://www.kdaedu.or.kr/" target="_blank"><span class="icon e01" ></span><span style="letter-spacing: -2px">영양사 식품위생교육</span></a></li>
						<li><a href="https://www.kdaedu.or.kr/" target="_blank"><span class="icon e02"></span>영양사 보수교육</a></li>						
						<li><a href="/member/sso_login2.do" target="_blank"><span class="icon e03"></span>온라인 교육센터</a></li>
						<li><a href="/work/education/ke_elderly_info.do"><span class="icon e04"></span>교육과정 안내</a></li>
						<li><a href="/work/education/ke_curriculum.do"><span class="icon e05"></span>교육과정 신청</a></li>
						<!-- 학술대회 관련 부분 -->
						<!-- <li><a href="/work/education/ke_menu.do"><span class="icon e06"></span>영양사학술대회</a></li> -->
						<li><a href="/work/education/ke_contest_info.do"><span class="icon e06"></span>영양사학술대회</a></li>
					</ul>
				</div>
			</div>
			<div class="c_box shortcut">
				<div class="left">
					<div class="cb_head">
						<h2>학교분과</h2>
					</div>
					<div class="cb_body">
						<ul>
							<li class="start"><a href="send_edu.do?gubun=1" target="_blank" title="새창으로 이동"><span class="icon s01"></span>영양교사 정보관<span class="icon arrow"></span></a></li>
							<li><a href="send_edu.do?gubun=2" target="_blank" title="새창으로 이동"><span class="icon s02"></span>학교영양사 정보관<span class="icon arrow"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="right">
					<div class="cb_head">
						<h2>면허신고센터, 레시피</h2>
					</div>
					<div class="cb_body">
					<ul>
						<li class="start"><a href="https://www.kdaedu.or.kr/" target="_blank" title="새창으로 이동"><span class="icon s03"></span><span class="cb_btn">면허신고센터<span class="icon arrow"></span></span></a></li>
						<li><a href="/work/archive/ka_recipe.do?bbs_board_code=92" target="_blank" title="새창으로 이동"><span class="icon s02"></span><span class="cb_btn">식단 및 레시피<span class="icon arrow"></span></span></a></li>
						<!--<a href="/research_index.jsp" target="_blank" title="새창으로 이동"><span class="icon s03" style="font-weight:bold;" ><font color = "red" size = "4">5월23일까지 &nbsp;</font></br><font color = "red" size = "4"> 완료</font></span><span class="cb_btn">바로가기<span class="icon arrow"></span></span></a>-->
					</div>
				</div>
			</div>
			<div class="c_box quickmenu">
				<h2 class="ti">빠른메뉴</h2>
				<div class="cb_body">
					<ul>
						<li id="archive_tab" class="archive on">
							<a href="javascript:doClickTabQuickmenu('archive');">회원자료실<span class="icon_state"></span></a>
							<div class="cb_list">
								<ul>
									<li><a href="/work/archive/ka_hotnews.do?bbs_board_code=91"><span class="icon a1"></span>식품영양핫뉴스</a></li>
									<li><a href="/work/archive/ka_management.do?bbs_board_code=63"><span class="icon a2"></span>급식경영</a></li>
									<li><a href="/work/archive/ka_recipe.do?bbs_board_code=92"><span class="icon a3"></span>식단 및 레시피</a></li>
									<li><a href="/work/archive/ka_hygiene.do?bbs_board_code=86"><span class="icon a4"></span>급식위생</a></li>
									<li><a href="/work/archive/ka_education.do?bbs_board_code=65"><span class="icon a5"></span>영양교육</a></li>
									<li><a href="/work/archive/ka_clinical.do?bbs_board_code=64"><span class="icon a6"></span>임상영양</a></li>
									<li><a href="/work/archive/ka_form.do?bbs_board_code=85"><span class="icon a7"></span>업무서식</a></li>
									<li><a href="/work/archive/ka_literature.do?bbs_board_code=66"><span class="icon a8"></span>국내외문헌정보</a></li>
									<li class="noline"><a href="/work/archive/ka_legal.do"><span class="icon a9"></span>법률정보</a></li>
									<li class="noline"><a href="/work/archive/ka_govt.do?bbs_board_code=122"><span class="icon a10"></span>정부지침서</a></li><!-- 20190402 정부지침서 -->
								</ul>
							</div>
						</li>
						<li id="business_tab" class="business">
							<a href="javascript:doClickTabQuickmenu('business');">영양<span class="icon_state"></span></a>
							<div class="cb_list">
								<ul>
									<li><a href="/work/business/kb_nutrition.do"><span class="icon b1"></span>영양의 날</a></li>
									<li><a href="/work/business/kb_health.do"><span class="icon b4"></span>국민건강증진사업</a></li>
									<li><a href="https://www.dietitian.or.kr/main_popup/popup_banner9.html" target="_blank" title="새창으로 이동"><span class="icon b5"></span>우리 농산물 정보관</a></li>
									<li class="noline"><a href="/work/business/kb_farm.do"><span class="icon b2"></span>우리농축수산물소비촉진</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="c_box2 bannerzone">
				<h2 class="ti">배너존</h2>
				<div class="cb_body">
					<ul>
						<c:forEach items="${bannerAry[3]}" var="banner4" varStatus="status">
						<li <c:if test="${status.count == 1 }"> class="start" </c:if>>
							<a href="${banner4.link_url}"  <c:if test="${ banner4.link_target != ''}"> target="${banner4.link_target }" title="새창으로 이동" </c:if>  onclick="doClickBanner(${banner4.idx});"><img src="${banner4.banner_img}" alt="${banner4.banner_name}" /></a>
						</li>
						</c:forEach>
					</ul>
				
				<!-- 
					<ul>
						
						<li >
							<a href="https://www.dietitian.or.kr/main_popup/popup_banner9.html"   target="_blank" title="새창으로 이동"   onclick="doClickBanner(87);"><img src="/images/banner/201806041355035081.png" alt="농산물" /></a>
						</li>
						<li class="start" >
							<img src="/images/banner/201806221355450371.png" usemap="#Map" />
							<map name="Map">
	                          <area shape="rect" coords="5,3,160,80"  href="http://kdaedu1.or.kr/" target="_black" alt="영양사 식품 위생교육">
	                          <area shape="rect" coords="170,3,320,80" href="http://kdaedu1.or.kr/FreeCourse.cmd?cmd=userFreeCourseList" target="_black" alt="영양사를 위한 무료 온라인 교육">
	                        </map>
						</li>
						<li >
							<a href="https://www.dietitian.or.kr/work/education/ke_contest_info.do"   target="_blank" title="새창으로 이동"   onclick="doClickBanner(91);"><img src="/images/banner/201805231744487981.png" alt="학술대회" /></a>
						</li>
						
					</ul>
					 -->
				</div>
			</div>
			<div class="area">
				<div class="c_familysite">
					<div class="cf_title">
						<h2>관련기관사이트</h2>
					</div>
					<div class="cf_list">
						<ul id="scrollerBanner">
							<li><a href="https://www.moe.go.kr" target="_blank" title="새창으로 이동">교육부</a></li>
							<li><a href="http://www.moel.go.kr" target="_blank" title="새창으로 이동">고용노동부</a></li>
							<li><a href="http://www.mafra.go.kr" target="_blank" title="새창으로 이동">농림축산식품부</a></li>
							<li><a href="http://www.mohw.go.kr" target="_blank" title="새창으로 이동">보건복지부</a></li>
							<li><a href="http://www.mfds.go.kr" target="_blank" title="새창으로 이동">식품의약품안전처</a></li>
							<li><a href="http://www.cdc.go.kr" target="_blank" title="새창으로 이동">질병관리청</a></li>
							<li><a href="http://kostat.go.kr/" target="_blank" title="새창으로 이동">통계청</a></li>
							<li><a href="http://www.me.go.kr" target="_blank" title="새창으로 이동">환경부</a></li>
							<!-- <li><a href="http://www.kosha.or.kr" target="_blank" title="새창으로 이동">안전보건공단</a></li> -->
							<li><a href="http://www.kidee2011.or.kr" target="_blank" title="새창으로 이동">한국영양교육평가원</a></li>
							<!-- <li><a href="http://www.seniordietitianclub.org" target="_blank" title="새창으로 이동">대한영양사시니어직능클럽</a></li> -->
							<li><a href="http://www.naqs.go.kr/smt2/index.html" target="_blank" title="새창으로 이동">원산지 표시 종합안내서비스</a></li>
							<li><a href="http://www.greentable.or.kr" target="_blank" title="새창으로 이동">바른 식생활 정보 114</a></li>
							<li><a href="http://koreanfood.rda.go.kr" target="_blank" title="새창으로 이동">식품성분표 검색</a></li>
						</ul>
					</div>
				</div>
				<div class="c_banner">
					<div class="cb_title">
						<h2>배너모음<a href="/use/ku_banner.do"><span class="icon"></span></a></h2>
						<div class="cb_navi">
							<button class="cb_btn prev" id="banner5_slider-next"><span class="ti" >이전배너</span></button>
							<button class="cb_btn stop" id="banner5_ctrl" onclick="playControl('banner5_ctrl', 5)"><span class="ti">일시정지</span></button>
							<button class="cb_btn next" id="banner5_slider-prev"><span class="ti">다음배너</span></button>
						</div>
					</div>
					<div  class="cb_list">
						<ul id="banner5">
							<c:forEach items="${bannerAry[4]}" var="banner5" varStatus="status">
							<li><a href="${banner5.link_url}" onclick="doClickBanner(${banner5.idx});" <c:if test="${ banner5.link_target != ''}"> target="${banner5.link_target }" title="새창으로 이동" </c:if>  class="mr10 slide"><img src="${banner5.banner_img}" width="150" height="40" alt="" /></a></li>
							</c:forEach>
						</ul>
					</div>			
					
				</div>
			</div>
		</div>
	</div>
	<!-- Contents E-->
	
	<%@ include file ="/pages/footer.jsp"%>
	
</div>	
</body>	
</html>
<script>
var banner1 = $('#banner1').bxSlider({ 		
	infiniteLoop: true,						
	auto: true,
	minSlides: 1,      // 최소 노출 개수
    maxSlides: 1,      // 최대 노출 개수
    moveSlides : 1,
    pause: 1000,	
    speed: 10000,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    slideMargin: 0,
    nextText : '',
    prevText : ''
});

$('#banner1_slider-next').click(function(){
	 banner1.goToNextSlide();
     return false;
});

$('#banner1_slider-prev').click(function(){
  	banner1.goToPrevSlide();
	return false;
});


var banner4 = $('#banner4').bxSlider({ 		
	infiniteLoop: true,						
	auto: true,
	minSlides: 1,      // 최소 노출 개수
    maxSlides: 1,      // 최대 노출 개수
    moveSlides : 1,
    pause: 10000,	
    speed: 1000,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    slideWidth: 323,   // 슬라이드 너비
    slideMargin: 0,
    nextText : '',
    prevText : '',
    onSlideAfter : function() {					
    	sliderPager( 4 ); 	
    }    
});

var banner5 = $('#banner5').bxSlider({ 		
	infiniteLoop: true,						
	auto: true,
	minSlides: 4,      // 최소 노출 개수
    maxSlides: 4,      // 최대 노출 개수
    moveSlides : 1,
    pause: 1000,
    speed: 1000,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    slideWidth: 480,   // 슬라이드 너비
    slideMargin: 0,
    nextText : '',
    prevText : '' 
});

$('#banner5_slider-next').click(function(){
	 banner5.goToNextSlide();
      return false;
});

$('#banner5_slider-prev').click(function(){
   	banner5.goToPrevSlide();
	return false;
});

function sliderPager(num) {
	var currentIdx = eval("banner" + num).getCurrentSlide();
	$("#banner" + num + "_pager > li a").each(function(index){
		if( currentIdx == index) {
			$(this).addClass("on");	
		} else {
			$(this).removeClass("on");
		}				
	});
}	

function sliderGoTo(num, index) {
	var banner = eval("banner" + num);
	banner.goToSlide(index);
}
					
function playControl(id, num) {
	var isStop = $("#"+id).hasClass('play');
	var banner = eval("banner"+num);
	if( !isStop ) {
		
		banner.stopAuto(true);
		$("#"+id).removeClass('stop');
		$("#"+id).addClass('play');
	} else {
		banner.startAuto(true);
		$("#"+id).removeClass('play');
		$("#"+id).addClass('stop');
	}	
}
</script>