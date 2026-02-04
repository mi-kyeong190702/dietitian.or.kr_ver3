<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>

<style type="text/css">
<!--
strong, b {font-weight:bold;}
-->
</style>

<script type="text/javascript">

function doNext(){
	
	if(IsCheck()){
		document.inputForm.method = "post";
		document.inputForm.action = "/work/publication/kp_archiveshop_pay.do";
		document.inputForm.submit();
	}
}

function IsCheck()
{
	if(document.all['Member'][0].checked == false && document.all['Member'][1].checked == false)
	{
		alert('회원구분을 먼저 선택해주세요.');
		return false;
	}
	if(document.all['Member'][1].checked == true && document.inputForm.accept.checked == false){
		alert("비회원이신 경우에는 \n개인정보활용동안의에 동의 하셔야 합니다");
		return false;
	}
	
	return true;
}

function deposit_check(str)
{

	if(str=="1")	
	{ 
		depo001.style.display = 'block';
	}		 	 
	else
	{ 
		depo001.style.display = 'none';	
	} 
}
</script>

<form name="inputForm" >
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육자료</mark>(판매품)</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_archiveshop.do" class="cm">교육자료</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="w600 ac">
			<div class="box t2 p20 mt20">
				<div class="box p30 center">
					<p class="text s1 big"><mark class="bold cm">로그인</mark>을 하지 않으셨습니다.</p>
					<p class="text s1 mt10 mb20">회원가입 혜택을 받기 위해서는 로그인이 필요합니다<br />
					지금 로그인 후 바로 구매하시겠습니까?</p>
					<!-- 비회원 클릭 시 -->
					<div class="box r5 mb5 p10" id ="depo001"  style="display:none;">
						<div class="area h140 scroll text small">
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
							 2) 위탁받는 자(수탁자) : 옐로우캡, 우체국 택배<br>
							&nbsp;&nbsp;&nbsp;위탁하는 업무의 내용 : 배송정보 위탁<br><br>
							<b>5. 동의 거부권 등에 대한 고지</b><br>
							개인정보 제공은 교육자료 구매를 위해 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 교육자료 구매가 제한될 수 있습니다.
						</div>
						<div class="line bt dot mt10 p8 pb0 text ssmall left">
							<input type="checkbox" class="mr5"  name='accept' value='0' />
							<label for="checkbox1_1" class="mr20">위의 개인정보 수집 및 이용안내에 동의합니다.</label>
						</div>
					</div>
					<!-- 비회원 클릭 시 -->
					<div class="box r5 p10">
						<div class="area text small">
						<%if(g_isLogin){%>
							<input type="radio" class="mr5" name="Member" value="1" />
						<%}else{%>
							<input type="radio" class="mr5" name="Member" value="1" onclick="alert('먼저 로그인을 하세요.');document.all['Member'][0].checked=false;"/>
						<%}%>							
							<label for="radio1_1" class="mr20">회원</label>
							<input type="radio" class="mr5" name="Member" value="2" onclick="deposit_check('1')"/>
							<label for="radio1_2" class="mr20">비회원</label>
							<a href="javascript:doNext();" class="btn t1">확인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>