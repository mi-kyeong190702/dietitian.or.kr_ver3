<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

	function f_action(bindex, bpayment){
		//주석 처리
		/* if ( bpayment == '1' ) {
			alert("완납 건은 삭제할 수 없습니다!");
			return;
		} */
		
		if( confirm("정말 삭제하시겠습니까?") ) {
			location.href="purchaseAction.do?crud=D&cd=purchase&bindex="+bindex;
		}
	}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		
			<table class="table t1 text small center">
				<colgroup>
					<col width="80">
					<col width="120">
					<col width="*">
					<col width="120">
					<col width="120">
					<col width="120">
					<col width="120">
					<col width="100">
					<col width="150">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">주문자 이름</th>
					<th scope="col" class="bold cm">주문날짜</th>
					<th scope="col" class="bold cm">주문회원 HP</th>
					<th scope="col" class="bold cm">송금자 이름</th>
					<th scope="col" class="bold cm">입급 예정일</th>
					<th scope="col" class="bold cm">입금일</th>
					<th scope="col" class="bold cm">입금여부</th>
					<th scope="col" class="bold cm">상세정보</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="purchase">
				<tr>
					<td>${purchase.bindex }</td>
					<td>${purchase.bf_name }</td>
					<td class="ca">${purchase.bdate }</td>
					<td>${purchase.bf_Mobile }</td>
					<td>${purchase.bf_PaymentName }</td>
					<td>${purchase.bf_PaymentDate }</td>
					<td>${purchase.bpaymentDate }</td>
					<c:if test="${purchase.bpayment ==0}">
						<td class="cp">
							미납
						</td>
					</c:if>
					<c:if test="${purchase.bpayment ==1}">
						<td class="cs">
							완납
						</td>
					</c:if>
					<td>
						<a href="purchaseForm.do?bindex=${purchase.bindex }" class="btn mr5">보기</a>
						<a href="javascript:f_action('${purchase.bindex }', '${purchase.bpayment }');" class="btn t3">삭제</a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="purchaseExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		</div>
	</div>
</div>
