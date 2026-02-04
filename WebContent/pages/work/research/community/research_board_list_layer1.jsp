<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="area">
	<div class="fl">
		<h4 class="title s1 i_b_t6"><strong class="bold cm">${boardPage.getTotalBoardCnt()}건</strong>의 데이터가 있습니다.</h4>
	</div>
	<div class="fr">
		<label for="inputid1"><span class="ti">목록수</span></label>
		<select name="inputid1" class="select t2 fl w80" id="inputid1" onchange="selectCnt(this.value);">
			<option value="10" <c:if test="${board_cnt == 10}"><c:out value="selected"/></c:if> >10건</option>
			<option value="20" <c:if test="${board_cnt == 20}"><c:out value="selected"/></c:if> >20건</option>
			<option value="50" <c:if test="${board_cnt == 50}"><c:out value="selected"/></c:if> >50건</option>
		</select>
	</div>
</div>
<div class="box p20 mt5">
	<div class="form">
		<div class="f_wrap">
			<div class="f_field div1">
				<div class="ff_wrap">
					<div class="area">
						<label for="inputid2"><span class="ti">카테고리</span></label>
						<select name="inputid2" class="select t2 fl w150" id="board_search" name="board_search">
							<option value="0" <c:if test="${boardSearch == 0}"><c:out value="selected"/></c:if>>제목</option>
							<option value="1" <c:if test="${boardSearch == 1}"><c:out value="selected"/></c:if>>내용</option>
						</select>
						<label for="inputid3"><span class="ti">검색어</span></label>
						<input type="text" class="input t1 fl w200 ml5" id="board_keyword" name="board_keyword" value="${boardKeyword}"/>
						<a href="javascript:doSearch()" class="btn form t1 fl ml5" type="button">검색<span class="icon search"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<table class="table t1 text s1 ca center mt20">
	<colgroup>
		<%-- <col width="35" /> --%>
		<col width="70" />
		<col width="*" />
		<col width="40" />
		<col width="110" />
		<col width="110" />
		<col width="70" />
	</colgroup>
	<thead>
		<tr>
			<!-- <th scope="col" class="bold cm"><label for="checkbox_all"><span class="ti">전체선택</span></label><input type="checkbox" name="checkbox" id="checkbox_all"></th> -->
			<th scope="col" class="bold cm">번호</th>
			<th scope="col" class="bold cm">제목</th>
			<th scope="col" class="bold cm">첨부</th>
			<th scope="col" class="bold cm">작성자</th>
			<th scope="col" class="bold cm">등록일</th>
			<th scope="col" class="bold cm">조회</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${imptList.size() > 0 }">
			<c:forEach var="i" begin="0" end="${imptList.size()-1 }">
				<tr>
					<td><span class="i_secret">중요글</span> </td>
					<td class="left link">
						<a href="javascript:doSelect(${imptList[i].atc_sno})">
							${imptList[i].atc_sbj}
						</a>						
					</td>
					<td>
						<c:if test="${null ne imptList[i].bbs_file_type && imptList[i].bbs_file_type !=''}">
							<c:set var="str" value="${imptList[i].bbs_file_type}" />	
							<c:if test="${str == 'xlsx' }"><c:set var="str" value="xls"/> </c:if>						
							<span class="i_file ${str}"><span class="ti">${imptList[i].bbs_file_type}</span></span>
						</c:if>						
					</td>
					<td>${imptList[i].atc_wrtr_nm}</td>
					<td>${imptList[i].frst_rgt_dttm}</td>
					<td>${imptList[i].atc_inqr_cnt}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		
		<c:choose>
			<c:when test="${boardList.size() > 0 }">
				<c:forEach var="i" begin="0" end="${boardList.size()-1 }">
				
				<tr>
					<!-- <td><label for="checkbox_10"><span class="ti">선택</span></label><input type="checkbox" name="checkbox" id="checkbox_10"></td> -->
					<td>${boardPage.getTotalBoardCnt() - boardList[i].board_rownum + 1} </td>
					<td class="left link">
						<a href="javascript:doSelect(${boardList[i].atc_sno})">
							${boardList[i].atc_sbj}
						</a>						
						<c:if test="${boardList[i].bbs_new == 'Y' }">
							<span class="i_new"><span class="ti">NEW</span></span>
						</c:if>						
					</td>
					<td>
						<c:if test="${null ne boardList[i].bbs_file_type && boardList[i].bbs_file_type !=''}">
							<c:set var="str" value="${boardList[i].bbs_file_type}" />	
							<c:if test="${str == 'xlsx' }"><c:set var="str" value="xls"/> </c:if>						
							<span class="i_file ${str}"><span class="ti">${boardList[i].bbs_file_type}</span></span>
						</c:if>						
					</td>
					<td>${boardList[i].atc_wrtr_nm}</td>
					<td>${boardList[i].frst_rgt_dttm}</td>
					<td>${boardList[i].atc_inqr_cnt}</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">글 또는 검색된 결과가 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<c:if test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
<div class="btn_wrap mt20">
	<ul class="fr">
		
			<li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
		
	</ul>
</div>
</c:if>
