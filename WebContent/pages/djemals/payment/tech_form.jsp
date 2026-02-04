<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
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
<div id="adm_contents">
	<div class="c_page">
		
		<div class="cp_contents">
		
		<c:if test="${null eq tech}">
		<script>
		alert("해당 내용을  삭제 하였거나 내역이 존재하지 않습니다.");
		self.close();
		</script>					
		</c:if>
		<c:if test="${null ne tech}">
				
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="4"scope="col" class="bold cm">인척사항</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">이름</td>
					<td class="left">
					${tech.name}
					</td>
				</tr>
				<tr>
					<td class="bold">구분</td>
					<td class="left">
					<c:if test="${tech.member_flag == '1'}">회원</c:if>
					<c:if test="${tech.member_flag == '0'}">비회원</c:if>					
					</td>
				</tr>
				<tr>
					<td class="bold">면허번호</td>
					<td class="left">${tech.lic_no}</td>
				</tr>
				<tr>
					<td class="bold">생년월일</td>
					<td class="left">${tech.birth}</td>
				</tr>
				<tr>
					<td class="bold">근무처명(학교명)</td>
					<td class="left">${tech.office_name }</td>
				</tr>
				<tr>
					<td class="bold">전화번호</td>
					<td class="left">${tech.tel }</td>
				</tr>
				<tr>
					<td class="bold">핸드폰</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(tech.tel_hp) > 13}">
							${fn:substring(tech.tel_hp, 0, 12)}
						</c:when>
						<c:otherwise>
							${tech.tel_hp }
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">전문영양사 자격증 소지유무</td>
					<td class="left">
					<c:choose>
						<c:when test="${tech.diet_License01 == 'Y'}">임상</c:when>
						<c:when test="${tech.diet_License01 == 'Y'}">급식</c:when>
						<c:when test="${tech.diet_License01 == 'Y'}">산업보건영양사</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">운영형태</td>
					<td class="left">
					<c:choose>
						<c:when test="${tech.gtype == 'a'}">직영</c:when>
						<c:otherwise>위탁</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">소속지부</td>
					<td class="left">${tech.branch_name }</td>
				</tr>
				<tr>
					<td class="bold">소속분과</td>
					<td class="left">${tech.big_name }</td>
				</tr>
				<tr>
					<td class="bold">주소</td>
					<td class="left">
					(${tech.zip }) 
					${tech.addr}
					</td>
				</tr>
				<tr>
					<td class="bold">참가일자</td>
					<td class="left">
					<c:choose>
						<c:when test="${tech.join_flag == '1'}">7월 23일</c:when>
						<c:when test="${tech.join_flag == '2'}">7월 24일</c:when>
						<c:when test="${tech.join_flag == '3'}">7월 23일, 7월 24일</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<c:choose>
						<c:when test="${tech.pay_flag == 'C'}">
				<tr>
					<td class="bold">입금내역</td>
					<td class="left">
					카드결제 <fmt:formatNumber value="${tech.pay_amount }" pattern="#,###.##"/>
					<br>카드결제 내역을 확인 하세요.
					</td>
				</tr>
						</c:when>
						<c:otherwise>
				<tr>
					<td class="bold">입금(예정)일</td>
					<td class="left">${tech.pay_date }</td>
				</tr>		
				<tr>
					<td class="bold">입금액</td>
					<td class="left"><fmt:formatNumber value="${tech.pay_amount }" pattern="#,###.##"/> 원</td>
				</tr>		
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			
	</c:if>

		</div>
	</div>
</div>
</body>