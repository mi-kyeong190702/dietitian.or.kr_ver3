<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
	<!-- Header S-->
	<header id="header">
		<div class="h_bar">
			<div class="wrap">
				<div class="h_accessibility">
					<h2>Screen</h2>
					<button class="ha_btn plus" onclick="zoomInOut('in')"><span class="ti">Zoom In</span></button>
					<button class="ha_btn minus" onclick="zoomInOut('out')"><span class="ti">Zoom Out</span></button>
				</div>
				<hr />
				<div class="h_topmenu">
					<h2 class="ti">상단메뉴</h2>
					<ul>
						<li class="start"><a href="/english/">HOME</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr />
		
		<div class="wrap">
			<div class="h_logo">
				<a href="/english/" title="메인페이지로 이동"><h1 class="ti">The Korean Dietetic Association</h1></a>
			</div>
			<hr />
			<div class="h_menu">
				<nav id="nav">
					<ul>
						<li class="n_main introduce">
							<a href="/english/kda-about/ka_greetings.do" <c:if test="${ dir == 'kda-about' }"> class="on" </c:if> >KDA Introduction<span class="icon_active" ></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/english/kda-about/ka_about.do">Greetings</a></li>
										<li><a href="/english/kda-about/ka_organization.do">Organization KDA</a></li>
										<li><a href="/english/kda-about/ka_activities.do">Major Activities</a></li>
										<li><a href="/english/kda-about/ka_business.do">Business Plan</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="n_main news"><a href="/english/kda-report/kr_report.do"  <c:if test="${ dir == 'kda-report'  }"> class="on" </c:if>>KDA History</a></li>
						<li class="n_main news">
							<a href="/english/kda-dietetics/kd_dietetics.do"  <c:if test="${ dir == 'kda-dietetics' }"> class="on" </c:if>>Dietetics in Korea<span class="icon_active"></span></a>
							<div class="n_sub">
								<div class="ns_menu">
									<ul class="ns_depth1">
										<li><a href="/english/kda-dietetics/kd_dietetics.do">Definition of a Dietitian</a></li>
										<li><a href="/english/kda-dietetics/kd_code.do">Code of Conduct</a></li>
										<li><a href="/english/kda-dietetics/kd_dietitian.do">To Be a dietitian</a></li>
										<li><a href="/english/kda-dietetics/kd_certificated.do">Certificated Dietetic Specialisis</a></li>
										<li><a href="/english/kda-dietetics/kd_workfields.do">Work Fields for Dietetic</a></li>
										<li><a href="/english/kda-dietetics/kd_propects.do">Prospects of Dietetic</a></li>
										<li><a href="/english/kda-dietetics/kd_history.do">History of Dietetic in Kr</a></li>				
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header E-->
