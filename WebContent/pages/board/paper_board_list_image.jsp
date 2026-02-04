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

 
<div class="post-list">
  <c:forEach var="item" items="${requestScope.boardList}">
    <a href="javascript:doSelect(${item.bbs_idx}, ${item.bbs_board_code})">
    <div class="post-item">
      <!-- 썸네일 -->
      <div class="thumb">
        <c:choose>
          <c:when test="${not empty item.bbs_file_url}">
            <img src="${item.bbs_file_url}" alt="썸네일">
          </c:when>
          <c:otherwise>
             <img src="/images/main/no_img.png"> 
          </c:otherwise>
        </c:choose>
      </div>

      <!-- 텍스트 정보 -->
      <div class="info">
        <div class="meta-top">
        <c:if test="${item.bbs_notice == true }">
            <span class="issue">ISSUE</span>    
        </c:if>
        <c:if test="${item.bbs_notice == false }">
            <span class="no">NO. ${requestScope.boardPage.getTotalBoardCnt() - item.board_rownum + 1}</span>
        </c:if>
          
        </div>
        <div class="title_image">${item.bbs_subject}</div>
        <div class="category">${item.bbs_category}</div>
        <div class="meta-bottom">
          <span class="date">${item.bbs_reg_date_dt}</span>
          <span class="views">${item.bbs_view}</span>
        </div>
      </div>
    </div>
    </a>
  </c:forEach>
</div>
<style>

.post-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 10px 0;
}

.post-item {
  display: flex;
  gap: 15px;
  border-bottom: 1px solid #ddd;
  padding-bottom: 15px;
}

.thumb {
  width: 140px;
  height: 100px;
  background: #f5f5f5;
  border: 1px solid ;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 14px;
  text-align: center;
}

.thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 4px;
  flex: 1;
}

.meta-top .no {
  font-size: 12px; 
}

.title_image {
  font-weight: bold;
  font-size: 16px;
  line-height: 1.2;         /* 한 줄 높이를 지정 */
  height: 1.2em;            /* line-height × 1줄 */
  max-height: 1.2em;        /* 혹시 몰라 중복 지정 */
  overflow: hidden;

  /* multiline-ellipsis 설정 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
}

.category { 
  display: inline-block;
  padding: 2px 4px;
  font-size: 14px;
}

.meta-bottom {
  display: flex;
  gap: 12px;
  font-size: 12px;
  margin-top: 4px;
}

.meta-bottom .date,
.meta-bottom .views { 
  padding: 2px 4px;
}

a {
  color: inherit;
  text-decoration: none;
}

a:hover {
  color: inherit;
  text-decoration: none;
}
.issue {
  font-weight: bold;
  color: #d9534f; /* 붉은색 강조 */
  font-size: 1.2em;
}
</style>