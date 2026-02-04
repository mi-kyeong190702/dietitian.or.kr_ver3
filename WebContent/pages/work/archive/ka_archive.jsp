<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자</mark>료실</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_archive.do" class="cm">자료실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">회원</mark> 자료실</h5>
				<div class="box t1 r5 mt10 p30">
					<ul class="text s1 ml5 ka_archive">
						<li><a href="./ka_hotnews.do?bbs_board_code=91&g_userid=${g_encoded_userid}"><span class="txt">식품·영양 News</span></a></li>
						<li><a href="/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=${g_encoded_userid}"><span class="txt">나의 식단 자랑하기</span></a></li>
						<li><a href="./ka_management.do?bbs_board_code=63&g_userid=${g_encoded_userid}"><span class="txt">급식경영</span></a></li>
						<li class="mt10 mb10"><a href="./ka_hygiene.do?bbs_board_code=86&g_userid=${g_encoded_userid}"><span class="txt">급식위생</span></a></li>
						<li class="mt10 mb10"><a href="./ka_education.do?bbs_board_code=65&g_userid=${g_encoded_userid}"><span class="txt">영양교육</span></a></li>
						<li class="mt10 mb10"><a href="./ka_clinical.do?bbs_board_code=64&g_userid=${g_encoded_userid}"><span class="txt">임상영양</span></a></li>
						<li><a href="./ka_form.do?bbs_board_code=85&g_userid=${g_encoded_userid}"><span class="txt">업무서식</span></a></li>
						<li><a href="./ka_literature.do?bbs_board_code=66&g_userid=${g_encoded_userid}"><span class="txt">국내외 문헌정보</span></a></li>
						<li><a href="./ka_legal.do"><span class="txt">법률정보</span></a></li>
						<li class="mt10 mb10"><a href="./ka_govt.do?bbs_board_code=122&g_userid=${g_encoded_userid}"><span class="txt">정부지침서</span></a></li>
						<li class="mt10 mb10"><a href="./ka_story.do?bbs_board_code=22&g_userid=${g_encoded_userid}"><span class="txt">영양관련정보</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>