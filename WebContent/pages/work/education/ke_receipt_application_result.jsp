<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<!-- // Contents Start -->
<c:choose>
	<c:when test="${not empty error }">
	 	<script>
	 	alert("${error}");
	 	location.href="/work/education/ke_receipt.do";
	 	</script>
	</c:when>
	<c:otherwise>
	
        	<script>
	 		alert("신청되었습니다.");
	 		location.href="/work/education/ke_receipt.do";
	 		</script>
         
	</c:otherwise>
</c:choose>



