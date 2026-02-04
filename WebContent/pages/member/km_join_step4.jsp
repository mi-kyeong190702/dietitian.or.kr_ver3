<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.MEMBER_JOIN"%>

<%
	MEMBER_JOIN member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
%>

<form name="join">
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
		<p class="text cb s1"><mark class="text big cb">영양사와 함께하는 <mark class="text big cm">대한영양사협회</mark>에 오신 것을 환영합니다.</mark><br />
		건강증진 및 질병치료를 목적으로 연구개발하고 전문적인 영양서비스를 제공하는 영양전문인 단체 대한영양사협회에 오신 것을 환영합니다. 대한영양사협회 회원으로 가입하시면 다양한 회원혜택을 경험하실 수 있습니다.</p>
		<div class="area mt50">
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
					<h6 class="title s1 i_b_t3"><mark class="bold">정회원, 특별회원, 학생회원</mark> <span class="ssmall">(입금은 어떤 형태로 하실 건가요?)</span></h6>
					<ul class="mt10 line bt bcm">
						<li class="pr p30 ca">
							<span>인터넷뱅킹, 텔레뱅킹, 계좌이체 포함</span>
							<span class="pa r20 t20"><a href="/member/km_join_step5_bran.do?code_pay_flag=10" class="btn t1 big">무통장 입금</a></span>
						</li>
						<li class="pr p30 ca line bt dot">
							<span>회원 인증시까지 최소 1주정도가 소요됨.</span>
							<span class="pa r20 t20"><a href="/member/km_join_step4_giro.do?code_pay_flag=60" class="btn t1 big">지로 입금</a></span>
						</li>
						<li class="pr p30 ca line bt dot">
							<span>계좌 출금 시 회원 인증됨.</span>
							<span class="pa r20 t20"><a href="/member/km_join_step4_cms.do?code_pay_flag=15" class="btn t1 big">CMS 입금</a></span>
						</li>
					</ul>	
				</div>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">평생회원</mark> <span class="ssmall">(평생회원은 중앙회에서만 관리하고 있으므로 전화해주세요.)</span></h6>
					<ul class="mt10 line bt bcm">
						<li class="pr p30 ca">
							<span><strong class="bold cb">문의처</strong> : 02-823-5680 / 내선 311, 312<br />
							<strong class="bold cb">납부방법</strong> : 당해년도에 한해 3회까지 분납 가능</span>
							<span class="pa r20 t35"><a href="/member/km_join_step5_bran.do?code_pay_flag=10" class="btn t2 big">다음으로</a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</form>