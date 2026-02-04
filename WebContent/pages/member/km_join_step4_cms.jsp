<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
	function doPrev()
	{
		document.location.href = "/member/km_join_step4.do";
	}

	function doNext()
	{
		if ( check() )
		{	
			var f = document.forms["join"];
			f.action = "/member_join_insert.do";
			f.method = "post";
			f.submit();		
		}
	}
	
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신규</mark>회원가입</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/member/km_join.do">회원가입</a></li>
				<li><a href="/member/km_join.do" class="cm">신규회원 가입</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<h4 class="title bold t2 cm s1 i_b_t2">회원가입 절차</h4><span class="ib mt10 ml10 text small ca">회원가입은 다음과 같은 순서에 따라 진행됩니다.</span>
		</div>
		<ol class="step_join mt20">
			<li class="start"><span class="icon step1"></span><span class="txt">실명확인</span></li>
			<li><span class="icon step2"></span><span class="txt">회원종류 선택</span></li>
			<li><span class="icon step3"></span><span class="txt">회원정보 입력</span></li>
			<li class="on"><span class="icon step4"></span><span class="txt"><strong>입금 및 확인</strong></span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		<div class="box t2 bgs mt40 p20 text">
			<!-- // Contents Start -->
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">입금</mark> 및 확인</h5>
				<form name="join" method="post">
				<input type="hidden" name="code_pay_flag" id="code_pay_flag"  value="15" title="입금형태">		
				
				<%@ include file="/pages/member/inc/deposit_cms.jsp" %>
		
		
				<div class="btn_wrap mt30">
					<ul>
						<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
						<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
					</ul>
				</div>
				</form>
			</div>
		<!-- // Contents End -->		
	</div>
</div>
