<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kdaFn" uri="/WEB-INF/tld/kda-func.tld" %>


<%@include file="../common.jsp"%>
	
<script type="text/javascript">
	
	var board;
	var download;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")
		download = document.forms["download"];
	});
	
	function doPrint()
	{
		$("#print_contents").printElement({
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
		if ( confirm("게시글을 삭제 하시겠습니까?")) {
			board.board_form.value="delete";
			board.submit();			
		}

	}
	
	function doWrite()
	{
		board.board_form.value="write";
		board.submit();		
	}
	
	function doWriteComment()
	{
		//board.board_form.value="write";
		//board.submit();		
	}
	
	function doSelect(resi_serial_no) {
		board.board_form.value = "view";
		board.resi_serial_no.value	 = resi_serial_no;
		board.submit();
	}
	
</script>

<div class="box t3 text small">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${requestScope.boardRow.resi_address}</h4>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">등록일</strong>
				<span>${f:substring(requestScope.boardRow.resi_wrt_date, 0, 10)}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">총 분량</strong>
				<span>${requestScope.boardRow.resi_user_name}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">조리시간</strong>
				<span>${requestScope.boardRow.resi_content1}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">조리온도</strong>
				<span>${requestScope.boardRow.resi_title}</span>
			</div>
		</li>
	</ul>
</div>
<div id="print_contents" class="line bb p30 text">
	<h4 class="ti">본문</h4>
	
	${kdaFn:convHTML(requestScope.boardRow.resi_content1)}
	${kdaFn:convHTML(requestScope.boardRow.resi_content2)}
	${kdaFn:convHTML(requestScope.boardRow.resi_content3)}
	${kdaFn:convHTML(requestScope.boardRow.resi_content4)}
</div>
	
<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
		<li><a href="javascript:doPrint();" class="btn big t2">프린트</a></li>
	</ul>
	
	<% if ( g_isLogin ) { %>
	<ul class="fr">
		<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
		<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
		<li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
	</ul>
	<% } %>
</div>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>