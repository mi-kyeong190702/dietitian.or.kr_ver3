<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://pay.kcp.co.kr/plugin/payplus.js" charset="utf-8"></script>
<script type="text/javascript">
//2022.03.23 주석처리
//StartSmartUpdate();

function  jsf__chk_plugin() {
	document.joinCard.action="/payment/${menu}/order.do";
	document.joinCard.submit();
	
	/*
   	// IE 일경우 기존 로직을 타게끔
	if ((navigator.userAgent.indexOf('MSIE') > 0) || (navigator.userAgent.indexOf('Trident/7.0') > 0)) {
        	if ( document.Payplus.object != null )
            {
        		document.joinCard.action="/payment/${menu}/order.do";
        		document.joinCard.submit();
            }
	} else {
        var inst = 0;
		for (var i = 0; i < navigator.plugins.length; i++) {
			if (navigator.plugins[i].name == "KCP")  {
				inst = 1;
			}
		}
		if (inst == 1) {
           	document.joinCard.action="/payment/${menu}/order.do";
          	document.joinCard.submit();
		} else {
			document.location.href=GetInstallFile();
		}
	}
	*/
}
</script>

<script type="text/javascript">
	setTimeout("jsf__chk_plugin()","100");
</script>

<div class="s_page">
<!-- 
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1">
				<mark class="cm">영양사 카드</mark> 결제
			</h3>
		</div>
		<div class="sp_navi">
		</div>
	</div>
	<hr />
-->
	<div class="sp_body">
<form name="joinCard" method="post" ID="Form1">
	<input type="hidden" name="o_gubun" 			value="${cardPayment.o_gubun}"  />
	<input type="hidden" name="good_name" 			value="${cardPayment.good_name}" />
	<input type="hidden" name="good_mny"        	value="${cardPayment.good_mny}" 		title="결제금액" />
	<input type="hidden" name="buyr_name"       	value="${cardPayment.buyr_name}"		title="주문자명" /> 
	<input type="hidden" name="buyr_tel1"       	value="${cardPayment.buyr_tel1}" 		title="주문자 전화번호" /> 
	<input type="hidden" name="buyr_tel2"       	value="${cardPayment.buyr_tel2}" 		title="주문자 휴대폰번호" />    
	<input type="hidden" name="buyr_mail"      		value="${cardPayment.buyr_mail}"		title="주문자 E-mail" />
	<input type="hidden" name="pers_birth"			value="${cardPayment.pers_birth}"		title="주문자 생년월일" />
	<input type="hidden" name="id" 					value="${cardPayment.user_id}"			title="주문자 id"/>
	<input type="hidden" name="code_bran" 			value="${cardPayment.code_bran}"		title="지부 코드"/>
	<input type="hidden" name="goods_code_num" 		value="${cardPayment.goods_code_num}"	title=""/>
	<input type="hidden" name="edu_kind" 			value="${cardPayment.edu_kind}"			title="" />
	<input type="hidden" name="mem_due" 			value="${cardPayment.mem_due}"			title="" />
	<input type="hidden" name="seq" 				value="${cardPayment.seq}"				title="" />
</form>

<!-- 
    <table width="600" cellspacing="0" cellpadding="0">
        <tr>
            <td><img src="/pages/payment/img/kcp_plug_img01.gif" width="600" height="84" alt=""/></td>
        </tr>
        <tr>
            <td style="background-image:url('/pages/payment/img//kcp_plug_bg01.gif');">
                <table style="width:550;text-align:center">
                <tr>
                    <td height="50" colspan="2" align="center" >고객님의 안전한 결제를 위해 결제 정보를 암호화하는 프로그램을 확인(설치)하는 중입니다.</td>
                </tr>
                <tr>
                    <td height="60" colspan="2" align="center" valign="top"><img src="/pages/payment/img/kcp_ing.gif" style="width:481px;height:31px;" alt=""/></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px;text-align:left;">
                        1. 페이지 상단의 알림표시줄이 나타났을 경우 알림표시줄에서 마우스 오른쪽 버튼을 눌러 <br />
                        <span class="red bold">"ActiveX 컨트롤 설치"</span>를 선택하여 주십시오. <br />
                        2. <u>보안경고 창이 나타나면 <span class="red bold">"설치"</span> 또는 <span class="red bold">"예"</span> 버튼을 눌러 설치를 진행하여 주십시오.</u> <br />
                        &nbsp;&nbsp;&nbsp;통신 환경에 따라 2-3초에서 수분이 걸릴수도 있습니다. <br />
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="center"><img src="/pages/payment/img/kcp_plug_img02.gif" style="width:530px;height:11px;" alt="" /></td>
                </tr>
                <tr>
                    <td width="153" rowspan="2" align="center"><img src="/pages/payment/img/kcp_plug_img03.gif" style="width:103px;height:97px;" alt="" /></td>
                    <td style="width:397px;height:30px;text-align:left;"><img src="/pages/payment/img/kcp_plug_img04.gif" style="width:14px;height:14px" alt="" />
                        <span class="bold">프로그램이 자동으로 설치가 되지 않는 경우</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;">
                        1. <a href="http://pay.kcp.co.kr/plugin_new/file/KCPUXWizard.exe"><span class="red bold">이곳</span></a>을 눌러
                        설치 파일을 다운로드하여 주십시오.<br />
                        2. 다운받은 프로그램을 실행하시면 설치가 진행됩니다.<br />
                        3. 설치가 완료된 후 키보드의 &quot;F5&quot; 버튼을 눌러 새로고침을 하면<br />
                        &nbsp;&nbsp;&nbsp;다음 결제 페이지로 이동합니다.
                    </td>
                </tr>
                </table>
			 </td>
        </tr>
        <tr>
            <td><img src="/pages/payment/img/kcp_plug_img05.gif" width="600" height="20" alt="" /></td>
        </tr>
    </table>
  -->
	</div>
</div>
