<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>

<%@include file="/pages/common.jsp"%>

<script type="text/javascript">
function f_Search() {
	if($("#board_keyword").val()  == "" ) {
		alert("검색어를 입력하여 주십시요");
		return;
	}
	
	var query = "&board_search=" + $("#board_search").val()
	     	   + "&board_keyword=" + $("#board_keyword").val();
	location.href="?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}"+ query ;
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark> 검색</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
				<li><a href="/work/publication/kp_m_list.do" class="cm">국민영양 검색</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
		<!-- //  Content start -->
		<div class="tab_2 div2 mb30">
			<ul>
				<li><a href="/work/publication/kp_m_list.do">목차/e-Book 보기</a></li>
				<li><a href="/publication/paper_board/kp_m_search.do?bbs_board_code=13&g_userid=${chk_encoded_userid}" class="on">내용검색</a></li>
			</ul>
		</div>

		<div class="box p20">
			<div class="form">
				<div class="f_wrap">
					<div class="f_field div1">
						<div class="title s1">
							<mark class="exbold cm mr10">SEARCH</mark>먼저 검색을하고자 하는 세부 항목(발행년월, 칼럼명, 제목, 원고자)을 선택한 후 검색어를 입력하세요.
						</div>
						<div class="ff_wrap mt10">
							<div class="area">
								<select class="select t2 fl w150" id="board_search" name="board_search">
									<option value="4">발행년월</option>
									<option value="2">칼럼명</option>
									<option value="0">제목</option>
									<option value="3">원고자</option>
								</select>
								<input type="text" class="input t1 fl w200 ml5" id="board_keyword" value="${param.board_keyword}" />
								<a href="javascript:f_Search()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="70">
				<col width="100">
				<col width="100">
				<col width="*">
				<col width="90">
				<col width="80">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">번호</th>
				<th scope="col" class="bold cm">발행년월</th>
				<th scope="col" class="bold cm">칼럼명</th>
				<th scope="col" class="bold cm">제목</th>
				<th scope="col" class="bold cm">원고자</th>
				<th scope="col" class="bold cm">파일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${boardList}" var="board">
			<tr>
				<td>${board.board_rownum}</td>
				<td>${board.bbs_option}</td>
				<td>${board.bbs_category}</td>
				<td class="left link">
				
				<c:choose>
					<c:when test="${!board.bbs_del_flag && boardSettings.bs_ViewLevel >= g_user_level}">
						<a href="./${kind}_view.do?bbs_board_code=${param.bbs_board_code}&g_userid=${chk_encoded_userid}&bbs_idx=${board.bbs_idx}&curPage=${param.curPage}">${board.bbs_subject}</a>
					 	<c:if test="${board.bbs_new == 'Y' }"><span class="i_new"><span class="ti">NEW</span></span></c:if>
					</c:when>
					<c:otherwise>
						${board.bbs_subject}
						<c:if test="${board.bbs_new == 'Y' }"><span class="i_new"><span class="ti">NEW</span></span></c:if>
					</c:otherwise>
				</c:choose>			
							
					
				</td>
				<td>${board.bbs_name}</td>
				<td>
				<c:choose>
					<c:when test="${!board.bbs_del_flag && boardSettings.bs_ViewLevel >= g_user_level}">
					 	<a href="/board_file_download.do?bbs_board_code=${param.bbs_board_code}&bbs_idx=${board.bbs_idx}" title="본 원고 인용 시 반드시 출처 명시해주시기 바랍니다."><span class="i_file big ${board.bbs_file_type} mr10"></span></a>
					 	<c:if test="${board.bbs_file_type2 != ''}">
					 	<a href="/board_file_download.do?bbs_board_code=${param.bbs_board_code}&bbs_idx=${board.bbs_idx}&num=2" title="본 원고 인용 시 반드시 출처 명시해주시기 바랍니다."><span class="i_file big ${board.bbs_file_type2} mr10"></span></a>
					 	</c:if>
					 	</td>
					 	<!-- <a href="/board_file_download.do?bbs_board_code=${param.bbs_board_code}&bbs_idx=${board.bbs_idx}" class="btn">다운로드</a></td> -->
					 	
					</c:when>
					<c:otherwise>
						<a href="javascript:alert('다운로드 권한이 없습니다')" title="본 원고 인용 시 반드시 출처 명시해주시기 바랍니다."><span class="i_file big ${board.bbs_file_type} mr10"></span></a>
					 	<c:if test="${board.bbs_file_type2 != ''}">
					 	<a href="javascript:alert('다운로드 권한이 없습니다')" title="본 원고 인용 시 반드시 출처 명시해주시기 바랍니다."><span class="i_file big ${board.bbs_file_type2} mr10"></span></a>
					 	</c:if>
					 	</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<c:set var="bs_admin" value="${fn:split(boardSettings.bs_admin,',') }" />
		<c:set var="check" value="0"/>
		<c:if test="${g_isLogin}"> 
		<c:forEach var="list" items="${bs_admin }">			
			<c:if test="${list==g_userid }">
				<c:set var="check" value="1"/>				
			</c:if>
		</c:forEach>
		</c:if>
		<c:if test="${g_isLogin and (g_user_level <= boardSettings.bs_WriteLevel || check==1)}">
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="${kind}_form.do?bbs_board_code=${bbs_board_code}&g_userid=${chk_encoded_userid}" class="btn big t1">글쓰기</a></li>
			</ul>
		</div>
		</c:if>
		
	 	<kda:paging listHelper="${listHelper}"/>	
	 <!-- // Contents End -->
	</div>
</div>
