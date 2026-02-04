<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html> 
	<body> 
	<script type="text/javascript"> 
		alert("${requestScope.message}");
		
		var redirect = "${requestScope.redirect}";
		if ( redirect != "" )
			parent.location.href = redirect;
		
	</script>
	</body>
</html>