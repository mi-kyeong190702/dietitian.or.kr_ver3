<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	var board;
	var state = "<c:out value="${loginVo.pers_state}" />";
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined");
	});
	
	function selectCnt(board_cnt){
		board.board_cnt.value	 = board_cnt;
		board.submit();
	}
	
	function doSearch()
	{
		board.board_form.value="list";
		board.board_search.value = $("#board_search").val();
		board.board_keyword.value = $("#board_keyword").val();
		board.board_page.value = "1";
		
		board.submit();
	}
	
	function doSelect(atc_sno)
	{
		board.board_form.value = "view";
		board.atc_sno.value	 = atc_sno;
		board.submit();
	}
	
	function doWirte()
	{
		board.board_form.value="write";
		board.submit();
	}
	
	function moveFirst(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function movePrev(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function movePage(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function moveNext(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function moveLast(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function doSecret(atc_sno)
	{
		if(state=='00'||state=='01'){
			board.board_form.value = "view";
			board.atc_sno.value	 = atc_sno;
			board.submit();
		}else{
			$(".secret_box").show();
			$("#pass").val("");
			$("#pass").focus();
			$("#atcsno").val(atc_sno);			
		}
	}
	
	function doSecretClose(){
		$(".secret_box").hide();
		$("#pass").val("");
		$("#atcsno").val("");
	}
	
	
	function authCheck() {
		var pwd = $("#pass").val();
		var sno = $("#atcsno").val();
		
		var param = "";
		param += "pass=" + pwd;
		param += "&atc_sno=" + sno;
		param += "&btn_cd=view";
		
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
			var cd = board.bbs_cd.value;
			var addr = "";
			var bcd = document.createElement("input");
			bcd.type="hidden";
			bcd.name="bcd";
			bcd.value=board.bbs_cd.value;
			board.insertBefore(bcd,null); 
			board.bcd.value=cd;
			board.board_form.value = "view";
			board.atc_sno.value	 = sno;
			board.method="POST";
			if(cd=='003'){
				addr ="/work/research/community/kr_inquiry.do?bbs_cd=003";
			}else if(cd=='004'){
				addr ="/work/research/license/kr_license.do?bbs_cd=004";
			}else if(cd=='005'){
				addr ="/work/research/recipient/kr_recipient.do?bbs_cd=005";
			}
			board.action=addr;
			board.submit();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
		
	}
	function handleGetPwdError(data) {
		alert("다시 시도해 주세요");
	}
	
	function showHideAns(idx) {
		if( $("#faq_ans" + idx).css("display") != "none" ) {
			$("#faq_ans" + idx).hide();
			$("#faq_icon" + idx).removeClass("close");
			$("#faq_icon" + idx).addClass("open");
		} else {
			$("#faq_ans" + idx).show();
			$("#faq_icon" + idx).removeClass("open");	
			$("#faq_icon" + idx).addClass("close");
			
		}
	}
	
	function doModify(sno)
	{
		if(state=='00'||state=='01'){
			board.board_form.value="modify";
			board.atc_sno.value=sno;
			board.submit();
		}else{
			$(".secret_box").show();
			$("#pass").val("");
			$("#pass").focus();
			$("#btncd").val("modify");
			$("#atcsno").val(board.atc_sno.value);
		}
	}
	
	function doDelete(sno)
	{
		if(state=='00'||state=='01'){
			if ( confirm("게시글을 삭제 하시겠습니까?")) {
				board.board_form.value="delete";
				board.atc_sno.value=sno;
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
</script>


<!-- bbs_cd - [001:공지사항] [002:FAQ] [003:문의하기] [004:면허등록] -->
<c:choose>
	<c:when test="${bbs_cd=='001'}">
	    <%@include file="./research_board_list_layer1.jsp"%><!-- 번호,제목,첨부,작성자,등록일,조회수  -->
	</c:when>
	<c:when test="${bbs_cd=='002'}">
	    <%@include file="./research_board_list_layer2.jsp"%><!-- 제목,내용  -->
	</c:when>
	<c:when test="${bbs_cd=='003'}">
	    <%@include file="./research_board_list_layer3.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='004'}">
	    <%@include file="./research_board_list_layer4.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='005'}">
	    <%@include file="./research_board_list_layer5.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
</c:choose>


	<div class="paging small mt30">
		<a href="javascript:moveFirst(${boardPage.getFirstPage()});" class="p_btn start"><span class="icon"></span><span class="ti">처음</span></a>
		<a href="javascript:movePrev(${boardPage.getPrevPage()});" class="p_btn prev"><span class="icon"></span><span class="ti">이전</span></a>			
			
		<c:forEach var="i" begin="${boardPage.getStartPage() }" end="${boardPage.getEndPage()}" step="1">
			<c:choose>
				<c:when test="${boardPage.getCurPage() == i }">
					<a href="javascript:movePage(${i});" class="p_btn on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:movePage(${i});" class="p_btn">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
		<a href="javascript:moveNext(${boardPage.getNextPage()});" class="p_btn next"><span class="icon"></span><span class="ti">다음</span></a>
		<a href="javascript:moveLast(${boardPage.getLastPage()});" class="p_btn end"><span class="icon"></span><span class="ti">끝</span></a>
	</div>
