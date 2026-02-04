<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common.jsp"%>
<ul>
<c:forEach items="${list}" var="board">
	<li class="p5 pl10 line dashed bb over"><span class="i_box_t1 link">
	<c:choose>
		<c:when test="${board.bbs_del_flag}">
			<b>[ - - 해당글은 삭제된 글입니다. - - ]</b>
		</c:when>
		<c:when test="${ g_user_level <= 5}">
			<a href="javascript:doSelect(${board.bbs_idx},  ${ param.bbs_board_no})">${board.bbs_subject}</a>
		</c:when>
		<c:otherwise>
			${board.bbs_subject}
		</c:otherwise>
	</c:choose>
	</span>
	</li>
</c:forEach>		
</ul>