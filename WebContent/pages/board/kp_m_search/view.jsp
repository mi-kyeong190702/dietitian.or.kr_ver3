<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<%@include file="/pages/common.jsp"%>

<script>
function doPrint()
{
	$("#print_contents").printElement({
		printMode: 'popup',
		pageTitle:'본문',		
		leaveOpen:false		
	});
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark>검색</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">KDA 출판</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">국민영양</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_m_list" class="cm">국민영양검색</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" id="print_contents">
	<!-- // Contents Start -->
		<div class="tab_2 div2 mb30">
			<ul>
				<li><a href="/work/publication/kp_m_list.do">목차/e-Book 보기</a></li>
				<li><a href="/publication/paper_board/kp_m_search.do?bbs_board_code=13&g_userid=${chk_encoded_userid}" class="on">내용검색</a></li>
			</ul>
		</div>
		<div class="box t3 text small">
			<ul class="area">
				<li class="line bb bgs">
					<div class="p10 pl15">
						<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${board.bbs_subject }</h4>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm ">컬럼명</strong>
						<span>${board.bbs_category}</span>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm">년월</strong>
						<span>${board.bbs_option}</span>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm">조회</strong>
						<span>${board.bbs_view}</span>
					</div>
				</li>
			</ul>
		</div>
	
		<div class=" line bb bw2 text small">
			<div class="pr">
				<h4 class="pa l15 t10 bold cm">첨부파일1</h4>
				<ul class="ml100">
					<li class="p10 pl15 link bold line dot bb"><span class="i_file2 ${board.bbs_file_type} mr10"></span><a href="/board_file_download.do?bbs_board_code=${param.bbs_board_code}&bbs_idx=${board.bbs_idx}">${board.bbs_file_name}</a></li>
					
				</ul>
			</div>
		</div>
		<c:if test="${board.bbs_file_name2 != ''}" >
			<div class=" line bb bw2 text small">
				<div class="pr">
					<h4 class="pa l15 t10 bold cm">첨부파일2</h4>
					<ul class="ml100">
						<li class="p10 pl15 link bold line dot bb"><span class="i_file2 ${board.bbs_file_type2} mr10"></span><a href="/board_file_download.do?bbs_board_code=${param.bbs_board_code}&bbs_idx=${board.bbs_idx}&num=2">${board.bbs_file_name2}</a></li>
						
					</ul>
				</div>
			</div>		
		</c:if>
		
		<div class="line bt mt40 text small">
			<h4 class="ti">편의버튼</h4>
			<ul>
				<c:if test="${boardPrev != null }">
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm">이전글</strong>
						<span class="link ml100 mr90"><a href="?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}&bbs_idx=${boardPrev.bbs_idx}&curPage=${param.curPage}">${boardPrev.bbs_subject}</a></span>
					</div>
				</li>
				</c:if>
				<c:if test="${boardNext != null }">
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm">다음글</strong>	
						<span class="link ml100 mr90"><a href="?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}&bbs_idx=${boardNext.bbs_idx}&curPage=${param.curPage}">${boardNext.bbs_subject}</a></span>
						
					</div>
				</li>
				</c:if>
			</ul>
		</div>
		
		
		<div class="btn_wrap mt20">
			<ul class="fl">
				<%-- <li><a href="./${kind}.do?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}&curPage=${param.curPage}" class="btn big">목록</a></li> --%>
				<li><a href="./${kind}.do?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}" class="btn big">목록</a></li>
				<!-- <li><a href="javascript:doPrint();" class="btn big t2">프린트</a></li> -->
			</ul>
			<ul class="fr">
			
			<c:if test="${boardSettings.bs_WriteLevel >= g_user_level or isAdmin}">
				<li><a href="./${kind}_form.do?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}&bbs_idx=${param.bbs_idx}" class="btn big t4">수정/삭제</a></li>
				<li><a href="./${kind}_form.do?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}" class="btn big t1">글쓰기</a></li>
			</c:if>
			</ul>
		</div>
		<!--  // Contents end -->
	</div>
</div>