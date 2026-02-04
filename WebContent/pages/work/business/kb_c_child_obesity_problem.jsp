<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">소아</mark>비만관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_child_obesity.do" class="cm">소아비만관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body h900">
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
				<%@ include file="inc/child_obesity.jsp" %>
				
				<div class="text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">소아비만의 문제점</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">성인비만으로 될 가능성이 높다.</h5>
							<p class="mt10 pl15">신생아 및 영아기에 발생한 비만의 경우는 주로 지방세포수가 증가하고 이후 사춘기까지는 주로 세포의 크기가 커지므로 세포수가 증가하는 시기에 발생한 소아비만이 성인비만으로 쉽게 이행된다고 한다. 
							소아비만이 가장 많이 나타나는 연령은 1세 미만의 영아기, 5-6세 그리고 사춘기이다. <br />
							영아의 비만은 대부분 돌이 되면서 보통의 체형이 되며 2세까지는 약간 비만 하더라도 활발하게 움직이고 기분좋게 잘 놀며, 차차 비만의 경향이 없어지면 걱정할 필요는 없다. 
							하지만 사춘기의 비만의(특히 고도비만) 80%는 성인이 되어도 계속 비만증을 갖게 된다.<mark class="cm"> 즉 소아에서의 비만 발병연령이 높을수록 성인비만으로 지속되기 쉽다. </mark>
							</p>
						<h5 class=" title bold t3 i_b_t3 mt40">비만이 되면</h5>
							<p class="mt10 pl15">고혈압, 고지혈증, 지방간, 동맥경화, 관절염, 당뇨병 등의 성인병이 조기에 발병되며 관절 등의 정형외과적 문제를 일으킬 수 있다. </p>
						<h5 class=" title bold t3 i_b_t3 mt40">심리적, 정서적 문제를 일으킨다.</h5>
							<p class="mt10 pl15">체형의 변화와 운동능력 저하에 따른 열등감에 의해 내향적이고 소극적이며 비활동적인 성격을 형성하게 되어 불안감에 따른 심신증과 등교거부 등의 문제를 일으키기도 한다. 
							반대로 더 사교적이고 적극적이며 낙천적인 비만 특유의 성격을 가지고 있는 경우도 있는데 이는 심리적 고통을 감추려는 반응의 하나로 분석되기도 한다. 
							</p>
				</div>
			</c:otherwise>
    	</c:choose>	
	</div>
</div>
