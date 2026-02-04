<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<c:choose>
	<c:when test="${limit_pwd}">
	<script>
	if( confirm("비밀번호 변경한지 6개월이 지났습니다.\n회원정보(비밀번호, 우편물 수신처등) 변경하시겠습니까?" ) ) {
		parent.location.href="/kmp_member_info.do";	
	} else {
		/* var msg = "2015년 8월 1일부터 새우편번호 사용이 전면 시행됨에 따라\n";
		msg += "반드시 새주소 사용이 선행되어야 합니다.\n";
		msg += "이에 홈페이지의 마이페이지에서 '새주소(도로명 주소)'로 개인정보를\n'";
		msg += "변경해 주세요.";
		alert(msg);
		parent.location.href="/kmp_member_info.do"; */
		parent.location.href="/index.do";
	}
	</script>
	</c:when>
	<c:otherwise>
	<script>
		/* msg = "2015년 8월 1일부터 새우편번호 사용이 전면 시행됨에 따라\n";
		msg += "반드시 새주소 사용이 선행되어야 합니다.\n";
		msg += "이에 홈페이지의 마이페이지에서 '새주소(도로명 주소)'로 개인정보를\n'";
		msg += "변경해 주세요.";
		alert(msg);
		parent.location.href="/kmp_member_info.do"; */
		
		parent.location.href="/index.do";
		
	</script>
	</c:otherwise>
</c:choose>

