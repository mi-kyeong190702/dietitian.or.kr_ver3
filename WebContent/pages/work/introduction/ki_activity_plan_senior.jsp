			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">활</mark>동</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
							<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
							<li><a href="/work/introduction/ki_activity.do" class="cm">활동</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
				
					<!-- 상단 tab -->
					<jsp:include page="ki_activity_plan_submenu.jsp" flush="false">
					        <jsp:param name="idx" value="1"/>
					</jsp:include>
					
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">사업계획</h4>
					<jsp:include page="activity_select.jsp" flush="false">
					        <jsp:param name="idx" value="12"/>
					</jsp:include>		
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">대한영양사 시니어직능클럽</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">대한영양사 시니어직능클럽 운영 지원</h6>
						</div>
					</div>		
				</div>
			</div>
