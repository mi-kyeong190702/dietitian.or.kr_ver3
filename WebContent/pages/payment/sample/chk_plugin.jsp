<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String good_mny			= ParamUtils.getParameter(request, "good_mny"); 
	String O_gubun			= ParamUtils.getParameter(request, "O_gubun");
	String good_name		= ParamUtils.getParameter(request, "good_name");	
	String buyr_name		= ParamUtils.getParameter(request, "buyr_name"); 
	String buyr_tel1		= ParamUtils.getParameter(request, "buyr_tel1"); 
	String buyr_tel2		= ParamUtils.getParameter(request, "buyr_tel2"); 
	String buyr_mail		= ParamUtils.getParameter(request, "buyr_mail"); 
	String pers_birth		= ParamUtils.getParameter(request, "pers_birth");
	String  id 			= ParamUtils.getParameter(request, "id");
	String code_bran		= "";
	String goods_code_num	= ParamUtils.getParameter(request, "goods_code_num");
	String mem_due			= ParamUtils.getParameter(request, "dues_bran").trim();
	String edu_kind			= ParamUtils.getParameter(request, "edu_kind"); //재가입 카드결제 부분에서는 값을 보내주는 부분이 없음.
	String seq				= ParamUtils.getParameter(request, "seq").trim();//재가입 카드결제 부분에서는 값을 보내주는 부분이 없음.
	
	

	
	//2013 년 4월 3일  수정 - 신규 회원구분의 회비 추가 (125만원, 120만원)
	if(    good_mny.equals("1250000") ||  good_mny.equals("1200000")
		|| good_mny.equals("1050000") ||  good_mny.equals("800000")
		|| good_mny.equals("1000000") ||  good_mny.equals("750000"))
	{
		code_bran = "0";
		System.out.println(" code_bran1"+code_bran);
	}else{
		code_bran = ParamUtils.getParameter(request, "code_bran").trim();
		System.out.println(" code_bra2"+code_bran);
	}
	
	System.out.println("======================================================================");
	System.out.println("================== pages/payment/sample/chk_plugin.jsp ===============");
	
	System.out.println("O_gubun			:"+O_gubun		);	 
	System.out.println("good_name		:"+good_name	);	 	 
	System.out.println("good_mny		:"+good_mny		);	  
	System.out.println("buyr_name		:"+buyr_name	);	 	 		
	System.out.println("buyr_tel1		:"+buyr_tel1		);	  
	System.out.println("buyr_tel2		:"+buyr_tel2		);	 	 
	System.out.println("buyr_mail		:"+buyr_mail		);	 	 
	System.out.println("pers_birth		:"+pers_birth	);	 	
	System.out.println("id			:"+ id		);	 	 
	System.out.println("code_bran		:"+code_bran);	 
	System.out.println("goods_code_num	:"+goods_code_num);	 	
	System.out.println("mem_due			:"+mem_due		);	 	 
	System.out.println("edu_kind		:"+edu_kind		);	  
	System.out.println("seq				:"+seq	);	 			 	
	System.out.println("======================================================================");
	
%>

<head>
    <title>한국사이버결제 플러그인 설치 페이지</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <link rel="stylesheet" href="css/sample.css" type="text/css" />

    <script type="text/javascript" src="http://pay.kcp.co.kr/plugin/payplus.js"></script>

    <script type="text/javascript">
    StartSmartUpdate();

    function  jsf__chk_plugin()
    {
    	
        // IE 일경우 기존 로직을 타게끔
        if ((navigator.userAgent.indexOf('MSIE') > 0) || (navigator.userAgent.indexOf('Trident/7.0') > 0))
        {
        	if ( document.Payplus.object != null )
            {
        		document.joinCard.action="/pages/payment/sample/order.jsp";
        		document.joinCard.submit();
            }
        }
        // 그 외 브라우져에서는 체크로직이 변경됩니다.
        else
        {
        	var inst = 0;
            for (var i = 0; i < navigator.plugins.length; i++)
            {
                if (navigator.plugins[i].name == "KCP")
                {
                    inst = 1;
                }
            }

            if (inst == 1)
            {
            	document.joinCard.action="/pages/payment/sample/order.jsp";
            	document.joinCard.submit();
            }
            else
            {
                document.location.href=GetInstallFile();
            }
        }
    }
    </script>

    <script type="text/javascript">
        setTimeout("jsf__chk_plugin()","1000");
    </script>
