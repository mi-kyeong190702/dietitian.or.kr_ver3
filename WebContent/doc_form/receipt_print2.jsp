<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.net.URLDecoder" %>
<%@ page import="kda.utils.ParamUtils,kda.utils.KdaStringUtil" %>
<%@ page import="kda.WorkData"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	if( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
		response.setHeader("Pragma", "no-cache");
	} else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
		response.setHeader("Cache-Control", "no-cache");
	}
	response.setDateHeader("Expires", 0);
	
	String user_code  = ParamUtils.getParameter(request, "doc_seq");
	String print_seq  = ParamUtils.getParameter(request, "print_seq");
	
	request.setAttribute("user_code", user_code);
	
	String doc_name_str = "";
	String doc_param = "";
	
	if( KdaStringUtil.isEmpty(user_code) || KdaStringUtil.isEmpty(print_seq) ) {
		doc_name_str = "회원증영수증";
	} else {
		doc_name_str = "회원증영수증_user";
		doc_param = "/rv code_seq['" + print_seq + "'] code_pers[" + user_code + "] ";
	}
%>

<sql:setDataSource var="dataSource2" dataSource="jdbc/dataSource2" />
<sql:query dataSource="${dataSource2}" var="persResult">
SELECT 
	pers_name, lic_no, pers_birth 
FROM Person_M_TBL WHERE code_pers = '${user_code}' 
</sql:query>
<c:set value="${persResult.rows[0]}" var="person" />

<sql:query dataSource="${dataSource2}" var="duesResult">
SELECT ROW_NUMBER()OVER(ORDER BY a.regi_date desc,a.pres_let_dt desc, a.dues_h_seq desc, a.dues_b_seq desc) no
		, a.dues_gubun, c.detcodename dg_name , a.dues_h_seq , a.dues_b_seq , a.pres_let_dt , a.code_inout_gubun	
		, d.detcodename iog_name, a.code_receipt, e.detcodename rc_name, a.pres_money, a.bank_name, a.code_pay_flag
		, f.detcodename pf_name, a.conform_dt, a.conform_yn, h.detcodename cf_name, a.regi_date, a.register
		, b.auth_start, b.auth_end,  b.code_member, g.detcodename cm_name, b.incom_flag, case when b.incom_flag = '1' then '완납'  else '미완납' end  if_name
FROM dues_b_tbl a LEFT JOIN com_code c ON c.groupcode = '038' AND c.detcode = a.dues_gubun
	LEFT JOIN com_code d  ON d.groupcode = '015' AND d.detcode = a.code_inout_gubun
	LEFT JOIN com_code e ON e.groupcode = '013' AND e.detcode = a.code_receipt 
	LEFT JOIN com_code f ON f.groupcode = '014'  AND f.detcode = a.code_pay_flag 
	LEFT JOIN com_code h  ON h.groupcode='052'  AND h.detcode=a.conform_yn  , dues_h_tbl b
	LEFT JOIN com_code g ON g.groupcode = '006' AND g.detcode = b.code_member
WHERE a.code_pers=b.code_pers  AND a.dues_gubun=b.dues_gubun  AND a.dues_h_seq=b.dues_h_seq
	AND a.code_pers = '${user_code}' 
</sql:query>

<html>
<head>
	<title>회원증/영수증 출력</title>
	<link href="/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/layout.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" onLoad="onLoad()">
