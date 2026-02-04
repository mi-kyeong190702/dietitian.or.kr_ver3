<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>

<%
    /* ============================================================================== */
    /* =   PAGE : 결과 처리 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2006   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
    /* = -------------------------------------------------------------------------- = */
   /*
    String req_tx         = ParamUtils.getParameter(request, "req_tx" );                      // 요청 구분(승인"취소"매입);
    String use_pay_method = ParamUtils.getParameter(request, "use_pay_method" );              // 사용 결제 수단
    String bSucc          = ParamUtils.getParameter(request, "bSucc" );                       // 업체 DB 정상처리 완료 여부
    // -------------------------------------------------------------------------- = *"
    String res_cd         = ParamUtils.getParameter(request, "res_cd" );                      // 결과 코드
    String res_msg        = ParamUtils.getParameter(request, "res_msg" );                     // 결과 메시지
    // -------------------------------------------------------------------------- = *"
    String ordr_idxx      = ParamUtils.getParameter(request, "ordr_idxx" );                   // 주문번호
    String tno            = ParamUtils.getParameter(request, "tno" );                         // KCP 거래번호
    String good_mny       = ParamUtils.getParameter(request, "good_mny" );                    // 결제 금액
    String good_name      = ParamUtils.getParameter(request, "good_name" );                   // 상품명
   	String buyr_name      = ParamUtils.getParameter(request, "buyr_name" );                   // 구매자명
   	String buyr_tel1      = ParamUtils.getParameter(request, "buyr_tel1" );                   // 구매자 전화번호
   	String buyr_tel2      = ParamUtils.getParameter(request, "buyr_tel2" );                   // 구매자 휴대폰번호
   	String buyr_mail      = ParamUtils.getParameter(request, "buyr_mail" );                   // 구매자 E-Mail
    // -------------------------------------------------------------------------- = *"
    // 신용카드
    String card_cd        = ParamUtils.getParameter(request, "card_cd" );                     // 카드 코드
    String card_name      = ParamUtils.getParameter(request, "card_name" );                   // 카드명
    String app_time       = ParamUtils.getParameter(request, "app_time" );                    // 승인시간 (공통);
    String app_no         = ParamUtils.getParameter(request, "app_no" );                      // 승인번호
    String quota          = ParamUtils.getParameter(request, "quota" );                       // 할부개월
    // -------------------------------------------------------------------------- = *"
    // 계좌이체
    String bank_name      = ParamUtils.getParameter(request, "bank_name" );                   // 은행명
    // -------------------------------------------------------------------------- = *"
    // 가상계좌
    String bankname       = ParamUtils.getParameter(request, "bankname" );                    // 입금 은행
    String depositor      = ParamUtils.getParameter(request, "depositor" );                   // 입금계좌 예금주
    String account        = ParamUtils.getParameter(request, "account" );                     // 입금계좌 번호

    // = -------------------------------------------------------------------------- = *"*/
    
    String req_tx         = "테스트 데이터"; // 요청 구분(승인"취소"매입);
	String use_pay_method = "테스트 데이터"; // 사용 결제 수단
	String bSucc          = "테스트 데이터";//"false"; // 업체 DB 정상처리 완료 여부
	// -------------------------------
	String res_cd         = "0000"; // 결과 코드
	String res_msg        = "테스트 데이터"; // 결과 메시지
	// -------------------------------
	String ordr_idxx      = "테스트 데이터"; // 주문번호
	String tno            = "테스트 데이터"; // KCP 거래번호
	String good_mny       = "테스트 데이터"; // 결제 금액
	String good_name      = "테스트 데이터"; // 상품명
	String buyr_name      = "테스트 데이터"; // 구매자명
	String buyr_tel1      = "테스트 데이터"; // 구매자 전화번호
	String buyr_tel2      = "테스트 데이터"; // 구매자 휴대폰번호
	String buyr_mail      = "테스트 데이터"; // 구매자 E-Mail
	// -------------------------------
	// 신용카드
	String card_cd        = "테스트 데이터"; // 카드 코드
	String card_name      = "테스트 데이터"; // 카드명
	String app_time       = "테스트 데이터"; // 승인시간 (공통);
	String app_no         = "테스트 데이터"; // 승인번호
	String quota          = "테스트 데이터"; // 할부개월
	// -------------------------------
	// 계좌이체
	String bank_name      = "테스트 데이터"; // 은행명
	// -------------------------------
	// 가상계좌
	String bankname       = "테스트 데이터"; // 입금 은행
	String depositor      = "테스트 데이터"; // 입금계좌 예금주
	String account        = "테스트 데이터"; // 입금계좌 번호


    String req_tx_name = "";

    if( req_tx.equals("pay"))
        req_tx_name = "카드결제";
    else if( req_tx.equals("mod"))
        req_tx_name = "취소/매입";
%>
<head>
<script language='javascript' src='http://pay.kcp.co.kr/plugin/payplus.js'></script>
<script type="text/javascript">
      <!-- 신용카드 영수증 연동 스크립트 -->
      function receiptView(tno)
      {

          receiptWin = "http://admin.kcp.co.kr/Modules/Sale/Card/ADSA_CARD_BILL_Receipt.jsp?c_trade_no=" + tno
          window.open(receiptWin , "" , "width=420, height=670")
      }
