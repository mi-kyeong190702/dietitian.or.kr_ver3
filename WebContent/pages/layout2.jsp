<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, 
				org.springframework.web.context.WebApplicationContext,
				org.springframework.web.context.support.WebApplicationContextUtils,
				java.util.*,
				kda.main.data.BANNER,
				kda.main.MainService" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta property="og:image" content="https://www.dietitian.or.kr/images/common/logo_kda.png" />
	<title>사단법인 대한영양사협회</title>	
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/layout.css">
	<link rel="shortcut icon" href="/css/favicon.ico" type="images/ico"/> 
	<link rel="stylesheet" href="/css/jquery-ui-1.10.4.custom.min.css" />
	<link rel="stylesheet" href="/css/jquery.ui.timepicker.css" />
	<script src="/js/jquery-1.11.2.min.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.timepicker.js"></script>
	<script type="text/javascript" src="/js/html5.js"></script>
	<script src="/js/jquery.PrintArea.js_4.js"></script>
	<script src="/js/jquery.printElement.js"></script>
	<script src="/js/jquery.mb.browser.min.js"></script>
	<script src="/js/jquery.bpopup.min.js"></script>	
	<script src="/js/dietitan.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
	<script>
	$(document).ready(function(){
		$(".lt_wrap").each(function(ind){
			if( $(this).hasClass("txt") ) {	
				$(this).addClass("common_folder_contents");
				if( ind > 1 ) {
					$(this).hide();
				}
			} else {
				$(this).addClass("common_folder_title");
				reverseIcon(0);	
			}
		});
		
		$(".common_folder_title").each(function(bIndex){	
			$(this).click(function(){
				$(".common_folder_contents").each(function(cIndex) {
					if( bIndex == cIndex ) {
						$(this).show();
					} else {
 						$(this).hide();
 					}
				});
				reverseIcon(bIndex);
			});
		});
		
		function reverseIcon(index) {
			$(".common_folder_title").each(function(bIndex){	
				var btn = $(this).find(".icon");
				if( index == bIndex ) {
					btn.removeClass("close");
					btn.addClass("open");
				} else {
					btn.removeClass("open");
					btn.addClass("close");
				}
			});
		}
	});
	</script>
</head>
<body>
<div id="wrap">

	<!-- Header S-->
	<tiles:insertAttribute name="header" />
	<!-- Header E--> 
	<hr />
	
	<!-- Contents S-->
	<div id="contents" class="sub">
		<div class="wrap">

			<tiles:insertAttribute name="menu" />

			<hr />

			<tiles:insertAttribute name="body" />
			<%
			List<BANNER> bannerList = new ArrayList();
			try { 
				WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
				MainService mainService = (MainService)ctx.getBean("bannerService");
				bannerList = mainService.getMainBannerList();
            	
        	} catch(Exception e) { 
        		// false로 가져가지
        		e.printStackTrace();
        	}
			
			%>
			
			<div class="area">
				<div class="c_banner sub">
					<div class="cb_title">
						<h2>배너모음<a href="/use/ku_banner.do"><span class="icon"></span></a></h2>
						<div class="cb_navi">
							<button class="cb_btn prev" id="banner5_slider-next"><span class="ti" >이전배너</span></button>
							<button class="cb_btn stop" id="banner5_ctrl" onclick="playControl('banner5_ctrl', 5)"><span class="ti">일시정지</span></button>
							<button class="cb_btn next" id="banner5_slider-prev"><span class="ti">다음배너</span></button>
						</div>
					</div>
					<div class="cb_list">
						<ul id="banner5">
							<% 	for( BANNER banner : bannerList ) { 
									if( banner.getBanner_type() == 5 ) {	
							%>
							
							<li><a href="<%=banner.getLink_url()%>" onclick="doClickBanner(<%=banner.getIdx()%>);"  
									<% if( banner.getLink_target() != null && !banner.getLink_target().equals("") ){ %> target="<%=banner.getLink_target()%>" title="새창으로 이동" <% } %>  class="mr10 slide"><img src="<%=banner.getBanner_img()%>" width="150" height="40" alt="" /></a></li>
							
							<% 		}
								} %>
							
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<hr />
	
	<!-- Footer S-->
	<tiles:insertAttribute name="footer" />
	<!-- Footer E-->

</div>
</body>
</html>
<script>
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

<c:if test="${login == 'Y' }">
<script>
var pageTitle = $.trim($(".sp_title").text());
$.ajax({
	url : "/member_log_ajax.do",
	data : "page_title=" + encodeURIComponent(pageTitle),
	success : function() {
		alert("success");
	}
});
</script>
</c:if>