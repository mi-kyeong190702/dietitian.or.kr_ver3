<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>

<%

/*########################################################################
'# PG 사 : KCP
'# KCP
'# 대표       : 2108-1063
'#  - 이동주   : 2108-1063
'# - 기술문의 : 2108-2985,83
'########################################################################*/


	String good_mny =  ParamUtils.getParameter(request, "good_mny").trim();
	if( good_mny == "" ) 
		good_mny = "0";
	else good_mny = good_mny.replaceAll(",", "");
	
	String code_bran = ParamUtils.getParameter(request, "code_bran").trim();
	if( code_bran == "")
		code_bran = "0";
	
%>
<html>
<head>



<link href="/css/style.css" rel="stylesheet" type="text/css">
<!-- style2.css , style4 추가 KSH 12.07-->
<link href="/css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-size: 11px}
.style5 {
	color: #0099FF;
	font-weight: bold;
}
.style6 {color: #0099FF}
.style7 {color: #666666}
-->
</style>


<script src="/js/default.js" type="text/JavaScript"></script>
<script language='javascript' src='https://pay.kcp.co.kr/plugin/payplus_test.js'></script>
<!-- ※ 주의!!!
     테스트 결제시 : src='https://pay.kcp.co.kr/plugin/payplus_test.js'
     리얼   결제시 : src='https://pay.kcp.co.kr/plugin/payplus.js'     로 설정해 주시기 바랍니다. -->
<script language='javascript'>

    // 플러그인 설치(확인)
    StartSmartUpdate();

    function  jsf__pay( form )
    {
        if( document.Payplus.object == null )
        {
            openwin = window.open( 'chk_plugin.html', 'chk_plugin', 'width=420, height=100, top=300, left=300' );
        }

        if ( MakePayMessage( form ) == true )
        {
            openwin = window.open( 'proc_win.html', 'proc_win', 'width=449, height=209, top=300, left=300' );
            return  true;
        }
        else
        {
            return  false;
        }
    }

    // 주문번호 생성 예제
    function init_orderid()
    {
        var today = new Date();
        var year  = today.getFullYear();
        var month = today.getMonth() + 1;
        var date  = today.getDate();
        var time  = today.getTime();

        if(parseInt(month) < 10) {
            month = "0" + month;
        }

        var order_idxx = year + "" + month + "" + date + "" + time;

        document.order_info.ordr_idxx.value = order_idxx;
    }

</script>
</head>

<body topmargin=0 leftmargin=0 onload="init_orderid();">
<!-- style2.css , style4 추가 KSH 12.07-->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="21%" align="center" valign="top" background="/images/bg_main.gif"></td>
        <td width="999" align="center" valign="top" background="/images/bg_main.gif">
            <table width="999" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="933" height="122" align="right" valign="bottom">
                        <!-- #include virtual="/inc/top.asp" -->
                    </td>
                    <td width="66" rowspan="3" align="left" valign="top" background="/images/bg.gif" style="padding-top:122px ">
                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="66" height="303">
                            <param name="flash_component" value="ImageViewer.swc">
                            <param name="movie" value="/fla/quick.swf">
                            <param name="quality" value="high">
                            <param name="FlashVars" value="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:false,imageURLs:['img1.jpg','img2.jpg','img3.jpg'],slideLoop:false,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}">
                            <embed src="/fla/quick.swf" quality="high" flashvars="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:false,imageURLs:['img1.jpg','img2.jpg','img3.jpg'],slideLoop:false,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="66" height="303"></embed>
                        </object>
                    </td>
                </tr>
				<tr>
					<td width="933" align="left" valign="top">
						<table width="920" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td height="177" align="left" valign="top">
									<table width="920" height="177" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="220" align="left" valign="top" background="/images/sub_login_bg.gif">
												<table width="205" height="156" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td align="center" valign="middle">
															<!-- 로그인박스시작 -->
															<!-- #include virtual="/inc/login.asp" -->
															<!-- 로그인박스끝 -->
														</td>
													</tr>
												</table>
											</td>
											<td align="left" valign="top">
												<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="700" height="177">
													<param name="flash_component" value="ImageViewer.swc">
													<param name="movie" value="/fla/member.swf">
													<param name="quality" value="high">
													<param name="FlashVars" value="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:false,imageURLs:['img1.jpg','img2.jpg','img3.jpg'],slideLoop:false,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}">
													<embed src="/fla/member.swf" quality="high" flashvars="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:false,imageURLs:['img1.jpg','img2.jpg','img3.jpg'],slideLoop:false,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="177"></embed>
												</object>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">
									
									<table width="920" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="205" height="100%" align="left" valign="top">

											</td>
											<td width="14" rowspan="2" align="left" valign="top"></td>
											<td width="701" height="100%" rowspan="2" align="center" valign="top">
												<!--- 상세페이지 시작 --->
												<table width="670" border="0" cellspacing="0" cellpadding="0">
												<!---상세페이지 찾아오시는길 수정 KSH 12.07------->
                                                    <tr>
                                                        <td width="670" height="48" align="left" valign="top">
                                                            <table width="670" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="9" height="49">&nbsp;</td>
                                                                    <td width="151" height="49" align="center" valign="bottom"><img src="../images/title_10.gif" ></td>
                                                                    <td width="505" height="49" align="left" valign="bottom"><br />
                                                                        <table width="505" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="180"><img src="/information/images/info01_17.jpg" width="158" height="21" /></td>
                                                                                <td align="right"><span class="style4">HOME &gt; 카드결제 하기</span> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="9" height="4"></td>
                                                                    <td width="151" height="4" bgcolor="cce194"></td>
                                                                    <td width="505" height="4" bgcolor="ededed"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
 <tr>
      <td align="left" valign="top">
         <table width="670" height="562" border="5" cellpadding="0" cellspacing="0">
             <tr>
                 <td width="9" height="49">&nbsp;</td>
                 <td width="656" height="49" align="center" valign="top">
		
		<form name="order_info" action="pp_ax_hub.asp" method="post" onSubmit="return jsf__pay(this)">
		<table border='5' cellpadding='0' cellspacing='1' width='500' align='center'>
		    <tr>
		        <td align='left' colspan='2'></td>
		    </tr>
		    <tr>
		        <td colspan="2"><br />아래의 내용을 확인 하시고 결제 버튼을 클릭 하시면<br />카드 결제가 진행됩니다.<br /><br />
		            <table width="468" border="5" cellpadding="0" cellspacing="1" bgcolor="#94D8BE" style="padding: 5 5 5 5 ">
		      <tr>
		          <td bgcolor="F4F4F4">신청교육 확인</td>
		          <td bgcolor="#FFFFFF"><%=ParamUtils.getParameter(request, "good_name")%></td>
		      </tr>
		      <tr>
		          <td bgcolor="F4F4F4">결제금액</td>
		          <!-- td bgcolor="#FFFFFF"><%//response.write FormatNumber(good_mny,0) 'good_mny = "1004"  // 'test 결제 라서%>원</td-->
		           <td bgcolor="#FFFFFF"><%= good_mny %>원</td>
		           
		      </tr>
		      <tr>
		          <td bgcolor="F4F4F4">결제자명</td>
		          <td bgcolor="#FFFFFF"><%=ParamUtils.getParameter(request, "pers_name")%></td>
		      </tr>
						<%
							String installment_plan = "0";
							if( Integer.parseInt(good_mny) > 50004 ){
						%>																					
							<input type='hidden' name='quotaopt' value='12' />
						<%}else{%>
							<input type='hidden' name='quotaopt' value='0' />
						<%}%>
						  </table>
						  <div align=center>
						  <% if( good_mny == "" || good_mny =="0" ){%>
						    	  결제금액이 0원이면 결제 할 수 없습니다.
						  <%}else{%><br /><br />
								  <input type="image"  src="../images/cash_btn_01.gif" width="90" height="20" alt="영양사카드 결제"/>
						  <%}%>
						  </div>


<!-- 요청종류 승인(pay)/취소,매입(mod) 요청시 사용 -->
<input type='hidden' name='req_tx'    value='pay' />


<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->

<!-- 테스트 결제시 : T0000 으로 설정, 리얼 결제시 : 부여받은 사이트코드 입력 -->

<%
	//중앙			SITE_CODE ="P3286"       SITE_KEY ="3cyF-XEK0ro1JTG-xCCKxP6__"
	//서울			SITE_CODE ="P3300"       SITE_KEY ="0mKBBU4vXhl0VszRQPWD3Jx__"
	//부산			SITE_CODE ="P3290"       SITE_KEY ="2n5lW8VZ1WfOePaSEhAdUS1__"
	//인천 		SITE_CODE ="P3291"       SITE_KEY ="1bVE49GJeGZ--2r-Qwjkmhd__"
	//강원도		SITE_CODE ="P3289"       SITE_KEY ="11BAmy8G-TOf3wn4vpFAnyf__"
	//경기			SITE_CODE ="P3299"       SITE_KEY ="2dussbq0Xo-ZXMmr1wmXukf__"
	//충청북도	SITE_CODE ="P3297"       SITE_KEY ="2.9YH2oi9tuX5RGcLG7B.Z1__"
	//대전충남	SITE_CODE ="P3287"       SITE_KEY ="2ZUIzQYDGW8.pQaywaBCnO4__"
	//전라북도	SITE_CODE ="P3294"       SITE_KEY ="15xXUF4Ho231oBdeZTaMkfN__"
	//공주전남	SITE_CODE ="P3295"       SITE_KEY ="2sZ-5Evz92oOafSb.6OBfj4__"
	
	
	//대구경북	SITE_CODE ="P3292"       SITE_KEY ="4ljgq3R60jgg6yL-2gR3MxY__"
	//경상남도	SITE_CODE ="P3288"       SITE_KEY ="3YbWQflZLwSy02nRLXYCKZF__"
	//울산			SITE_CODE ="P3298"       SITE_KEY ="45pL8rXMluvjoaSEFLarC0O__"
	
	//제주			SITE_CODE ="P3293"       SITE_KEY ="35XkN0I39DgVdAUK5v5ikY6__"

	String SITE_CODE 	="";
	String SITE_KEY		= "";
	
    if( code_bran.equals("0") || code_bran.equals("1") ){
    	
		//중앙
		SITE_CODE ="P3286";
		SITE_KEY ="3cyF-XEK0ro1JTG-xCCKxP6__";
				
    }else  if( code_bran.equals("10") ){
    	
		//local_name		= "서울"
		SITE_CODE ="P3300";
		SITE_KEY ="0mKBBU4vXhl0VszRQPWD3Jx__";
			
    }else if( code_bran.equals("20") ){
    	
		//local_name		= "부산";
		SITE_CODE ="P3290";
		SITE_KEY ="2n5lW8VZ1WfOePaSEhAdUS1__";
			
    }else if( code_bran.equals("30") ){
    	
    	//local_name		= "인천"
		SITE_CODE ="P3291";
		SITE_KEY ="1bVE49GJeGZ--2r-Qwjkmhd__";
			
    }else if( code_bran.equals("40") ){
    	
		//local_name		= "경기"
		SITE_CODE ="P3299";
		SITE_KEY ="2dussbq0Xo-ZXMmr1wmXukf__";
			
    }else if( code_bran.equals("50") ){
    	
    	//local_name		= "강원"
		SITE_CODE ="P3289";
		SITE_KEY ="11BAmy8G-TOf3wn4vpFAnyf__";

    }else if( code_bran.equals("60") ){
    	
		//local_name		= "충북"
		SITE_CODE ="P3297";
		SITE_KEY ="2.9YH2oi9tuX5RGcLG7B.Z1__";

    }else if( code_bran.equals("70") ){
    	
		//local_name		= "대전충남"
		SITE_CODE ="P3287";
		SITE_KEY ="2ZUIzQYDGW8.pQaywaBCnO4__";

    }else if( code_bran.equals("80") ){
			
    	//local_name		= "전북"
		SITE_CODE ="P3294";
		SITE_KEY ="15xXUF4Ho231oBdeZTaMkfN__";

    }else if( code_bran.equals("90") ){
			
    	//local_name		= "광주전남"
		SITE_CODE ="P3295";
		SITE_KEY ="2sZ-5Evz92oOafSb.6OBfj4__";

    }else if( code_bran.equals("100") ){
    	
		//local_name		= "대구경북"
		SITE_CODE ="P3292";
		SITE_KEY ="4ljgq3R60jgg6yL-2gR3MxY__";
		
    }else if( code_bran.equals("110") ){
    	
		//local_name		= "경남"
		SITE_CODE 	= "P3288";
		SITE_KEY 	= "3YbWQflZLwSy02nRLXYCKZF__";

    }else if( code_bran.equals("12") ){
    	
		//local_name		= "울산"
		SITE_CODE 	= "P3298";
		SITE_KEY 	= "45pL8rXMluvjoaSEFLarC0O__";

    }else if( code_bran.equals("130") ){
		
    	//local_name		= "제주"
		SITE_CODE 	= "P3293";
		SITE_KEY 	= "35XkN0I39DgVdAUK5v5ikY6__";
		
    }else{
    	
    	//모두 중앙으로
		SITE_CODE ="P3286";
		SITE_KEY ="3cyF-XEK0ro1JTG-xCCKxP6__";
		
    }
	
/*/////////////////////////////
		//test 용
		//SITE_CODE ="T0000";
		//SITE_KEY ="3grptw1.zW0GSo4PQdaGvsF__";
/////////////////////////////*/
%>

<input type='hidden' name='site_cd'   value='<%=SITE_CODE%>' />
<input type='hidden' name='site_key'  value='<%=SITE_KEY%>' />

<!-- 14 개  지부별 코드 부여 >
<!-- http://testpay.kcp.co.kr/Pay/Test/site_key.jsp 로 접속하신후 부여받은 사이트코드를 입력하고 나온 값을 입력하시기 바랍니다. -->

<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////////// -->


<!-- 신한카드만 사용가능 하게 한다 -->
<%
//	카드별 고유코드
//	CCAM	AmexLocal카드	 CCBC 비씨카드	 CCCH 축협카드
//	CCCJ	제주은행카드	  CCCT 시티카드	  CCDI	 현대카드
//	CCHM	한미카드	 CCHN 하나카드	 CCJB 전북은행카드
//	CCKE	 외환카드	 CCKJ	 광주은행카드	 CCKM	 국민카드
//	CCKW	 조흥카드	 CCLG	 엘지카드	 CCLO	 롯데카드
//	CCPH	 우리카드	 CCSG	 신세계한미카드	 CVSF	 Visa해외카드
//	CCSS	 삼성카드	 CCSU	 수협카드	 CAMF	 Amex해외카드
//	CDIF	 Diners해외카드	 CJCF	 JCB해외카드	 CMCF	 Master해외카드
//  CCNH     NH          CCCU   신협
//  CCKD 산은 , CCXX : 기타 회외카드 ,
//  -----------------------------
//  2008.04.24    저축카드 신규 등록 CCSB


//Card_NOT = "CCAM:CCBC:CCCH:CCCJ:CCCT:CCDI:CCHM:CCHN:CCJB:CCKE:CCKJ:CCKM:CCKW:CCLG:CCLO:CCPH:CCSG:CVSF:CCSS:CCSU:CAMF:CDIF:CJCF:CMCF:CCKD:CCXX:CCSB:"

String Card_NOT = "CCAM:CCBC:CCCH:CCCJ:CCCT:CCDI:CCHM:CCHN:CCJB:CCKE:CCKJ:CCKM:CCKW:CCLO:CCPH:CCSG:CVSF:CCSS:CCSU:CAMF:CDIF:CJCF:CMCF:CCKD:CCXX:CCSB:CCNH:CCCU:";

//CCSH 신한카드
	String good_name	= ParamUtils.getParameter(request, "good_name");

%>
<input type='hidden' name='not_used_card' value='<%=Card_NOT%>' />
<!-- MPI 결제창에서 사용 한글 사용 불가 -->
<input type='hidden' name='site_name' value='dietitian' />
<!-- 필수 항목 : PULGIN 설정 정보 변경하지 마세요 -->
<input type='hidden' name='module_type' value='01' />

<!-- 필수 항목 : 결제 금액/화폐단위 -->
<input type='hidden' name='currency' value='WON' />

<!-- 주문 번호 (자바 스크립트 샘플(init_orderid()) 참고) -->
<input type='hidden' name='ordr_idxx' value='' />

<!-- 교통카드 테스트용 파라미터 (교통카드 테스트 시에만 이용하시기 바랍니다.) -->
<input type='hidden' name='test_flag' value='T_TEST' />

<!-- 필수 항목 : PLUGIN에서 값을 설정하는 부분으로 반드시 포함되어야 합니다. ※수정하지 마십시오.-->
<input type='hidden' name='res_cd'         value='' />
<input type='hidden' name='res_msg'        value='' />
<input type='hidden' name='tno'            value='' />
<input type='hidden' name='trace_no'       value='' />
<input type='hidden' name='enc_info'       value='' />
<input type='hidden' name='enc_data'       value='' />
<input type='hidden' name='ret_pay_method' value='' />
<input type='hidden' name='tran_cd'        value='' />
<input type='hidden' name='bank_name'      value='' />
<input type='hidden' name='bank_issu'      value='' />
<input type='hidden' name='use_pay_method' value='' />

<!-- 현금영수증 관련 정보 : PLUGIN 에서 내려받는 정보입니다 -->
<input type='hidden' name='cash_tsdtime'   value='' />
<input type='hidden' name='cash_yn'        value='' />
<input type='hidden' name='cash_authno'    value='' />

<input type="hidden" name="pay_method" 		value="100000000000" /> <!--ex. 지불 방법 신용카드인 경우 -->

<input type="hidden" name="skin" 			value="original"><!-- 기본 스킨 -- 0  -->
<input type="hidden" name="site_logo" 		value="/images/index/logo00.jpg" />
<input type="hidden" name="good_name" 		value="<%=good_name%>" />
<input type="hidden" name="good_mny" 		value="<%=good_mny%>" size='10' > <!-- 결제 금액-->
<input type="hidden" name="pers_name" 		value="<%=ParamUtils.getParameter(request, "pers_name")%>" /> <!-- 주문자명-->

<input type="hidden" name="email" 		value="<%=ParamUtils.getParameter(request, "email")%>" size='25' />
<input type="hidden" name="pers_tel" 		value="<%=ParamUtils.getParameter(request, "pers_tel")%>" size='20' />
<input type="hidden" name="pers_hp" 		value="<%=ParamUtils.getParameter(request, "pers_hp")%>" size='20' />

<!-- 영협 추가-->
<input type="hidden" name="o_gubun" 		value="<%=ParamUtils.getParameter(request, "o_gubun").trim()%>" />

<input type="hidden" name="pers_birth" 		value="<%=ParamUtils.getParameter(request, "pers_birth").trim()%>" />
<input type="hidden" name="user_id"				value="<%= ParamUtils.getParameter(request, "user_id").trim()%>"  >
<input type="hidden" name="code_bran" 		value="<%=code_bran%>">
<input type="hidden" name="goods_code_num" 	value="<%=ParamUtils.getParameter(request, "goods_code_num").trim()%>" />
<input type="hidden" name="mem_due" 		value="<%=ParamUtils.getParameter(request, "mem_due").trim()%>" />
<input type="hidden" name="seq"				value="<%=ParamUtils.getParameter(request, "seq").trim()%>" />
<%
	String edu_kind = "";

	if( ParamUtils.getParameter(request, "edu_kind").trim() == "" )
		edu_kind = "1";
	else
		edu_kind = ParamUtils.getParameter(request, "edu_kind").trim();
	
%>
<input type="hidden" name="edu_kind" value="<%=edu_kind%>" />
<!-- 영협 추가-->

                                                                                </td>
                                                                            </tr>
                                                                        </table>
</form>
                                                                    </td>
                                                                </tr>
                                                            </table>
												<!-- 상세페이지 끝 --->
											            </td>
										            </tr>
                                                    <tr>
                                                        <td align="left" valign="top"></td>
                                                    </tr>
                                                </table>
								            </td>
							            </tr>
						            </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="933" height="157" align="left" valign="top">
                                    <!-- #include virtual="/inc/copy.asp" -->
                                </td>
                            </tr>
			            </table>
                    </td>
                </tr>
            </table>
        </td>
        <td width="21%" align="center" valign="top" background="/images/bg.gif"></td>
    </tr>
</table>
</body>
<map name="Map2">
	<area shape=rect coords="162,209,318,236" href="card.asp" />
</map>

</html>
