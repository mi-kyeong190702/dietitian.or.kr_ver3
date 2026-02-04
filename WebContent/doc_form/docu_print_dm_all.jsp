<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.net.URLDecoder" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>
<%
	if( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
		response.setHeader("Pragma", "no-cache");
	} else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
		response.setHeader("Cache-Control", "no-cache");
	}
	response.setDateHeader("Expires", 0);
	
	String doc_name = "라벨지";
	String doc_name_str = "라벨지_all1";	

	String doc_code =  ParamUtils.getParameter(request, "doc_code");
	String book_kind = ParamUtils.getParameter(request, "code_book_kind"); 	
    String book_start_dt = ParamUtils.getParameter(request,"book_start_dt");
    
	String dm_print_yymm_seq = ParamUtils.getParameter(request,"dm_print_yymm_seq");
	String rece_yn = ParamUtils.getParameter(request, "rece_yn");
	String dm_creater = URLDecoder.decode(ParamUtils.getParameter(request, "dm_creater"));
	String admin = ParamUtils.getParameter(request,"admin"); 

	String add1 = "";
	String add2 = "";
	
	if( rece_yn.equals("") ) {
		add1 = "AND a.rece_yn = '" + rece_yn + "'";	
	} else {
		add1 = " ";	
	}
	
	if( !book_start_dt.equals("") ) {
		add2 = "AND CONVERT(varchar,a.regi_date,112) like substring('"  + book_start_dt + "',1,6)+'%'";	
	} else {
		add2 = " ";	
	}

	String doc_param = "/rv book_kind['"  + book_kind + "'] dm_print_yymm_seq['" + dm_print_yymm_seq + "']  dm_creater['" + dm_creater + "'] add1[" + add1 + "] add2[" + add2 + "]";
	// 'response.write("doc_name_str " &doc_name_str& "<br>"&	response.write("sql " &doc_param& "<br>"))

	String ocxWidth = "";
	String ocxHeight = "";
	if( admin.equals("Y") ) {
		ocxWidth= "960";
		ocxHeight= "89%";	
	} else {
		ocxWidth= "730";
		ocxHeight= "590";
	}
%>

<html>
<head>
	<title><%=doc_name%></title>
	<link href="/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/layout.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" onLoad="onLoad()">
<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
<tr>
	<td width="25%"></td><td height="30"align="center" class="board_04" style="font-size: 16px;" width="50%"><%=doc_name%> 출력</td>
	<td align="right" width="25%"><a href="/CAB/CX60u_OCX_setup.exe" ><img src="/member/images/new/ser_btn_27.gif" border="0"  align="absmiddle"></a>&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
	<td>

<script language="javascript">
<!--
function onLoad()
{


	//        0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기

	//Cxviewer.HideToolBar();
	//Cxviewer.DisableToolbar(0);
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


//-->

</script>

	</td>
</tr>
</table>
<object id=rdpdf50 classid="clsid:0D0862D3-F678-48B5-876B-456457E668BC" width=0% height=0% codebase="http://www.dietitian.or.kr/CAB/rdpdf50.cab#version=2,1,0,73">
</object>
<object  id=Cxviewer name=Cxviewer width=960 height=84% align=center classid="clsid:04931AA4-5D13-442f-AEE8-0F1184002BDD" codebase="http://www.dietitian.or.kr/CAB/cxviewer60u.cab#version=6,2,0,35">
</object>
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
