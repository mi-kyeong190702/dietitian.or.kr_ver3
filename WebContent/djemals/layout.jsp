<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<title>대한영양사협회</title>
<script type="text/javascript" src="/djemals/js/jquery-1.11.2.min.js" ></script>
<link rel="stylesheet" type="text/css" href="/djemals/back/css/import.css" />
<link rel="stylesheet" type="text/css" href="/djemals/css/admin_common.css" /> 
<link rel="stylesheet" type="text/css" href="/djemals/css/adm_layout.css" />
<script type="text/javascript">
function showMenu(menuId) {
	$("#"+menuId).show();
}

function hideMenu(menuId) {
	$("#"+menuId).hide();
}
</script>   
</head>
<body>

<tiles:insertAttribute name="top"/>
<tiles:insertAttribute name="left" />
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

</body>
</html>