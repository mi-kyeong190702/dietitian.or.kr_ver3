<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/js/jquery.PrintArea.js_4.js"></script>
<script src="/js/jquery.printElement.js"></script>

<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")	
	});
	
	function doPrint()
	{
		printDiv("contents" , {
			printMode: 'popup',
			pageTitle:'본문',		
			leaveOpen:false		
		});
	}
	
	function doCancel()
	{
		board.board_form.value="list";
		board.submit();
	}
	
	function doModify()
	{
		board.board_form.value="modify";
		board.submit();		
	}
	
	function doDelete()
	{
		board.board_form.value="delete";
		board.submit();
	}
	
	function doWrite()
	{
		board.board_form.value="write";
		board.submit();		
	}
	
	function doSelect(bbs_idx) {
		board.board_form.value = "view";
		board.bbs_idx.value	 = bbs_idx;
		board.submit();
	}
	
</script>

<div class="box t3 text small">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${requestScope.boardRow.bbs_subject}</h4>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm ">분류</strong>
				<span>${requestScope.boardRow.bbs_category}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">등록일</strong>
				<span>${requestScope.boardRow.bbs_reg_date_dt}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">조회</strong>
				<span>${requestScope.boardRow.bbs_view}</span>
			</div>
		</li>
	</ul>
</div>
<div id="contents" class="line bb p30 text">
	<h4 class="ti">본문</h4>
	${requestScope.boardRow.bbs_contents}
</div>

<div class=" line bb bw2 text small">
	<div class="pr">
		<h4 class="pa l15 t10 bold cm">첨부파일</h4>
		<ul class="ml100">			
		
		<c:if test="${requestScope.boardRow.bbs_file_name != '' }">
			<li class="p10 pl15 link bold line dot bb">
				<span class="i_file pdf mr10"></span>
				<a href="#">${requestScope.boardRow.bbs_file_name}</a>
			</li>
		</c:if>
		
		<c:if test="${requestScope.boardRow.bbs_file_name2 != '' }">
			<li class="p10 pl15 link bold">
				<span class="i_file jpg mr10"></span>
				<a href="#">${requestScope.boardRow.bbs_file_name2}</a>
			</li>
		</c:if>

		<c:if test="${requestScope.boardRow.bbs_file_name3 != '' }">
			<li class="p10 pl15 link bold">
				<span class="i_file jpg mr10"></span>
				<a href="#">${requestScope.boardRow.bbs_file_name3}</a>
			</li>
		</c:if>
		
		<c:if test="${requestScope.boardRow.bbs_file_name4 != '' }">
			<li class="p10 pl15 link bold">
				<span class="i_file jpg mr10"></span>
				<a href="#">${requestScope.boardRow.bbs_file_name4}</a>
			</li>
		</c:if>
		
		<c:if test="${requestScope.boardRow.bbs_file_name5 != '' }">
			<li class="p10 pl15 link bold">
				<span class="i_file jpg mr10"></span>
				<a href="#">${requestScope.boardRow.bbs_file_name5}</a>
			</li>
		</c:if>
			
		</ul>
	</div>
</div>

<div class="line bt mt40 text small">
	<h4 class="ti">편의버튼</h4>
	<ul>
		
		<c:if test="${requestScope.boardRowPrev != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">이전글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowPrev.bbs_idx})">${requestScope.boardRowPrev.bbs_subject}</a></span>
				<span class="pa r15 t15">2015-02-04</span>
			</div>
		</li>
		</c:if>
		
		<c:if test="${requestScope.boardRowNext != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">다음글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowNext.bbs_idx})">${requestScope.boardRowNext.bbs_subject}</a></span>
				<span class="pa r15 t15">2015-02-04</span>
			</div>
		</li>
		</c:if>
	</ul>
</div>

<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
		<li><a href="javascript:doPrint();" class="btn big t2">프린트</a></li>
	</ul>
	
	<ul class="fr">
		<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
		<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
		<li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
	</ul>
</div>