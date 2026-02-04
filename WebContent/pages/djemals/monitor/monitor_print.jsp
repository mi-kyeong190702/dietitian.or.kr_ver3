<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>대한영양사협회</title>
	<link rel="stylesheet" type="text/css" href="/djemals/css/import.css" />  
	<link rel="stylesheet" type="text/css" href="/djemals/css/import.css" />  
	<link rel="stylesheet" type="text/css" href="/djemals/css/admin_common.css" /> 
	<link rel="stylesheet" type="text/css" href="/djemals/css/adm_layout.css" />   
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<script type="text/javascript">
		
	</script>
	
</head>

<body>

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
			
		</div>

</body>
<script>
window.print();
</script>
