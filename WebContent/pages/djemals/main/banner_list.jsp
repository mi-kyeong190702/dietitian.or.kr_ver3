<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_search() {
	var srchTy = $("#srchTy").val();
	var srchName = $("#srchName").val();

	location.href="bannerList.do?srchTy=" + srchTy + "&srchName=" + srchName;
}
</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">배너 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">배너 관리</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<div class="area">
				<div class="ib fl">
					<div class="text mt5">
						<strong class="bold cm">${listHelper.totalCount}건</strong>의 데이터가 있습니다.
					</div>
				</div>
				<div class="ib fr">
					<div class="ib fl"><a href="./bannerForm.do" class="btn form">신규등록</a></div>
					<select class="fl select t1 w100 ml5">
						<option>10건</option>
					</select>
				</div>
			</div>
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>검색</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w15p" id="srchTy" name="srchTy">
										<option value="">배너구분</option>
										<c:forEach items="${bannerTy}" var="ty">
										<option value="${ty.key}" <c:if test="${param.srchTy == ty.key }">selected</c:if> >${ty.value}</option>
										</c:forEach>
									</select>
									<input type="text" class="input t1 fl w50p ml5" id="srchName" name="srchName" value="${param.srchName}"/>
									<a href="javascript:f_search();" class="btn form t1 fl ml5">검색</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table t1 text small center mt5">
				<colgroup>
					<col width="60">
					<col width="90">
					<col width="220">
					<col width="80">
					<col width="70">
					<col width="*">
					<col width="100">
					<col width="80">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">배너구분</th>
					<th scope="col" class="bold cm">배너명</th>
					<th scope="col" class="bold cm">미리보기</th>
					<th scope="col" class="bold cm">게시여부</th>
					<th scope="col" class="bold cm">링크주소</th>
					<th scope="col" class="bold cm">등록자</th>
					<th scope="col" class="bold cm">등록일</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="banner">
				<tr>
					<td class="ssmall">${banner.num}</td>
					<td class="left">${bannerTy[banner.banner_type]}</td>
					<td class="left link"><a href="bannerForm.do?idx=${banner.idx}&srchTy=${param.srchTy}&srchName=${param.srchName}">${banner.banner_name}</a></td>
					<td><a href="${banner.banner_img}" class="btn" target="_blank">미리보기</a></td>
					<td class="<c:if test="${banner.use_yn == 'Y'}">cm</c:if><c:if test="${banner.use_yn == 'N'}">cp</c:if>">
						${banner.use_yn}
					</td>
					<td class="left">${banner.link_url}</td>
					<td>${banner.user_name }</td>
					<td class="ssmall">${kdaFunc:formatDay(banner.regi_date)}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="bannerForm.do" class="btn big t1">신규등록</a></li>
				</ul>
			</div>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>
