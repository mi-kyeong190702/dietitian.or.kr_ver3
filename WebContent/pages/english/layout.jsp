<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>The Korean Dietetic Association</title>
	<link rel="stylesheet" href="/english/css/common.css">
	<link rel="stylesheet" href="/english/css/layout.css">
	<link rel="shortcut icon" href="/english/css/favicon.ico" />
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/html5.js"></script>
	<script src="/js/jquery.bpopup.min.js"></script>
	<script src="/js/english.js"></script>
</head>
<body>
<div id="wrap">
	<tiles:insertAttribute name="header" />
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