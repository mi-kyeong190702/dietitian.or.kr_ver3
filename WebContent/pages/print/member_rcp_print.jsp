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
<div class="img-wrapper">
    <img src="/images/print/rcp.png"  class="backimg"/> 
    
	<div style="color: back; position: absolute;top: 200;left: 145;font-size:16px">
	${requestScope.DocuInfo.MEM_DUES_KOR}원 (￦${requestScope.DocuInfo.MEM_DUES})
	</div>
	<div class="wrap" style="color: back; position: absolute;top: 227;left: 145;font-size:16px" width="50" height="120">
		${requestScope.DocuInfo.CODE_MEMBER_STR}
	</div> 
	<div style="color: back; position: absolute;top: 365;left: 180;font-size:16px">
		${requestScope.PRES_LET_DT}
	</div>   
	
	<div style="color: back; position: absolute;top: 155;left: 320;font-size:16px">
		<%=pers_name%>
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
  width: 290px;        /* 원하는 가로 너비 설정 */
  border: 0px solid #000;
  word-wrap: break-word; /* 단어가 길면 줄바꿈 */
  white-space: normal;   /* 줄바꿈 허용 */
  padding: 0px;
  line-height :1.6
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