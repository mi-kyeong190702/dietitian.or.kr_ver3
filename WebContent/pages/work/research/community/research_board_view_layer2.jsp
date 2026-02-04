<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	
</script>
	
<div class="box t3 text ssmall">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${boardRow.atc_sbj}</h4>
			</div>
		</li>
		<li class="bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">작성자</strong>
				<span>${boardRow.atc_wrtr_nm}</span>
			</div>
		</li>
		<li class="bgw">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">게시여부</strong>
				<span>
					<c:if test="${boardRow.atc_pst_yn == 'Y'}">게시</c:if>
					<c:if test="${boardRow.atc_pst_yn == 'N'}">미게시</c:if>
				</span>
			</div>
		</li>
		
		<c:if test="${null ne boardRow.bbs_file_name && boardRow.bbs_file_name != ''}">
		<li class="bgw">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">첨부파일</strong>
				
				<c:set var="str" value="${boardRow.bbs_file_type}" />	
				<c:if test="${str == 'xlsx' }"><c:set var="str" value="xls"/> </c:if>
					
				<span class="i_file ${str} mr10"></span>
					<a href="javascript:doFileDownLoad('${boardRow.atc_sno}')">
					<fmt:parseNumber var="size1" integerOnly="true" type="number" value="${boardRow.bbs_file_size/1024}" />
					${boardRow.bbs_file_name} (<c:out value="${size1}" />KByte) 
					</a>				
			</div>
		</li>
		</c:if>
	</ul>
</div>
<div class="line bb p30 text">
	<h4 class="ti">본문</h4>
		<iframe name="bbs_contents" width="682" scrolling="no" src="/research_board_view_contents.do?bbs_cd=002&atc_sno=${requestScope.boardRow.atc_sno}" onload="javascript:setIFrameHeight(this)"></iframe>
	<br>
</div>


<div class="line bt mt40 text small">
	<h4 class="ti">편의버튼</h4>
	<ul>
		
		<c:if test="${boardRowPrev != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">이전글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${boardRowPrev.atc_sno})">${boardRowPrev.atc_sbj}</a></span>
				<span class="pa r15 t15">${f:substring(boardRowPrev.frst_rgt_dttm, 0, 10)}</span>
			</div>
		</li>
		</c:if>
		
		<c:if test="${boardRowNext != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">다음글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${boardRowNext.atc_sno})">${boardRowNext.atc_sbj}</a></span>
				<span class="pa r15 t15">${f:substring(boardRowNext.frst_rgt_dttm, 0, 10)}</span>
			</div>
		</li>
		</c:if>
	</ul>
</div>

<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
	</ul>
<c:if test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
		<ul class="fr">
			<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
			<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
		</ul>
</c:if>
</div>
