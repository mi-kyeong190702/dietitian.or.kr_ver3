<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>

<%@include file="/pages/common.jsp"%>

<script>
function f_search() {
	var searchKind = $("#searchKind").val();
	var searchWord = $("#searchWord").val();
	
	location.href = "?searchKind=" + searchKind + "&searchWord=" + searchWord;
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">채용</mark>정보</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="/work/news/kn_careers.do">채용정보</a></li> 
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!-- // 본문 시작 -->
		<div class="box p20">
			<div class="form">
				<div class="f_wrap">
					<div class="f_field div1">
						<div class="title s1 i_b_t6">
							먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있습니다.
						</div>
						<div class="ff_wrap mt10">
							<div class="area">
								<select class="select t2 fl w150" id="searchKind" name="searchKind">
									
									<option value="1" <c:if test="${param.searchKind == '1'}">selected</c:if>>회사/기관명</option>
									<option value="2" <c:if test="${param.searchKind == '2'}">selected</c:if>>모집분야</option>
									<option value="3" <c:if test="${param.searchKind == '3'}">selected</c:if>>근무지역</option>
								</select>
								<input type="text" class="input t1 fl w200 ml5" id="searchWord"  name="searchKind" value="${param.searchWord}"/>
								<a href="javascript:f_search()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="box bga text ssmall mt5 p10">
		
			* <mark class="bold cr">연봉 2,800만원 미만의 채용공고</mark>는 등록할 수 없으며, <mark class="bold">영양사 관련 이외의 업무는 사전 통보 없이 삭제</mark>될 수 있습니다.
		</div>
		
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="60">
				<col width="*">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="60">
				<col width="100">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">번호</th>
				<th scope="col" class="bold cm">회사/기관명</th>
				<th scope="col" class="bold cm">모집분야</th>
				<th scope="col" class="bold cm">근무지역</th>
				<th scope="col" class="bold cm">모집기한</th>
				<th scope="col" class="bold cm">조회</th>
				<th scope="col" class="bold cm">작성일자</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${listHelper.list}" var="employ">
			<tr>
				<td>${employ.num2}</td>
				
				<td class="left link">
				<c:choose>
					<c:when test="${g_userid != ''}">
					
						<a href="kn_careers_view.do?idx=${employ.eindex}&rnum=${employ.num2}&curPage=${listHelper.curPage}&searchKind=${param.searchKind}&searchWord=${param.searchWord}">${employ.ecname}</a>
					
					</c:when>
					<c:otherwise>
						${employ.ecname}
					</c:otherwise>
				</c:choose>
				</td>
				
				<td>${employ.ecpart}</td>
				<td>${employ.etlocation}</td>
				<td>${kdaFunc:formatDay(employ.eclimitdate)}</td>
				<td>${employ.eview}</td>
				<td>${kdaFunc:formatDay(employ.eDate)}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="kn_careers_form.do" class="btn big t1">글쓰기</a></li>
			</ul>
		</div>
		
		<kda:paging listHelper="${listHelper}"/>
		
		<!-- // 본문 끝 -->
	</div>
</div>