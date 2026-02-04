<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %> 
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>
 
<%@ page import="kda.SessionInfo" %>
<title>영수증</title> 
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME);  
     
%>
<div class="img-wrapper">
    <img src="/images/print/rcp.png"  class="backimg"/> 
	<input type="hidden" id="newCostHidden" name="newCostHidden" value="${requestScope.DocuInfo.NEW_COST}">   
	<div style="color: black; position: absolute;top: 200;left: 145;font-size:16px">
	    ${requestScope.DocuInfo.NEW_COST_KOR }원 (￦${requestScope.DocuInfo.NEW_COST}) 
	</div>
	
	<div class="wrap" style="color: black; position: absolute;top: 202;left: 145;font-size:16px" width="50" height="120">
		${requestScope.DocuInfo.EDUNAME}
	</div>
	<div style="color: black; position: absolute;top: 155;left: 320;font-size:16px">  
		 ${requestScope.DocuInfo.OPER_NAME} 
	</div>
	<div style="color: black; position: absolute;top: 370;left: 180;font-size:16px;">
		${requestScope.DocuInfo.CONFIRM_DT} 
	</div>  
</div>   
<style>

@page {
  size: A4;
  margin: 0;
}
html, body {
  width: 210mm;
  height: 150mm;
  margin: 0;
  padding: 0;
}
.img-wrapper {
  position: relative;
  width: 794px;
  height: 1002px;
}

.backimg {
  margin : 20px;
  display: block;
  background: url("/images/print/rcp.png")  no-repeat center/cover;
  width: 447px;
  height: 618px;
}
 
.wrap {
  width: 310px;
  word-wrap: break-word;
  white-space: pre-line;  
  line-height: 1.6;
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