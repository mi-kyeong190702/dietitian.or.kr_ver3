<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.MEMBER_JOIN"%>

<%
	MEMBER_JOIN member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);	
%>
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
			<li><span class="icon step4"></span><span class="txt">입금 및 확인</span></li>
			<li class="on"><span class="icon step5"></span><span class="txt"><strong>가입완료</strong></span></li>
		</ol>
		<div class="box t2 bgs mt40 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">가입</mark>완료</h5>
				<div class="box t1 r5 mt10 p10">
					<p class="p10 ssmall">
						<mark class="bold">소속 시도영양사회로 CMS 신청서를 팩스 송부해 주시면 회비 재가입이 완료 되십니다.</mark><br />
						회비 출금 후 약 24시간 후부터 홈페이지 상의 회원 전용공간을 이용하실 수 있습니다.
					</p>
					<table class="table t2 text ssmall ca center mt10">
						<colgroup>
							<col width="150">
							<col width="*">
						</colgroup>
						<thead>
						<tr>
							<th scope="col" class="bold cm">지역</th>
							<th scope="col" class="bold cm">전화번호/FAX</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td scope="row">서울</td>
							<td>TEL : 02)3289-7200 / FAX : 02)3289-7201</td>
						</tr>
						<tr>
							<td scope="row">부산</td>
							<td>TEL : 051)634-7640 / FAX : 051)631-6136</td>
						</tr>
						<tr>
							<td scope="row">인천</td>
							<td>TEL : 032)435-5990 / FAX : 032)432-5199</td>
						</tr>
						<tr>
							<td scope="row">경기</td>
							<td>TEL : 031)468-9417 / FAX : 031)448-9890</td>
						</tr>
						<tr>
							<td scope="row">강원</td>
							<td>TEL : 033)251-7576 / FAX : 033)251-7579</td>
						</tr>
						<tr>
							<td scope="row">충북</td>
							<td>TEL : 043)268-4798 / FAX : 043)266-0166</td>
						</tr>
						<tr>
							<td scope="row">대전/충남/세종</td>
							<td>TEL : 042)252-4346 / FAX : 042)252-9110</td>
						</tr>
						<tr>
							<td scope="row">전북</td>
							<td>TEL : 063)272-0175 / FAX : 063)255-1811</td>
						</tr>
						<tr>
							<td scope="row">광주전남</td>
							<td>TEL : 062)364-6773 / FAX : 062)364-6772</td>
						</tr>
						<tr>
							<td scope="row">대구경북</td>
							<td>TEL : 053)563-6066 / FAX : 053)563-6466</td>
						</tr>
						<tr>
							<td scope="row">경남</td>
							<td>TEL : 055)268-6846 / FAX : 055)268-6847</td>
						</tr>
						<tr>
							<td scope="row">울산</td>
							<td>TEL : 052)258-6069 / FAX : 052)275-2823</td>
						</tr>
						<tr>
							<td scope="row">제주</td>
							<td>TEL : 064)721-9062 / FAX : 064)721-9062</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="/" class="btn big t1">가입완료</a></li>
			</ul>
		</div>
	</div>
</div>
