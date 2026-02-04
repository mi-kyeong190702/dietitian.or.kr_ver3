<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>사단법인 대한영양사협회</title>	
	<link rel="stylesheet" href="/css/research_common.css">
	<link rel="stylesheet" href="/css/research_layout.css">
	<link rel="shortcut icon" href="/css/favicon.ico" />
	<script src="/js/jquery-1.11.2.min.js"></script>	
	<script src="/js/html5.js"></script>
	<script src="/js/dietitan.js"></script>
	<script src="/js/jquery.bpopup.min.js"></script>
	
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

			<!-- 이 LEFT 메뉴 부분과 바로 아래에 있는 Content 부분은 프로그래머가 해당 페이지에 맞게 알아서 다르게 Include 할 겁니다. -->
			<!-- 아래 ASP 문법은 그냥 인클루드 문법이라고 생각 하시면 됩니다 -->
			<tiles:insertAttribute name="menu" />

			<hr />

			<!-- 이 Content 부분도 해당 페이지에 맞게 알아서 다르게 Include. -->
			<tiles:insertAttribute name="body" />

		</div>
	</div>
	
	<hr />
	
	<!-- Footer S-->
	<tiles:insertAttribute name="footer" />
	<!-- Footer E-->

</div>
</body>

<script src="/js/jquery.PrintArea.js_4.js"></script>
<script src="/js/jquery.printElement.js"></script>
<script src="/js/jquery.mb.browser.min.js"></script>
<script src="/js/jquery.bpopup.min.js"></script>
<script src="/js/html5.js"></script>
<script src="/js/dietitan.js"></script>

</html>