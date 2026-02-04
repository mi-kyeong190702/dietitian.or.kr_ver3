<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(id){
	
	if( confirm("정말 삭제하시겠습니까?") ) {
		location.href="fundAction.do?fund_key="+id+"&crud=D";
	}
	
}

function f_print(id){
	window.open("","fundpop","width=740,height=740, scrollbars=yes, resizable=yes");
	
	$("#fund_key").val(id);
	
	var f = document.forms["fundForm"];	
	
	f.method = "POST";
	f.target="fundpop";
	f.action="fundPrint.do";
	f.submit();
}

function f_excel(id){
	
}
	
</script>
<form name="fundForm">
<input type="hidden" id="fund_key" name="fund_key"/> 
<input type="hidden" id="fund_cd" name="fund_cd" value="fund"/> 
</form>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<h3 class="title t2 s1 cm">회관기금</h3>
			<div class="area">
				<div class="ib fl">
					<div class="text mt5">
						Excel은 오른쪽 클릭 후 새창에서 열기를 실행 하세요.
					</div>
				</div>
			</div>

			<table class="table t1 text small center mt5">
				<colgroup>
					<col width="60">
					<col width="100">
					<col width="100">
					<col width="*">
					<col width="100">
					<col width="80">
					<col width="80">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">성명</th>
					<th scope="col" class="bold cm">소속영양사</th>
					<th scope="col" class="bold cm">소속분과</th>
					<th scope="col" class="bold cm">입금은행</th>
					<th scope="col" class="bold cm">금액</th>
					<th scope="col" class="bold cm">Excel</th>
					<th scope="col" class="bold cm">삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="fund">
				<tr>
					<td>${fund.fund_name}</td>
					<td>${fund.fund_group}</td>
					<td>${fund.fund_group_job}</td>
					<td>${fund.fund_bank_name}</td>
					<td>
						<c:choose>
							<c:when test="${fund.fund_guja1 != '기타'}">${fund.fund_guja1}</c:when>
							<c:otherwise>${fund.fund_guja_etc}구좌 (${fund.fund_guja_price}만원)</c:otherwise>
						
						</c:choose>
					</td>
					<td><a href="javascript:f_excel(${fund.fund_key });" class="btn">Excel</a></td>
					<td><a href="javascript:f_action(${fund.fund_key });" class="btn t3">삭제</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>

		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		</div>
		

	</div>
</div>
