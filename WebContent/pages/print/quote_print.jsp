<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.*" %> 
<%@ page import="kda.utils.ParamUtils" %>
<%@ page import="kda.WorkData"%>

<%@include file="../common.jsp"%>
<%@ page import="kda.SessionInfo" %> 
<title>견적서</title>
<%
	String code_pers = (String) session.getAttribute(SessionInfo.CODE_PERS);	
    String pers_name =  (String) session.getAttribute(SessionInfo.PERS_NAME); 
     
%>


<c:set var="rowH" value="50"/>
<c:set var="pageSize" value="13"/>
<c:set var="baseTop" value="430"/>
<c:set var="totalCount" value="${fn:length(booklist)}"/>


<c:forEach var="start" begin="0" end="${totalCount-1}" step="${pageSize}">
  <c:set var="end" value="${start + pageSize}"/>
  <c:if test="${end > totalCount}">
    <c:set var="end" value="${totalCount}"/>
  </c:if>
  
  <!-- 페이지용 부분 리스트 만들기 -->
  <c:set var="pageList" value="${booklist.subList(start, end)}"/>

  <div class="page">
    <div class="img-wrapper">
      <img src="/images/print/quote.png" class="backimg"/>
   
       <!-- 주문일 -->
	    <c:set var="arr" value="${fn:split(result.bf_PaymentDate, '-')}" />
	    <div style="color: black; position: absolute;top: 140;left: 60;font-size:16px">
	       ${arr[0]}
	    </div>
	    <div style="color: black; position: absolute;top: 140;left: 130;font-size:16px">
	       ${arr[1]}
	    </div>
	    <div style="color: black; position: absolute;top: 140;left: 180;font-size:16px">
	       ${arr[2]}
	    </div>
	    <!-- 이름 -->
	    <div style="color: black; position: absolute;top: 182;left: 210;font-size:16px">
	       ${result.bf_name}
	    </div>    
	    <!-- 금액 -->
	    <div style="color: black; position: absolute;top: 335;left: 40;font-size:16px">
	       ${result.getBf_Price_kor()}
	    </div>
	    <div style="color: black; position: absolute;top: 335;left: 270;font-size:16px">
	      <fmt:formatNumber type="currency" value="${result.getBf_Price()}" pattern="###,###" />
	    </div>
	    
	    <!-- 합산금액-->
	    <div style="color: black; position: absolute;top: 1085;left: 390;font-size:16px">
	       ${total.totalEa}
	    </div>
	    <div style="color: black; position: absolute;top: 1085;left: 555;font-size:16px">
	      <fmt:formatNumber type="currency" value="${total.totalAmt}" pattern="###,###" />
	    </div> 
     
		<!-- 이번 페이지 아이템들: 반드시 pageList 사용 -->
		<c:forEach var="item" items="${pageList}" varStatus="row">
		  <!-- 페이지 내 상대 행(row.index: 0부터 시작) -->
		  <div style="
		    position:absolute;
		    top:${baseTop + (row.index * rowH)}px;
		    left:30px;
		    font-size:16px;
		    width:230px;
		    line-height:21px;
		    height:${rowH}px;
		    display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;
		    white-space:normal; word-break:break-word; overflow:hidden; text-overflow:ellipsis;">
		    ${item.oTitle}
		  </div>
		
		  <!-- 규격 -->
		  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:300px; font-size:16px;">
		    ${item.std_nm}
		  </div>
		
		  <!-- 수량 -->
		  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:395px; font-size:16px;">
		    ${item.eEa}
		  </div>
		
		  <!-- 단가 -->
		  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:445px; width:60px; text-align:right; font-size:16px;">
		    <fmt:formatNumber value="${item.ePrice1}" pattern="###,###"/>
		  </div>
		
		  <!-- 공급가액 -->
		  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:543px; width:80px; text-align:right; font-size:16px;">
		    <fmt:formatNumber value="${item.ePrice2}" pattern="###,###"/>
		  </div>
		
		  <!-- 세액 -->
		  <div style="position:absolute; top:${baseTop + (row.index * rowH) + 10}px; left:673px; font-size:16px;">
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