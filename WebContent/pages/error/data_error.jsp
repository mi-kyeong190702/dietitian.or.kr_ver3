<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%

	System.out.println( request.getAttribute("exception").toString() );
%>
<c:choose>
	<c:when test="${fn:contains(exception, '문자열이나 이진 데이터는 잘립니다')}">
	<script>
		alert("입력하신 값이 유효하지 않습니다.\n값을 확인 후 다시 시도하여 주십시요.");
		window.history.back();
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("처리 중 오류가 발생하였습니다.\n다시 시도하여 주십시요.");
		window.history.back();
	</script>
	</c:otherwise>
</c:choose>