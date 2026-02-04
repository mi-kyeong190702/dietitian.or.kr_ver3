<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.*" %> 
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@include file="../common.jsp"%>
<%@ page import="kda.SessionInfo" %>
<title>거래명세서</title>  
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME); 
     
%> 

<c:set var="rowH" value="50"/>
<c:set var="pageSize" value="13"/>
<c:set var="baseTop" value="400"/>
<c:set var="total" value="${fn:length(booklist)}"/>

<c:forEach var="start" begin="0" end="${total-1}" step="${pageSize}">
  <c:set var="end" value="${start + pageSize}"/>
  <c:if test="${end > total}">
    <c:set var="end" value="${total}"/>
  </c:if>

  <!-- 페이지용 부분 리스트 만들기 -->
  <c:set var="pageList" value="${booklist.subList(start, end)}"/>

  <div class="page">
    <div class="img-wrapper">
      <img src="/images/print/trsDetails.png" class="backimg"/>

      <!-- 헤더 --> 
   <c:set var="raw" value="${result.bpaymentDate}" />
   <div style="color: black; position: absolute;top: 120;left: 85;font-size:16px">
      ${fn:substring(raw,0,4)}
   </div>
   <div style="color: black; position: absolute;top: 120;left: 155;font-size:16px">
       ${fn:substring(raw,5,7)}
   </div>
   <div style="color: black; position: absolute;top: 120;left: 204;font-size:16px">
      ${fn:substring(raw,8,10)}
   </div>
   <!-- 이름 -->
   <div style="color: black; position: absolute;top: 188;left: 200;font-size:16px">
      ${result.bf_name}
   </div>    
   <!-- 금액 -->
   <div style="color: black; position: absolute;top: 315;left: 130;font-size:16px">
      ${result.getBf_Price_kor()}
   </div>
   <div style="color: black; position: absolute;top: 315;left: 420;font-size:16px">
       <fmt:formatNumber type="currency" value="${result.getBf_Price()}" pattern="###,###" />
   </div>
   <div style="color: black; position: absolute;top: 1049;left: 530;font-size:16px">
     <fmt:formatNumber type="currency" value="${result.getBf_Price()}" pattern="###,###" />
   </div>
  

      <!-- 현재 페이지 행들 -->
      <c:forEach var="item" items="${pageList}" varStatus="row">
        <div style="
	      position:absolute;
	      top:${baseTop + (row.index * rowH)}px;
	      left:80px;
	      font-size:16px;
	      width:240px;
	      /* 줄 높이와 행 높이 */
	      line-height:21px; 
	
	      /* flexbox로 세로 중앙 정렬 */
	      display:flex;
	      align-items:center;      /* 세로 중앙 */
	      justify-content:flex-start; /* 가로는 왼쪽 정렬 */
	
	      /* 줄바꿈 설정 */
	      white-space:normal;
	      word-break:break-word;
	      overflow-wrap:anywhere;
	      overflow:hidden;
	      display: -webkit-box;
	      -webkit-line-clamp: 2;   /* 최대 줄 수 */
	      -webkit-box-orient: vertical;">
	    ${item.oTitle}
	  </div>

  <!-- 규격 -->
  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:350px;">
    ${item.std_nm}
  </div>

  <!-- 수량 -->
  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:450px;">
    ${item.eEa}
  </div>

  <!-- 단가 -->
  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:500px; width:60px; text-align:right;">
    <fmt:formatNumber value="${item.ePrice1}" pattern="###,###"/>
  </div>

  <!-- 공급가액 -->
  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:620px; width:60px; text-align:right;">
    <fmt:formatNumber value="${item.ePrice2}" pattern="###,###"/>
  </div>

  <!-- 세액 -->
  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:730px;">
    -
  </div>
         
      </c:forEach>

    </div>
  </div>
</c:forEach>

<style>

@page {
  size: A4;
  margin: 15mm 12mm 12mm 12mm; /* 상,우,하,좌 */
}

html, body {
  margin: 0;
  padding: 0;
  height: 100%;
}

/* 화면에서 미리보기용 */
@media screen {
  body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f6f6f6;
  }
}

/* A4 프레임 */
.page {
  width: 210mm;
  height: 297mm;
  background: #fff;
  position: relative;
  box-sizing: border-box;

  /* 페이지 사이 여백 (미리보기에서만 적용됨) */
  margin-bottom: 20mm;  /* 👈 페이지 간 간격 */
  padding: 0;
  overflow: hidden;
}

/* 절대 배치 기준 */
.img-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
}

/* 거래명세서 배경 이미지 */
.backimg {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;  /* A4 비율로 제작된 이미지라면 fill/contain */
  z-index: 0;
}

@media print {
  .page {
    page-break-after: always;
    margin-bottom: 0; /* 👈 인쇄 시엔 여백 제거 */
  }
  .page:last-child {
    page-break-after: auto;
  }
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