<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>			
<%@ page import="java.io.*"%>
<%@ page import="kda.WorkData"%>

<script type="text/javascript">

	$(document).ready(function() {});
	
	function check()
	{
		if(document.join.accept1.checked != true){
			alert("이용약관에 동의 하셔야 합니다");

			return false;
		}

		if(document.join.accept2.checked != true){
			alert("개인정보활용동안의에 동의 하셔야 합니다");

			return false;
		}

		return true;
	}
	
	function doIpinCheck()	
	{
		if(check()){
		
			var popupWindow = window.open( "", "ipinpop", "left=200,top=100,status=0,width=450,height=550" );
	
			var IPIN = document.IPIN; 
			IPIN.target = "ipinpop";
			//KCB 테스트서버를 호출할 경우
			//ipin.action = "https://tipin.ok-name.co.kr:8443/tis/ti/POTI01A_LoginRP.jsp";
			//KCB 운영서버를 호출할 경우
			IPIN.action = "https://ipin.ok-name.co.kr/tis/ti/POTI01A_LoginRP.jsp";
			IPIN.submit();
	
			popupWindow.focus();
			
			return;
		}
	}
	
	function doIpinCheckComplete()
	{
		
		var IPIN = document.IPIN;
		if ( IPIN.AUTHINFO == "" ) {
			alert("I-PIN 실명확인이 완료 되지 않았습니다.");
			return;
		}

		alert("감사합니다. I-PIN 실명확인이 완료 되었습니다.\n회원가입 창으로 이동합니다.");
		document.location.href = "/member/km_join_step2.do";
	}
	
	function mobileConfirm(){
		if(check()){
			
			var popupWindow = window.open( "/pages/member/kcpcert_start.jsp", "MOBILEPOP", "left=200, top=100, status=0, width=650, height=450" );
			
			var MOBILE = document.MOBILE;

			MOBILE.target = "MOBILEPOP";
			MOBILE.action = "/pages/member/kcpcert_start.jsp";
			MOBILE.submit();

			popupWindow.focus()	;
			
			return;
		}
		
	}
	
	function MJoin(frm){
		document.mobileJoin.persName.value = frm.username.value; 
		document.mobileJoin.persBirth.value = frm.birth.value;
		document.mobileJoin.persHp.value = frm.phone.value;
		document.mobileJoin.action = "/member/km_join_step2.do";
		document.mobileJoin.submit();
	}
	
