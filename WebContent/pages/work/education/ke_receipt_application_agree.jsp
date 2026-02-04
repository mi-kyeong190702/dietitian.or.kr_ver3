<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function send() {
	if( !$("input:checkbox[id='accept']").is(":checked") ) {
		alert("개인정보활용동안의에 동의 하셔야 합니다");
		$("#accept").focus();
		return;	
	}
	
	document.frmAgree.submit()
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">등</mark>록</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_receipt.do" class="cm">등록</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<%@include file="inc/receipt.jsp" %>
		
		<!-- // Contents Start -->
		
		<h4 class="title bold cm t2 s1 i_b_t2 mt20">학술대회 등록신청</h4><br />
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">개인정보</mark> 수집 및 이용안내</h5>
				<div class="box t1 r5 mt10 p10">
					<div class="area h170 scroll text small">
							<table width="580" height="200" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<b>1. 개인정보의 수집&middot;이용 목적</b><br>
										협회는 전국영양사 학술대회 등록 및 취소 시 필요한 개인정보를 수집하고자 합니다.<br>
										수집한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는<br>별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
										- 학술대회 신청 및 통계·분석<br>
										&nbsp;&nbsp;학술대회 신청 및 통계·분석을 위한 업무<br>
										- 학술대회 취소 및 환불<br>
										&nbsp;&nbsp;학술대회 등록 취소 및 환불에 대한 위한 업무<br>
										- 민원사무 처리<br>
										&nbsp;&nbsp;학술대회 신청확인, 입금 및 환불확인, 자료집 발송, 관련서류 발송<br>
										- 학술대회 참석 등록 및 확인<br>
										&nbsp;&nbsp;학술대회 참석 등록 및 확인을 위한 업무<br><br>
										<b>2. 수집하려는 개인정보의 항목</b><br>
										- 필수항목 : 성명, 생년월일, 영양사 면허번호, 근무처 명, 근무처주소, 근무처전화번호, <br>
										&nbsp;&nbsp;연락처(휴대폰), E-mail, 면허관련정보(근무처분류, 운영형태 등)<br>
										- 수집방법 : 홈페이지, 서면양식, 이메일<br>
										- 인터넷 서비스 이용과정에서 자동으로 생성·수집되는 개인정보항목이 수집될 수 있습니다.<br>
										&nbsp;&nbsp;(접속로그(일시, IP 주소, 웹브라우저 정보 등), 서비스 이용기록, 방문기록)<br><br>
										<b>3. 개인정보의 보유 및 이용기간</b><br>
										수집된 개인정보는 학술대회 종료 후 3년간 보유 후 즉시 파기합니다.<br><br>
										<b>4. 개인정보처리 위탁</b><br> 
										협회는 원활한 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
										 1) 위탁받는 자(수탁자) : DB Inc.(주)<br>
										&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 홈페이지 운영 위탁<br>
										 2) 위탁받는 자(수탁자) : 로젠 택배, 우체국 택배<br>
										&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 배송정보 위탁<br>
										 3) 위탁받는 자(수탁자) : 유랩스<br>
										&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 학술대회 오프라인 등록정보 위탁<br>
										 4) 위탁받는 자(수탁자) : 온오프스트림<br>
										&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 학술대회 온라인 등록정보 위탁<br><br>
										<b>5. 동의 거부 시 불이익</b><br>
										본 개인정보 수집 및 이용 안내에 동의하지 않으시는 경우, 동의를 거부할 수 있으며,<br>이 경우 학술대회 신청 및 취소가 제한될 수 있습니다.<br>
									</td>
								</tr>
								</table>
					</div>
					<div class="line bt dot mt10 p8 pb0 text ssmall left">
					<form name="frmAgree" method="post" action="ke_receipt_application.do">
						<input type="checkbox" class="mr5" name="accept" id="accept" value="y" />
						<label for="accept" class="mr20">개인정보 수집 및 이용안내에 동의 합니다.</label>
					</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="javascript:send();" class="btn t1 big">동의</a></li>
				<li><a href="javascript:window.history.back();" class="btn t2 big">동의하지 않습니다.</a></li>
			</ul>
		</div>
					
		<!-- // Contents End -->
	</div>
</div>

