<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../common.jsp"%>

<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")	
	});
	
	function doSearch()
	{
		board.board_form.value="list";
		board.board_search.value = $("#board_search").val();
		board.board_keyword.value = $("#board_keyword").val();
		board.board_page.value = "1";
		
		board.submit();
	}
	
	function doSelect(bbs_idx)
	{
		board.board_form.value = "view";
		board.bbs_idx.value	 = bbs_idx;
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
		//이전  페이지(<) 클릭 시 X1 번 글록 이동
        var iPage = parseInt(page / 8);
        const iRest = page % 8;
        if ( iRest == 0 ) {
            if ( iPage == 0 ) {
                iPage = 1;
            } else {
                iPage = (iPage - 1) * 8 + 1;
            }
        } else {
            iPage = iPage * 8 + 1;
        }
        
		board.board_form.value="list";
		board.board_page.value=iPage;
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
		//다음  페이지(>) 클릭 시 X1 번 글록 이동
        var iPage = parseInt(page / 8);
        const iRest = page % 8;
        if ( iRest == 0 ) {
            iPage = (iPage - 1) * 8 + 1;
        } else {
            iPage = iPage * 8 + 1;
        }
        
		board.board_form.value="list";
		board.board_page.value=iPage;
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
							<option value="0" <c:if test="${requestScope.boardSearch == 0}"><c:out value="selected"/></c:if>>제목</option>
							<option value="1" <c:if test="${requestScope.boardSearch == 1}"><c:out value="selected"/></c:if>>내용</option>
							<option value="3" <c:if test="${requestScope.boardSearch == 3}"><c:out value="selected"/></c:if>>작성자</option>
						</select>
						<input type="text" id="board_keyword" name="board_keyword" class="input t1 fl w200 ml5" value="${requestScope.boardKeyword}"/>
						<a href="javascript:doSearch()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="box t3 mt20 p20 text small">
	<ul class="area">
		<c:choose>
			<c:when test="${requestScope.boardList.size() > 0 }">
				<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">
					<li class="fl w25p">
						<div class="p10" style="height:279px;">
							<div class="box bw2 bga p5">
								<img src="${requestScope.boardList[i].bbs_file_url}" style="width:100%; height:130px;" alt="${requestScope.boardList[i].bbs_file_name}" />
							</div>
							<ul class="area mt5">
								<li class="link">
									<a href="javascript:doSelect(${requestScope.boardList[i].bbs_idx})" class="bold cm">${requestScope.boardList[i].bbs_subject}</a>
								</li>
								
								<c:if test="${requestScope.boardList[i].bbs_notice == true }">
								    <span class="bold"><font color="red">ISSUE</font></span>
								</c:if>
								<c:if test="${requestScope.boardList[i].bbs_notice == false }">
								    <li class="fl ca">NO. ${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum + 1}</li>
								</c:if>    
								
								<li class="fr ca">${requestScope.boardList[i].bbs_reg_date_dt }</li>
							</ul>
						</div>
					</li>
				</c:forEach>
			</c:when>
		</c:choose>
	</ul>
</div>

<div class="btn_wrap mt20">
	<ul class="fr">
		<c:if test="${g_isLogin}">  
			<% if (  g_user_level == 1 ) { %>
			<li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
			<% } %>
		</c:if>
	</ul>
</div>

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