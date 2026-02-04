<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
	strong, b {font-weight:bold;}
</style>

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

<c:set var="chkKind" value="${bbs_board_code== 22 ||  bbs_board_code == 64 }" />

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
			
			<c:when test="${requestScope.boardList.size() > 0 }">
				
				
				
				<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">
				<tr>
					<c:if test="${requestScope.boardList[i].bbs_notice == true }"><td><b><font color=blue>공지</font></b></td></c:if>
                    <c:if test="${requestScope.boardList[i].bbs_notice == false }"><td>${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum + 1}</td></c:if>
                    
					<c:if test="${chkKind}">
					<td>${requestScope.boardList[i].bbs_category }</th>
					</c:if>
					<td class="left link">
						<c:choose>
							<c:when test="${requestScope.boardList[i].bbs_del_flag}">
										<b>[ - - 해당글은 삭제된 글입니다. - - ]</b>
							</c:when>
							<c:when test="${(!requestScope.boardList[i].bbs_del_flag && requestScope.boardSettings.bs_ViewLevel >= g_user_level
							                && g_code_big == '104') || g_user_level == 1 }">
								<a href="javascript:doSelect(${requestScope.boardList[i].bbs_idx}, ${requestScope.boardList[i].bbs_board_code})">
											${requestScope.boardList[i].bbs_subject}
											<c:if test="${requestScope.boardList[i].bbs_comments_count > 0 }"><b>(${requestScope.boardList[i].bbs_comments_count})</b></c:if>								
											<c:if test="${requestScope.boardList[i].bbs_new == 'Y' }"><span class="i_new"><span class="ti">NEW</span></span></c:if>
								</a>
							</c:when>
							<c:otherwise>
								${requestScope.boardList[i].bbs_subject}
								<c:if test="${requestScope.boardList[i].bbs_comments_count > 0 }"><b>(${requestScope.boardList[i].bbs_comments_count})</b></c:if>								
								<c:if test="${requestScope.boardList[i].bbs_new == 'Y' }"><span class="i_new"><span class="ti">NEW</span></span></c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${requestScope.boardList[i].bbs_name}</td>
					<td>${requestScope.boardList[i].bbs_reg_date_dt}</td>
					<td>${requestScope.boardList[i].bbs_view }</td> 
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