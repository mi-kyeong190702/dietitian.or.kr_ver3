<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">회원</mark>혜택</h3>
		</div>
		<div class="sp_navi">
<ul>
	<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
	<li><a href="/member/km_join.do" >회원가입</a></li>
    <li><a href="/member/km_condition.do" >회원가입안내</a></li>
	<li><a href="/member/km_benefit.do" class="cm">회원혜택</a></li>
</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<%@ include file="../inc/member_benefit.jsp" %>
	</div>
</div>
