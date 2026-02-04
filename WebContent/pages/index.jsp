<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta property="og:type" content="website"> 
	<meta property="og:title" content="대한영양사협회">
	<!-- 이미지 파일 교체 후 사용하세요, 카카오 og 캐시 삭제: https://developers.kakao.com/tool/debugger/sharing -->
	<meta property="og:image"  content="https://www.dietitian.or.kr/images/common/logo_kda.png">
	<meta property="og:description" content="대한영양사 협회 홈페이지">
	<meta property="og:site_name" content="대한영양사협회">
	<meta property="og:locale" content="ko_KR">
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
	var tmpPopStartDt_newYear = "2026/01/01 07:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_newYear   = "2026/01/31 18:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	
	var vPopStartDt_newYear = new Date();
	var vPopEndDt_newYear   = new Date();
	
	vPopStartDt_newYear = new Date(tmpPopStartDt_newYear);
	vPopEndDt_newYear   = new Date(tmpPopEndDt_newYear);

	if( getCookie( "notice_newYear" ) != "done" ){
		if( vNowDt >= vPopStartDt_newYear && vNowDt <= vPopEndDt_newYear ) {
			noticeWindow_newYear = window.open('/assets/ver2/popup/popup_newYear_2026.html','notice_newYear','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=565px,height=850px,top=50px,left=500px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_newYear.opener = self;
		}
	}
	
	// [ popup - 1 ]
	//var tmpPopStartDt_1 = "2020/11/23"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopStartDt_1 = "2025/05/01"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_1   = "2025/07/18"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_1 = new Date();
	var vPopEndDt_1   = new Date();
	
	vPopStartDt_1 = new Date(tmpPopStartDt_1);
	vPopEndDt_1   = new Date(tmpPopEndDt_1);
	
	// 조건에 맞으면 팝업_1 을 띄움...
	if( getCookie( "notice_1" ) != "done" ){
		if( vNowDt >= vPopStartDt_1 && vNowDt <= vPopEndDt_1 ) {
			noticeWindow_1 = window.open('/assets/ver2/popup/popup_20250704.html','notice_1','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=500px,height=660px,top=100px,left=450px');
			//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
			noticeWindow_1.opener = self;
		}
	}
	
	
	// [ popup - 2 ]
	//임상영양관리지침서 관련 팝업 2022.05.02
	//영양사 올해의 뉴스 설문 관련 팝업 2022.11.07
	//영양사 올해의 뉴스 설문 관련 팝업 2022.11.21
	//서비스 일시중단 안내 팝업 2023.07.14
	var tmpPopStartDt_2 = "2025/04/30 12:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_2   = "2025/08/01"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_2 = new Date();
	var vPopEndDt_2   = new Date();
	
	vPopStartDt_2 = new Date(tmpPopStartDt_2);
	vPopEndDt_2   = new Date(tmpPopEndDt_2);
	
	// 조건에 맞으면 팝업_2 을 띄움...
    if( getCookie( "notice_2" ) != "done" ){
        // 추가보수교육 일시중단
        if( vNowDt >= vPopStartDt_2 && vNowDt <= vPopEndDt_2 ) {
        	noticeWindow_2 = window.open('/assets/ver2/popup/popup_20250710.html','notice_2','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=500px,height=920px,top=100px,left=1000px');
            noticeWindow_2.opener = self;
        }
    }
	
	// [ popup - 3 ]
	//영양의날 안내 팝업 2022.09.23
	//영양의날 안내 팝업 2023.05.13
	//공모전 안내 팝업 2023.07
	//영양의날 안내 팝업 2023.10.11
	var tmpPopStartDt_3 = "2024/05/13 07:00:00"; // 팝업 시작할날짜(자릿수지키세요)
	var tmpPopEndDt_3   = "2025/06/21 09:00:00"; // 팝업 종료할날짜(종료일 + 1 로 설정해야 함)
	
	var vPopStartDt_3 = new Date();
	var vPopEndDt_3   = new Date();
	
	vPopStartDt_3 = new Date(tmpPopStartDt_3);
	vPopEndDt_3   = new Date(tmpPopEndDt_3);
	
	// 조건에 맞으면 팝업_3 을 띄움...
	if( getCookie( "notice_3" ) != "done" ){
		if( vNowDt >= vPopStartDt_3 && vNowDt <= vPopEndDt_3 ) {
			noticeWindow_3 = window.open('/assets/ver2/popup/popup_20250619.html','notice_3','toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes, resizable=no,width=600px,height=480px,top=210px,left=650px');
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
			var  str=data;
			var word = str.split("$"); 
			 
			$("#tabConM01").html(word[0]);
			$("#tabConM02").html(word[1]);
			$("#tabConM03").html(word[2]);  
			//$("#tabConM07").html(word[4]);
			$("#tabConM04").html(word[4]);
			$("#tabConM05").html(word[5]); 
			departmentLoading();
			  
		}
		
		function departmentLoading(){ 
			$.ajax ( {
                type      : "GET"
              , url       : "/main_getDepartHtml.do"
              , dataType  : "html"
              , cache     : false
              , success   : handleGetDepartHtml
              , error     : handleGetNoticeHtmlError              
          });
		}
		
		function departmentLoading2(){ 
            $.ajax ( {
                type      : "GET"
              , url       : "/main_getDepartHtml2.do"
              , dataType  : "html"
              , cache     : false
              , success   : handleGetDepartHtml2
              , error     : handleGetNoticeHtmlError              
          });
        }
		
		function handleGetDepartHtml(data){ 
            
			$("#stabConM01").html(data); 
			departmentLoading2();
		}
		
	    function handleGetDepartHtml2(data){
            
            var  str=data;
            var word = str.split("$"); 
             
            $("#stabConM02").html(word[0]);
            $("#stabConM03").html(word[1]);
            $("#stabConM04").html(word[2]);
            $("#stabConM05").html(word[3]);
            $("#stabConM06").html(word[4]);
            $("#stabConM07").html(word[5]);
            
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
		
		function doClickBBS(bbs_page,bbs_idx, bbs_board_code)
		{	
			var userId = $("#userId").val();
			var param = "?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_board_code=" + bbs_board_code + "&bbs_idx=" + bbs_idx;
			var param2 = "?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_board_code=" + bbs_board_code + "&bbs_idx=" + bbs_idx + "&g_userid=" + userId;
 
			document.location.href = "/work/" + bbs_page+".do" + param2;
			
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
  
  <!-- Header S-->
   <%@ include file ="/pages/header.jsp"%>
  <!-- Header E--> 
  
  <!-- Contents S-->
  <div id="contents">
  	<input type="hidden" name="userId" id="userId" value="${g_encoded_userid}"> 
  	<input type="hidden" name="userlevel" id="userlevel" value="${g_user_level}">
  	<input type="hidden" name="userCodeBig" id="userCodeBig" value="${g_code_big}">
    <!-- 2025-02-15 메인 -->
    <div class="main_sec01">
      <div class="new_wrap">
        <div class="main_sec01_top"> 
          <!-- family site -->
          <div class="c_familysite">
            <div class="cf_title"> 관련기관사이트 </div>
            <div class="cf_list">
              <ul id="scrollerBanner">
                <li><a href="https://www.moe.go.kr" target="_blank" title="새창으로 이동">교육부</a></li>
                <li><a href="https://www.moel.go.kr" target="_blank" title="새창으로 이동">고용노동부</a></li>
                <li><a href="https://www.mafra.go.kr" target="_blank" title="새창으로 이동">농림축산식품부</a></li>
                <li><a href="https://www.foodnuri.go.kr" target="_blank" title="새창으로 이동">농식품정보누리</a></li>
                <li><a href="https://www.mohw.go.kr" target="_blank" title="새창으로 이동">보건복지부</a></li>
                <li><a href="https://www.foodlife-edu.or.kr/main.fd" target="_blank" title="새창으로 이동">식생활교실</a></li>
                <li><a href="https://koreanfood.rda.go.kr" target="_blank" title="새창으로 이동">식품성분표 검색</a></li>
                <li><a href="https://www.mfds.go.kr" target="_blank" title="새창으로 이동">식품의약품안전처</a></li>
                <li><a href="https://www.naqs.go.kr/hp/jsp/falsdisp/violatorPublic4NAQS.jsp" target="_blank" title="새창으로 이동">원산지·축산물이력위반공표</a></li>
                <li><a href="https://www.kdca.go.kr" target="_blank" title="새창으로 이동">질병관리청</a></li>
                <li><a href="https://kostat.go.kr/ansk" target="_blank" title="새창으로 이동">통계청</a></li>
                <li><a href="https://www.kidee2011.or.kr/php/main.php" target="_blank" title="새창으로 이동">한국영양교육평가원</a></li>
                <li><a href="https://www.mof.go.kr" target="_blank" title="새창으로 이동">해양수산부</a></li>
                <li><a href="https://www.me.go.kr" target="_blank" title="새창으로 이동">환경부</a></li>
              </ul>
            </div>
          </div>
          <!-- //family stie --> 
          <!-- search -->
          <div class="h_search">
            <form method="post" action="/ks_result.do">
              <fieldset>
                <legend><span class="ti">통합검색</span></legend>
                <label for="top_search"><span class="ti">카테고리</span></label>
                <select id="top_search" name="search" class="hs_select">
                  <option value="1" selected>회원자료실</option>
                  <option value="2">영양관련정보</option>
                  <option value="3">국민영양</option>
                </select>
                <label for="top_keyword"><span class="ti">검색어</span></label>
                <input type="text" class="hs_input" name="keyword" id="top_keyword" onkeypress="if( event.keyCode == 13) f_CommonSearch(); " placeholder="검색어를 입력하세요." />
                <button class="hs_btn" type="button" onclick="f_CommonSearch();"><span class="ti">검색</span></button>
              </fieldset>
            </form>
          </div>
          <!-- //search --> 
          <!-- sns 영역-->
          <div class="main_sns">
            <ul>
              <li><a href="https://www.youtube.com/@%EB%8C%80%ED%95%9C%EC%98%81%EC%96%91%EC%82%AC%ED%98%91%ED%9A%8C-g9w" target="_blank" title="youtube"><img src="/images/main/icon_sns01.png" alt="youtube"/></a></li>
              <li><a href="https://www.instagram.com/korean_dietetic_official/" target="_blank" title="Instagram"><img src="/images/main/icon_sns02.png" alt="Instagram"/></a></li>
              <li><a href="https://blog.naver.com/kdanews2020" target="_blank" title="blog"><img src="/images/main/icon_sns03.png" alt="blog"/></a></li>
              <li><a href="https://pf.kakao.com/_yxnxiuxb" target="_blank" title="kakaotalk"><img src="/images/main/icon_sns04.png" alt="kakaotalk"/></a></li>
              <li><a href="http://www.kdanews.co.kr/main/index.html" target="_blank" title="news"><img src="/images/main/icon_sns05.png" alt="news"/></a></li>
            </ul>
          </div>
          <!-- //sns 영역--> 
        </div>
        <div class="main_sec01_bot"> 
          <!-- 주요 메뉴 바로가기 -->
          <div class="c_box quickmenu">
            <h2 class="ti">주요 메뉴 바로가기</h2>
            <h4><strong>주요 메뉴</strong> 바로가기</h4>
            <ul>
              <li><a href="/member/km_join.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_01.png"  alt=""/></p>
                <p>회원가입</p>
                </a></li>
              <li><a href="/work/introduction/ki_about.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_02.png"  alt=""/></p>
                <p>영양사 소개</p>
                </a></li>
              <li><a href="/work/news/kn_re_license.do?g_userid=${g_encoded_userid}">
                <p class="_ico"><img src="../images/main/icon_quick_menu_05.png"  alt=""/></p>
                <p>면허증재교부</p>
                </a></li>
              <li><a href="/work/publication/kp_magazine.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_04.png"  alt=""/></p>
                <p>국민영양</p>
                </a></li>
              <li><a href="https://jkda.jams.or.kr/" target="_blank">
                <p class="_ico"><img src="../images/main/icon_quick_menu_08.png"  alt=""/></p>
                <p>온라인 논문 투고</p>
                </a></li>
              <li><a href="http://www.kdanews.co.kr/main/index.html" target="_blank">            
                <p class="_ico"><img src="../images/main/icon_quick_menu_06.png"  alt=""/></p>
                <p>영양사신문</p>
                </a></li>
              <li><a href="/work/news/kn_careers.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_07.png"  alt=""/></p>
                <p>채용정보</p>
                </a></li>
              <li><a href="/work/archive/ka_archive.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_03.png"  alt=""/></p>
                <p>회원자료실</p>
                </a></li>  
              <li><a href="/work/education/ke_curriculum.do">
                <p class="_ico"><img src="../images/main/icon_quick_menu_09.png"  alt=""/></p>
                <p>교육과정신청</p>
                </a></li>
            </ul>
            <!--//주요 메뉴 바로가기 --> 
          </div>
          <!-- 최근게시물 -->
          <div class="c_box latest">
            <h2 class="ti">최근게시물</h2>
            <!--공지사항 -->
            <div class="basic_tab tab-container-JS" >
              <div class="tab_list_style tab-list-JS">
                <ul>
                  <li class="selected"><a href="#tabConM01">공지사항</a></li>
                  <li><a href="#tabConM02">시도영양사회</a></li>
                  <li><a href="#tabConM03">관련기관소식 </a></li>
                </ul>
              </div> 
              <div class='tab_content tab-content-wrapper-JS' >
	              <div class="tab_con" id="tabConM01" ></div>
               	  <div class="tab_con" id="tabConM02"></div>
	              <div class="tab_con" id="tabConM03"></div>
              </div>
            </div>
            <!--//공지사항 --> 
          </div>
          <!--//최근게시물 --> 
          
          <!--기존 팝업존 그대로 사용 -->
          <div class="c_box popupzone">
            <h2 class="ti">팝업존</h2>
            <div class="cb_navi"> 
              <!--button id="banner4_ctrl" class="stop" onclick="playControl('banner4_ctrl', 4)"><span class="ti">정지</span></button><!-- 정지버튼을 누르면 재생버튼으로 교체해주세요. -->
              <ul id="banner4_pager">
                <c:forEach items="${bannerAry[2]}" var="banner3" varStatus="status"> 
                 <li><a href="javascript:sliderGoTo( 4, ${status.index})" <c:if test="${status.index == 0 }">class="on"</c:if>><strong><span class="ti">${status.count}</span></strong></a></li>
                </c:forEach>
              </ul>
            </div>
            <div class="cb_body">
              <ul id="banner4">
                <c:forEach items="${bannerAry[2]}" var="banner3"> 
                    <li><a href="${banner3.link_url}" title="${banner3.banner_name}" <c:if test="${ banner3.link_target != ''}"> target="${banner3.link_target }" title="새창으로 이동" </c:if> onclick="doClickBanner(${banner3.idx});"><img src="${banner3.banner_img}" alt="${banner3.banner_name}" width="406px" height="310"/></a></li
                </c:forEach>
              </ul>
            </div>
          </div>
          <!-- // 기존 팝업존 그대로 사용--> 
        </div>
      </div>
    </div>
    <div class="main_sec02">
      <div class="new_wrap"> 
        <!-- 최신글 (뉴스) -->
        <div class="c_box wide ">
          <h2 class="ti">최신글 (뉴스)</h2>
          <div class="box_tab tab-container-JS" >
            <div class="tab_list_style tab-list-JS" >
              <ul>
                <li class="selected"><a href="#tabConM04">식품ㆍ영양 News</a></li>
                <li><a href="#tabConM05">협회 News</a></li>
              </ul>
            </div>
            <div class="tab_content tab-content-wrapper-JS">
              <div class="tab_con" id="tabConM04" > 
                <!-- 뉴스 게시물 --> 
              </div>
              <div class="tab_con" id="tabConM05" > 
                <!-- 뉴스 게시물 -->                
              </div>
            </div>
          </div>
        </div>
        <!-- //최신글 (뉴스)  --> 
        <!-- 최신글 (갤러리) -->
        <div class="c_box wide ">
          <h2 class="ti">최신글 (갤러리)</h2>
          <div class="box_tab tab-container-JS" >
            <div class="tab_list_style tab-list-JS">
              <ul>
                <li class="selected"><a href="#tabConM06">협회 활동 현황</a></li>
                <li><a href="#tabConM07">나의 식단 자랑하기</a></li>
              </ul>
            </div>
            <div class="tab_content tab-content-wrapper-JS">
              <div class="tab_con"  id="tabConM06">
               <h2 class='ti'>협회 활동 현황</h2>               
               <ul class='gallery_list' id='gallery06'>
                <!-- 협회 활동 현황 게시물 noticeList4 --> 
                <c:forEach items="${noticeList4}" var="notice">
                 <c:if test="${notice.bbs_board_code == 89}">
                <li> 
                	<a href="javascript:doClickBBS('news/kn_gallery',${notice.bbs_idx},89)">
                		<p class="photo">
                			<img src="${notice.bbs_file_url}" alt="">
                		</p>
                	<div>
                		<p class="title">${notice.bbs_subject}</p>
                		<p class="date">${notice.bbs_reg_date_dt.substring(0,10)}</p>
                	</div>
                	</a> 
                </li>
                </c:if> 
                </c:forEach> 
                </ul>
                <a href="/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_encoded_userid}" class="more" title="협회활동 더보기"><span>협회활동 더보기</span></a>                 
              </div> 
              <div class="tab_con" id="tabConM07" > 
                <!-- 나의 식단 자랑하기 게시물 -->
                <h2 class='ti'>나의 식단 자랑하기</h2><ul class='gallery_list' id='gallery07'>
                <!-- 협회 활동 현황 게시물 noticeList4 --> 
                <c:forEach items="${noticeList4}" var="notice">
                 <c:if test="${notice.bbs_board_code == 92}">
                <li> 
                    <a href="javascript:doClickBBS('archive/ka_recipe',${notice.bbs_idx},92)">
                        <p class="photo">
                            <img src="${notice.bbs_file_url}" alt="">
                        </p>
                    <div>
                        <p class="title">${notice.bbs_subject}</p>
                        <p class="date">${notice.bbs_reg_date_dt.substring(0,10)}</p>
                    </div>
                    </a> 
                </li>
                </c:if> 
                </c:forEach>
                </ul>
                <a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}" class="more" title="식품ㆍ영양 News 더보기"><span>식품ㆍ영양 News 더보기</span></a>  
              </div>
              </div>
            </div>
          </div>
        </div>
        <!-- //최신글 (갤러리)  --> 
      </div>
    </div>
    <div class="main_sec03">
      <div class="new_wrap">
        <div class="part_tab tab-container-JS" >
          <div class="tab_list_style tab-list-JS">
          	<p>분과별게시판</p>
            <ul>
              <li class="selected"><a href="#stabConM01"><i class="_ico icon01"></i><span>산업체</span></a></li>
              <li><a href="#stabConM02"><i class="_ico icon02"></i><span>병원</span></a></li>
              <li><a href="#stabConM03"><i class="_ico icon03"></i><span>영양교사</span></a></li>
              <li><a href="#stabConM04"><i class="_ico icon04"></i><span>학교영양사</span></a></li>
              <li><a href="#stabConM05"><i class="_ico icon05"></i><span>보건복지</span></a></li>
              <li><a href="#stabConM06"><i class="_ico icon06"></i><span>건강상담</span></a></li>
              <li><a href="#stabConM07"><i class="_ico icon07"></i><span>어린이·사회복지급식관리지원센터</span></a></li><!-- 2025-03-07 수정 -->
            </ul>
          </div>
          <div class="tab_content tab-content-wrapper-JS">
            <div class="tab_con" id="stabConM01" > 
              <!--산업체 --> 
            </div>
            <div class="tab_con" id="stabConM02" > 
              <!--병원 --> 
            </div>
            <div class="tab_con" id="stabConM03" > 
              <!--영양교사 -->             
            </div>
            <div class="tab_con" id="stabConM04" > 
              <!--학교영양사 -->
            </div>
            <div class="tab_con" id="stabConM05" > 
              <!--보건복지 -->
            </div>
            <div class="tab_con" id="stabConM06" > 
              <!--건강상담 -->
            </div>
            <div class="tab_con" id="stabConM07" > 
              <!--어린이급식관리지원센터 -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="main_sec04">
      <div class="new_wrap">
        <ul class="main_banner">
          <c:forEach items="${bannerAry[3]}" var="banner4" varStatus="status">
			<li <c:if test="${status.count == 1 }"> class="start" </c:if>>
				<a href="${banner4.link_url}"  <c:if test="${ banner4.link_target != ''}"> target="${banner4.link_target}" title="새창으로 이동" </c:if> onclick="doClickBanner(${banner4.idx});">
				<img src="${banner4.banner_img}" alt="${banner4.banner_name}" /></a>
			</li>
		  </c:forEach>
        </ul>
      </div>
    </div>
    <!-- right quick -->
    <div class="main_quick">
      <h4>KDA교육</h4>
      <ul>
        <li><a href="https://www.kdaedu.or.kr/" target="_blank" rel="noopener noreferrer">법정교육센터</a></li>
        <li><a href="https://www.kdaedu.or.kr/" target="_blank" rel="noopener noreferrer">면허신고센터</a></li>
        <li><a href="/member/sso_login2.do">온라인교육센터</a></li>
        <li><a href="/work/education/ke_elderly_info.do">교육과정안내</a></li>
        <li><a href="/work/education/ke_contest_info.do">영양사학술대회</a></li>
      </ul>
      <h4>KDA정보</h4>
      <ul>
        
        <li><a href="/member/km_join.do">회원가입</a></li>
        <li><a href="/work/archive/ka_diet_manage.do?g_userid=${g_encoded_userid}">식단관리프로그램</a></li>       
        <li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
        <li><a href="http://www.kdanews.co.kr/main/index.html" target="_blank" rel="noopener noreferrer">영양사신문</a></li>
         <li><a href="/work/business/kb_nutrition.do">영양의 날</a></li>
      </ul>
      <button class="main_quick_control"><span>퀵메뉴컨틀로</span></button>
    </div>
    <!-- //right quick --> 
    <!-- //2025-02-15 메인 --> 
  </div>
  <!-- Contents E--> 
  
  <!-- Footer S-->
   <%@ include file ="/pages/footer.jsp"%>
  <!-- Footer E--> 
  
</div>
</body>
</html> 
<script>


var banner4 = $('#banner4').bxSlider({ 		
	infiniteLoop: true,						
	auto: true,
	minSlides: 1,      // 최소 노출 개수
    maxSlides: 1,      // 최대 노출 개수
    moveSlides : 1,
    pause: 10000,	
    speed: 1000,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    slideWidth: 406,   // 슬라이드 너비
    slideMargin: 0,
    nextText : '',
    prevText : '',
    onSlideAfter : function() {					
    	sliderPager( 4 ); 	
    }    
});
var banner6, banner7;
 
// 갤러리(협회 활동 현황)
$(function(){
	 banner6 =  $('#gallery06').bxSlider({
     infiniteLoop: true,
      auto: true,
      minSlides: 1,
      maxSlides: 2,
      moveSlides: 2,
      pause: 4000,
      speed: 2000,
      pager: false,
      slideWidth: 269,
      nextText : '',
      prevText : '',
      onSlideAfter: function() { sliderPager(2); }
     });

	  // 갤러리(나의 식단 자랑하기)
      banner7 =    $('#gallery07').bxSlider({
      infiniteLoop: true,
      auto: true,
      minSlides: 1,
      maxSlides: 2,
      moveSlides: 2,
      pause: 4000,
      speed: 2000,
      pager: false,
      slideWidth: 269,
      slideMargin: 0,
      onSlideAfter: function() { sliderPager(2); }
    }); 
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


	
/* 새로 tab js 추가 */
	jQuery(function ($) {

  $(".tab-container-JS").each(function () {
    var $TabList = $(this).find(".tab-list-JS");
    var $TabListli = $TabList.find("li");
    var $ConWrapper = $(this).children(".tab-content-wrapper-JS");
    var $Content = $ConWrapper.children();

    var $selectCon = $TabList.find("li.selected").find("a").attr("href");
    $Content.hide();
    $($selectCon).show();

    $TabListli.children("a").click(function () { 
    	console.log($TabListli.children("a"));
    	
      if (!$(this).parent().hasClass("selected")) {
        var visibleCon = $(this).attr("href");
        $TabListli.removeClass("selected");
        $(this).parent("li").addClass("selected"); 
        $Content.hide();
        $(visibleCon).fadeIn(function(){
            if ( visibleCon === "#tabConM07" ) {
                banner7.reloadSlider();
                
            }
            if ( visibleCon === "#tabConM06" ) {
                banner6.reloadSlider();  
              }
        });

      }
      return false;
    });
  });
  
  $(".main_quick_control").click(function () {
      $(this).parent().toggleClass("close");
	    $(this).toggleClass("open");
	});

  });

  jQuery(function($){
	    // 분과별 탭 li 컬렉션
	    var $partTabs = $('.part_tab .tab-list-JS li');
	    var tabCount  = $partTabs.length;
	    var current   = 0;

	    // 5초(5000ms)마다 다음 탭 클릭
	    setInterval(function(){
	      current = (current + 1) % tabCount;
	      $partTabs.eq(current).find('a').trigger('click');
	    }, 10000);
  });
  
  jQuery(function($){ 
	  var $tabs = $('.main_sec02 .box_tab .tab-list-JS li');
	    
	    // 자동 전환 대상 탭만 필터링 (예: "식품 영양News", "협회 News"만 전환)
	    var $autoTabs = $tabs.filter(function() {
	        var tabText = $(this).text().trim();
	        return tabText !== '협회 활동 현황' && tabText !== '나의 식단 자랑하기';
	    });

	    var current = 0;

	    setInterval(function(){
	        current = (current + 1) % $autoTabs.length;
	        $autoTabs.eq(current).find('a').trigger('click');
	    }, 5000); // 5초
	});
  
  jQuery(function($){ 
      var $tabs = $('.main_sec02 .box_tab .tab-list-JS li');
        
        // 자동 전환 대상 탭만 필터링 (예: "식품 영양News", "협회 News"만 전환)
        var $autoTabs = $tabs.filter(function() {
            var tabText = $(this).text().trim();
            return tabText !== '식품ㆍ영양 News' && tabText !== '협회 News';
        });

        var current = 0; 

        setInterval(function(){
            current = (current + 1) % $autoTabs.length;
            $autoTabs.eq(current).find('a').trigger('click');
        }, 8000); // 5초
        
    });
  /* 
  var main_banner = $('.main_banner').bxSlider({      
	    infiniteLoop: true,                     
	    auto: true,
	    minSlides: 4,      // 최소 노출 개수
	    maxSlides: 4,      // 최대 노출 개수
	    moveSlides : 1,
	    pause: 3000,    
	    speed: 3000,        // 이동 속도를 설정
	    pager: false,      // 현재 위치 페이징 표시 여부 설정
	   slideWidth: 297,   // 슬라이드 너비
	});
 */
	/* 새로 tab js 추가 */

</script>