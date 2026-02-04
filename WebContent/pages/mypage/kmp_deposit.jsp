<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function f_openBank() {
	window.open("/member/popup/km_deposit_receipt.do", "bank",  "width=600,height=800");
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기존회원</mark> 재가입/입금확인</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/kmp_deposit.do" class="cm">기존회원 재가입/입금확인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<%@include file="../common.jsp"%>
		<h4 class="title bold t2 cm s1 i_b_t2 mt50">기존회원 재가입 및 입금 확인</h4>
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<div class="box t1 r5 p10">
					<div class="area h300 text small">
						<p>본 협회의 회원가입 기간은 1년입니다.<br />
						회원 유효기간이 만료되신 분은 회비를 납부하시어 회원 재가입하여 주시기 바랍니다.</p><br />
						
						<p><mark class="bold cm">무통장 입금(일시납만 가능)</mark>을 원하는 경우는<br />
						아래의 <mark class="bold cm">소속시도영양사회 연락처 바로가기</mark>에서 해당 소속지부 입금처 확인 후 무통장 입금해 주시기 바랍니다.<br />
						입금 후 <mark class="bold cm">무통장, 지로입금</mark>을 선택하여 입금 확인을 요청하시면 24시간 내에 회원으로 인증됩니다.<br />
						(단, 토,일요일 및 공휴일은 제외)</p><br />
						
						<mark class="bold cm">CMS 입금(분납, 일시납)</mark>을 원하는 경우는 <mark class="bold cm">CMS 입금</mark>을 선택하여 CMS 출금이체 신청서를 작성해 주시기 바랍니다.<br />
						CMS 출금 등록은 작성 이후 3일이 소요되며, 신청하신 해당 출금일에 출금이 완료된 후 회원으로 인증됩니다.<br />
						(단, 토,일요일 및 공휴일은 제외)</p><br />
						
						<p>출금 이후에도 로그인이 안될 경우는 소속시도영양사회로 연락주시기 바랍니다.</p>
						
						<a href="/member/km_account.do" target="_self" class="btn t4 middle mt10">소속시도영양사회 연락처 바로가기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="text s1 mt30"></div>
		<div class="mt30 center">
			<a href="javascript:f_openBank()" class="btn t1 big">무통장, 지로입금</a>
			<!-- 2022.04.01 주석처리 -->
<!-- 			<a href="/mypage/pre_receipt_card.do" class="btn t2 big">영양사카드 결제하기</a> 	 -->
			
<!-- 			2020.06.15 박이랑 요청으로 cms입금 타site로 연결함  -->
<!-- 			<a href="/mypage/kmp_deposit_cms.do" class="btn t3 big">CMS입금</a> -->
			<a href="https://tnbsoft.co.kr/cert/client/application/user/dietitian" target="_blank" class="btn t3 big">CMS입금</a>
			
		</div>
	</div>
</div>
	
