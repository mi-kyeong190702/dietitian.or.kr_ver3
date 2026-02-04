<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ page import="kda.utils.ParamUtils" %>
<style type="text/css">
	strong, b {font-weight:bold;}
</style>
<% %>

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
				<c:forEach var="i" begin="0" end="5">
					<c:if test="${requestScope.boardList[i].board_rownum < 10 }">
					<li class="fl w33p">
						<div class="p10" style="height:279px;">
							<div class="box bw2 bga p5">
								<img src="${requestScope.boardList[i].bbs_file_url}" style="width:100%; height:200px;" alt="${requestScope.boardList[i].bbs_file_name}" />
							</div>
							<ul class="area mt5">
								<li class="link">
									<a href="javascript:doSelect(${requestScope.boardList[i].bbs_idx}, ${requestScope.boardList[i].bbs_board_code})" class="bold cm">${requestScope.boardList[i].bbs_subject}</a>
								</li>								
							</ul>
						</div>
					</li>
					</c:if>
				</c:forEach>
			</c:when>
		</c:choose>
	</ul>
</div>

<c:set var="chkKind" value="${bbs_board_code== 22 ||  bbs_board_code == 64 }" />

<table class="table t1 text s1 ca center mt20">
  <colgroup>
    <col width="70"><col width="*"><col width="110"><col width="110"><col width="70">
  </colgroup>
  <thead>
    <tr>
      <th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
      <c:when test="${not empty requestScope.boardList}">
        <c:forEach var="item" items="${requestScope.boardList}">
          <tr>
            <td>
              <c:choose>
                <c:when test="${item.bbs_notice}">
                  <b><font color="blue">공지</font></b>
                </c:when>
                <c:otherwise>
                  ${requestScope.boardPage.totalBoardCnt - item.board_rownum + 1}
                </c:otherwise>
              </c:choose>
            </td>
            <!-- 카테고리(필요시) 생략 -->
            <td class="left link">
              <a href="javascript:doSelect(${item.bbs_idx}, ${item.bbs_board_code})">
                                            ${item.bbs_subject}
              <c:if test="${item.bbs_comments_count > 0 }"><b>(${item.bbs_comments_count})</b></c:if>                               
              <c:if test="${item.bbs_new == 'Y' }"><span class="i_new"><span class="ti">NEW</span></span></c:if>
              </a> 
            </td>
            <c:set var="bbs_name" value="${item.bbs_name}" />
            <% 
            String bbs_name = (String) pageContext.getAttribute("bbs_name");
            String input = bbs_name;
            if (!bbs_name.equals("관리자")){
            	if (input == null || input.length() <= 2){
            		//관리자일 경우는 그냥 관리자 표시
            	}else{
	                int length = input.length();
	                int maskLength = length / 2;
	                int start = (length - maskLength) / 2;
	                StringBuilder sb = new StringBuilder();
	                sb.append(input, 0, start);
	                for (int i = 0; i < maskLength; i++) sb.append('O');
	                sb.append(input.substring(start + maskLength));
	                
	                bbs_name = sb.toString(); 
            	}
            } 
            %>
            <!-- ★ 작성자 이름 마스킹 적용 ★ --> 
            <td><%=bbs_name %>
            </td>
            <td>${item.bbs_reg_date_dt}</td>
            <td>${item.bbs_view}</td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr><td colspan="5">글 또는 검색된 결과가 존재하지 않습니다.</td></tr>
      </c:otherwise>
    </c:choose>
  </tbody>
</table>