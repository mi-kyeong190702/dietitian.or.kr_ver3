<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common.jsp"%>
<%
	String user_level = session.getAttribute(SessionInfo.USER_LEVEL).toString();	
%>
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>
<script type="text/javascript">
	
	var board;
	var write;
	var editor;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")
		write = document.forms["write"];		
		
		editor = $("#bbs_contents").ckeditor();	
	
	});
	
	function doWrite() 
	{
		if($("#bbs_subject").val() == "" || $("#bbs_subject").length < 1) {
			alert("제목을 꼭 써주셔야 합니다.");
			$("#bbs_subject").focus();
			return;
		} 
		var bbscd= board.bbs_board_code.value;
		if(bbscd!='34'){
			if($("#bbs_name").val() == ""  || $("#bbs_name").length < 1) {
				alert("이름을 꼭 써주셔야 합니다.");
				$("#bbs_name").focus();
				return;
			}
		}
		
		if(bbscd == '66'){
			$("#bbs_category").val($('select[name=bbs_category]').val());
		}
	
		if($("#bbs_email").length > 0 &&  $("#bbs_email").val() == "") {
			alert("이메일을 꼭 써주셔야 합니다.");
			$("#bbs_email").focus();
			return;
		}
		
		if($("#bbs_tel").length > 0 && $("#bbs_tel").val() == "") {
			alert("연락처를 꼭 써주셔야 합니다.");
			$("#bbs_tel").focus();
			return;
		} 
		
		
		if($("#bbs_contents").val() == "" || $("#bbs_contents").length < 1) {
			alert("내용을 꼭 써주셔야 합니다.");
			$("#bbs_contents").focus();
			return;
		}		
		
		if($("#bbs_notice").prop("checked")){			
			$("#bbs_notice").val("1");			
		}
		
		write.bbs_contents.value = $("#bbs_contents").val();
		
		write.bbs_board_code.value = board.bbs_board_code.value;		
		write.target = "work";
		
		if($('input:checkbox[name=file_del_chk]').is(':checked')){
			write.file_del_chk.value = "Y";
		}
		if($('input:checkbox[name=file_del_chk2]').is(':checked')){
			write.file_del_chk2.value = "Y";
		}
		if($('input:checkbox[name=file_del_chk3]').is(':checked')){
			write.file_del_chk3.value = "Y";
		}
		if($('input:checkbox[name=file_del_chk4]').is(':checked')){
			write.file_del_chk4.value = "Y";
		}
		if($('input:checkbox[name=file_del_chk5]').is(':checked')){
			write.file_del_chk5.value = "Y";
		}
		
		if ( board.board_form.value == "write" ) {
			write.bbs_idx.value = "0";
			write.action = "/paper_board_insert.do";
		}
		else {
			write.bbs_idx.value = board.bbs_idx.value;
			write.action = "/paper_board_update.do";
		}
		
		
		write.submit();
	} 
	
	function doCancel()
	{
		board.board_form.value="list";
		board.submit();
	}
	
	function doComplete()
	{
		board.board_form.value="list";
		board.submit();
	}
	
	function doFileDownLoad(bbs_file_name, bbs_file_url, num)
	{
		download.bbs_board_code.value = board.bbs_board_code.value;
		download.bbs_idx.value = board.bbs_idx.value;
		download.bbs_file_name.value = bbs_file_name;
		download.bbs_file_url.value = bbs_file_url;
		download.num.value = num;
		
		download.method = "post";
		download.action = "/board_file_download.do"
		download.target = "work";
		download.submit();

	}
	
</script>

<form name="write" enctype="multipart/form-data" method="post">
<input type="hidden" name="bbs_board_code" value="">
<input type="hidden" name="bbs_category" value="${requestScope.bbs_category}">
<input type="hidden" name="bbs_idx" value="">

<div class="form line bt bcm bw2">
<c:choose>
	<c:when test="${requestScope.bbs_board_code == 0 
				|| (requestScope.bbs_board_code >= 25 && requestScope.bbs_board_code <= 33)
	            || requestScope.bbs_board_code == 95
	            || requestScope.bbs_board_code == 106
	            || requestScope.bbs_board_code == 108}">
	    <%@include file="./paper_board_write_layer1.jsp"%><!-- 제목,부서,연락처,담당자,내용,첨부파일5 -->
	</c:when>
	<c:when test="${(requestScope.bbs_board_code == 34)}">	            
	    <%@include file="./paper_board_write_layer2.jsp"%><!-- 제목,이름,이메일,내용,첨부파일5 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 2 || requestScope.bbs_board_code == 91 || requestScope.bbs_board_code == 87 }">
	   <%@include file="./paper_board_write_layer_top.jsp"%><!-- 제목,(분류),연락처,담당자,내용,첨부파일5 top 순번추가-->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 63  || requestScope.bbs_board_code == 64
					|| (requestScope.bbs_board_code >= 69 && requestScope.bbs_board_code <= 81  ) 
					|| requestScope.bbs_board_code == 91 || requestScope.bbs_board_code == 107  || requestScope.bbs_board_code == 87 
					|| requestScope.bbs_board_code == 125 || requestScope.bbs_board_code == 127 || requestScope.bbs_board_code == 129
					|| requestScope.bbs_board_code == 134 || requestScope.bbs_board_code == 135 || requestScope.bbs_board_code == 138
					|| requestScope.bbs_board_code == 139 || requestScope.bbs_board_code == 136 || requestScope.bbs_board_code == 137  
					|| requestScope.bbs_board_code == 154 || requestScope.bbs_board_code == 156 || requestScope.bbs_board_code == 171
					|| requestScope.bbs_board_code == 176 || requestScope.bbs_board_code == 180 || requestScope.bbs_board_code == 182 
					|| requestScope.bbs_board_code == 157
					}">	            
	    <%@include file="./paper_board_write_layer3.jsp"%><!-- 제목,(분류),연락처,담당자,내용,첨부파일5 (자동화)-->
	</c:when>
	<c:when test="${requestScope.bbs_board_code >= 69 
	            && requestScope.bbs_board_code <= 81}">
	    <%@include file="./paper_board_write_layer4.jsp"%><!-- 제목,담당자,내용,첨부파일5 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 99999999}">
	    <%@include file="./paper_board_write_layer5.jsp"%><!-- 공지사항(자동화제외)/news/notice/input.asp -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 92}">
	    <%@include file="./paper_board_write_default2.jsp"%><!--영양클리닉>식단  제목,이름,이메일,html,내용,첨부3 -->
	</c:when>
	<c:when test="${(requestScope.bbs_board_code >= 124 && requestScope.bbs_board_code <= 186  ) 
	 }">
	    <%@include file="./paper_board_write_default3.jsp"%><!--영양클리닉>식단  제목,이름,이메일,html,내용,첨부3 -->
	</c:when>
	<c:otherwise><!-- 코드 67번 -->
	    <%@include file="./paper_board_write_default.jsp"%><!--영양클리닉>식단  제목,이름,이메일,html,내용,첨부3 -->
	</c:otherwise>
</c:choose>

<div class="btn_wrap mt40">
	<ul>
		<li><a href="javascript:doWrite();" class="btn big t1">완료</a></li>
		<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
	</ul>
</div>
</form>

<form name="download">
	<input type="hidden" name="bbs_board_code">
	<input type="hidden" name="bbs_idx">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
	<input type="hidden" name="num">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>