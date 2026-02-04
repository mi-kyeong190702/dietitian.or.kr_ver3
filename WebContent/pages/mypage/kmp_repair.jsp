<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">보수</mark>교육</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/kmp_situation.do">MY 교육정보</a></li>
				<li><a href="/kmp_repair.do" class="cm">보수교육</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="box p20">
			<div class="title s1 i_b_t6">
				보수교육
			</div>
		</div>
		
		<table class="table t1 text s1 ca center mt20">
	
			<colgroup>
				<col width="200">
				<col width="200">
				<col width="*">
				<col width="70">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">수강년도</th>
				<th scope="col" class="bold cm">이수시간</th>
				<th scope="col" class="bold cm">결과</th>
				<th scope="col" class="bold cm">출력</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${requestScope.myList.size() >0 }">
					<c:forEach var="i" begin="0" end="${requestScope.myList.size()-1 }">
						<tr>
							<td>${requestScope.myList[i].yyyy}</td>
							<td>${requestScope.myList[i].ke_isutime}</td>
							<td><c:choose>
									<c:when test="${requestScope.myList[i].ke_finish_yn == 'Y'}">이수</c:when>
									<c:otherwise>미이수</c:otherwise>
								</c:choose>
							</td>
							<td>
							<c:choose>
								<c:when test="${requestScope.myList[i].ke_finish_yn == 'Y'}"><a href="http://www.kdaedu.or.kr" class="btn">출력</a></c:when>
								<c:otherwise>${requestScope.myList[i].isusum}</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">보수 교육 목록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
		
		<div class="area center mb50">
			<p class="text middle bold ca s1 mt50 ml10">2015년 이후 수료증 출력은 KDA 영양사 법정교육센터에서 가능합니다.</p>
			<a class="btn t1 bbig mt20" href="http://dbms.kdaedu.or.kr/web/curriculum/confirm/list" title="새창으로 이동" target="_blank">전년도 교육 조회 바로가기</a>
		</div>
	</div>
</div>
