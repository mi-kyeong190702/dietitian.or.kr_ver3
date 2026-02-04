<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.WorkData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kdaFn" uri="/WEB-INF/tld/kda-func.tld" %>

<%@include file="../common.jsp"%>

<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")	
	});
	
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
	
	function doSelect(oindex) {
		board.board_form.value = "view";
		board.oindex.value = oindex;
		board.submit();
	}
	
	function doBuy(){
		var ctea = $("#ctea").val();
		var param = "ctea=" + ctea + "&oindex=${param.oindex}";
		$.ajax ( {
              type		: "POST"
			, url		: "/cart_board_insert.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: function() {
				board.board_form.value="list";
				board.action = "/work/publication/kp_archiveshop_cart.do";
				board.submit();
			}
			, error		: function(e) {
				alert("처리중 오류가 발생하였습니다.");
			}				
			
		});
	}
	

	
	function doInCart() {
		var ctea = $("#ctea").val();
		alert(ctea);
		var param = "ctea=" + ctea + "&oindex=${param.oindex}";
		$.ajax ( {
              type		: "POST"
			, url		: "/cart_board_insert.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleInsertCart
			, error		: function(e) {
				alert("처리중 오류가 발생하였습니다.");
			}				
			
		});
	}
	
	function handleInsertCart(data)
	{
		if ( data.indexOf("success") >= 0 )
			alert("상품을 장바구니에 담았습니다.");
	}

</script>

<div class="box bga text ssmall mt5 p10">
	우리 회에서는 식품, 영양에 관한 정보 제공 및 영양사 실무에도 도움이 될 수 있도록 영양사를 대상으로 교육자료를 개발, 제작하여<br />
	보급하고 있습니다.<br />
	다음의 교육자료를 구입하시고자 하는 분은 원하는 교육자료를 click하여 선택하시고, 구매신청서를 작성하신 후 해당 계좌로<br />
	입금하여 주시기 바랍니다. 신청하신 자료는 신청서 접수 및 입금 확인 후, 약 1주일 정도 경과 시 받아보실 수 있습니다.<br />
	<span class="mt10 i_b_t3">문의처 : 교육국 02-823-5680 (내선번호) 521</span>
</div>
<div class="box t3 text small mt10">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${requestScope.boardRow.otitle}</h4>
			</div>
		</li>
		<li class="fl w50p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">가격</strong>
				<span>${requestScope.boardRow.oprice1}(회원) / ${requestScope.boardRow.oprice2}(비회원)</span>
			</div>
		</li>
		<li class="fl w50p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">수량</strong>
				<span class="ib">
					<input type="text" class="input t1 fl w45 ml5" id="ctea" name="ctea" value="1" />
					<c:if test="${requestScope.boardRow.materials_status=='0' }">
					<a href="javascript:doBuy();" class="btn form t1 fl ml5">구매하기</a>
					<a href="javascript:doInCart();" class="btn form t3 fl ml5">장바구니에 담기</a>
					</c:if>
				</span>
			</div>
		</li>
	</ul>
</div>
<div class="line bb p30 text">
	<h4 class="ti">본문</h4>
	<div class="area">
		<div class="fl w45p">
			<img src="<%=WorkData.UPLOAD_CART_FRONT_PATH%>${requestScope.boardRow.oimage}" />
		</div>
		<div class="fr w50p">
			${ kdaFn:convHTML(requestScope.boardRow.ocontents)}
		</div>
	</div>
</div>

<!-- <div class="line bt mt40 text small"> -->
<!-- 	<h4 class="ti">편의버튼</h4> -->
<!-- 	<ul> -->
		
<%-- 		<c:if test="${requestScope.boardRowPrev != null }"> --%>
<!-- 		<li> -->
<!-- 			<div class="pr p15 line bb"> -->
<!-- 				<strong class="pa l15 t15 bold cm">이전글</strong> -->
<%-- 				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowPrev.oindex})">${requestScope.boardRowPrev.otitle}</a></span> --%>
<%-- 				<span class="pa r15 t15">${f:substring(requestScope.boardRowPrev.odate, 0, 10)}</span> --%>
<!-- 			</div> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${requestScope.boardRowNext != null }"> --%>
<!-- 		<li> -->
<!-- 			<div class="pr p15 line bb"> -->
<!-- 				<strong class="pa l15 t15 bold cm">다음글</strong> -->
<%-- 				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowNext.oindex})">${requestScope.boardRowNext.otitle}</a></span> --%>
<%-- 				<span class="pa r15 t15">${f:substring(requestScope.boardRowNext.odate, 0, 10)}</span> --%>
<!-- 			</div> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>
<!-- 	</ul> -->
<!-- </div> -->

<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
	</ul>
	<ul class="fr">
		
		<c:if test="${ g_user_level == 1}"> 
			<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
			<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
			<li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
		</c:if>
	</ul>
</div>
					