</script>
</head>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
<h3 class="title bold t1 s1 i_b_t1"><mark class="cm"></h3>
		</div>
		<div class="sp_navi">
<ul>
	
</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
<%



 if( !bSucc.equals("false")){       //업체 DB 처리 정상

            if( res_cd.equals("0000")){      //정상 승인

%>
				<table width="468" border="0" cellpadding="0" cellspacing="1" bgcolor="#94D8BE" style="padding: 5 5 5 5 ">
                    <TR>
					<TD colspan=2 align=center  bgcolor="F4F4F4">카드결제가 정상적으로 승인 되었습니다. </td>
					</TR>

				   <tr>
                        <td bgcolor="F4F4F4" width=100>결과코드</td>
                         <td bgcolor="#FFFFFF" width=368><%=res_cd%></td>
                    </tr>

                   <tr>
                        <td bgcolor="F4F4F4">결과 메세지</td>
                         <td bgcolor="#FFFFFF"><%=res_msg%></td>
                    </tr>

                   <tr>
                        <td bgcolor="F4F4F4">주문번호</td>
                         <td bgcolor="#FFFFFF"><%=ordr_idxx%></td>
                    </tr>


                   <tr>
                        <td bgcolor="F4F4F4">결제금액</td>
                         <td bgcolor="#FFFFFF"><%=good_mny%></td>
                    </tr>
					<tr>
                        <td bgcolor="F4F4F4">결제내역</td>
                         <td bgcolor="#FFFFFF"><%=good_name%></td>
                    </tr>

					<tr>
                        <td bgcolor="F4F4F4">성명</td>
                         <td bgcolor="#FFFFFF"><%=buyr_name%></td>
                    </tr>

					<tr>
                        <td bgcolor="F4F4F4">전화번호</td>
                         <td bgcolor="#FFFFFF"><%=buyr_tel1%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">휴대폰번호</td>
                         <td bgcolor="#FFFFFF"><%=buyr_tel2%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">E-mail</td>
                         <td bgcolor="#FFFFFF"><%=buyr_mail%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">승인시간</td>
                         <td bgcolor="#FFFFFF"><%=app_time%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">승인번호</td>
                         <td bgcolor="#FFFFFF"><%=app_no%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">할부개월</td>
                         <td bgcolor="#FFFFFF"><%=quota%></td>
                    </tr>
	   				<tr>
                        <td bgcolor="F4F4F4">신용카드 영수증</td>
                         <td bgcolor="#FFFFFF"><input type="button" name="receiptView" value="영수증 출력" class="box" onClick="javascript:receiptView('<%=tno%>')"></td>
                    </tr>
                </table>



<%
			}else{                // 승인 실패
%>

				<table width="468" border="0" cellpadding="0" cellspacing="1" bgcolor="#94D8BE" style="padding: 5 5 5 5 ">
                   <TR>
					<TD colspan=2 align=center  bgcolor="F4F4F4">카드결제를 실패 하였습니다. </td>
					</TR>
				   <tr>
                        <td bgcolor="F4F4F4" width=100>결과코드</td>
                         <td bgcolor="#FFFFFF" width=368>&nbsp;<%=res_cd%></td>
                    </tr>
					<tr>
                        <td bgcolor="F4F4F4" width=100>결과 메세지</td>
                         <td bgcolor="#FFFFFF"><%=res_msg%></td>
                    </tr>
				 </table>

<%			}

 }else{      			//업체 DB 처리 실패
%>
				<table width="468" border="0" cellpadding="0" cellspacing="1" bgcolor="#94D8BE" style="padding: 5 5 5 5 ">
                   <TR>
					<TD colspan=2 align=center  bgcolor="F4F4F4">카드결제가 이루워 지지 않았습니다.. </td>
					</TR>
				   <tr>
                        <td bgcolor="F4F4F4" width=100>취소 결과코드</td>
                         <td bgcolor="#FFFFFF"  width=368><%=res_cd%></td>
                    </tr>
					<tr>
                        <td bgcolor="F4F4F4">취소 결과 메세지</td>
                         <td bgcolor="#FFFFFF"><%=res_msg%></td>
                    </tr>
                   <TR>
					<TD colspan=2 align=left  bgcolor="#FFFFFF">
						<%if( res_cd.equals("0000")){%>결제는 정상적으로 이루어졌지만  결제 결과를 처리하는 중 오류가 발생하여  <BR>시스템에서 자동으로 취소 요청을 하였습니다. <br>해당 협회로 전화하여 확인하시기 바랍니다.
						<%}else{%>결제는 정상적으로 이루어졌지만  결제 결과를 처리하는 중 오류가 발생하여  <BR>시스템에서 자동으로 취소 요청을 하였습니다. <br>해당 협회로 전화하여 확인하시기 바랍니다.
						<%}%>
					</td>
					</TR>

				 </table>
<%
}
 %>
	</div>
</div>
