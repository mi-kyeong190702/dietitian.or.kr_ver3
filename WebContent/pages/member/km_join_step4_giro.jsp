<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

	
	function doPrev()
	{
		document.location.href = "/member/km_join_step4.do";
	}

	function doNext()
	{
		var f = document.forms["join"];
		f.action = "/member/km_join_step5_bran.do";
		f.submit();		
	}
	
	function doOpenGiroPopup()
	{
		var result = window.showModalDialog('/pages/member/km_join_giro.jsp','window','dialogwidth:800px;dialogheight:500px;scroll:no;');
		if ( result )
			doNext();
	}
		
</script>

<form name="join">
<input type="text" name="code_pay_flag" id="code_pay_flag" value="60" title="입금형태_지로">
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
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">입금</mark> 및 확인</h5>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">지로입금 유의사항</mark></h6>
					<ul class="p10 text ssmall">
						<li>현재 금융결제원에서는 지로를 통한 입금을 받지 않으려는 추세이므로 가능한 무통장 입금 <mark class="bold">(인터넷뱅킹, 텔레뱅킹, 계좌이체포함)</mark> 으로 결제해 주시기 바랍니다.</li>
						<li>특히 입금 확인 후 회원 인증시까지 최소 <mark class="bold">2주정도</mark>가 소요되니 유의해 주시기 바랍니다.</li>
					</ul>
				</div>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">방법1</mark></h6>
					<ul class="p10 text ssmall">
						<li>인터넷지로 사이트를 이용해서 납부</li>
						<li>인터넷지로 납부 : www.giro.or.kr 접속 -> 요청절차에 따라 지로 납부</li>
					</ul>
					<div class="btn_wrap mb10">
						<a href="http://www.giro.or.kr" target="_blank" class="btn t1 middle">인터넷지로 사이트 바로가기</a>
					</div>
				</div>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">방법2</mark></h6>
					<ul class="p10 text ssmall">
						<li>지로용지로 납부 : 시중은행 99번 창구에 비치 되어있는 용지 또는 협회에 신청하여 납부</li>
						<li>지로번호 : 7605071 </li>
					</ul>
					<div class="btn_wrap mb10">
						<!-- a href="/member/km_join_giro.do" class="btn middle wide">지로용지신청</a-->
						<a href="#" onclick="javascript:doOpenGiroPopup();" class="btn middle wide">지로용지신청</a>
					</div>
				</div>
			</div>
		</div>
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
				<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
			</ul>
		</div>
	</div>
</div>
</form>
