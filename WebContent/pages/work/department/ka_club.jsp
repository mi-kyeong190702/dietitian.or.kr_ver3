<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">분과별</mark> 게시판</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/department/ka_club.do" class="cm">분과별 게시판</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body h800">
		<div class="box t2 bgs mt50 p20 text">
			<div class="area"> 
				<div class="box t1 r5 mt10 p30">
					<ul class="text s1 ml5 ka_archive">
					
						<li><a href="/work/department/ka_industry_notice.do?bbs_board_code=124&g_userid=${g_encoded_userid}"><span class="txt">산업체</span></a></li>
						<li><a href="/work/department/ka_hospital_notice.do?bbs_board_code=128&g_userid=${g_encoded_userid}"><span class="txt">병원</span></a></li>
						<li><a href="/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=${g_encoded_userid}"><span class="txt">영양교사</span></a></li>
						
						<!-- <li class="mt10 mb10"><a href="/work/archive/ka_specialist.do?bbs_board_code=27"><span class="txt">전문영양사</span></a></li> -->
						<li class="mt10 mb10"><a href="/work/department/ka_school_notice.do?bbs_board_code=153&g_userid=${g_encoded_userid}"><span class="txt">학교영양사</span></a></li>
						<li class="mt10 mb10"><a href="/work/department/ka_center_notice.do?bbs_board_code=170&g_userid=${g_encoded_userid}"><span class="txt">보건복지시설</span></a></li>
						<li class="mt10 mb10"><a href="/work/department/ka_counsel_notice.do?bbs_board_code=175&g_userid=${g_encoded_userid}"><span class="txt">건강상담</span></a></li>
						
						<li><a href="/work/department/ka_child_notice.do?bbs_board_code=179&g_userid=${g_encoded_userid}"><span class="txt">어린이∙사회복지 급식관리지원센터</span></a></li> 
						 
					</ul>
				</div>
			</div>
		</div>
		 
	</div>
</div>