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
					<div class="tab t2 div5">
						<ul>
							<li><a href="/work/introduction/ki_activity.do">대한영양사협회 활동</a></li>
							<li><a href="/work/introduction/ki_activity_history.do">대한영양사협회 회관</a></li>
							<li><a href="/work/introduction/ki_activity_transition.do" class="on">연혁</a></li>
							<li><a href="/work/introduction/ki_activity_plan.do">사업계획</a></li>
							<li><a href="/work/introduction/ki_activity_articles.do">정관</a></li>
						</ul>
					</div>
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">연혁</h4>
					<jsp:include page="activity_year.jsp" flush="false">
					        <jsp:param name="yyyy" value="1960"/>
					        <jsp:param name="yyyyTop" value="2000"/>
					</jsp:include>
					<div class="pt50">
						<div class="pr">
							<h4 class="pa l0 t0 title bold s2 t2 cm">1960년대</h4>
							<ul class="text ca s1 mt50 ml140">
								<li class="mt20 pb20 line bb dot">
									<div class="area pr">
										<mark class="pa l0 t0 bold cb">
											`69.10.18
										</mark>
										<p class="small ml100">
											최초의 영양사 전문단체인&nbsp;&nbsp; 「한국영양사협회」를 창립함 <br> (초대회장 : 장학진).
										</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
