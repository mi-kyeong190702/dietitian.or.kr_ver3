<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<div class="paging">
				<a href="scheduleList.do?select_yy=${pre_year }&select_mm=${pre_month}" class="btn t1 middle">&lt; 이전</a>
				<span class="ib text bold middle p10">${select_yy }년 ${select_mm }월</span>
				<a href="scheduleList.do?select_yy=${next_year }&select_mm=${next_month}" class="btn t1 middle">다음 &gt;</a>
			</div>
		
			<div class="area mt10">
				<table class="table t2 text small s1 ca center">
					<colgroup>
						<col width="14.28%">
						<col width="14.28%">
						<col width="14.28%">
						<col width="14.28%">
						<col width="14.28%">
						<col width="14.28%">
						<col width="14.28%">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">S</th>
						<th scope="col" class="bold cm">M</th>
						<th scope="col" class="bold cm">T</th>
						<th scope="col" class="bold cm">W</th>
						<th scope="col" class="bold cm">T</th>
						<th scope="col" class="bold cm">F</th>
						<th scope="col" class="bold cm">S</th>
					</tr>
					</thead>
					<tbody>
					<c:set var="bool" value="0" />
					<c:set var="currentDay" value="1" />
					<c:set var="clss" value="bold" />
					<c:forEach var="tr" begin="0" end="5" varStatus="cnt1">
						<tr>
							<c:forEach var="td" begin="0" end="6" varStatus="cnt2">
								<c:if test="${cnt1.index == 0 && DayOfWeek == cnt2.index+1 }">
									<c:set var="bool" value="1" />
								</c:if>
								<c:if test="${bool == 1 && currentDay > DayOfMonth }">
									<c:set var="bool" value="0" />
								</c:if>
								
								<c:choose>
									<c:when test="${bool == 1 }">
										<c:choose>
											<c:when test="${cnt2.index == 0 }">
												<c:set var="clss" value="bold cp" />
											</c:when>
											<c:when test="${cnt2.index == 6 }">
												<c:set var="clss" value="bold cs" />
											</c:when>
											<c:otherwise>
												<c:set var="clss" value="bold" />
											</c:otherwise>
										</c:choose>
										<td class="left">
											<div class="h85 scroll">
											<div class="${clss }">${currentDay }</div>
														<ul>
												<c:forEach var="list" items="${scheduleList }">
													<c:if test="${list.intdd == currentDay }">
															<li class="link"><a href="scheduleForm.do?select_yy=${select_yy }&select_mm=${select_mm}&select_dd=${currentDay}&num=${list.num }">${list.title }</a></li>
													</c:if>
												</c:forEach>
														</ul>
												<a href="scheduleForm.do?select_yy=${select_yy }&select_mm=${select_mm}&select_dd=${currentDay}" class="btn ssmall">추가</a>
											</div>
										</td>
										<c:set var="currentDay" value="${currentDay+1 }" />
									</c:when>
									<c:otherwise>
										<td class="left"><div class="h85 scroll"></div></td>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
