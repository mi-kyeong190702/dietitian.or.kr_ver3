<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_print(){
	
	window.open("","monitorpop","width=740,height=740, scrollbars=yes, resizable=yes");
	
	var f = document.forms["monitorForm"];	
	
	f.method = "POST";
	f.target="monitorpop";
	f.action="monitorPrint.do";
	f.submit();
}
</script>
<form name="monitorForm">
<input type="hidden" id="mcode" name="mcode" value="${monitor.mcode}"/>
</form>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">개인정보</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">성명</td>
					<td class="left">${monitor.m_name }</td>
				</tr>
				<tr>
					<td class="bold">주소</td>
					<td class="left">${monitor.m_post }<br/>${monitor.m_addr }</td>
				</tr>
				<tr>
					<td class="bold">연락처</td>
					<td class="left">${monitor.m_tel }</td>
				</tr>
				<tr>
					<td class="bold">등록일</td>
					<td class="left">
					<fmt:parseDate var="dateString" value="${monitor.indate}" pattern="yyyyMMddHHmmss" />
					<fmt:formatDate value="${dateString}"  pattern="yyyy-MM-dd"/>
					</td>
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
					<th colspan="2"scope="col" class="bold cm">이번 달 국민영양에서 유익했던 칼럼과 이유는? (3개까지 복수 응답 가능)</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun01_01 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text01_01 }</td>
				</tr>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun01_02 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text01_02 }</td>
				</tr>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun01_03 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text01_03 }</td>
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
					<th colspan="2"scope="col" class="bold cm">이번 달 국민영양에서 아쉬웠던 칼럼과 이유는? (3개까지 복수 응답 가능)</th>
				</tr>
				</thead>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun02_01 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text02_01 }</td>
				</tr>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun02_02 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text02_02 }</td>
				</tr>
				<tr>
					<td class="bold">선택값</td>
					<td class="left">${monitor.s_gubun02_03 }</td>
				</tr>
				<tr>
					<td class="bold">이유</td>
					<td class="left">${monitor.s_text02_03 }</td>
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
					<th colspan="2"scope="col" class="bold cm">앞으로 국민영양에서 다루었으면 하는 내용은?</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">내용</td>
					<td class="left">${monitor.s_text03_01 }</td>
				</tr>
				</tbody>
			</table>
			

			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="monitorList.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_print();" class="btn big">프린트</a></li>
					<li><a href="monitorExcel.do?mcode=${monitor.mcode }" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			

		</div>
	</div>
</div>
