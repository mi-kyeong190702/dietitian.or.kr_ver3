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
					        <jsp:param name="idx" value="11"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">영양사 국가시험 지원</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">한국영양사교육협의회 운영 </h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 한국영양사교육협의회 운영</li>
							<li class="pb20">2) 영양사 국가시험 관련 협의</li>
							<li class="pb20">3) 영양사 현안 문제 협의</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">한국보건의료인국가시험원 지원</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 영양사분과 시험위원회 운영 지원
								<ul class="text small pl15">
									<li class="i_b_t7 mt5  mb5">분과 시험위원 추천 등</li>
								</ul>
							</li>
							<li class="pb20">2) 영양사 국가시험 시행 지원
								<ul class="text small pl15">
									<li class="i_b_t7 mt5  mb5">문항개발, 심사, 시험출제·검토위원 추천 등</li>
								</ul>
							</li>
							<li class="pb20">3) 한국보건의료인국가시험원 이사회 및 소위원회 참석</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">기타</h6>
						</div>
						<ol class="bold mt20 ml30">
                            <li class="pb20">1) 영양사 국가시험 응시자·응시대학 현황 및 합격자 통계 분석</li>
                            <li class="pb20">2) 2025년도 문항개발능력향상 워크숍 진행</li>
                        </ol>
					</div>
				</div>
			</div>
