﻿<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String txtMM = new java.text.SimpleDateFormat ("MM"	).format(new java.util.Date());
String imgMM = txtMM;
String YYYY	= new java.text.SimpleDateFormat ("yyyy").format(new java.util.Date());

// /*
// 	1 , 2월 이미지명  :   icon_YYYY01_02.png   (예: icon_202001_02.png)
// 	7 , 8월 이미지명  :   icon_YYYY07_08.png   (예: icon_202007_08.png)
// 	그 외 이미지명        :   icon_YYYYMM.png      (예: icon_202003.png)
// */
if("01".equals(txtMM) || "02".equals(txtMM)) {
	txtMM = "1·2";
	imgMM = "01_02";
} else if("07".equals(txtMM) || "08".equals(txtMM)) {
	txtMM = "7·8";
	imgMM = "07_08";
}

%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민</mark>영양</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_magazine.do" class="cm">국민영양</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="text box t2 bgs">
			<div class="area">
				<img class="ml50" src="/images/sub/km_magazine_logo.png" alt="국민영양 로고" />
				<div class="fl w380 pt35 text ti">
								<p class="bbig bold"><mark class="cm">N</mark>utrition and <mark class="cm">D</mark>ieteics</p>
								<p class="small ca">ISSN 1227-5484</p>
							</div>
			</div>
		</div>
		
		<div class="text s1 pt30">
				<div class="w160 mr30 fl center">
					<div class="area">
						<a href="/work/publication/kp_m_list.do" title="국민영양 검색 목차로 이동"  target="_self"><img src="/images/sub/icon_<%=YYYY %><%=imgMM %>.png" alt="국민영양 표지" class="box bw3" /></a>
					</div>
					<div class="center ssmall ca m10">국민영양 <%=txtMM %>월호</div>
				</div>
				<div class="">
					<p class="middle bold">대한영양사협회 기관지 <mark class="big bold cg">국민영양</mark>은 연10회, 매월 1일 발간되고 있습니다.</p><br />
					
					<p>「국민영양」은 영양사 회원을 대상으로 무료 배포되고 있으며회원가입을 통해 보실 수 있습니다.<br />
					<a href="/member/km_join.do" class="btn t1 middle mb10">회원가입 바로가기</a>
					<p>대학도서관·식품영양학과에서 구독을 원하시는 경우 교육국으로 연락 부탁드립니다<br />
					(문의처 : 02-823-5680 교환 521)<br />
					<a href="/xaido/kda/kda_sub.pdf" class="btn t1 middle mb10">공문 다운받기</a><br /><br />
					최신 식품·영양 정보를 올바르게 전달하고 회원 상호간의 교류를 확대하는 장을 마련하고자 노력하는 「국민영양」에 회원 여러분의 많은 관심 부탁 드립니다. 
					</p>
					<ul class="ssmall fl ca mt10">
						<li class="i_box_t1">발행월 : 1·2월, 3월, 4월, 5월, 6월, 7·8월, 9월, 10월, 11월, 12월</li>
						<li class="i_box_t1">판 형 : B5 size</li>
						<li class="i_box_t1">총 지면 : 64page </li>
					</ul>
				</div>
		</div>
		
		<div class="box t2 bgs p20 text mt100">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">국민영양</mark> 참여 및 검색</h5>
				<div class="box t1 r5 mt10 p30">
					<ul class="text s1 m15 ka_archive">
                        <li style="width:45%"><a href="/work/publication/kp_participation.do"><span class="txt">표지모델 신청</span></a></li>
                        <li style="width:45%"><a href="/work/publication/kp_participation_manuscript.do"><span class="txt">원고공모</span></a></li>
                        <!-- <li><a href="/work/publication/kp_participation_mornitor.do"><span class="txt">모니터참여</span></a></li> -->
                        <li style="width:45%"><a href="/work/publication/kp_m_list.do"><span class="txt">목차/e-BOOK 보기</span></a></li>
                        <li style="width:45%"><a href="/publication/paper_board/kp_m_search.do?bbs_board_code=13"><span class="txt">내용검색</span></a></li>
                    </ul>
				</div>
			</div>
		</div>

		
		<div class="text s1 mb50">
			<h5 class="title bold t3 s1 mt40">대한영양사협회 국민영양 기획팀 (임기 : 2024~2025년)</h5>
			<ul class="mt10">
				<li class="i_box_t1"><mark class="bold">팀  장</mark> : 김은지(서울영등포초등학교 영양교사)</li>
				<li class="i_box_t1"><mark class="bold">위  원</mark> : 강신숙(서울아산병원 영양팀장)<br />
					<ul class="ml40">
						<li>김보은(삼성서울병원 영양팀 임상영양파트 파트장)<li>
						<li>박란희(소야초등학교 영양교사)<li>
						<li>박주현(상당구청 행정지원과 영양사)<li>
						<li>오유진(한국건강증진개발원 전략경영본부 운영지원부장)<li>
						<li>이경은(서울여자대학교 식품영양학전공 교수)<li>
						<li>이나겸(장안대학교 식품영양학과 교수)<li>
					</ul>							
				</li>

			</ul>
		</div>

	</div>
</div>
