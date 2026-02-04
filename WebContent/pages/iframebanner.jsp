<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %> 
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
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
			
			var addr = "";
			if(v==1){
				addr = "/work/news/kn_notice.do?bbs_board_code=2";				
			}else if(v==2){
				addr = "/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81";
			}else if(v==3){
				addr = "/work/news/kn_organ_news.do?bbs_board_code=0";
			}
						
			$("#plusBbs").attr("href", addr);
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

	
	
	<!-- Contents S-->
	<div id="contents">
		
		
		
		<div >

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
		
	
		</div>
	</div>
	<!-- Contents E-->

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