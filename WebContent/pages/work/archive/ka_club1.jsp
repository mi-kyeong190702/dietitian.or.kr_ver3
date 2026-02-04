<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">분과</mark> 게시판</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_club.do" class="cm">분과 게시판</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body h800">
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">분야별</mark> 모임</h5>
				<div class="box t1 r5 mt10 p30">
					<ul class="text s1 ml5 ka_archive">
					
						<li><a href="/work/archive/ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}"><span class="txt">산업체</span></a></li>
						<li><a href="/work/archive/ka_hospital.do?bbs_board_code=25&g_userid=${g_encoded_userid}"><span class="txt">병원</span></a></li>
						<li><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=${g_encoded_userid}"><span class="txt">영양교사</span></a></li>
						
						<!-- <li class="mt10 mb10"><a href="/work/archive/ka_specialist.do?bbs_board_code=27"><span class="txt">전문영양사</span></a></li> -->
						<li class="mt10 mb10"><a href="/work/archive/ka_center.do?bbs_board_code=28&g_userid=${g_encoded_userid}"><span class="txt">학교영양사</span></a></li>
						<li class="mt10 mb10"><a href="/work/archive/ka_welfare.do?bbs_board_code=29&g_userid=${g_encoded_userid}"><span class="txt">보건복지시설</span></a></li>
						<li class="mt10 mb10"><a href="/work/archive/ka_school.do?bbs_board_code=30&g_userid=${g_encoded_userid}"><span class="txt">건강상담</span></a></li>
						
						<li><a href="/work/archive/ka_industry.do?bbs_board_code=31&g_userid=${g_encoded_userid}"><span class="txt">어린이급식관리지원센터</span></a></li> 
						 
					</ul>
				</div>
			</div>
		</div>
		 
	</div>
</div>