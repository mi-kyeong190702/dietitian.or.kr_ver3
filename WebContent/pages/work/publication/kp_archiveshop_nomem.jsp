<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function f_agree() {
	if( !C_isCheck("accept") ) {
		alert("이용약관에 동의하셔야 구매가 가능합니다.");
		return;
	}	
	location.href="/kp_archiveshop_pay.do?board_form=list";
	
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육자료</mark>(판매품)</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">KDA 출판</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_archiveshop" class="cm">교육자료</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<h4 class="title bold cm t2 s1 i_b_t2 mt20">로그인을 하지 않으셨습니다.</h4><br />
		<p class="text middle cb s1 mt10">
			<mark class="big cm">회원가</mark>의 혜택을 받기 위해서는 로그인이 필요합니다.<br />
			지금 로그인 후 바로 구매하시겠습니까?
		</p>	
			
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1">이용약관</h5>
				<div class="box t1 r5 mt10 p10">
					<div class="area h170 scroll text small">
							<table width="580" height="200" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<b>1. 개인정보의 수집&middot;이용 목적</b><br>
협회는 다음의 목적을 위하여 개인정보를 수집하고자 합니다. 수집한 개인정보는 다음의 목적이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
- 개인 관리 및 서비스 제공<br>
&nbsp;&nbsp;서비스 제공에 따른 통계·분석, 물품배송, 결제·정산<br>
- 민원사무 처리<br>
&nbsp;&nbsp;교육자료 신청확인, 관련서류 발행, 입금 확인, 물품배송 확인<br><br>
<b>2. 수집하려는 개인정보의 항목</b><br>
협회는 양질의 서비스 제공을 위하여 다음의 개인정보를 수집하고 있습니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
- 필수항목 : 수령지 정보(수령자 이름, 주소, 전화번호, 휴대전화)<br>
- 선택항목 : 주문회원정보(이름, 전화번호, 휴대전화, 이메일), <br>            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부가정보(필요서류, 기타주문사항)<br>
- 수집방법 : 홈페이지, 서면양식, 팩스, 전화, 이메일<br>
- 인터넷 서비스 이용과정에서 자동으로 생성·수집되는 개인정보항목이 수집될<br>
&nbsp;&nbsp;수 있습니다. (접속로그(일시, IP 주소, 웹브라우저 정보 등), 서비스 이용기록,<br>
&nbsp;&nbsp;방문기록)<br><br>
<b>3. 개인정보의 보유 및 이용기간</b><br>
- 교육자료 배송 확인을 위한 구매 품목 및 수령지 정보(성명, 주소, 연락처<br>
&nbsp;&nbsp;(핸드폰번호))는 1년간 보유 후 즉시 파기합니다. <br><br>
<b>4. 개인정보처리 위탁</b><br> 
협회는 원활한 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
 1) 위탁받는 자(수탁자) : 동부CNI(주)<br>
&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 홈페이지 운영 위탁<br>
 2) 위탁받는 자(수탁자) : KG로지스, 우체국 택배<br>
&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 배송정보 위탁<br><br>
<b>5. 동의 거부권 등에 대한 고지</b><br>
개인정보 제공은 교육자료 구매를 위해 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 교육자료 구매가 제한될 수 있습니다.<br>
									</td>
								</tr>
								</table>
					</div>
					<div class="line bt dot mt10 p8 pb0 text ssmall left">
					<form name="frmAgree" method="post" action="ke_receipt_application.do">
						<input type="checkbox" class="mr5" name="accept" id="accept" value="Y" />
						<label for="accept" class="mr20">개인정보 수집 및 이용안내에 동의 합니다.</label>
					</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="/login/kl_login_nor.do" class="btn t1 big">회원</a></li>
				<li><a href="javascript:f_agree();" class="btn t2 big">비회원</a></li>
			</ul>
		</div>
	</div>
</div>