<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h3 class="title t2 s1 cm">방통대 식품영양학전공 개설반대 연대 서명 운동 </h3>
			<div class="box t2 p10 mt10">
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
				</c:forEach>
				</div>
			</div>
		</div>

</body>
<script>
window.print();
</script>