<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>	
		<td width="25%"></td>
		<td height="30" align="center" class="board_04" style="font-size: 16px;" width="50%">회원증/영수증 출력</td>
		<td align="right" width="25%"><a href="/CAB/CX60u_OCX_setup.exe" ><img src="/member/images/new/ser_btn_27.gif" border="0"  align="absmiddle"></a>&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3">
			<form name="print" method="post" action="receipt_print2.jsp">
			<input type="hidden" name="doc_seq" value="<%=user_code%>">
			<table width="960" cellspacing="0" cellpadding="0" border="0" align="center" >
				<tr align="center" >
					<td height="5" colspan="6"></td>
				</tr>
				<tr align="center" bgcolor="4AB2E7">
					<td height="2" colspan="6"></td>
				</tr>
				<tr height="30">
					<td width="80"  bgcolor="#F7FBFF" class="board_05" >사용자</td>
					<td width="260" align="center">
					${person.pers_name} / ${person.lic_no} ( ${person.pers_birth} )
					</td>
					<td width="80" bgcolor="#F7FBFF" class="board_05" >사용자</td>
					<td>
					<select name="print_seq" onchange="document.print.submit();">
						<option value="0" >인쇄 할 납입 정보를 선택해주세요</option>
						<c:forEach items="${duesResult.rows}" var="due">
						<c:if test="${ due.incom_flag == 'Y' }"></c:if>
						<c:set var="due_code_seq" value="${user_code}${due.dues_gubun}${due.dues_h_seq }" />
						<option value="${due_code_seq}" <c:if test="${due_code_seq ==  print_seq  }" >selected</c:if> >
							${due.auth_start} ~ ${due.auth_end }
						</option>
						</c:forEach>
					</select>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="3">
		<script language="javascript">
		function onLoad() {
			// 0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기
		
			// Cxviewer.HideToolBar();
			// Cxviewer.DisableToolbar(0);
			Cxviewer.DisableToolbar(2);
			Cxviewer.DisableToolbar(3);
			Cxviewer.DisableToolbar(12);
			Cxviewer.DisableToolbar(13);
			Cxviewer.DisableToolbar(14);
			Cxviewer.DisableToolbar(16);
			Cxviewer.DisableToolbar(17);
		
			Cxviewer.HidePopupMenu(4);		
			Cxviewer.HidePopupMenu(5);	
			Cxviewer.HidePopupMenu(6);		
			Cxviewer.HidePopupMenu(7);		
			Cxviewer.HidePopupMenu(9);
			Cxviewer.AutoAdjust = false;
			Cxviewer.ZoomRatio = 100;
			Cxviewer.SendMail(4);
		
			//Cxviewer.SetBackgroundColor(255,255,255); //테두리 흰색
			//0 : 팝업메뉴 전체, 1 : 다음/이전 페이지, 2 : 확대/축소, 3 : 인쇄, 4 : 파일저장, 5 : 차트바꾸기, 6 : 트리관리창 보이기, 7 : 이전/이후 문서, 8 : E-mail에 첨부하기, 9 : 일부페이지 저장
			//Cxviewer.ShowPopupMenu(3);
			//Cxviewer.ShowPopupMenu(8);
		    Cxviewer. CertPrintDialog(1, "", "", "", "");
			Cxviewer.ApplyLicense ("http://210.127.55.231:8282/DataServer/rdagent.jsp"); 
			Cxviewer.FileOpen ("<%=WorkData.DOMAIN%>/doc_form/<%=doc_name_str%>.mrd",  "<%=doc_param%>");
		}
		</script>			
		</td>
	</tr>
</table>

<object id=rdpdf50 classid="clsid:0D0862D3-F678-48B5-876B-456457E668BC" width=0% height=0%
	   codebase="http://www.dietitian.or.kr/CAB/rdpdf50.cab#version=2,1,0,73"></object>
<object  id=Cxviewer name=Cxviewer width=960 height=84% align=center
	   classid="clsid:04931AA4-5D13-442f-AEE8-0F1184002BDD" codebase="http://www.dietitian.or.kr/CAB/cxviewer60u.cab#version=6,2,0,35"></object>
	   

<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>
		<td height="30"  align="left" class="board_04" >
	※ 증서 출력 프로그램이 실행이 안되실 경우 상단의 <font color="f5500d"><b>출력 프로그램 설치</b></font> 버튼을 클릭해 주세요<br>
	&nbsp;&nbsp;&nbsp;&nbsp;<font color="f5500d"><b>인쇄가 안 되실 경우 JPG 파일로 저장</b></font>  하신 후 <font color="f5500d"><b>저장파일을 열어 인쇄</b></font>하시기 바랍니다.
		</td>
	</tr>
	<tr height="30">
		<td align="center">	<a href="javascript:window.close();" class="btn small t1">닫기</a></td>
	</tr>
</table>	   
</body>
</html>

		