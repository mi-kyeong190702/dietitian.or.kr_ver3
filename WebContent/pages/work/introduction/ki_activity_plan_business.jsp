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
		        <jsp:param name="idx" value="8"/>
		</jsp:include>
		<div class="area text mb50 s1" >
			<h5 class="title t3 bold i_b_t3 mt50">사업</h5>
			<div class="box bgs r5 mt40 ml10 p10 pl20">
				<h6 class="title bold i_b_t6 ">기관지 광고</h6>
			</div>
			
			<div class="box bgs r5 mt40 ml10 p10 pl20">
				<h6 class="title bold i_b_t6 ">사업 실시</h6>
			</div>
			<ol class="bold mt20 ml30">
				<li class="pb20">1) 영양사 대상 지속가능한 식생활 교육‧홍보</li>
				<li class="pb20">2) 건전한 식생활 확산 교육 사업 
					<ul class="ml10 mt5">
						<li class="i_b_t7 mb5 text">군 장병 대상 식생활교육 프로그램 운영 </li>
					</ul>
				</li>
				<li class="pb20">3) 학교·군급식 수산물 소비촉진 사업
					<ul class="ml10 mt5">
						<li class="i_b_t7 mb5 text">학교급식 ‘우리 수산물 DAY’ 운영</li>
						<li class="i_b_t7 mb5 text">온·오프라인 수산물 쿠킹클래스 운영</li>
						<li class="i_b_t7 mb5 text">단체급식 수산물 레시피 개발</li>
					</ul>
				</li>
				<li class="pb20">4) 유아 대상 우유마시기 습관 길러주기 교육</li>
				<li class="pb20">5) 한돈 관련 사업
					<ul class="ml10 mt5">
						<li class="i_b_t7 mb5 text">영양사 대상 한돈 부위별 가공처리 체험교육</li>
						<li class="i_b_t7 mb5 text">전국 어린이 대상 한돈 영양교육</li>
						<li class="i_b_t7 mb5 text">영양사 대상 한돈 소비촉진 프로모션 실시</li>
						<li class="i_b_t7 mb5 text">축산 인식 개선 및 균형잡힌 식습관 실천 교육·홍보</li>
					</ul>
				</li>
				<li class="pb20">6) 스마트 디바이스 영양‧신체분석을 기반으로 한 아동‧청소년 건강 체크 및 지능형 관리 플랫폼 개발</li>
				<li class="pb20">7) 구로구어린이·사회복지급식관리지원센터 운영</li>
				<li class="pb20">8) 소규모 사업장 안전보건 기술지원사업</li>
			</ol>
			
			<div class="box bgs r5 mt40 ml10 p10 pl20">
				<h6 class="title bold i_b_t6 ">2025 식품·기기전시회 개최</h6>
			</div>
			
			<div class="box bgs r5 mt40 ml10 p10 pl20">
				<h6 class="title bold i_b_t6 ">대국민 영양교육 실시</h6>
			</div>
			<ol class="bold mt20 ml30">
				<li class="pb20">- 관련 기관 연계 및 시·도영양사회 대국민 영양교육 지원</li>
			</ol>
			
			<div class="box bgs r5 mt40 ml10 p10 pl20">
				<h6 class="title bold i_b_t6 ">기타</h6>
			</div>
			<ol class="bold mt20 ml30">
				<li class="pb20">1) 회원의 요구도 조사를 바탕으로 한 신규 사업 개발</li>
				<li class="pb20">2) 연구 수행</li>
			</ol>
		</div>
	</div>
</div>
				
