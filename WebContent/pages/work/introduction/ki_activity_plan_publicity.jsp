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
					        <jsp:param name="idx" value="9"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">홍보</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">홍보위원회 운영</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
                            <h6 class="title bold i_b_t6 ">채널별 맞춤형 콘텐츠 기획·운영을 통한 홍보</h6>
                        </div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">영상 콘텐츠 제작을 통한 홍보</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) “영양사가 궁금해?” 영상 등 영양사 및 업무 관련 동영상 제작</li>
							<li class="pb20">2) “전국영양사학술대회 직무연수” 스케치 영상 등 협회 홍보 영상 제작</li>
						</ol>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">인플루언서를 통한 홍보</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">영양의 날 인지도 향상</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">대국민 영양 개선 캠페인 전개</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">영양사신문 활성화</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">카카오톡 채널 활성화</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">홈페이지 운영 및 개선</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">언론매체 관리 및 영양사ㆍ협회 정보 제공</h6>
						</div>
						
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">식품영양 관련 이슈 발생 시 정보 제공 및 전문가 의견 개진</h6>
						</div>
						
					</div>
				</div>
			</div>
