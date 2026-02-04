<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@include file="../common.jsp"%>
<%@ page import="kda.SessionInfo" %> 
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME);
%> 
<div class="img-wrapper">
    <img src="/images/print/member_certi.png"  class="backimg"/> 
    
    <!-- 성명 -->
    <div style="color: back; position: absolute;top: 208;left: 310;font-size:17px">
        <%=pers_name%>
    </div>
    <!-- 면허번호 -->
    <div style="color: back; position: absolute;top: 242;left: 310;font-size:17px">
        ${requestScope.UserInfo.lic_no}
    </div>
    <!-- 소속지부 -->
    <div style="color: back; position: absolute;top: 276;left: 310;font-size:17px">
        ${requestScope.UserInfo.code_bran_str}
    </div>
    <!-- 유효기간 -->
    <div style="color: back; position: absolute;top: 311;left: 310;font-size:17px">
	    ${requestScope.DUE_DT}
	</div>
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<div style="color: back; position: absolute;top: 423;left: 300;font-size:17px">
        <fmt:formatDate value="${now}" pattern="yyyy" />   
    </div>
    <div style="color: back; position: absolute;top: 423;left: 390;font-size:17px">
        <fmt:formatDate value="${now}" pattern="MM" />   
    </div>
    <div style="color: back; position: absolute;top: 423;left: 450;font-size:17px">
        <fmt:formatDate value="${now}" pattern="dd" />   
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
  width: 827px;
  height: 585px;
}

.backimg {
  margin : 10px;
  display: block;
  background: url("/images/print/member_certi.png")  no-repeat center/cover;
  width: 100%;
  height: 585px;
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