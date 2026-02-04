<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	var board;
	var download;
	var state = "<c:out value="${loginVo.pers_state}" />";
	
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
		if(state=='00'||state=='01'){
			board.board_form.value="modify";
			board.submit();
		}else{
			$(".secret_box").show();
			$("#pass").val("");
			$("#pass").focus();
			$("#btncd").val("modify");
			$("#atcsno").val(board.atc_sno.value);
		}
	}
	
	function doDelete()
	{
		if(state=='00'||state=='01'){
			if ( confirm("게시글을 삭제 하시겠습니까?")) {
				board.board_form.value="delete";
				board.submit();			
			}
		}else{
			$(".secret_box").show();
			$("#pass").val("");
			$("#pass").focus();
			$("#btncd").val("delete");
			$("#atcsno").val(board.atc_sno.value);
		}
	}
	
	function doSecretClose(){
		$(".secret_box").hide();
	}
	
	function authCheck() {
		var pwd = $("#pass").val();
		var sno = $("#atcsno").val();
		var btn = $("#btncd").val();
		
		var param = "";
		param += "pass=" + pwd;
		param += "&atc_sno=" + sno;
		param += "&btn_cd=" + btn;
		
			$.ajax({
			type : "POST",
			url : "/authCheck.do",
			data : param,
			dataType : "html",
			cache : false,
			success : handleGetPwd,
			error : handleGetPwdError
		});
	}
	
	function handleGetPwd(data) {
		
		if (data.indexOf("success") >= 0) {
			var sno = data.split("=")[1];
			var btncd = data.split("=")[2];
			
			board.atc_sno.value	 = sno;
			board.board_form.value=btncd;
			board.submit();	
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
	function handleGetPwdError(data) {
		alert("다시 시도해 주세요");
	}
	
	function doWrite()
	{
		board.board_form.value="write";
		board.submit();		
	}
	
	function doReply()
	{
		board.board_form.value="reply";
		board.submit();		
	}
	
	function reModify(sno)
	{
		if(state=='00'||state=='01'){
			board.atc_sno.value= sno;
			board.board_form.value="modify";
			board.submit();		
		}else{
			alert("수정 권한이 없습니다.");
		}
	}
	
	function reDelete(sno)
	{
		if(state=='00'||state=='01'){
			if ( confirm("답글을 삭제 하시겠습니까?")) {
				board.atc_sno.value= sno;
				board.board_form.value="delete";
				board.submit();			
			}
		}else{
			alert("삭제 권한이 없습니다.");
		}
	}
	
	function doSelect(atc_sno) {
		board.board_form.value = "view";
		board.atc_sno.value	 = atc_sno;
		board.submit();
	}
	
	function doFileDownLoad(file_atc_sno)
	{
		download.bbs_cd.value = board.bbs_cd.value;
		download.atc_sno.value = file_atc_sno;
		
		download.method = "post";
		download.action = "/research_file_download.do";
		download.target = "work";
		download.submit();
	}
	
</script>

<!-- bbs_cd - 001:공지사항, 002:FAQ, 003:문의하기, 004:면허등록 -->
<c:choose>
	<c:when test="${bbs_cd=='001'}">
	    <%@include file="./research_board_view_layer1.jsp"%><!-- 번호,제목,첨부,작성자,등록일,조회수  -->
	</c:when>
	<c:when test="${bbs_cd=='002'}">
	    <%@include file="./research_board_view_layer2.jsp"%><!-- 제목,내용  -->
	</c:when>
	<c:when test="${bbs_cd=='003'}">
	    <%@include file="./research_board_view_layer3.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='004'}">
	    <%@include file="./research_board_view_layer4.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='005'}">
	    <%@include file="./research_board_view_layer5.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
</c:choose>


<form name="download">
	<input type="hidden" name="bbs_cd">
	<input type="hidden" name="atc_sno">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>