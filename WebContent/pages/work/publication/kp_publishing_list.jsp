<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
  // Navigation Timing Level 2 방식 (모던 브라우저)
  window.addEventListener('load', function() {
    const [nav] = performance.getEntriesByType('navigation');
    if (nav && nav.type === 'reload') {
      // 새로고침일 때만 이동
      window.location.href = '/work/publication/kp_publishing_action.do';
    }
  });


  function f_action(bindex){ 
      
      if( confirm("정말 삭제하시겠습니까?") ) {
          location.href="/work/publication/kp_publishing_cancel.do?crud=D&cd=purchase&bindex="+bindex;
      }
  }
  
  function f_detail(bindex){ 
      
      location.href="/work/kp_publishing_detail.do?bindex="+bindex;    
  }
  
  function f_quote(bindex,gb){ 
      
      
      
      shape  = "width=750,height=700,";
      shape += "toolbar=no,location=no,directories=no,status=no,";
      shape += "menubar=no,scrollbars=no,resizable=yes";
      path   ="/work/kp_publishing_print.do?bindex="+bindex+"&gb="+gb;    
      
      xx = screen.availWidth;
      yy = screen.availHeight;
      sxx = 0;
      syy = 0;
      sxx = (xx/2) - 200;
      syy = (yy/2) - 90;

      shape = shape + ", top=" + syy + ", left=" + sxx;

      window.open(path, "kp_publishing_print", shape);
  }
  
  
 function f_rcp(bindex){ 
      
      
      
      shape  = "width=750,height=700,";
      shape += "toolbar=no,location=no,directories=no,status=no,";
      shape += "menubar=no,scrollbars=no,resizable=yes";
      path   ="/work/kp_publishing_rcp.do?bindex="+bindex;    
      
      xx = screen.availWidth;
      yy = screen.availHeight;
      sxx = 0;
      syy = 0;
      sxx = (xx/2) - 200;
      syy = (yy/2) - 90;

      shape = shape + ", top=" + syy + ", left=" + sxx;

      window.open(path, "kp_publishing_rcp", shape);
  }
  
  
  


</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">MY</mark> 구매정보</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_publishing_login.do" class="cm">MY 구매정보</a></li>
			</ul>
		</div>
	</div> 
    <div class="top-logout">
	  <form action="/work/publication/kp_publishing_logout.do" method="post">
	    <button type="submit" class="logout-button">로그아웃</button>
	  </form>
	</div>
	<hr />
	 <form action="kp_publishing_action.do" name="frmColumn" modelAttribute="column" method="post">
	   <input type="hidden" id="user_name" name="user_name" value="${user_info.bf_name}" >
       <input type="hidden" id="user_phone" name="user_phone" value="${user_info.bt_Tel}">
       <input type="hidden" id="user_birth" name="user_birth" value="${user_info.bf_birth}">
     </form>
	<div class="sp_body">
	     <div class="info-box">
		  <div class="info-message">
		    <div class="info-left">
		   • 교육자료(판매품) 구매내역입니다.<br>
		   • 구매하신 자료는 입금완료일로부터 1주일 이내에<br>&nbsp;&nbsp;&nbsp;&nbsp;수령 가능합니다.
		    </div>
		    <div class="info-right">
		   • 문의처 : 교육국 <a href="mailto:kdabook@kdiet.or.kr">kdabook@kdiet.or.kr</a><br>
		   • 입금 : 신한은행 140-006-740640<br>&nbsp;&nbsp;&nbsp;&nbsp;(예금주 : (사)대한영양사협회)<br>
		   • 배송료 : 50,000원 미만의 자료의 경우 택배 발송비<br>&nbsp;&nbsp;&nbsp;&nbsp;3,000원이 추가됩니다.
		    </div>
		  </div>
		  <div class="info-buttons">
		    <a href="/assets/ver2/download/data/협회 사업자등록증.pdf" download class="btn-download">사업자등록증</a>
		    <a href="/assets/ver2/download/data/교육자료(판매품) 통장사본.pdf" download class="btn-download">통장사본</a>
		    <a href="https://walla.my/v/h8FgLbs3KbdnJ1qPvWHv" target="blank" class="btn-download"> 계산서/현금영수증 신청</a>
		  </div>
		</div>
	<table class="purchase-table">
  <thead>
    <tr>
      <th style="width:5%">No</th>
      <th style="width:33%">구매내역</th>
      <th style="width:12%">금액</th>
      <th style="width:13%">구매일</th>
      <th style="width:15%">결제상태</th>
      <th style="width:11%">구매정보<br>상세보기</th>
      <th style="width:11%">구매신청 취소</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="item" items="${resultList}">
    <tr>
    <td>${item.rn} </td>
    <td>${item.oTitle_combined} </td>
    <td>
        <fmt:formatNumber type="currency" value="${item.price}" pattern="###,###" />원
     </td>
    <td>${item.bDate} </td>
    <td>${item.bPayment_nm}
    <c:if test="${item.bPayment == true}">
        <a href="javascript:f_quote(${item.bIndex},'1')" >
            <span class="btn red">견적서</span>  
        </a>
        <a href="javascript:f_rcp(${item.bIndex})" > 
            <span class="btn pink">영수증</span>
        </a>
        <a href="javascript:f_quote(${item.bIndex},'2')" > 
            <span class="btn pink">거래명세서</span>
        </a>
    </c:if>
    <c:if test="${item.bPayment == false}">
        <a href="javascript:f_quote(${item.bIndex},'1')" >
            <span class="btn red">견적서</span>  
        </a>
    </c:if>  
     </td>
    <td>
        <a href="javascript:f_detail(${item.bIndex})" >
            <button class="button" style="margin: 5px;">&nbsp;상세&nbsp;<br>&nbsp;보기&nbsp;</button>
        </a>
    </td>
    <td>
	    <c:if test="${item.bPayment == false}">
	        <a href="javascript:f_action(${item.bIndex})" ><button class="button">취소</button></a>
	    </c:if>
    </td>
    </tr>
   </c:forEach>    
  </tbody>
