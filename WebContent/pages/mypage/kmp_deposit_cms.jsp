<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
function f_sendIt(){
	if( check() ) {
		document.join.action = "kmp_deposit_cms_action.do";
		document.join.submit();
	}
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기존회원 </mark>재가입/입금 확인</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/member/km_join.do">마이페이지</a></li>
				<li><a href="/work/member/km_deposit.do" class="cm">기존회원 재가입/입금 확인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<h4 class="title bold t2 cm s1 i_b_t2 mt50">CMS입금</h4>
		<div class="box t2 bgs mt20 p20 text">
			<!--  // Contents Start -->
			<form name="join" method="post">
				<input type="hidden" name="code_pay_flag" id="code_pay_flag"  value="15" />		
				<input type="hidden" name="code_pers" id="code_pers"  value="${memberJoin.code_pers}" />
				<input type="hidden" name="code_member" id="code_member" value="${memberJoin.code_member}" />
				<%@ include file="/pages/member/inc/deposit_cms.jsp" %>
			</form>
				
			<div class="btn_wrap mt30">
				<a href="javascript:f_sendIt()" class="btn big t1">신청</a>
			</div>

		</div>	
		<!-- // Contents End -->
	</div>
</div>
