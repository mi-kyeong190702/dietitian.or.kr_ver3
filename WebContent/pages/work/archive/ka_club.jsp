<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">동호회</mark></h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_club.do" class="cm">동호회</a></li>
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
					
						<li><a href="/work/archive/ka_health.do?bbs_board_code=24&g_userid=${g_encoded_userid}"><span class="txt">건강상담영양사</span></a></li>
						<li><a href="/work/archive/ka_hospital.do?bbs_board_code=25&g_userid=${g_encoded_userid}"><span class="txt">병원영양사</span></a></li>
						<li><a href="/work/archive/ka_company.do?bbs_board_code=26&g_userid=${g_encoded_userid}"><span class="txt">급식전문업체영양사</span></a></li>
						
						<!-- <li class="mt10 mb10"><a href="/work/archive/ka_specialist.do?bbs_board_code=27"><span class="txt">전문영양사</span></a></li> -->
						<li class="mt10 mb10"><a href="/work/archive/ka_center.do?bbs_board_code=28&g_userid=${g_encoded_userid}"><span class="txt">보건소영양사</span></a></li>
						<li class="mt10 mb10"><a href="/work/archive/ka_welfare.do?bbs_board_code=29&g_userid=${g_encoded_userid}"><span class="txt">사회복지시설영양사</span></a></li>
						<li class="mt10 mb10"><a href="/work/archive/ka_school.do?bbs_board_code=30&g_userid=${g_encoded_userid}"><span class="txt">학교영양사</span></a></li>
						
						<li><a href="/work/archive/ka_industry.do?bbs_board_code=31&g_userid=${g_encoded_userid}"><span class="txt">산업체영양사</span></a></li>
						<li><a href="/work/archive/ka_counsel.do?bbs_board_code=32&g_userid=${g_encoded_userid}"><span class="txt">상담영양사</span></a></li>
						<li><a href="/work/archive/ka_policestation_group.do?bbs_board_code=106&g_userid=${g_encoded_userid}"><span class="txt">경찰서·소방서영양사 </span></a></li>
						
						<li class="mt10"><a href="/work/archive/ka_kindergarten_group.do?bbs_board_code=95&g_userid=${g_encoded_userid}"><span class="txt">유치원·어린이집영양사</span></a></li>
						<li class="mt10"><a href="/work/archive/ka_child_center.do?bbs_board_code=108&g_userid=${g_encoded_userid}"><span class="txt">어린이급식관리지원센터</span></a></li>
						<!-- <li class="mt10"><a href="/work/archive/ka_prodietitian.do?bbs_board_code=108"><span class="txt">영양지원 전문영양사</span></a></li> -->
					</ul>
				</div>
			</div>
		</div>
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">기타</mark> 모임</h5>
				<div class="box t1 r5 mt10 pl30 pt20 pb20">
					<ul class="text s1 ka_archive">
						<li class=""><a href="/work/archive/ka_christianity.do?bbs_board_code=33&g_userid=${g_encoded_userid}"><span class="txt">기독영양사</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>