</table>
<!-- 페이징 영역 -->
<div class="pagination">
  <c:if test="${currentPage > 1}">
    <a href="?page=${currentPage - 1}">&laquo;</a>
  </c:if>

  <c:forEach var="i" begin="1" end="${totalPages}">
    <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
  </c:forEach>

  <c:if test="${currentPage < totalPages}">
    <a href="?page=${currentPage + 1}">&raquo;</a>
  </c:if>
</div>
</div> 
 
<style>
.info-box {
  background: #faf4e7;        /* 연한 베이지 배경 */
  border: 1px solid #e4d6b0;  /* 살짝 진한 베이지 테두리 */
  padding: 16px;
  border-radius: 4px;
  font-size: 14px;
  line-height: 1.6;
  margin-bottom: 5px;
}

.info-message {
  display: flex;
  justify-content: space-between;
  gap: 16px;
}

.info-left,
.info-right {
  width: 48%;
}

.info-right a {
  color: #3a78d7;
  text-decoration: none;
}

.info-buttons {
  margin-top: 12px;
  text-align: left;
}

.info-buttons button {
  background: #3a78d7;
  color: #fff;
  border: none;
  padding: 8px 14px;
  margin-left: 8px;
  border-radius: 3px;
  cursor: pointer;
  font-size: 13px;
}

.info-buttons button:hover {
  background: #335ea0;
}

/* 반응형: 화면이 좁아지면 세로로 쌓이도록 */
@media (max-width: 600px) {
  .info-message {
    flex-direction: column;
  }
  .info-left,
  .info-right {
    width: 100%;
  }
  .info-buttons {
    text-align: center;
  }
  .info-buttons button {
    margin: 6px 4px;
  }
}
.purchase-table {
  width: 100%;
  border-collapse: collapse;
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 14px;
}

.purchase-table th, .purchase-table td {
  border: 1px solid #ddd;
  padding: 9px;
  text-align: center;
  line-height: 1.2;
}

.purchase-table th {
  background-color: #f5f5f5;
  font-weight: bold;
}

.btn {
  display: inline-block;
  padding: 4px 10px;
  margin-left: 5px;
  border-radius: 4px;
  font-size: 12px;
  color: white;
  font-weight: 500;
}

.btn.red {
  background-color: #b00020;
}

.btn.pink {
  background-color: #e91e63;
}

.btn.blue {
  background-color: #3f51b5;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.pagination a {
  color: black;
  padding: 8px 12px;
  margin: 0 4px;
  border: 1px solid #ddd;
  border-radius: 4px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-color: #4CAF50;
}

.pagination a:hover:not(.active) {
  background-color: #eee;
}

.top-logout {
  text-align: right;   /* 오른쪽 정렬 */
  margin: 10px 20px;   /* 상단 여백, 우측 여백 */
}

.logout-button {
  background-color: #333;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
}

.logout-button:hover {
  background-color: #555;
}

.btn-download {
  display: inline-block;
  padding: 8px 16px;
  background-color: #3a78d7;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  font-size: 14px;
}

.btn-download:hover {
  background-color: #2d5eaa;
}

</style>

