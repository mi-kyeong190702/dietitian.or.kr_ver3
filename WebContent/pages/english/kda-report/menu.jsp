<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>				
			<div class="s_menu">
				<div class="sm_title">
					<strong>KDA</strong>
					<h2>History</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <c:if test="${ page == 'kr_report' }"> class="on"</c:if>><a href="/english/kda-report/kr_report.do">History of the KDA</a></li>
					</ul>
				</div>
			</div>
