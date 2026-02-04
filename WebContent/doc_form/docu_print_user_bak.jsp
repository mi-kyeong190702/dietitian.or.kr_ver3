<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.WorkData"%>
<%@include file="../pages/common.jsp"%>

<%
	String code_pers = session.getAttribute(SessionInfo.CODE_PERS).toString();	
    String doc_gubun = ParamUtils.getParameter(request, "gubun", "");

	// 29번 공통코드 0 없음 1 수료증 2 확인증 3 자격증 4 이수증
	String doc_print_kind = ParamUtils.getParameter(request, "print_kind", "");
	
	// 16번 공통코드 1 자격증교육 2 전문영양사 평점인정교육 3 일반교육 4 위생교육 5 자격시험 6 자율학습 7 기타
	String doc_code_kind = request.getParameter("code_kind");
	String doc_detcode = request.getParameter("detcode");
	String doc_doc_seq = request.getParameter("doc_seq");

	String msg = "";
	if ( !doc_print_kind.equals("4") && doc_print_kind.equals("") )
		msg = "회원전용 페이지 입니다 로그인 하세요.";
	
	String rd_doc_name = "";
	
	System.out.println("code_pers : " + code_pers);
	System.out.println("doc_gubun : " + doc_gubun);
	System.out.println("doc_print_kind : " + doc_print_kind);
	System.out.println("doc_code_kind : " + doc_code_kind);
	System.out.println("doc_detcode : " + doc_detcode);
	System.out.println("doc_doc_seq : " + doc_doc_seq);
	
	if ( doc_gubun.equals("E") )
	{
		if 		( doc_print_kind.equals("1") && doc_code_kind.equals("3") ) rd_doc_name = "수료증";
		else if ( doc_print_kind.equals("1") && doc_code_kind.equals("1") ) rd_doc_name = "자격증수료증";
		else if ( doc_print_kind.equals("1") && doc_code_kind.equals("2") ) rd_doc_name = "전문영양사 평점인정교육";
		else if ( doc_print_kind.equals("4") && doc_code_kind.equals("4") ) rd_doc_name = "위생교육수료증";
		else 
			msg = "지원하지 않는 문서입니다.";
	}
	else {
		if ( !doc_gubun.equals("") )
			msg = "지원하지 않는 문서입니다.";
	}
 
	// ----------------------------------------------------------------
	// 		문서명 받아오기
	// ----------------------------------------------------------------
	String doc_name_str = rd_doc_name + "_each";
	String doc_param = "/rv detcode['" + doc_detcode + "'] code_seq['" +  doc_doc_seq + "'] ";
	
	System.out.println("doc_param :  " + doc_param);
	
	String ocxWidth= "960";
  	String ocxHeight= "89%";
%>

<html>
<head>
<title><%=rd_doc_name%></title>

<link href="../css/board.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" onLoad="onLoad()">

<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>
		<td width="25%"></td><td height="30"align="center" class="board_04" style="font-size: 16px;" width="50%"><%=rd_doc_name%> 출력</td><td align="right" width="25%"><a href="http://www.dietitian.or.kr/CAB/CX60u_OCX_setup.exe" ><img src="/member/images/new/ser_btn_27.gif" border="0"  align="absmiddle"></a>&nbsp;&nbsp;&nbsp;</td>
	</tr>
	
	<tr>
		<td>
			<script language="javascript">
			<!--
				function onLoad()
				{
					var msg = '<%=msg%>';
					if ( msg != "" )
						alert(msg);
					else
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
						Cxviewer.FileOpen ("<%=WorkData.DOMAIN%>/doc_form/<%=doc_name_str%>.mrd",  "<%=doc_param%>");
					}
				}
			//-->
			</script>
		</td>
	</tr>
</table>


</body>
</html>
