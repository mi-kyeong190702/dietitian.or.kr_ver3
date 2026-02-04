<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@ page import="kda.SessionInfo" %> 
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME);
    
%>
<c:forEach var="docu" items="${requestScope.DocuInfo}"> 
<div class="backimg">
    <img src="/images/print/edu_certi.png"  class="backimg"/>
	<!-- 증서번호 -->    
	<div style="color: black; position: absolute;top: 140;left: 235;font-size:16px">
	${docu.result_no} </div>
	  
	<!-- 성명 -->    
	<div style="color: black; position: absolute;top: 385;left: 260;font-size:16px">
	${docu.oper_name}  </div>
	
	<!-- 생년월일 -->
	<div style="color: black; position: absolute;top: 430;left: 260;font-size:16px">
		${docu.birth} 
	</div>
	 
	<!-- 면허번호 -->
	<div style="color: black; position: absolute;top: 475;left: 260;font-size:16px">
		${docu.oper_lic_no} 
	</div> 
	
	<!-- 교육명 -->
	<div class="wrap" style="color: black; position: absolute;top: 490;left: 260;font-size:16px">
		${requestScope.DocuInfoNm.edutest_name} 
	</div> 
	
	<!-- 교육기간 -->
	<div style="color: black; position: absolute;top: 606;left: 260;font-size:16px">
		${docu.oper_start_dt}
	</div> 
	<div style="color: black; position: absolute;top: 606;left: 417;font-size:16px">
       <b>~</b>
    </div> 
	<div style="color: black; position: absolute;top: 606;left: 450;font-size:16px">
		${docu.oper_end_dt} 
	</div> 
	
	<!-- 교육시간 -->
	<div  style="color: black; position: absolute;top: 650;left: 260;font-size:16px">
		${docu.time_cnt} 
	</div> 
	
	
	<!-- 이수날짜 -->
	<div style="color: black; position: absolute;top: 800;left: 310;font-size:18px">
		${docu.oper_end_dt2} 
	</div> 
</div>
</c:forEach>
<style>

@page {
  size: A4;
  margin: 0;
}
html, body {
  width: 210mm;
  height: 297mm;
  margin: 0;
  padding: 0;
}
.img-wrapper {
  position: relative;
  width: 794px;
  height: 1122px;
}

.backimg {
  display: block;
  background: url("/images/print/edu_certi.png")  no-repeat center/cover;
  width: 100%;
  height: 100%;
}
 
.wrap {
  width: 430px;
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