<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")	
	});
	
	
	function doSelect(idx) {
		location.href="/work/publication/kp_archiveshop.do?board_form=view&oindex=" + idx;
	}
	

		
	function doDelete(ctindex)
	{
		board.board_form.value="delete";
		board.ctindex.value = ctindex;
		board.submit();
	}
	
	function doShopping()
	{
		document.location.href = "/work/publication/kp_archiveshop.do";
	}
	
	
	function doPayment()
	{
		var count = ${requestScope.boardList.size()};

		if ( count > 0 ) {
			<% if( !g_isLogin ) { %>
			location.href="/kp_archiveshop_nomem.do";
			<% } else { %> 
			board.action = "/kp_archiveshop_pay.do";
			board.submit();
			<% } %>
		} else {
			alert("장바구니에 담긴 상품이 없습니다.");
		}		
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

</script>

<table class="table t1 text s1 ca center">
	<colgroup>
		<col width="70">
		<col width="*">
		<col width="80">
		<col width="60">
		<col width="70">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" class="bold cm">번호</th>
		<th scope="col" class="bold cm">상품명</th>
		<th scope="col" class="bold cm">단가</th>
		<th scope="col" class="bold cm">수량</th>
		<th scope="col" class="bold cm">삭제</th>
	</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${requestScope.boardList.size() >0 }">
				<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">	
				<tr>
					<td>${requestScope.boardList[i].ctindex}</td>
					<td class="left link"><a href="javascript:doSelect('${boardList[i].oindex}');">${requestScope.boardList[i].otitle}</td>
					<td class="cp">
						<c:choose>
							<c:when test="${isMember}">
								<fmt:formatNumber type="currency" value="${requestScope.boardList[i].oprice1}" pattern="###,###" />
							</c:when>
							<c:otherwise>
								<fmt:formatNumber type="currency" value="${requestScope.boardList[i].oprice2}" pattern="###,###" />
							</c:otherwise>
						</c:choose>	
					</td>
					<td>${requestScope.boardList[i].ctea}</td>
					<td><a href="javascript:doDelete(${requestScope.boardList[i].ctindex});" class="btn t4">삭제</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">장바구니에 담긴 상품이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>	
	</tbody>
</table>

<div class="btn_wrap mt20">
	<ul class="fr">
		<li><a href="javascript:doShopping()" class="btn big t2">쇼핑 계속하기</a></li>
		<li><a href="javascript:doPayment()" class="btn big t1">결제하기</a></li>
	</ul>
</div>