</head>


<body>

<form name="joinCard" method="post" ID="Form1">
	<input type="hidden" name="O_gubun" 			value=<c:out value="${requestScope.cardpayInfo.o_gubun}"/>			title="" />
	<input type="hidden" name="good_name" 		value=<c:out value="${requestScope.cardpayInfo.good_name}"/>		title="" />
	<input type="hidden" name="good_mny"        	value=<c:out value="${requestScope.cardpayInfo.good_mny}"/> 		title="결제금액" />
	<input type="hidden" name="buyr_name"       	value=<c:out value="${requestScope.cardpayInfo.buyr_name}"/>			title="주문자명" /> 
	<input type="hidden" name="buyr_tel1"       	value=<c:out value="${requestScope.cardpayInfo.buyr_tel1}"/> 		title="주문자 전화번호" /> 
	<input type="hidden" name="buyr_tel2"       	value=<c:out value="${requestScope.cardpayInfo.buyr_tel2}"/> 		title="주문자 휴대폰번호" />    
	<input type="hidden" name="buyr_mail"      	value=<c:out value="${requestScope.cardpayInfo.buyr_mail}"/>		title="주문자 E-mail" />
	<input type="hidden" name="pers_birth"		value=<c:out value="${requestScope.cardpayInfo.pers_birth}"/>		title="주문자 생년월일" />
	<input type="hidden" name="id" 			value=<c:out value="${requestScope.cardpayInfo.user_id}"/>			title="주문자 id"/>
	<input type="hidden" name="code_bran" 		value=<c:out value="${requestScope.cardpayInfo.code_bran}"/>		title="지부 코드"/>
	<input type="hidden" name="goods_code_NUm" 	value=<c:out value="${requestScope.cardpayInfo.goods_code_num}"/>		title="키"/>
	<input type="hidden" name="edu_kind" 			value=<c:out value="${requestScope.cardpayInfo.edu_kind}"/>		title="" />
	<input type="hidden" name="mem_due" 			value=<c:out value="${requestScope.cardpayInfo.mem_due}"/>			title="" />
	<input type="hidden" name="seq" 				value=<c:out value="${requestScope.cardpayInfo.seq}"/>				title="" />
</form>

<div align="center">
    <table width="600" cellspacing="0" cellpadding="0">
        <tr>
            <td><img src="img/kcp_plug_img01.gif" width="600" height="84" alt=""/></td>
        </tr>
        <tr>
            <td style="background-image:url('img/kcp_plug_bg01.gif');">
                <table style="width:550;text-align:center">
                <tr>
                    <td height="50" colspan="2" align="center" >고객님의 안전한 결제를 위해 결제 정보를 암호화하는 프로그램을 확인(설치)하는 중입니다.</td>
                </tr>
                <tr>
                    <td height="60" colspan="2" align="center" valign="top"><img src="img/kcp_ing.gif" style="width:481px;height:31px;" alt=""/></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:50px;text-align:left;">
                        1. 페이지 상단의 알림표시줄이 나타났을 경우 알림표시줄에서 마우스 오른쪽 버튼을 눌러 <br />
                        <span class="red bold">"ActiveX 컨트롤 설치"</span>를 선택하여 주십시오. <br />
                        2. <u>보안경고 창이 나타나면 <span class="red bold">"설치"</span> 또는 <span class="red bold">"예"</span> 버튼을 눌러
                        설치를 진행하여 주십시오.</u> <br />
                        &nbsp;&nbsp;&nbsp;통신 환경에 따라 2-3초에서 수분이 걸릴수도 있습니다. <br />
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="center"><img src="img/kcp_plug_img02.gif" style="width:530px;height:11px;" alt="" /></td>
                </tr>
                <tr>
                    <td width="153" rowspan="2" align="center"><img src="img/kcp_plug_img03.gif" style="width:103px;height:97px;" alt="" /></td>
                    <td style="width:397px;height:30px;text-align:left;"><img src="img/kcp_plug_img04.gif" style="width:14px;height:14px" alt="" />
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
            <td><img src="img/kcp_plug_img05.gif" width="600" height="20" alt="" /></td>
        </tr>
    </table>
</div>
</body>
</html>
