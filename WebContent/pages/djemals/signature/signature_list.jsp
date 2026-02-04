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
		location.href="signatureAction.do?kn_Code="+id+"&crud=D";
	}
}

function f_print(){
	
	window.open("","signaturepop","width=740,height=740, scrollbars=yes, resizable=yes");
	
	var f = document.forms["signatureForm"];	
	
	f.method = "POST";
	f.target="signaturepop";
	f.action="signaturePrint.do";
	f.submit();
}
	
</script>
<form name="signatureForm">
<input type="hidden" id="cPage" name="cPage" value="${listHelper.curPage}"/> 
</form>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<h3 class="title t2 s1 cm">방통대 식품영양학전공 개설반대 연대 서명 운동 </h3>
			<div class="box t2 p10 mt10" id="contentsPrint">
				<div class="area">
				<c:forEach items="${listHelper.list}" var="signature">
					<table class="table t3 text small center mt5">
						<colgroup>
							<col width="150">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<td class="bold">성명</td>
							<td class="left">${signature.kn_Name }</td>
						</tr>
						<tr>
							<td class="bold">자택주소</td>
							<td class="left">
							<c:if test="${null ne signature.kn_Home_Post }">${signature.kn_Home_Post } </c:if>
							${signature.kn_Home_Addr }
							</td>
						</tr>
						<tr>
							<td class="bold">전화 / 휴대전화</td>
							<td class="left">${signature.kn_Home_Tel } / ${signature.kn_Home_pcs }</td>
						</tr>
						<tr>
							<td class="bold">남기실 말씀</td>
							<td class="left">${signature.kn_Contents }</td>
						</tr>
						<tr>
							<td class="bold">순번 / 공유번호</td>
							<td class="left">${signature.num2 } / ${signature.kn_Code }</td>
						</tr>
						</tbody>
					</table>
					<div class="btn_wrap mt20">
						<ul class="fr">
							<li><a href="javascript:f_action(${signature.kn_Code });" class="btn t3 big">삭제</a></li>
						</ul>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="javascript:f_print();" class="btn big">프린트</a></li>
				</ul>
			</div>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		</div>

		

	</div>
</div>
