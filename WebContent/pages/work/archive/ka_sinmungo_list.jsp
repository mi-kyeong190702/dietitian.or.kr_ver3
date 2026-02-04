<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@include file="/pages/common.jsp"%>
<%@ page import="kda.utils.ParamUtils"%>
<% String search_keyword 	= ParamUtils.getParameter(request, "search_keyword", "");
   String search 	= ParamUtils.getParameter(request, "search", "");
%>

<script type="text/javascript">
	
	var board;
	
	
	function doSearch()
	{ 
		board.board_form.value		="list";
		board.board_search.value 	= $("#board_search").val();
		board.board_keyword.value 	= $("#board_keyword").val();
		board.board_page.value 		= "1";
		
		board.submit();
	}
	
	function doSelect(bbs_idx, bbs_board_code)
	{
		board.board_form.value 		= "view";
		board.bbs_idx.value	 		= bbs_idx;
		board.bbs_board_code.value	= bbs_board_code;
		board.submit();
	}

	function doWirte()
	{
		board.board_form.value="write";
		board.submit();
	}

	function doSearch(){
		var f = $("#board_search option:selected").val();
		location.href="ka_sinmungo_list.do?seacrh="+f;	
	}
	
	function goPerson(){
		var id=$("#hide").val();
		document.location.href="ka_sinmungo_person_update.do?user_id="+id;
	}
	
	function movePage(page)
	{
		document.board.cp.value=page;
		document.board.search_keyword.value = document.ka_sinmungo_search.search_keyword.value;
		document.board.submit();
	}

</script>
<form id="board" name="board" action="/ka_sinmungo_list.do">
	<input type="hidden" name="cp" 		value="">
	<input type="hidden" name="search_keyword" 		value="<%=search_keyword%>">
	<input type="hidden" name="search" 		value="<%=search%>">
</form>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1">
				<mark class="cm">영양사</mark>신문고
			</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span
						class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_sinmungo_check.do" class="cm">영양사신문고</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="box t2 p20">
			<h4 class="title bold s1 cb2">
				영양사 신문고는 영양사 업무 현장에서 발생하는 어려움을 소통하고 함께 고충 해결방안을 모색하기 위해 <br>마련된
				공간입니다. <br>비방, 광고, 개인자료 요청 등의 글은 통보없이 삭제될 수 있으며, 질의, 의견개진 등은
				회원게시판을 이용 부탁드립니다.
			</h4>
		</div>
		<div class="box p20">
			<div class="form">
				<div class="f_wrap">
					<div class="f_field div1">
						<div class="title s1 i_b_t6">먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수
							있습니다.</div>
						<form id="ka_sinmungo_search" name="ka_sinmungo_search"
							action="/ka_sinmungo_list.do">
							<div class="ff_wrap mt10">
								<div class="area">
									<c:set value="${search }" var="search" />
									<select id="search" name="search" class="select t2 fl w150">
										<option value="0" <% if(  search.equals("0") ) { %> selected <% } %>>제목</option>
										<option value="1" <% if(  search.equals("1") ) { %> selected <% } %>>내용</option>
										<option value="2" <% if(  search.equals("2") ) { %> selected <% } %>>작성자</option>
									</select>
									<c:set value="${search_keyword }" var="search_keyword"
										scope="session" />
									<c:set value="${search }" var="search_keyword" scope="session" />
									<input type="text" id="search_keyword" name="search_keyword" class="input t1 fl w200 ml5" value="${search_keyword}"> 
									<input type="submit" class="btn form t1 fl ml5" value="검색">
								</div>
							</div>
						</form>
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
				<col width="110">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">제목</th>
					<th scope="col" class="bold cm">등록일자</th>
					<th scope="col" class="bold cm">처리현황</th>
					<th scope="col" class="bold cm">처리부서</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty list }">
						<c:set value="${list}" var="list" />
						<c:forEach var="list" items="${list}">
							<form>
								<input type="hidden" id="hide" name="hide"
									value="${list.board_user_id }" />
							</form>
							<tr>
								<td>${list.rnum2}</td>
								<c:choose>
									<c:when test="${fn:length(list.board_subject)>12 }">
										<td style="text-align: left; padding-left: 20px;"><a
											href="/ka_sinmungo_view.do?idx=${list.idx}&user_id=${list.board_user_id}"><c:out
													value="${fn:substring(list.board_subject,0,10)}" />.......</a></td>
									</c:when>
									<c:otherwise>
										<td style="text-align: left; padding-left: 20px;"><a
											href="/ka_sinmungo_view.do?idx=${list.idx}&user_id=${list.board_user_id}">${list.board_subject}</a></td>
									</c:otherwise>
								</c:choose>
								<td>${list.board_reg_date}</td>
								<td>${list.board_handling}</td>
								<td>${list.board_dept_com}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">글 또는 검색된 결과가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<c:if test="${sessionScope.user_level != 1 }">
			<c:if test="${sessionScope.user_level ne null }">
				<div class="btn_wrap mt20">
					<ul class="fr">
						<form action="/ka_sinmungo_person_update.do" method="post">
							<li><input type="submit" class="btn big t2" value="개인정보 수정"></li>
							<input type="hidden" value="${sessionScope.userid }" id="userid" name="userid" />
						</form>
					
						<form action="/ka_sinmungo_write.do" method="post">
							<li><input type="submit" class="btn big t1" value="글쓰기"></li>
						</form>
					</ul>
				</div>
			</c:if>
		</c:if>
		<!-- 
		<div class="paging small mt30" style="text-align: center">
			<a href="${firstpage }" class="p_btn start"><span class="icon"></span><span class="ti">처음</span></a>
			<a href="${prev }" class="p_btn prev"><span class="icon"></span><span class="ti">이전</span></a>
			<c:forEach var="page" items="${page}" >
			${page }
			</c:forEach>
			<a href="${next }" class="p_btn next"><span class="icon"></span><span class="ti">다음</span></a>
			<a href="${endpage }" class="p_btn end"><span class="icon"></span><span class="ti">끝</span></a>
		</div>
		 -->
		<div class="paging small mt30">
			<a
				href="javascript:movePage(${requestScope.boardPage.getFirstPage()});"
				class="p_btn start"><span class="icon"></span><span class="ti">처음</span></a>
			<a
				href="javascript:movePage(${requestScope.boardPage.getPrevPage()});"
				class="p_btn prev"><span class="icon"></span><span class="ti">이전</span></a>

			<c:forEach var="i" begin="${requestScope.boardPage.getStartPage() }"
				end="${requestScope.boardPage.getEndPage()}" step="1">
				<c:choose>
					<c:when test="${requestScope.boardPage.getCurPage() == i }">
						<a href="javascript:movePage(${i});" class="p_btn on">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:movePage(${i});" class="p_btn">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<a
				href="javascript:movePage(${requestScope.boardPage.getNextPage()});"
				class="p_btn next"><span class="icon"></span><span class="ti">다음</span></a>
			<a
				href="javascript:movePage(${requestScope.boardPage.getLastPage()});"
				class="p_btn end"><span class="icon"></span><span class="ti">끝</span></a>
		</div>

	</div>
</div>
