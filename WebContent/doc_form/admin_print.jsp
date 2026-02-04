<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if ( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
		response.setHeader("Pragma", "no-cache");
	} else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
		response.setHeader("Cache-Control", "no-cache");
	}

	response.setDateHeader("Expires", 0);
	
	String adminid = ParamUtils.getParameter(request,"loginID");
	if( adminid.equals("")) {
		out.println("<script>");
		out.println("alert('관리자 페이지 로그인 후 사용해 주십시요')");
		out.println("window.close()");
		out.println("</script>");
		return;
	}
	

	String doc_type = ParamUtils.getParameter(request,"doc_type");
	String doc_no =  ParamUtils.getParameter(request, "doc_no");
	String doc_pros = ParamUtils.getParameter(request,"doc_pros");

	String doc_name = "문서작성가이드";
%>
<sql:setDataSource var="dataSource3" dataSource="jdbc/dataSource2" />
<sql:query dataSource="${dataSource3}" var="admin">
SELECT UserId, UserPW, UserName, UserBran, UserPower, use_yn 
FROM User_Master
WHERE UserId = '${UserId}'
</sql:query>
<c:choose>
	<c:when test="${ admin eq null }">
		<script>
			alert("관리자만 해당 페이지를 사용 하실 수 있습니다.");
			window.close();
		</script>
	</c:when>
	<c:otherwise>


<html>
<head>
	<title><%=doc_name%></title>
	<link href="/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/layout.css" rel="stylesheet" type="text/css">
	<script>
	function initForm(form) {
		form.code_dept.length = category.length;
		for (i = 0; i < category.length; i++){
			form.code_dept[i].value = category[i].value;
		   	form.code_dept[i].text = category[i].text;
		   	form.code_dept.selectedIndex = 0;
		   	form.code_doc.selectedIndex = 0;
		}
		change_dept(form);
	}
	 
	function change_dept(form) {
		var i = form.code_dept.selectedIndex;
		form.code_doc.length = category[i].length;
		  
		  for (j = 0; j < docform.code_doc.length; j++){
		   form.code_doc[j].value = category[i][j].value;
		   form.code_doc[j].text = category[i][j].text;
		   form.code_doc.selectedIndex = 0;
		  }
		change_doc(form);
	}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;"onLoad="initForm(document.docform);loadRD('0','문서작성가이드');">	
	
	
</body>
</html>
	
	</c:otherwise>
</c:choose>
