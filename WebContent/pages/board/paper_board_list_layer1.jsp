<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kda.WorkData"%>
<style type="text/css">
<!--
strong, b {font-weight:bold;}
-->
</style>

<div class="box p20">
	<div class="form">
		<div class="f_wrap">
			<div class="f_field div1">
				<div class="title s1 i_b_t6">
					<c:choose>			
						<c:when test="${requestScope.bbs_board_code == 34 }">
							먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있으며, 비방, 광고, 개인자료 요청, 개인정보 관련 등의 글은 통보없이 삭제될 수 있습니다. 
						</c:when>
						<c:otherwise>
							먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있습니다.
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="ff_wrap mt10">
					<div class="area">
						<select id="board_search" name="board_search" class="select t2 fl w150">
							<option value="0" <c:if test="${requestScope.boardSearch == 0}"><c:out value="selected"/></c:if>>제목</option>
							<option value="1" <c:if test="${requestScope.boardSearch == 1}"><c:out value="selected"/></c:if>>내용</option>
				
						<c:choose>			
							<c:when test="${requestScope.bbs_board_code == 34 }">
								<option value="5" <c:if test="${requestScope.boardSearch == 5}"><c:out value="selected"/></c:if>>작성자</option>
							</c:when>
							<c:otherwise>
								<option value="3" <c:if test="${requestScope.boardSearch == 3}"><c:out value="selected"/></c:if>>작성자</option>
							</c:otherwise>
						</c:choose>
						</select>
						<input type="text" id="board_keyword" name="board_keyword" class="input t1 fl w200 ml5" value="${requestScope.boardKeyword}"/>
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
			<c:when test="${requestScope.boardList.size() > 0 }">
				<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">
				
					<c:if test="${requestScope.boardList[i].bbs_notice == true }"><td><b><font color=blue>공지</font></b></td></c:if>
					<c:if test="${requestScope.boardList[i].bbs_notice == false }"><td>${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum + 1}</td></c:if>
					<td class="left link">
						<c:choose>
							<c:when test="${requestScope.boardList[i].bbs_del_flag}">
										<b>[ - - 해당글은 삭제된 글입니다. - - ]</b>
							</c:when>
							<c:when test="${!requestScope.boardList[i].bbs_del_flag && requestScope.boardSettings.bs_ViewLevel >= g_user_level}">
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
					<c:choose>
						<c:when test="${requestScope.boardList[i].bbs_board_code == 34 }">
							<c:set value="<%=WorkData.MASTER_USER %>" var="master_user"/>
							<c:if test="${requestScope.boardList[i].bbs_user_id == master_user}">
								<td>관리자</td>
							</c:if>
							<c:if test="${requestScope.boardList[i].bbs_user_id != master_user}">
								<td>${requestScope.boardList[i].bbs_user_id }</td>
							</c:if>
						</c:when>
						<c:otherwise>
							<td>${requestScope.boardList[i].bbs_name}</td>	
						</c:otherwise>
					</c:choose>
												
					<td>${requestScope.boardList[i].bbs_reg_date_dt}</td><!-- 등록일-->
					<td>${requestScope.boardList[i].bbs_view }</td> <!-- 조회 -->
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