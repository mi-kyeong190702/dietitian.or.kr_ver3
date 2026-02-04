<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>				
<div class="s_menu">
	<div class="sm_title">
		<strong>KDA</strong>
		<h2>Dietetics in Korea</h2>
	</div>
	<div class="sm_list">
		<ul class="sm_depth1">
			<li <c:if test="${ page == 'kd_dietetics' }"> class="on" </c:if>><a href="./kd_dietetics.do">Definition of a Dietitian</a></li>
			<li <c:if test="${ page == 'kd_code' }"> class="on" </c:if>><a href="./kd_code.do">Code of Conduct</a></li>
			<li <c:if test="${ page == 'kd_dietitian' }"> class="on" </c:if>><a href="./kd_dietitian.do">To Be a dietitian</a></li>
			<li <c:if test="${ page == 'kd_certificated' }"> class="on" </c:if>><a href="./kd_certificated.do">Certificated Dietetic Specialists</a></li>
			<li <c:if test="${ page == 'kd_workfields' }"> class="on" </c:if>><a href="./kd_workfields.do">Work Fields for Dietitians</a></li>
			<li <c:if test="${ page == 'kd_propects' }"> class="on" </c:if>><a href="./kd_propects.do">Prospects of Dietitians</a></li>
			<li <c:if test="${ page == 'kd_history' }"> class="on" </c:if>><a href="./kd_history.do">History of Dietetic in Korea</a></li>
		</ul>
	</div>
</div>