</script>

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
			<li class="start on"><span class="icon step1"></span><span class="txt"><strong>실명확인</strong></span></li>
			<li><span class="icon step2"></span><span class="txt">회원종류 선택</span></li>
			<li><span class="icon step3"></span><span class="txt">회원정보 입력</span></li>
			<li><span class="icon step4"></span><span class="txt">입금 및 확인</span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">대한영양사협회</mark> 회원가입 안내</h5>
				<div class="box t1 r5 mt10 p30">
					<ul class="banner_join">
						<li class="start"><a href="/member/km_condition.do"><span class="icon step1"></span><span class="txt">회원의 자격</span></a></li>
						<li><a href="/member/km_money.do"><span class="icon step2"></span><span class="txt">회비 구분 및 금액</span></a></li>
						<li><a href="/member/km_period.do"><span class="icon step3"></span><span class="txt">회원유효기간</span></a></li>
						<li class="mt10"><a href="/member/km_benefit.do"><span class="icon step4"></span><span class="txt">회원 혜택</span></a></li>
						<li class="mt10"><a href="/member/km_deposit_manner.do"><span class="icon step5"></span><span class="txt">입금 방법</span></a></li>
						<li class="mt10"><a href="/member/km_account.do"><span class="icon step6"></span><span class="txt">입금계좌 및 문의처</span></a></li>
					</ul>
				</div>	
			</div>
		</div>
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">이용</mark>약관</h5>
				<div class="box t1 r5 mt10 p10">
					<div class="area h170 scroll text small">
						<b>1. 목적</b><br>
						이 약관은 이용자가 대한영양사협회가 제공하는 홈페이지 등 회원서비스를 이용함에 있어 회원과 대한영양사협회(이하 ‘협회’라함) 간의 권리, 의무 및 책임사항 등 기본적인 사항을 규정함을 목적으로 합니다. <br>
						<br>
						
						<b>2. 용어의 정의</b><br>
						본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
						① 이용자 : 본 약관에 따라 협회 사이트가 제공하는 서비스를 받는 자<br>
						② 가입 : 협회가 제공하는 개인신상신고를 필한 후 회비를 납입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br>
						③ 회원 : 협회와 서비스 이용계약을 체결하고 아이디(ID)를 부여받은 자<br>
						④ 아이디(ID): 이용자의 식별 및 서비스 이용을 위하여 회원 자신이 선정하고 협회가 승인하는 문자와 숫자의 조합<br>
						⑤ 비밀번호 : 회원이 부여받은 아이디(ID)와 일치된 회원임을 확인하고 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합<br>
						⑥ 해지(탈퇴) : 회원이 서비스 이용 이후 그 이용계약을 해약하는 것을 말함<br>
						<br>
						
						<b>3. 약관의 효력 및 변경</b><br>
						① 이 약관은 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다. <br>
						② 이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공시하고, 이에 동의한 이용자가 회원에 가입함으로써 효력이 발생합니다.<br>
						③ 협회가 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체 없이 제2항과 같은 방법으로 공시합니다. 다만, 이용자의 권리 또는 의무에 관한 중요한 규정의 변경은 최소한 7일전에 공시합니다. <br>
						④ 이용자가 변경된 약관 사항에 동의하지 않는 경우 이용자는 본인의 회원등록을 취소할 수 있으며, 계속 사용하는 경우는 약관 변경에 대한 동의로 간주됩니다.<br>
						<br>
						
						<b>4. 약관 외 준칙</b><br>
						이 약관에 언급되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신망이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령 또는 관례에 따릅니다.<br>
						<br>
						
						<b>5. 이용계약의 성립</b><br>
						① 이용계약은 이용신청자가 본 약관을 읽고 약관 내용에 대한 동의와 협회의 이용 승낙으로 성립됩니다.<br>
						② 회원에 가입하여 서비스를 이용하고자 하는 자는 협회에서 제공하는 신청양식에 따라 요청하는 개인 신상정보를 제공해야 하며, 이용자가 제공한 개인정보는 본 약관 및 협회의 개인정보보호정책에 따라 철저히 보호됩니다.  <br>
						③ 이용자는 본 약관에 동의하는 것을 거부할 권리가 있으며, 동의를 거부할 경우 회원가입이 제한됩니다.<br>
						<br>
						
						<b>6. 이용 신청의 승낙 및 유보, 거절</b><br>
						① 협회는 이용계약의 절차에 따라 적합하게 이용 신청한 자에 대하여는 서비스 이용을 승낙함을 원칙으로 합니다. <br>
						② 협회는 다음에 해당하는 경우에 대하여는 승낙을 유보할 수 있습니다. <br>
						&nbsp;- 기술상 지장이 있는 경우<br>
						&nbsp;- 가입조건이 성립되지 않는 경우<br>
						&nbsp;- 본인 확인이 되지 않는 경우<br>
						&nbsp;- 기타 협회의 귀책사유로 인하여 이용승낙이 곤란한 경우<br>
						③ 협회는 다음에 해당하는 이용계약신청에 대하여는 이를 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다.<br>
						&nbsp;- 실명이 아니거나 다른 사람의 명의를 사용한 경우<br>
						&nbsp;- 이용 신청서의 내용을 허위로 기재하여 신청한 경우<br>
						&nbsp;- 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청한 경우<br>
						&nbsp;- 부정한 용도 및 영리를 목적으로 본 서비스를 이용하고자 하는 경우<br>
						&nbsp;- 14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우<br>
						&nbsp;- 가입신청자가 본 약관에 의하여 회원자격을 상실한 적이 있는 경우, 단 협회의 회원 재가입 승낙을 얻은 경우에는 예외로 함<br>
						&nbsp;- 기타 협회가 정한 이용 신청 요건이 미비된 경우<br>
						<br>
						
						<b>7.  협회의 의무 </b><br>
						① 협회는 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 시스템에 장애가 생기거나 멸실된 때에는 지체 없이 이를 수리 복구하여야 합니다. 다만, 천재지변, 국가비상사태 등 불가항력적 사유가 발생한 경우에는 일시적 또는 사태해결 전까지 서비스를 중단할 수 있습니다. <br>
						② 협회는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안시스템을 갖추어야 하며, 안정적인 운영을 할 수 있도록 유지보수를 이행하여야 합니다. <br>
						③ 협회는 서비스 제공과 관련하여 알게 된 회원의 개인정보를 본인의 동의 없이 제3자에게 누설, 배포하지 않습니다. 단, 관계법령에 의한 수사상의 목적으로 관계기관으로부터 요구 받은 경우나 정보통신윤리위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다. <br>
						④ 협회는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 신속하게 처리하여야 하며, 신속한 처리가 곤란한 경우 그 사유와 처리 일정을 서비스 화면에 게재하거나 전자메일 등을 통하여 동 회원에게 통지합니다. <br>
						<br>
						
						<b>8. 회원의 의무 </b><br>
						① 회원은 이 약관의 규정, 이용안내 및 주의사항 등 협회가 공지 또는 통지하는 사항을 준수하여야 하며, 협회의 업무에 방해되는 행위를 하지 않아야 합니다. <br>
						② 회원은 본인 아이디와 비밀번호의 관리소홀 및 부정사용과 관련된 모든 책임은 본인에게 있습니다.  <br>
						③ 회원은 본인의 아이디 및 비밀번호가 도용되거나 제3자가 부정사용하고 있음을 인지한 경우에는 즉시 협회에 통지하고 협회의 안내에 따라야 합니다.  <br>
						④ 해당 회원이 협회에 그 사실을 통지하지 않거나, 또는 통지한 경우라도 협회의 안내에 따르지 아니하여 발생되는 불이익은 본인이 책임져야 합니다. <br>
						⑤ 회원은 사진을 포함하여 이미지를 사용할 경우 피사체에 대한 초상권, 상표권, 특허권 등 모든 권리를 자신이 취득하여 사용하여야 하며, 이들 권리에 대한 분쟁 발생 시에는 모든 법적, 물질적 책임을 부담해야 합니다. <br>
						⑥ 회원은 다음의 행위를 해서는 안 됩니다. <br> 
						&nbsp;- 이용 신청 또는 변경 시 허위 사실을 기재<br>
						&nbsp;- 타인의 정보를 도용 하거나, 다른 회원의 개인정보를 수집, 저장하여 부정하게 사용하는 행위<br>
						&nbsp;- 협회의 서비스 정보를 이용하여 얻은 정보를 협회의 사전 승낙 없이 복제 또는 유통시키거나 영리목적으로 이용하는 행위<br>
						&nbsp;- 협회의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
						&nbsp;- 협회의 업무를 방해하거나 명예를 훼손하는 행위<br>
						&nbsp;- 광고 또는 광고성 정보를 전송하거나 영업을 위한 행위<br>
						&nbsp;- 해킹 또는 컴퓨터 바이러스를 유포시키는 행위<br>
						<br>
						
						<b>9. 서비스 이용</b><br>
						① 서비스 이용은 협회의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 단, 정기점검, 증설 및 교체 등의 필요로 인하여 협회가 정한 날 또는 시간은 일시 중단할 수 있습니다.<br>
						② 예정된 작업으로 인한 서비스 중단의 경우에는 사전에 중단 사유와 기간을 홈페이지에 공시하거나 회원에게 통지합니다.<br>
						<br>
						
						<b>10. 서비스 변경 및 중지</b><br>
						① 협회는 긴급한 시스템 점검 및 증설, 교체 등과 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우에는 예고 없이 일시적 또는 사태해결 전까지 서비스를 중단할 수 있습니다. <br>
						② 협회는 새로운 서비스로의 교체 등 협회가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. <br>
						③ 협회는 서비스의 변경, 해지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다. <br>
						<br>
						
						<b>11. 게시물 관리 및 이용</b><br>
						① 협회는 회원이 본 서비스를 이용하여 협회의 각종 게시판에 올린 이미지나 글의 게재, 게시, 전자메일 방법 등으로 전송한 내용물들에 대하여 일체 민·형사상의 책임을 지지 않으며, 분쟁이 발생 시에는 회원은 그 해결에 소요되는 비용을 부담하고 협회를 위하여 분쟁을 처리하여야 합니다. 또한 협회가 제3자에게 배상하거나 협회에 손해가 발생한 경우 회원은 협회에 배상하여야 합니다.<br>
						② 협회는 회원의 게시물이 다음 사항에 해당된다고 판단되는 경우에는 사전 통지 없이 삭제할 수 있습니다 <br>
						&nbsp;- 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우<br>
						&nbsp;- 공공질서 및 미풍양속에 위반되는 내용인 경우<br>
						&nbsp;- 범죄적 행위에 결부된다고 인정되는 내용인 경우<br>
						&nbsp;- 상업성이 있는 게시물이나 광고, 행운의 편지 등의 내용인 경우<br>
						&nbsp;- 협회 및 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br>
						&nbsp;- 선정적인 음란물을 게제하거나 음란사이트를 링크한 경우<br>
						&nbsp;- 기타 관계 법령이나 협회에서 정한 규정에 위배되는 경우<br>
						③ 협회는 회원이 등록한 게시물을 활용해 가공, 판매, 출판 등을 할 수 있습니다.<br>
						<br>
						
						<b>12. 게시물에 대한 저작권</b><br>
						① 서비스에 대한 저작권 및 지적재산권은 협회에 귀속됩니다. 단, 회원의 게시물 등은 제외합니다. <br>
						② 회원은 협회의 서비스 정보를 이용하여 얻은 정보를 협회의 사전 승낙 없이 임의가공, 복제, 송신, 출판, 재배포, 방송 등의 방법으로 영리목적에 이용할 수 없습니다.  <br>
						<br>
						
						<b>13. 계약해지</b><br>
						① 회원이 서비스 이용계약을 해지하고자 할 경우에는 본인이 직접 온라인 또는 협회가 정한 별도의 이용방법으로 협회에 해지신청을 하여야 합니다 <br>
						② 회원이 서비스 이용계약을 해지할 경우, 회원의 모든 정보는 관련법 및 개인정보처리방침에 따라 협회가 일정기간 보유 후 소멸됩니다.  <br>
						③ 협회는 회원이 회원의 의무의 규정을 위반한 경우 사전 통지 없이 일방적으로 이용계약을 해지하거나 또는 서비스 이용을 중지할 수 있으며, 이로 인하여 협회에 손해가 발생한 경우 이에 대한 민·형사상 책임을 물을 수 있습니다.  <br>
						<br>
						
						<b>14. 서비스 이용제한</b><br>
						① 협회는 다음에 해당하는 사유가 발생한 경우에는 서비스 이용을 제한하거나 중지시킬 수 있습니다.<br>
						&nbsp;- 회원이 회원의 의무의 규정을 위반한 경우<br>
						&nbsp;- 서비스의 안정적인 운영을 위한 정기점검을 실시하는 경우<br>
						&nbsp;- 시스템 점검 및 증설, 교체, 고장 등과 천재지변, 국가비상사태 등 불가항력적 사유가 발생한 경우<br>
						&nbsp;- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우<br>
						&nbsp;- 기타 중대한 사유로 인하여 협회가 서비스 제공을 지속하는 것이 부적당하다고 인정되는 경우<br>
						② 협회는 회원이 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우에는 경고, 일시정지, 영구이용정지 및 가입제한 등 단계적으로 서비스 이용을 제한 할 수 있습니다. <br>
						<br>
						
						<b>15. 손해 배상</b><br>
						① 회원이 본 약관의 규정을 위반함으로 인하여 협회에 손해가 발생하게 되는 경우, 본 약관을 위반한 회원은 협회에 발생하는 모든 민·형사상의 손해에 대하여 배상 및 책임을 지어야 합니다.<br>
						② 회원이 본 약관의 위반 및 서비스를 이용하여 행한 불법행위로 인해 협회가 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받는 경우 당해 회원은 자신의 책임과 비용으로 분쟁을 해결하여 협회를 면책 시켜야 하며, 그러하지 못한 경우 당해 회원은 그로 인하여 협회에 발생한 모든 손해를 배상하여야 합니다.  <br>
						<br>
						
						<b>16. 면책사항</b><br>
						① 협회는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>
						② 협회는 회원의 귀책사유로 인한 서비스 이용 장애에 대하여는 책임을 지지 않습니다. <br>
						③ 협회는 회원이 서비스와 관련하여 게재한 정보나 자료에 대한 정확도 및 신뢰도 등과 관련한 어떠한 것도 책임을 지지 아니합니다. <br>
						④ 협회는 회원이 본 약관을 위반하여 발생된 어떠한 손해에 대하여도 책임을 지지 아니합니다. <br>
						<br>
						
						<b>17. 관할법원</b><br>
						서비스 이용과 관련하여 발생한 분쟁에 대해 소송이 제기될 경우 협회의 소재지를 관할하는 법원 또는 대한민국의 민사소송법에 따른 법원을 관할법원으로 합니다. <br>
						<br>
						
						<b>18. 부 칙</b><br>
						이 약관은 2008년 10월 8일부터 시행합니다.
					</div>
					<div class="line bt dot mt10 p8 pb0 text ssmall left">
						<input type="checkbox" class="mr5" name="accept1" id="accept1" name='accept1' value='0' />
						<label for="accept1" class="mr20">이용약관에 동의 합니다.</label>
					</div>
				</div>
			</div>
		</div>
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">개인정보</mark> 수집 및 이용안내</h5>
				<div class="box t1 r5 mt10 p10">
					<div class="area h170 scroll text small">
						<b>1. 개인정보의 처리 목적</b><br>
						협회는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
						① 회원 가입∙관리 및 서비스 제공<br>
						&nbsp;&nbsp;회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별∙인증, 회원자격 유지∙관리, 제한적 본인확인제<br>
						&nbsp;&nbsp;시행에 따른 본인확인, 서비스 부정이용 방지, 각종 고지∙통지∙홍보, 통계∙분석, 고충처리, 물품 배송, 서비스<br>
						&nbsp;&nbsp;제공, 청구서 발송, 콘텐츠 제공, 본인인증, 결제∙정산을 위한 기록·보존 등을 목적으로 개인정보를 처리합니다. <br>
						② 민원사무 처리<br>
						&nbsp;&nbsp;민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락∙통지, 처리결과 통보 등을 목적으로 개인정보를 <br>
						&nbsp;&nbsp;처리합니다.<br>
						③ 면허신고 사무 처리<br>
						&nbsp;&nbsp;국민영양관리법 제20조의2에 따라 보건복지부장관으로부터 위탁받은 신고 수리 업무처리를 목적으로<br>
						&nbsp;&nbsp;개인정보를 처리합니다. <br>
						<br>
						
						<b>2. 개인정보의 처리 및 보유 기간</b><br>
						① 협회는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리·보유합니다.<br> 
						② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. <br>
						&nbsp;- 회원∙교육관리 시스템 내 개인정보 : 영구(정관, 홈페이지 이용 약관 및 정보 주체의 동의)<br>
						<br>
						
						<b>3. 처리하는 개인정보의 항목</b><br>
						협회는 양질의 서비스 제공을 위하여 다음의 개인정보를 수집하고 있습니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br> 
						&nbsp;- 필수항목 : ID, 비밀번호, 성명, 생년월일, 영양사 면허번호, 주소, 연락처(휴대폰), E-mail, 자택주소, 자택전화,<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;면허관련정보(근무처분류, 운영형태 등)<br>
						&nbsp;- 선택항목 : 자택 및 근무처 정보(근무처명, 근무처주소, 부서 및 직급, 근무처전화, 우편물 수신처, 기타정보<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(학력, 출신학교, 자격증 종류, 경력, 산하단체/분야회 소속현황)<br>
						&nbsp;- 수집방법 : 온라인 회원가입, 온라인 교육 신청, 오프라인(서면) 회원가입 신청, FAX, 전자우편,<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소속시도영양사회 및 산하조직으로부터의 제공<br>
						&nbsp;- 인터넷 서비스 이용과정에서 자동으로 생성∙수집되는 개인정보항목이 수집될 수 있습니다.<br>
						&nbsp;&nbsp;&nbsp;접속로그(일시, IP 주소, 웹브라우저 정보 등), 서비스 이용기록, 방문기록<br>
						<br>
						
						<b>4. 개인정보의 제3자 제공</b><br>
						① 협회는 정보주체의 동의가 있거나 법률의 규정에 의한 경우를 제외하고는 이용 범위를 넘어 정보주체의 개인정보를 이용하거나 타인에게 제공하지 않습니다. 단, 다음의 경우에는 정보주체의 동의 없이 개인정보를 제공할 수 있습니다.<br>
						&nbsp;- 회원 본인이 자신의 정보를 요구하는 경우<br>
						&nbsp;- 관련 법령에 따른 사무를 위해 필요한 경우<br>
						&nbsp;- 협회 정관에 따른 회원관리 및 목적사업 수행에 필요한 경우<br>
						&nbsp;- 각 시∙도영양사회, 분과위원회 등 산하조직의 회원관리, 회비관리 등 업무 목적으로 회원정보를 제공하는 경우<br>
						&nbsp;- 정부 및 관련 기관의 요구에 의해 회원정보의 제공이 필요하다고 판단되는 경우<br>
						&nbsp;- 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
						&nbsp;- 기타 이사회의 의결을 통해 회원정보의 제공이 필요하다고 판단되는 경우<br>
						② 개인정보의 정보제공 범위는 다음과 같이 제한되며, 정보제공 요구 기관별로 그 제공범위를 달리할 수 있으며, 제공형태는 출력된 인쇄물로 한정합니다. 다만, 각 시∙도영양사회 및 산하조직이 회원∙교육관리 목적상 파일로 요청할 경우 제공할 수 있습니다. <br>
						&nbsp;- 회원의 성명, 아이디, 면허번호, 생년월일, 성별, 근무처명, 근무처 주소, 근무처 전화번호, 자택주소,<br>
						&nbsp;&nbsp;&nbsp;핸드폰번호, 이메일주소, 회비납입정보, 자격증 관련 정보, 법정 교육 및 개별 교육 정보 중 전부 또는 일부<br>
						&nbsp;- 제공받는 자의 개인정보 이용 목적 : 회원관리, 교육관리, 교육관련 정보, 학력관련 정보, 간행물 배포,<br>
						&nbsp;&nbsp;&nbsp;업무 주요사항 관련 우편물 발송, 정관에 따른 목적사업 관련 정보 제공, 회원명부 제작 등<br>
						&nbsp;- 제공받는 자의 보유∙이용기간 : 목적 달성시 까지<br>
						<br>
						
						<b>5. 개인정보처리의 위탁</b><br>
						① 협회는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
						▶ 우편물 발송 처리<br>
						&nbsp;- 위탁받는 자 (수탁자) : DMline<br>
						&nbsp;- 위탁하는 업무의 내용 : 간행물, 공문 등 우편물 발송을 위한 주소 라벨용 파일<br>
						▶ 홈페이지 및 회원∙교육관리 프로그램 운영 및 유지관리<br>
						&nbsp;- 위탁받는 자 (수탁자) : 디비아이엔씨(DB Inc)<br>
						&nbsp;- 위탁하는 업무의 내용 : 홈페이지 및 회원∙교육관리 프로그램 운영에 필요한 회원정보<br>
						▶  KDA 온라인 영양사 보수교육센터 및 영양사 위생교육센터 운영 및 유지관리<br>
						&nbsp;- 위탁받는 자 (수탁자) : 메디오피아테크<br>
						&nbsp;- 위탁하는 업무의 내용 : KDA 온라인 영양사 보수교육센터 및 위생교육센터 교육프로그램 운영에 필요한 회원정보<br>
						② 협회는 위탁계약 체결시 개인정보보호법 제26조에 따라 위탁업무 수행 목적 외 개인정보 처리금지, 기술적∙관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리∙감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.  <br>
						③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.  <br>
						<br>
						
						<b>6. 개인정보의 파기</b><br>
						① 협회는 개인정보 보유기간의 경과, 개인정보 처리목적 달성 등 개인정보가 불필요하게 되었을때에는 지체없이 해당 개인정보를 파기합니다. <br>
						② 정보주체로부터 동의받은 개인정보의 보유기간이 경과하거나 개인정보의 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는 해당 개인정보 또는 개인정보파일을 별도의 데이터베이스로 옮기거나 보관장소를 달리하여 보존합니다.<br>
						③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
						&nbsp;1. 파기절차 : 협회는 파기 사유가 발생한 개인정보를 선정하고, 협회의 개인정보 보호책임자의 승인을 받아<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보를 파기합니다.<br>
						&nbsp;2. 파기방법 : 협회는 전자적 형태로 기록∙저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이문서에<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기록∙저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
						<br>
						
						<b>7. 개인정보 처리방침 변경</b><br>
						이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다. <br> 
						<br>
						
						<b>8. 부 칙</b><br>
						본 개인정보처리방침은 2012년 1월 1일부터 적용됩니다.
					</div>
					<div class="line bt dot mt10 p8 pb0 text ssmall left">
						<input type="checkbox" class="mr5" id="accept2" name='accept2' value='0' />
						<label for="accept2" class="mr20">개인정보 수집 및 이용안내에 동의 합니다.</label>
					</div>
				</div>
			</div>
		</div>
		</form>
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">실명</mark> 확인</h5><span class="ml10 ca ssmall">대한영양사협회는 회원가입 실명제를 실시합니다.</span>
				<div class="box t1 r5 pr mt10 p40 ca">
					<form name="IPIN" method="post" >
						<input type="hidden" name="IDPCODE" value="${ipin.idpCode}" />
						<input type="hidden" name="IDPURL" value="${ipin.idpUrl}" />
						<input type="hidden" name="CPCODE" value="${ipin.cpCode}" />
 						<input type="hidden" name="RETURNURL" value="${ipin.returnUrl}" />
						<input type="hidden" name="WEBPUBKEY" value="${ipin.pubkey}" />
						<input type="hidden" name="WEBSIGNATURE" value="${ipin.sig}" />
						<input type="hidden" name="CPREQUESTNUM" value="${ipin.curtime}" />
						<input type="hidden" name="AUTHINFO" value="" />
						<input type="hidden" name="IPIN_PERS_NAME" value="" />

						<strong class="pa l30 t40 bold cm text middle">아이핀 인증</strong><!-- 180919modi -->
						<span class="ml90">I-PIN 인증으로 진행하려면 <mark class="cb">'아이핀 인증'</mark>을 클릭해 주세요.</span><!-- 180919modi -->
						<span class="pa r30 t30"><a href="javascript:doIpinCheck();" class="btn t1 big">아이핀 인증</a></span><!-- 180919modi -->
					</form>
				</div>
				<form name="mobileJoin" method="post" >
					<input type="hidden" id="persName" name="persName" value="" />
					<input type="hidden" id="persBirth" name="persBirth" value="" />
					<input type="hidden" id="persHp" name="persHp" value="" />
				</form>
				<div class="box t1 r5 pr mt10 p40 ca">
					<form name="MOBILE" method="post" >
						<input type="hidden" id="persName" name="persName" value="" />
						<input type="hidden" id="persBirth" name="persBirth" value="" />
						<input type="hidden" id="persHp" name="persHp" value="" />
						<strong class="pa l30 t40 bold cm text middle">휴대폰 인증</strong><!-- 180919modi -->
						<span class="ml90">본인 휴대폰으로 발송된 인증번호를 연락하여 인증 진행합니다.</span><!-- 180919modi -->
						<span class="pa r30 t30"><a href="javascript:mobileConfirm();" class="btn t1 big">휴대폰 인증</a></span>
						
					</form>
				</div>
			</div>
		</div>
		<!--
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="javascript:doAgreeY();" class="btn big t1">동의</a></li>
				<li><a href="javascript:doAgreeN" class="btn big">동의하지 않습니다.</a></li>
			</ul>
		</div>
		-->
	</div>
</div>					