<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>			
			<div class="s_menu">
				<div class="sm_title">
					<strong>KDA</strong>
					<h2>Introduction</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <c:if test="${page == 'ka_greetings'}">
							class="on"</c:if>>
							<a href="/english/kda-about/ka_greetings.do">Greetings</a>
						</li>
					
						<li <c:if test="${page == 'ka_about' or  page == 'ka_objectives' or page == 'ka_overview' or page == 'ka_membership' }">
							class="on"</c:if>>
						
						<a href="/english/kda-about/ka_objectives.do">About KDA</a>
							<ul class="sm_depth2">
								<li><a href="/english/kda-about/ka_objectives.do" <c:if test="${page == 'ka_objectives'}">class="on"</c:if>>Objectives</a></li>
								<li><a href="/english/kda-about/ka_overview.do"  <c:if test="${page == 'ka_overview'}">class="on"</c:if> >KDA Overview</a></li>
								<li><a href="/english/kda-about/ka_membership.do" <c:if test="${page == 'ka_membership'}">class="on"</c:if> >Membership Type & Qualifications</a></li>
							</ul>
						</li>
						<li <c:if test="${ page == 'ka_organization' 
								or page == 'ka_office' or page == 'ka_local' 
								or page == 'ka_officerlist' or page == 'ka_presidents' }">
							class="on"</c:if>>
						<a href="/english/kda-about/ka_organization.do">Organization Of KDA</a>
							<ul class="sm_depth2">
								<li><a href="/english/kda-about/ka_organization.do" <c:if test="${page == 'ka_organization'}">class="on"</c:if>>Organization of Korean<br />Dietetic Association</a></li>
								<li><a href="/english/kda-about/ka_office.do" <c:if test="${page == 'ka_office'}">class="on"</c:if>>Oraganization of Main Office</a></li>
								<li><a href="/english/kda-about/ka_local.do" <c:if test="${page == 'ka_local'}">class="on"</c:if>>Local Branches</a></li>
								<li><a href="#" <c:if test="${page == 'ka_officerlist'}">class="on"</c:if> >Officer List</a></li>
								<li><a href="#" <c:if test="${page == 'ka_presidents'}">class="on"</c:if> >Presidents List of Local <br />Branches</a></li>
<%-- 								<li><a href="/english/kda-about/ka_officerlist.do" <c:if test="${page == 'ka_officerlist'}">class="on"</c:if> >Officer List</a></li> --%>
<%-- 								<li><a href="/english/kda-about/ka_presidents.do" <c:if test="${page == 'ka_presidents'}">class="on"</c:if> >Presidents List of Local <br />Branches</a></li> --%>
							</ul>
						</li>
						<li <c:if test="${ page == 'ka_activities' }"> class="on"</c:if>><a href="/english/kda-about/ka_activities.do">Major Activities</a></li>
						<li <c:if test="${ page == 'ka_business' }"> class="on"</c:if>><a href="/english/kda-about/ka_business.do">Business Plan</a></li>
					</ul>
				</div>
			</div>
