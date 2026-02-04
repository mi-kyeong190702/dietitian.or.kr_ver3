<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.WorkData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../common.jsp"%>

<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined");
	});
	
	function doSearch()
	{
		board.board_form.value="list";
		board.board_search1.value = $("#board_search1").val();
		board.board_search2.value = $("#board_search2").val();
		board.board_keyword.value = $("#board_keyword").val();
		board.submit();
	}
	
	function doSelect(oindex)
	{
		board.board_form.value = "view";
		board.oindex.value = oindex;
		board.submit();
	}
	
	function doWirte()
	{
		board.board_form.value="write";
		board.submit();
	}
	
	function doInsertCart(i, oindex)
	{
		var ctea = $("#ctea" + i).val()
		var param = "ctea=" + ctea + "&oindex=" + oindex;
		$.ajax ( {
              type		: "POST"
			, url		: "/cart_board_insert.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleInsertCart
			, error		: handleInsertCartError				
		});
	}
	
	function handleInsertCart(data)
	{
		if ( data.indexOf("success") >= 0 )
			alert("상품을 장바구니에 담았습니다.");
	}
	
	function handleInsertCartError(){}
		
	function doShowCart()
	{
		board.board_form.value="list";
		board.action = "/work/publication/kp_archiveshop_cart.do";
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

</script>

<div class="box p20">
	<div class="form">
		<div class="f_wrap">
			<div class="f_field div1">
				<div class="title s1 i_b_t6">
					먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있습니다.
				</div>
				<div class="ff_wrap mt10">
					<div class="area">
						<select id="board_search1" name="board_search1" class="select t2 fl w120" id="board_search1">
							<option value="0" <c:if test="${requestScope.boardSearch1 == 0}"><c:out value="selected"/></c:if>>제목</option>
							<option value="1" <c:if test="${requestScope.boardSearch1 == 1}"><c:out value="selected"/></c:if>>출판년도</option>
						</select>
						<input type="text" id="board_keyword" name="board_keyword" class="input t1 fl w200 ml5" value="${requestScope.boardKeyword}"/>
						<select id="board_search2" name="board_search2" class="select t2 fl w90 ml5" id="inputid3">
							<option value="%" <c:if test="${requestScope.boardSearch2 == '%'}"><c:out value="selected"/></c:if>>전체</option>
							<option value="서적" <c:if test="${requestScope.boardSearch2 == '서적'}"><c:out value="selected"/></c:if>>서적</option>
							<option value="리플릿" <c:if test="${requestScope.boardSearch2 == '리플릿'}"><c:out value="selected"/></c:if>>리플릿</option>
							<option value="기타도구" <c:if test="${requestScope.boardSearch2 == '기타도구'}"><c:out value="selected"/></c:if>>기타도구</option>
							<option value="포스터/패널" <c:if test="${requestScope.boardSearch2 == '포스터/패널'}"><c:out value="selected"/></c:if>>포스터/패널</option>
						</select>
						<a href="javascript:doSearch()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="btn_wrap mt20">
    <ul class="fr">
        <li><a href="javascript:doShowCart();" class="btn big t2">장바구니 보기</a></li>
        <% if (  g_user_level == 1 ) { %>
            <li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
        <% } %>
    </ul>
</div>

<table class="table t1 text small s1 ca center mt20">
	<colgroup>
		<col width="50">
		<%-- <col width="70"> --%>
		<col width="80">
		<col width="*">
		<col width="70">
		<col width="150">
		<col width="120">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" class="bold cm">번호</th>
		<!-- <th scope="col" class="bold cm">분류</th> -->
		<th scope="col" class="bold cm">사진</th>
		<th scope="col" class="bold cm">제목</th>
		<th scope="col" class="bold cm">출판년도</th>
		<th scope="col" class="bold cm">회원/비회원가격(영양사)</th>
		<th scope="col" class="bold cm">구매</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${requestScope.boardList.size() >0 }">
			<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">
			<tr>
				<td>${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum + 1 }</td>
				<%-- <td>${requestScope.boardList[i].bs_categorytype }</td> --%>				
				<td><img src="<%=WorkData.UPLOAD_CART_FRONT_PATH%>${requestScope.boardList[i].oimage}" width="70" /></td>				
				<td class="left link">
					<a href="javascript:doSelect(${requestScope.boardList[i].oindex})">
						${requestScope.boardList[i].otitle}
					</a>
				</td>
									
				<td>${requestScope.boardList[i].oyear}</td>
				<td class="cp"><fmt:formatNumber type="currency" value="${requestScope.boardList[i].oprice1}" pattern="###,###" />/<fmt:formatNumber type="currency" value="${requestScope.boardList[i].oprice2}" pattern="###,###" /></td>
				<td>
					<input id="ctea${i}" name="ctea${i}" type="text" class="input t1 fl w45 ml5" value="1"/>
					<c:if test="${requestScope.boardList[i].materials_status=='0' }">
					<a href="javascript:doInsertCart(${i},${requestScope.boardList[i].oindex})" class="btn form t3 p0 fl ml5">담기</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7">글 또는 검색된 결과가 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>

<div class="paging small mt30">
	<a href="javascript:moveFirst(${requestScope.boardPage.getFirstPage()});" class="p_btn start"><span class="icon"></span><span class="ti">처음</span></a>
	<a href="javascript:movePrev(${requestScope.boardPage.getPrevPage()});" class="p_btn prev"><span class="icon"></span><span class="ti">이전</span></a>			
		
	<c:forEach var="i" begin="${requestScope.boardPage.getStartPage() }" end="${requestScope.boardPage.getEndPage()}" step="1">
		<c:choose>
			<c:when test="${requestScope.boardPage.getCurPage() == i }">
				<a href="javascript:movePage(${i});" class="p_btn on">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:movePage(${i});" class="p_btn">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	<a href="javascript:moveNext(${requestScope.boardPage.getNextPage()});" class="p_btn next"><span class="icon"></span><span class="ti">다음</span></a>
	<a href="javascript:moveLast(${requestScope.boardPage.getLastPage()});" class="p_btn end"><span class="icon"></span><span class="ti">끝</span></a>
</div>