<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>			
<script type="text/javascript">
	$(document).ready(function() {});
	function check() {
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

	function doIpinCheck()	{
		if(check()){
			var popupWindow = window.open( "", "I-PIN-POP", "left=200, top=100, status=0, width=450, height=550" );
			var IPIN = document.IPIN;
	
			IPIN.target = "I-PIN-POP";
			//KCB 테스트서버를 호출할 경우
			//ipin.action = "https://tipin.ok-name.co.kr:8443/tis/ti/POTI01A_LoginRP.jsp";
			//KCB 운영서버를 호출할 경우
			IPIN.action = "https://ipin.ok-name.co.kr/tis/ti/POTI01A_LoginRP.jsp";
			IPIN.submit();
	
			popupWindow.focus()	;
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

		alert("감사합니다. I-PIN 실명확인이 완료 되었습니다.\n 교육생 가입 창으로 이동합니다.");
		document.location.href = "/work/education/ke_join_step1.do";
	}
	
</script>

<form name="join">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육생</mark>등록</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_curriculum.do" >교육과정 신청</a></li>
				<li><a href="/work/education/ke_join_edu.do" class="cm">교육생 등록</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
	
		</p>
		<div class="area mt50">
			<h4 class="title bold t2 cm s1 i_b_t2">교육신청 절차</h4><span class="ib mt10 ml10 text small ca">교육신청 절차  교육생 등록과 교육신청은 다음과 같은 순서에 따라 진행됩니다. </span>
		</div>
		<ol class="step_join mt20">
			<li class="start on"><span class="icon step1"></span><span class="txt"><strong>실명확인</strong></span></li>
			<li><span class="icon step3"></span><span class="txt">교육생 등록</span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		
		<div class="box t2 bgs mt20 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">이용</mark>약관</h5>
				<div class="box t1 r5 mt10 p10">
					<div class="area h170 scroll text small">
						<b>1. 목적</b><br>
						이 약관은 대한영양사협회가 제공하는 인터넷 서비스 www.dietitian.or.kr (이하 "서비스"라 합니다)를 운영하는데 있어 대한영양사협회와 회원간의 이용 및 서비스 제공에 관한 기본적인 사항을 규정하는 것을 목적으로 합니다.<br>
						<br>
						<b>2. 약관의 효력 및 변경</b><br>
						이 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스 화면에서 동의 의사를 표시함으로써 효력을 발생 합니다.<br>
						대한영양사협회는 합리적인 사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 이를 공시 또는 공지합니다.<br>
						<br>
						<b>3. 약관 외 준칙</b><br>
						이 약관에 명시되지 않은 사항이 관계 법령에 규정되어 있을 경우에는 그 규정에 따릅니다.<br>
						<br>
						<b>4. 용어의 정의</b><br>
						1) 회원 : 대한영양사협회에 개인신상신고를 필하고 회비를 납입한 자로 자로 대한영양사협회 홈페이지의 모든 서비스를 이용할 수 있는 자<br>
						2) 아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 협회가 승인하는 문자와 숫자의 조합<br>
						3) 비밀번호 : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합<br>
						4) 전자우편(E-Mail) : 인터넷을 통한 우편<br>
						5) 탈퇴 : 협회 또는 회원이 서비스이용 이후 그 이용계약을 종료시키는 의사 표시<br>
						<br>
						<b>5. 대한영양사협회의 의무</b><br>
						1) 대한영양사협회는 이 약관에서 정한 바 계속적, 안정적으로 서비스를 제공할 수 있도록 합니다.<br>
						2) 대한영양사협회는 귀하가 쾌적한 환경에서 서비스를 즐길 수 있도록 항상 노력합니다. <br>
						3) 대한영양사협회는 서비스제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙없이 제3자에게 누설, 배포하지 않습니다.<br>
						4) 대한영양사협회는 정보통신망 이용촉진에 관한 법률, 통신비밀보호법, 전기통신 기본법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다. <br>
						<br>
						<b>6. 회원의 가입 대상</b><br>
						1) 정회원 : 대한민국 영양사면허를 취득한 자<br>
						2) 준회원 : 식품영양(학)과(영양(학)과등 영양사 자격시험관련 학과 포함) 재학생으로서 본 회의 활동에 동참하기를 원하는 자<br>
						3) 특별회원 : 본 회의 목적에 관련된 분야에서 학위를 소지하고 연구?교육?기타 실무에 종사하는 자 또는 본 회에서 인정하는 외국의 영양사 면허를 취득한 자로서 상임이사회의 승인을 얻은 자<br>
						4) 명예회원 : 본 회의 발전을 위하여 현저한 공로가 있거나 식품영양학에 관한 학식과 경험이 많은 자로 회장의 추천에 의하여 상임이사회의 승인을 얻은 자<br>
						<br>
						<b>7. 회원의 의무 </b><br>
						1) 귀하는 서비스 이용을 위해 등록할 경우 현재의 사실과 일치하는 완전한 정보("등록정보"- 이름, 생년월일, 전화번호, 주소 등)를 제공하셔야 합니다. <br>
						2) 회원가입은 반드시 실명으로만 가입할 수 있으며 대한영양사협회는 실명확인조치를 할 수 있습니다.<br>
						3) 타인의 명의(이름 및 생년월일)를 도용하여 이용신청을 한 회원의 모든 ID는 삭제되며, 관계법령에 따라 처벌을 받을 수 있습니다.<br>
						4) 귀하는 등록정보에 변경사항이 발생할 경우 즉시 갱신하셔야 합니다. <br>
						5) 귀하가 서비스 등록절차를 완료하시면 대한영양사협회에서 승인을 받아야 해당 회원으로 인정이 됩니다. 단 귀하는 귀하의 책임 하에 비밀번호와 사용자 계정의 보안을 유지하셔야 합니다. <br>
						6) 귀하는 다음과 같은 행위를 하는데 서비스를 이용하지 않기로 동의합니다. <br>
						&nbsp;① 타인(소수를 포함)에게 해를 입히는 모든 행위 <br>
						&nbsp;② 저속 또는 음란한 데이터, 텍스트, 소프트웨어, 음악, 사진, 그래픽, 비디오 메시지 등(이하 "컨텐트")을 게시, 게재 또는 전자우편으로 보내는 행위 등 <br>
						&nbsp;③ 실명이 아니거나 타인으로 가장하는 행위 및 타인과의 관계를 허위로 명시하는 행위 <br>
						&nbsp;④ 다른 이용자의 ID, 비밀번호, 생년월일을 도용하는 행위<br>
						&nbsp;⑤ 권리(지적재산권을 포함한 모든 권리)가 없는 컨텐트를 게시, 게재 또는 전자우편으로 보내는 행위<br>
						&nbsp;⑥ 불필요하거나 승인되지 않은 광고, 판촉물을 게재하거나, "정크 메일(junk mail)", "스팸(spam)", "행운의 편지(chain letters)", "피라미드 조직" 등을 권유하거나 게시, 게재 또는 전자우편으로 보내는 행위 등 <br>
						&nbsp;⑦ 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비를 파괴, 방해 또는 기능을 제한하기 위한 소프트웨어 바이러스를 게시, 게재 또는 전자우편으로 보내는 행위 등 <br>
						&nbsp;⑧ 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시, 게재, 전자우편으로 보내는 행위 등 <br>
						&nbsp;⑨ 다른 사용자의 개인정보를 수집 또는 저장하는 행위 <br>
						&nbsp;⑩ 사람을 비방할 목적으로 사실 또는 허위의 사실을 적시하여 사람의 명예를 훼손하는 행위 <br>
						&nbsp;⑪ 자기 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 가할 목적으로 허위의 정보를 유통 시키는 행위 <br>
						&nbsp;⑫ 재물을 걸고 도박하거나 사행행위를 하는 행위 <br>
						&nbsp;⑬ 윤락행위를 알선하거나 음행을 매개하는 내용의 정보를 유통시키는 행위 <br>
						&nbsp;⑭ 수치심이나 혐오감 또는 공포심을 일으키는 말이나 음향, 글이나 화상 또는 영상을 계속하여 상대방에게 도달하게 하여 상대방의 일상적 생활을 방해하는 행위 <br>
						&nbsp;⑮ 타인의 정보통신서비스 이용명의를 도용하여 사용하는 행위 <br>
						&nbsp;16 기타 불법적이거나 부당한 행위 <br>
						(7) 귀하는 인터넷의 전세계적인 성격을 인정하여 온라인상의 행위 및 용인할 수 있는 컨텐트에 대한 현지 규정을 준수할 것을 동의합니다. <br>
						(8) 귀하는 상업적인 목적을 위하여 본 서비스 자체, 서비스의 이용 또는 서비스에의 접속을 복사, 복제, 판매, 재판매 또는 이용하지 않을 것에 동의합니다. <br>
						<br>
						<b>8. 수집하는 개인정보의 항목</b><br>
						 대한영양사협회는 회원가입, 회원 서비스 및 정보 제공, 영양사 정책 및 현황 등을 위해 다음과 같은 개인정보를 수집하고 있습니다.<br>
						- 성명, 생년월일, 면허번호, 아이디, 비밀번호, 이메일 주소, 자택/근무처 주소, 자택/ 근무처 전화번호, 핸드폰번호<br>
						- 그 외 해당 근무처 선택항목<br>
						<br>
						<b>9. 개인정보의 공개</b><br>
						대한영양사협회는 다음과 같은 경우에 법에서 허용하는 범위 내에서 귀하의 성명, 전자우편주소 등 귀하의 개인정보를 제3자에게 제공할 수 있습니다. <br>
						(1) 귀하가 서비스를 이용함에 있어 관련 법률을 위반하여 수사기관이나 기타 정부기관으로부터 정보제공을 요청받는 경우 <br>
						(2) 귀하의 법률위반, 본 서비스 약관위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우 <br>
						(3) 기타 법률에 의해 요구되는 경우 <br>
						<br>
						<b>10. 사용의 중지 및 내용 삭제</b><br>
						(1) 귀하가 정보사용에 대한 이용 해지 및 삭제를 하고자 할 때는 본인이 직접 연락하여 삭제 신청을 할 수 있습니다.<br>
						(2) 귀하가 위 6. 회원의 의무 중 (6)에 해당하는 행위를 할 경우에 귀하는 평가원이 귀하의 서비스 이용을 중지시키거나 서비스 내에 포함되어 있는 내용을 삭제할 수 있음에 동의합니다. <br>
						<br>
						<b>11. 부 칙</b><br>
						(1) 본 약관은  2008년 10월 8일부터 적용됩니다.
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
						<b>처리하는 개인정보의 항목</b><br>
					협회는 양질의 서비스 제공을 위하여 다음의 개인정보를 수집하고 있습니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
					- 필수항목 : ID, 비밀번호, 성명, 생년월일, 영양사 면허번호, 주소, 연락처(휴대폰), E-mail, 자택주소,<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					자택전화, 면허관련정보(근무처분류, 운영형태 등)<br>
					- 선택항목 : 자택 및 근무처 정보(근무처명, 근무처주소, 부서 및 직급, 근무처전화, 우편물 수신처, <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					기타정보(학력, 출신학교, 자격증 종류, 경력, 산하단체/분야회 소속현황)<br>
					 - 수집방법 : 온라인 회원가입, 온라인 교육 신청, 오프라인(서면) 회원가입 신청, FAX, 전자우편,  <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 소속시도영양사회 및 산하조직으로부터의 제공<br>
					- 인터넷 서비스 이용과정에서 자동으로 생성·수집되는 개인정보항목이 수집될 수 있습니다.<br>
					&nbsp;&nbsp;
					(접속로그(일시, IP 주소, 웹브라우저 정보 등), 서비스 이용기록, 방문기록<br>
					<br>
					<b>개인정보의 처리 목적</b><br>
					협회는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
					① 회원 가입·관리 및 서비스 제공<br>
					&nbsp;&nbsp;
					회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제<br>
					&nbsp;&nbsp;
					시행에 따른 본인확인, 서비스 부정이용 방지, 각종 고지·통지·홍보, 통계·분석, 고충처리, 물품배송, <br>
					&nbsp;&nbsp;
					서비스 제공, 콘텐츠 제공, 본인인증, 결제·정산 등을 목적으로 개인정보를 처리합니다.<br>
					② 민원사무 처리<br>
					&nbsp;&nbsp;
					민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 <br>
					&nbsp;&nbsp;
					목적으로 개인정보를 처리합니다.<br>
					③ 관련 법령 및 협회 정관에 따른 업무<br>
					&nbsp;&nbsp;
					관련 법령 및 협회 정관에 따른 회원관리 업무, 교육 실시 업무, 전문영양사 자격 관련 업무, <br>
					&nbsp;&nbsp;
					목적사업 수행 관련 업무 등을 목적으로 개인정보를 처리합니다.<br>
					<br>
					<b>개인정보의 처리 및 보유 기간</b><br>
					① 협회는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은<br>
					&nbsp;&nbsp;개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.<br>
					② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
					< 회원·교육관리 시스템 내 회원등록 정보 데이터 ><br>
					- 보유 근거 : 정관, 홈페이지 이용 약관 및 정보 주체의 동의<br>
					- 보유 기간 : 영구<br>
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

						<strong class="pa l40 t40 bold cm">아이핀(I-PIN)</strong>
						<span class="ml120">I-PIN 인증으로 진행하려면 <mark class="cb">'아이핀인증'</mark>을 클릭해 주세요.</span>
						<span class="pa r40 t30"><a href="javascript:doIpinCheck();" class="btn t1 big">아이핀인증</a></span>
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