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
			<h3 class="title t2 s1 cm">대한영양사협회 회관 기금 (약정, 기부) 신청서</h3>
			<div class="box t2 p10 mt10">
				<div class="area">
					<table class="table t3 text small center mt5">
						<colgroup>
							<col width="150">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<td class="bold">성명</td>
							<td class="left">${fund.fund_name }</td>
						</tr>
						<tr>
							<td class="bold">면허번호</td>
							<td class="left">${fund.fund_liscense }</td>
						</tr>
						<tr>
							<td class="bold">소속 영양사회</td>
							<td class="left">${fund.fund_group }</td>
						</tr>
						<tr>
							<td class="bold">소속분과</td>
							<td class="left">${fund.fund_group_job }</td>
						</tr>
						<tr>
							<td class="bold">연락처 집 전화번호</td>
							<td class="left">${fund.fund_h_tel }</td>
						</tr>
						<tr>
							<td class="bold">연락처 집 주소</td>
							<td class="left">${fund.h_post1 }-${fund.h_post2 } ${fund.h_post_add } ${fund.h_post_add_detail }</td>
						</tr>
						<tr>
							<td class="bold">연락처 직장 명</td>
							<td class="left">${fund.fund_c_name }</td>
						</tr>
						<tr>
							<td class="bold">연락처 직장 전화번호</td>
							<td class="left">${fund.fund_c_tel }</td>
						</tr>
						<tr>
							<td class="bold">연락처 직장 주소</td>
							<td class="left">${fund.c_post1 }-${fund.c_post2 } ${fund.c_post_add } ${fund.c_post_add_detail }</td>
						</tr>
						<tr>
							<td class="bold">휴대전화</td>
							<td class="left">${fund.fund_pcs1}</td>
						</tr>
						<tr>
							<td class="bold">이메일</td>
							<td class="left">${fund.fund_email }</td>
						</tr>
						<tr>
							<td class="bold">납부은행</td>
							<td class="left">${fund.fund_account }</td>
						</tr>
						<tr>
							<td class="bold">납부방법</td>
							<td class="left">${fund.fund_method }</td>
						</tr>
						<tr>
							<td class="bold">약정 약정 금액</td>
							<td class="left">
								<c:choose>
									<c:when test="${fund.fund_guja1 == '기타'}">
										${fund.fund_guja_etc} 구좌 ( ${fund.fund_guja_price}만원)
									</c:when>
									<c:otherwise>
										${fund.fund_guja1}
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="bold">약정 납부 예정일</td>
							<td class="left">2010년 ${fund.fund_month2}월 ${fund.fund_day2}일</td>
						</tr>
						<tr>
							<td class="bold">약정 납부 입금자명</td>
							<td class="left">${fund.fund_input_name2 }</td>
						</tr>
						<tr>
							<td class="bold">기부 기부 금액</td>
							<td class="left">${fund.fund_price }</td>
						</tr>
						<tr>
							<td class="bold">기부 납부 예정일</td>
							<td class="left">2010년 ${fund.fund_month}월 ${fund.fund_day}일</td>
						</tr>
						<tr>
							<td class="bold">기부 납부 입금자명</td>
							<td class="left">${fund.fund_input_name }</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

</body>
<script>
window.print();
</script>
