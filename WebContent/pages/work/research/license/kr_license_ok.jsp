<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html> 
	<body> 
	<script type="text/javascript">
		alert('${msg}');
		location.href='${returnURL}';
	</script>
	</body>
</html>