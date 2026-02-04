<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common.jsp"%>

<%
	String board_form 		= ParamUtils.getParameter(request	, "board_form", "list");
	int board_page 			= ParamUtils.getIntParameter(request, "board_page", 1);
	String board_search 	= ParamUtils.getParameter(request, "board_search", "0");
	String board_keyword 	= ParamUtils.getParameter(request, "board_keyword", "");

	String bbs_board_code	= ParamUtils.getParameter(request, "bbs_board_code", "0");
	int bbs_idx 			= ParamUtils.getIntParameter(request, "bbs_idx", -1);
	String bbs_category 	= ParamUtils.getParameter(request, "bbs_category", "");

	
%>

<script type="text/javascript">
	var board;	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined");	
	});
	
	function doSearch(){
		board.board_form.value		= "list";
		board.board_search.value 	= $("#board_search").val();
		board.board_keyword.value 	= $("#board_keyword").val();
		board.board_page.value 		= "1";
		
		board.submit();
	}
	
	function doSelect(resi_serial_no)
	{
		board.board_form.value = "view";
		board.resi_serial_no.value = resi_serial_no;
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
						<select id="board_search" name="board_search" class="select t2 fl w150">
							<option value="1" <c:if test="${param.board_search == 1}">selected</c:if> >음식명 </option>
							<option value="2" <c:if test="${param.board_search == 2}">selected</c:if>>총분량 </option>
							<option value="3" <c:if test="${param.board_search == 3}">selected</c:if>>조리시간 </option>				
						</select>
						<input type="text" id="board_keyword" name="board_keyword" class="input t1 fl w200 ml5" value="${param.board_keyword}"/>
						<a href="javascript:doSearch()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<table class="table t1 text s1 ca center mt20">
	<colgroup>
		<col width="70">
		<col width="*">
		<col width="110">
		<col width="110">
		<col width="70">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" class="bold cm">번호</th>
		<th scope="col" class="bold cm">제목</th>
		<th scope="col" class="bold cm">작성자</th>
		<th scope="col" class="bold cm">등록일</th>
		<th scope="col" class="bold cm">조회</th>
	</tr>		
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${requestScope.boardList.size() >0 }">
			<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">	
			<tr>
				<td>${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum }</td>
				<td class="left link">
					
					<a href="javascript:doSelect(${requestScope.boardList[i].resi_serial_no})">
						${requestScope.boardList[i].resi_address}
					</a>
					<c:if test="${requestScope.boardList[i].resi_new == 'Y' }">
						<span class="i_new"><span class="ti">NEW</span></span>
					</c:if>
				</td>
				<td>작성자</td>
				<td>${requestScope.boardList[i].resi_wrt_date}</td>
				<td>${requestScope.boardList[i].resi_read_no}</td>
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

<c:if test="${ isMember }">
<div class="btn_wrap mt20">
	<ul class="fr">
		<li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
	</ul>
</div>
</c:if>		
	
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