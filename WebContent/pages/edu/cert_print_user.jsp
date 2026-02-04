<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ page import="kda.WorkData"%>

<html>
<head>
<title>위생교육수료증</title>
<link href="/css/common.css" rel="stylesheet" type="text/css">
<link href="/css/layout.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" onLoad="onLoad()">

<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>
		<td width="25%"></td><td height="30"align="center" class="board_04" style="font-size: 16px;" width="50%">위생교육수료증 출력</td>
		<td align="right" width="25%">
			<a href="/CAB/CX60u_OCX_setup.exe" class="btn small ">설치</a>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	
	<tr>
		<td>
			<script language="javascript">
			<!--
				function onLoad()
				{
					
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
				
						Cxviewer. CertPrintDialog(1, "", "", "", "");
						Cxviewer.ApplyLicense ("http://210.127.55.231:8282/DataServer/rdagent.jsp");
						Cxviewer.FileOpen ("https://dietitian.or.kr/doc_form/위생교육수료증_each.mrd",  "/rv detcode['${detcode}'] code_seq['${doc_seq}']");
					
				}
			//-->
			</script>
		</td>
	</tr>
</table>

<object
   id=rdpdf50
   classid="clsid:0D0862D3-F678-48B5-876B-456457E668BC"
   width=0%
   height=0%
   codebase="http://www.dietitian.or.kr/CAB/rdpdf50.cab#version=2,1,0,73">
</object>
<object
   id=Cxviewer
   name=Cxviewer
   width=960
   height=84%
   align=center
   classid="clsid:04931AA4-5D13-442f-AEE8-0F1184002BDD"
   codebase="http://www.dietitian.or.kr/CAB/cxviewer60u.cab#version=6,2,0,35">
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
