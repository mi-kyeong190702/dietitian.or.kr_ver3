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
	
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/html5.js"></script>
	<script src="/js/dietitan.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
	<style>
	#wrap { min-width: 0px !important;}
	.wrap { width : 100% !important;}
	</style>
</head>
<body>
<div id="wrap">
	<div id="contents">
		<div class="wrap">
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
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
