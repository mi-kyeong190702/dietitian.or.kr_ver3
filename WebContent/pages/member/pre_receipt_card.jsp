<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기존회원 </mark>재가입/입금 확인</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/member/km_join.do">회원가입</a></li>
				<li><a href="/work/member/km_deposit.do" class="cm">기존회원 재가입/입금 확인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<h4 class="title bold t2 cm s1 i_b_t2 mt20 mb20">영양사 카드결제하기</h4>
		
		<!--  // Contents Start -->
		<c:import url="/pages/member/inc/pre_receipt_card.jsp">
			<c:param name="menu" value="member"></c:param>
		</c:import>
		
		<!-- // Contents End -->
	</div>
</div>