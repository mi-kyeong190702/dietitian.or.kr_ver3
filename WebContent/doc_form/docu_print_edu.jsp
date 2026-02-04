<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@include file="../pages/common.jsp"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String person_yn = ParamUtils.getParameter(request,"person_yn");
	String operkey = ParamUtils.getParameter(request, "operkey");
	String doc_code = ParamUtils.getParameter(request, "doc_code");
	String doc_seq = ParamUtils.getParameter(request, "doc_seq");
	String admin = ParamUtils.getParameter(request, "admin");
	String isMember = ParamUtils.getParameter(request, "isMember");
	
// 	String doc_name = ParamUtils.getParameter(request, "doc_name").replaceAll("'", "");
	String doc_name ="";
	
	//--- doc_name 조회 [START]
	Connection  conn  = null;
	Statement   stmt  = null;
	ResultSet   rs    = null;	
	String query      = " SELECT detcodename FROM com_code WHERE detcode = '" + doc_code + "' "; // AND use_yn = 'Y' "
	
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:/comp/env");
	   DataSource ds = (DataSource)envCtx.lookup("jdbc/dataSource2");

	   conn = ds.getConnection();
	   stmt = conn.createStatement();
	  	rs = stmt.executeQuery(query);
	   //===================================================

	   while(rs.next()) {          // 쿼리 결과 보여주기
	       String rs_str = rs.getString(1);
	   		if(rs_str!=null){
	   			doc_name = rs_str;
	   		}
	   }

	}catch(SQLException se){
		 out.println("[CONTENT]쿼리 에러 : SQLException ");
	}catch(NullPointerException ne){
		 out.println("[CONTENT]널 에러 : NullPointerException ");
	}catch(Exception e){
		 out.println("[CONTENT]에러 : Exception ");
	} finally { 
		  if (rs != null) try {rs.close(); }catch(SQLException ex) {}
		  if (stmt != null) try {stmt.close(); } catch(SQLException ex) {}
		  if (conn != null) try {conn.close(); }catch(SQLException ex) {}
	}	
	//--- doc_name 조회 [END]
	
	String msg = "";
	
	System.out.println("doc_code 	: " + doc_code);
	System.out.println("doc_seq 	: " + doc_seq);
	System.out.println("admin 	: " + admin);
	System.out.println("doc_name 	: " + doc_name);
	System.out.println("operkey   :" + operkey);
	System.out.println("person_yn    :" + person_yn);
	System.out.println("isMember    :" + isMember);
	
// 	if (sessionInfo.getUserLevel() == 1 )
// 		admin = "Y";
	
/*  	if (doc_code.equals("0105") || doc_code.equals("0108") || admin.equals("Y")){ 
	}else{		
		if( code_pers == null || "".equals(code_pers) )
			msg = "로그인을 해주세요.";
	} */
 	String doc_name_str = "교육결제영수증1";
 	String doc_param 	= "/rv person_yn["+person_yn+"] operkey["+operkey+"] isMember["+isMember+"] ";
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
	<td align="right" width="25%">
		<a href="http://www.dietitian.or.kr/CAB/CX60u_OCX_setup.exe" class="btn small ">설치</a>&nbsp;&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>


<script type="text/javascript">
function onLoad(){
	var msg = '<%=msg%>';
	
	if ( msg != "" )
		alert(msg);
	else
	{
		//0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기
	
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
}
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
