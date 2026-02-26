<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
							<c:if test="${ requestScope.bbs_board_code != 2}">
							<option value="3" <c:if test="${requestScope.boardSearch == 3}"><c:out value="selected"/></c:if>>작성자</option>
							</c:if>

							
							<!-- 정보공유 게시판은 구분을 검색조건으로 사용하지 않습니다. -->
							<c:if test="${requestScope.boardSettings.bs_Category == 1 && requestScope.bbs_board_code != 20 &&  param.bbs_category != '교육' }">
							<option value="2" <c:if test="${requestScope.boardSearch == 2}"><c:out value="selected"/></c:if>>자료분류</option>
							</c:if>
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
		<col width="60">
		<c:if test="${requestScope.boardSettings.bs_Category == 1  &&  param.bbs_category != '교육'}">
			<col width="100">
		</c:if>
		<col width="*"><!-- 제목 -->
		<col width="80"><!-- 작성자 -->
		<col width="100"><!-- 등록일 -->
		<col width="50"><!-- 조회 -->
		<c:if test="${requestScope.bbs_board_code == 104}">
			<col width="50"><!--추천수 -->
		</c:if>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="bold cm">번호</th>
			<c:if test="${requestScope.boardSettings.bs_Category == 1  &&  param.bbs_category != '교육'}">
			<th scope="col" class="bold cm">자료분류</th>
			</c:if>
			<th scope="col" class="bold cm">제목</th>
			<th scope="col" class="bold cm">작성자</th>
			<th scope="col" class="bold cm">등록일</th>
			<th scope="col" class="bold cm">조회</th>
			<c:if test="${requestScope.bbs_board_code == 104}">
			<th scope="col" class="bold cm">추천수</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
		<c:if test="${ param.bbs_board_code == 22 }">
			<c:choose>
				<c:when test="${requestScope.boardSettings.bs_ViewLevel >= g_user_level }">
				<tr>
					<td colspan="6" style="background-color: #F9FAEF"><a href="javascript:doSelect(54516, 22)"><b>지난『영양관련정보』 바로보기</b></a></td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="6" style="background-color: #F9FAEF"><b>지난『영양관련정보』 바로보기</b></td>
				</tr>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${ param.bbs_board_code == 63 }">
			<c:choose>
				<c:when test="${requestScope.boardSettings.bs_ViewLevel >= g_user_level }">
				<tr>
					<td colspan="6" style="background-color: #F9FAEF">
					<a href='http://www.kamis.co.kr' target='_newddd'><b>'농축산물 가격정보' 확인하기</b></a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="6" style="background-color: #F9FAEF">
					<a href='http://www.kamis.co.kr' target='_newddd'><b>'농축산물 가격정보' 확인하기</b></a>
					</td>
				</tr>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<c:choose>
			<c:when test="${requestScope.boardList.size() > 0 }">
				<c:forEach var="i" begin="0" end="${requestScope.boardList.size()-1 }">
				<tr>			
					<c:if test="${requestScope.boardList[i].bbs_notice == true }"><td><b><font color=blue>공지</font></b></td></c:if>
                    <c:if test="${requestScope.boardList[i].bbs_notice == false }"><td>${requestScope.boardPage.getTotalBoardCnt() - requestScope.boardList[i].board_rownum + 1}</td></c:if>
                    	
					<c:if test="${requestScope.boardSettings.bs_Category == 1 &&   param.bbs_category != '교육'}">			
						<td>${requestScope.boardList[i].bbs_category }</td>
					</c:if>
					<td class="left link">
						<c:choose>
							<c:when test="${requestScope.boardList[i].bbs_del_flag}">
										<b>[ - - 해당글은 삭제된 글입니다. - - ]</b>
							</c:when>
							<c:when test="${(!requestScope.boardList[i].bbs_del_flag && requestScope.boardSettings.bs_ViewLevel >= g_user_level
							               && g_code_big == '103') || g_user_level == 1 || check == 1 }"> 
								
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
					<c:if test="${requestScope.bbs_board_code == 104}">
					<td>${requestScope.boardList[i].bbs_recomm }</td>
					</c:if> 
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">글 또는 검색된 결과가 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>