<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@include file="../common.jsp"%>
<%@ page import="kda.SessionInfo" %> 
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME);
%> 
  
<!-- <img src="/images/print/back.png" width="827px" height="1169px"> -->
<div style="color: back; position: absolute;top: 180;left: 600;font-size:16px">
<%=pers_name%> ${requestScope.UserInfo.code_call}</div>
<div style="color: back; position: absolute;top: 360;left: 545;font-size:17px">
	${requestScope.DocuInfo.MEM_DUES}
</div>
<div style="color: back; position: absolute;top: 430;left: 380;font-size:15px">
	${requestScope.DocuInfo.CODE_MEMBER_STR}
</div>
<div style="color: back; position: absolute;top: 430;left: 523;font-size:15px">
	${requestScope.DocuInfo.MEM_DUES}
</div>
<div style="color: back; position: absolute;top: 665;left: 450;font-size:16px">
	${requestScope.PRES_LET_DT}
</div>   

<div style="color: back; position: absolute;top: 333;left: 555;font-size:15px">
	<%=pers_name%>
</div>
<div style="color: back; position: absolute;top: 705;left: 162;font-size:15px">
	<%=pers_name%>
</div> 
<div style="color: back; position: absolute;top: 730;left: 162;font-size:15px">
	${requestScope.UserInfo.lic_no}
</div>
<div style="color: back; position: absolute;top: 752;left: 162;font-size:15px">
	${requestScope.UserInfo.code_bran_str}
</div> 
<div style="color: back; position: absolute;top: 775;left: 162;font-size:15px">
	${requestScope.DUE_DT}
</div>  
<style>
body {
  background: url("/images/print/rcp.png") no-repeat;
   background-size: 750px 1000px;
}

</style> 

<script type="text/javascript">
window.onload = function() { 
	
	setTimeout(function () {  
		window.print();
		window.close(); 
		}, 
        500);  	   
	}
</script>