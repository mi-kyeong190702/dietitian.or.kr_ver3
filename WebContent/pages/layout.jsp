<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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

		</div>
	</div>
	
	<hr />
	
	<!-- Footer S-->
	<tiles:insertAttribute name="footer" />
	<!-- Footer E-->

</div>
</body>
</html> 
 