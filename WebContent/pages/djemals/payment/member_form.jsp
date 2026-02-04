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
		
		<c:if test="${fn:length(member) == 0 }">
		<script>
		alert("조회된 정보가 없습니다.");
		self.close();
		</script>					
		</c:if>
		<c:if test="${fn:length(member) >1 }">
		<script>
		alert("조회된 회원이 2명 이상 입니다.관리자에 문의하세요. ");
		self.close();
		</script>		
		</c:if>
		<c:if test="${fn:length(member) == 1 }">
				
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="4"scope="col" class="bold cm">기본 정보</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">성명</td>
					<td class="left">
					${member[0].pers_name}
					(${member[0].code_member })
					</td>
				</tr>
				<tr>
					<td class="bold">생년월일</td>
					<td class="left">${member[0].pers_birth}</td>
				</tr>
				<tr>
					<td class="bold">성별</td>
					<td class="left">${member[0].code_sex}</td>
				</tr>
				<tr>
					<td class="bold">면허번호</td>
					<td class="left">${member[0].lic_no}</td>
				</tr>
				<tr>
					<td class="bold">이용자ID</td>
					<td class="left">${id }</td>
				</tr>
				<tr>
					<td class="bold">휴대폰</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(member[0].pers_hp) > 13}">
							${fn:substring(member[0].pers_hp, 0, 12)}
						</c:when>
						<c:otherwise>
							${member[0].pers_hp }
						</c:otherwise>
					</c:choose>
				</td>
				</tr>
				<tr>
					<td class="bold">이메일주소</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(member[0].email) > 13}">
							${fn:substring(member[0].email, 0, 12)}
						</c:when>
						<c:otherwise>
							${member[0].email }
						</c:otherwise>
					</c:choose>
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
					<th colspan="4"scope="col" class="bold cm">자택 및 근무처 정보(우편물 수신처)</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">자택주소</td>
					<td class="left">
					(${member[0].code_post })
					${member[0].pers_add }
					</td>
				</tr>
				<tr>
					<td class="bold">자택전화</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(member[0].pers_tel) > 13}">
							${fn:substring(member[0].pers_tel, 0, 12)}
						</c:when>
						<c:otherwise>
							${member[0].pers_tel}
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">근무처명</td>
					<td class="left">${company.company_name}</td>
				</tr>
				<tr>
					<td class="bold">부서및직급</td>
					<td class="left">${company.job_dept}"부</td>
				</tr>
				<tr>
					<td class="bold">근무처주소</td>
					<td class="left">
					(${company.code_post })
					${company.company_add }
					</td>
				</tr>
				<tr>
					<td class="bold">근무처전화</td>
					<td class="left">${company.company_tel}</td>
				</tr>
				<tr>
					<td class="bold">우편물수신처</td>
					<td class="left">${member[0].code_place}</td>
				</tr>
				<tr>
					<td class="bold">수취인 호칭</td>
					<td class="left">${member[0].code_call }</td>
				</tr>
				</tbody>
			</table>
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">납입년도</th>
					<th scope="col" class="bold cm">회원구분</th>
					<th scope="col" class="bold cm">금액</th>
					<th scope="col" class="bold cm">비고</th>
					<th scope="col" class="bold cm">회원유효기간</th>
				</tr>
				</thead>
				<tbody>
			<c:forEach items="${money}" var="money">
				<tr>
					<td>${fn:substring(money.auth_start,0,4) }</td>
					<td>${money.code_member}</td>
					<td>${money.mem_dues}원</td>
					<td>
					<c:choose>
					<c:when test="${money.incom_flag=='Y'}">완납</c:when>
					<c:otherwise>미납</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:if test="${money.auth_start != '' }">
					<fmt:parseDate var="dateString" value="${money.auth_start}" pattern="yyyyMMdd" />
					<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
					</c:if>
					<span class="text ml10 mr10">~</span>
					<c:if test="${money.auth_end != '' }">
						<c:choose>						
							<c:when test="${money.auth_end == '평생회원' }">
								평생회원
							</c:when>
							<c:otherwise>
							<fmt:parseDate var="dateString" value="${money.auth_end}" pattern="yyyyMMdd" />
							<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
							</c:otherwise>
						</c:choose>
					</c:if>
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
			
			
	</c:if>

		</div>
	</div>
</div>
</body>