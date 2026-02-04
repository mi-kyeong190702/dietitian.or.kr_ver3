<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양 </mark>참여</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
				<li><a href="/work/publication/kp_participation.do" class="cm">국민영양 참여</a></li>
			</ul>
		</div>
	</div>
	<hr />
	
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
				<div class="tab t2 div2 mb30">
					<ul>
						<li><a href="/work/publication/kp_participation.do" class="on">표지모델 신청</a></li>
						<li><a href="/work/publication/kp_participation_manuscript.do">원고 공모</a></li>
						<!-- <li><a href="/work/publication/kp_participation_mornitor.do">모니터 참여</a></li> -->
					</ul>
				</div>
				<div class="text s1">
					<h4 class="title bold cm t2 s1 i_b_t2 mt30">「국민영양」 표지모델을 찾습니다.</h4><br />
					
						<p class="text cb s1 mt30">
							대한영양사협회우리 협회에서는 2007년도부터 <mark class="bold cm">「국민영양」</mark>에 식품·영양 전문인으로 활동하고 있는 영양사를 찾아가 
							업무 모습을 촬영하여 인터뷰와 함께 소개하고 있습니다. <br />
							표지모델을 아래와 같이 공모하오니 회원 여러분의 많은 참여 바랍니다.
						</p>
						<h5 class=" title bold t3 i_b_t3 mt30">참여대상</h5>
							<p class="text i_box_t1 mt10 ml10">대한영양사협회 회원이면 누구나 참여 가능</p>
						<h5 class=" title bold t3 i_b_t3 mt30">내용</h5>
							<p class="text i_box_t1 mt10 ml10">국민영양 표지 촬영과 이달의 영양사 지면 인터뷰 실시<br /><span class="small cm">※ 촬영과 인터뷰는 해당 영양사의 근무처에서 진행됩니다.</span></p>
						<h5 class=" title bold t3 i_b_t3 mt30">방법</h5>
							<div>
								<ul class="text mt10 ml10">
									<li class="i_box_t1">추천 : 각계에서 활발히 활동하고 있는 영양사를 추천사유와 함께 추천함.</li>
									<li class="i_box_t1 mt5">신청 : 적극적으로 자신을 표현할 수 있는 기회! 간단한 신청사유와 함께 자신을 추천함.<br />
										<span class="small link">아래의 양식을 다운받아 작성 한 후 대한영양사협회 교육팀 메일<a href="mailto:kdabook@kdiet.or.kr" class="bold">(kdabook@kdiet.or.kr)</a>로 보내주세요.</span>
										<div class="mt10">
											<span><a href="/assets/ver2/download/publ/국민영양표지모델추천서[서식].hwp" class="btn t3 middle">추천서 양식 다운로드</a></span>
											<span><a href="/assets/ver2/download/publ/국민영양표지모델신청서[서식].hwp" class="btn t3 middle">신청서 양식 다운로드</a></span>
										</div>
									</li>
								</ul>
							</div>
						<h5 class=" title bold t3 i_b_t3 mt30">모집기간</h5>
							<p class="text i_box_t1 mt10 ml10">상시 접수</p>
						<h5 class=" title bold t3 i_b_t3 mt30">문의처</h5>
							<p class="text i_box_t1 mt10 ml10">02-823-5680 (교환 521)</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>