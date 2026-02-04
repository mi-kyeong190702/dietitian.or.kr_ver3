<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
 
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">구매정보</mark> 상세보기</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/kp_publishing_detail.do?bindex=${result.bindex}" class="cm">구매정보 상세보기</a></li>
			</ul>
		</div>
	</div>
	<div class="top-pre">
      <form action="/work/publication/kp_publishing_action.do" method="post">
        <button type="submit" class="pre-button">이전</button>
      </form>
    </div>
	<hr />
	<div class="sp_body">
	    <table class="order-table"> 
	     <tbody>
		    <tr>
		      <th width="30%">주문자료명 및 수량</th>
		      <td style="line-height:150%">${result.getOTitle_combined()}</td>
		    </tr> 		 
		    <tr>
		      <th>총 구매가격</th>
		      <td>
		          <fmt:formatNumber type="currency" value="${result.getBf_Price()}" pattern="###,###" />원
              </td>
		    </tr>
		    <tr>
		      <th>주문일</th>
		      <td>${result.bdate}</td>
		    </tr>
		    <tr>
		      <th>이름</th>
		      <td>${result.bf_name}</td>
		    </tr>
		    <tr>
		      <th>휴대폰</th>
		      <td>${result.bf_Mobile}</td>
		    </tr>
		    <tr>
		      <th>생년월일</th>
		      <td>${result.bf_birth}</td>
		    </tr>
		    <tr>
		      <th>이메일</th>
		      <td>${result.bf_Email}</td>
		    </tr>
		    <tr>
		      <th>배송주소</th>
		      <td>${result.bt_Address}</td>
		    </tr>
		    <tr>
		      <th>결제방법</th>
		      <td>
		      <c:if test="${result.pay_Gubun == 'GIRO'}" >무통장입금</c:if>
		      <c:if test="${result.pay_Gubun == 'CARD'}" >영양사 카드</c:if>
		      </td>
		    </tr>
		    <c:if test="${result.pay_Gubun == 'GIRO'}" >
		    <tr>
		      <th>입금정보</th>
		      <td>신한은행 : 140-006-740640 (예금주 : (사)대한영양사협회)</td>
		    </tr>
		    </c:if>
		  </tbody>
		</table>
	</div> 
</div> 
			
<style>
    .order-table {
	  width: 100%;
	  border-collapse: collapse;      /* 셀 경계선을 붙여서 한 줄로 보이게 */
	  margin: 1em 0;
	  table-layout: fixed;            /* 너비 비율을 고정 */
	}
	
	.order-table th,
	.order-table td {
	  border: 1px solid #000;         /* 검은 실선 테두리 */
	  padding: 8px 12px;              /* 충분한 여백 */
	  vertical-align: top;            /* 내용이 길어져도 위쪽 정렬 */
	}
	
	.order-table th {
	  background-color: #f4f4f4;      /* 헤더 배경 */
	  font-weight: bold;
	  text-align: left;
	}
	
	.order-table th[colspan="2"] {
	  /* 첫 번째 행(제목)은 좌우 넓이를 동일하게 */
	  text-align: left;
	}
	
	/* 왼쪽 열(라벨) 스타일 */
	.order-table td:first-child {
	  font-weight: bold;
	  width: 30%;                     /* 라벨 영역 비율 */
	  white-space: nowrap;            /* 줄바꿈 방지 */
	}
	
	/* 오른쪽 열(값) */
	.order-table td:last-child {
	  width: 70%;                     /* 값 영역 비율 */
	  word-break: break-word;         /* 긴 문자열은 줄바꿈 */
	}
	
	.top-pre {
	  text-align: right;   /* 오른쪽 정렬 */
	  margin: 10px 20px;   /* 상단 여백, 우측 여백 */
	}
	
	.pre-button {
	  background-color: #333;
	  color: white;
	  border: none;
	  padding: 6px 12px;
	  border-radius: 4px;
	  cursor: pointer;
	}
	
	.pre-button:hover {
	  background-color: #555;
	}

  </style> 
