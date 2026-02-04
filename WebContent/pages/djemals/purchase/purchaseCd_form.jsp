<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<table class="table t1 text small center">
				<colgroup>
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">주문자료 리스트</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="totalPrice" value="0"/>
				<c:set var="price" value="0"/>
				<c:forEach items="${goods}" var="goods">
				<tr>
					<td class="left">${goods.ctGoodsName } ${goods.eea }부 :
						<c:choose>
							<c:when test="${purchase.buserId !='' && null ne purchase.buserId }"> 
								<c:set var="price" value="${goods.eprice1*goods.eea }" />
							</c:when>
							<c:otherwise>
								<c:set var="price" value="${goods.eprice2*goods.eea }" />
							</c:otherwise>
						</c:choose>
						<c:set var="totalPrice" value="${totalPrice+price }"/>
						${price } 원
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="right bold">총 결제 금액 : <c:out value="${totalPrice }"/> 원</td>
				</tr>
				</tbody>
			</table>
			<%-- <table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">결제정보</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${purchase.pay_Gubun == 'CARD' }">
				<tr>
					<td class="bold">카드결제</td>
					<td class="cp left">카드결제 확인요망</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td class="bold">입금은행</td>
					<td class="cp left">신한은행 : 385-05-006159</td>
				</tr>
				<tr>
					<td class="bold">예금주</td>
					<td class="left">대한영양사협회</td>
				</tr>
				<tr>
					<td class="bold">입금예정일</td>
					<td class="left">${purchase.bf_PaymentDate }</td>
				</tr>
				<tr>
					<td class="bold">송금자이름</td>
					<td class="left">${purchase.bf_PaymentName }</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table> --%>
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">주문회원정보</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">이름</td>
					<td class="left">${purchase.bf_name }</td>
				</tr>
				<tr>
					<td class="bold">면허번호</td>
					<td class="left">${purchase.bf_license }</td>
				</tr>
				<tr>
					<td class="bold">전화번호</td>
					<td class="left">${purchase.bf_Tel }</td>
				</tr>
				<tr>
					<td class="bold">휴대전화</td>
					<td class="left">${purchase.bf_Mobile }</td>
				</tr>
				<tr>
					<td class="bold">이메일</td>
					<td class="left">${purchase.bf_Email }</td>
				</tr>
				<%-- <tr>
					<td class="bold">수령방법</td>
					<td class="left">
					<c:choose>
					<c:when test="${purchase.bf_Delivery == 0 }">일반배송</c:when>
					<c:otherwise>택배</c:otherwise>
					</c:choose>					
					</td>
				</tr> --%>
				</tbody>
			</table>
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">수령지정보</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">수령자이름</td>
					<td class="left">${purchase.bt_name }</td>
				</tr>
				<tr>
					<td class="bold">주소</td>
					<td class="left"><span>${fn:substring(purchase.bt_Post, 0, 3) } - ${fn:substring(purchase.bt_Post, 3, 6) } </span><br />${purchase.bt_Address }</td>
				</tr>
				<tr>
					<td class="bold">전화번호</td>
					<td class="left">${purchase.bt_Tel }</td>
				</tr>
				<tr>
					<td class="bold">휴대전화</td>
					<td class="left">${purchase.bt_Mobile }</td>
				</tr>
				</tbody>
			</table>
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">부가정보</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">필요서류</td>
					<td class="left">${purchase.bt_Paper }</td>
				</tr>
				<tr>
					<td class="bold">기타주문사항</td>
					<td class="left">${purchase.bt_Text }</td>
				</tr>
				</tbody>
			</table>
			
			<c:if test="${purchase.bpayment == 1 }">
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">입금확인</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">입금확인 날짜</td>
					<td class="left">
					${ purchase.bpaymentDate }
					</td>
				</tr>
				</tbody>
			</table>
			</c:if>

			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="purchaseCdList.do" class="btn big">목록</a></li>
				</ul>
				<c:if test="${purchase.bpayment != 1 }">
				<ul class="fr">
					<li><a href="purchaseAction.do?bindex=${purchase.bindex }&crud=U&cd=group" class="btn big t1">입금확인</a></li>
				</ul>
				</c:if>
			</div>
			

		</div>
	</div>
</div>
