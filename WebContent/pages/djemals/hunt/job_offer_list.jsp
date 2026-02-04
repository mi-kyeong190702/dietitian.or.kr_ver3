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
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="50">
					<col width="60">
					<col width="60">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="40">
					<col width="70">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="130">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="60">
					<col width="*">
					<col width="50">
					<col width="150">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">회사명</th>
					<th scope="col" class="bold cm">담당자</th>
					<th scope="col" class="bold cm">전화번호</th>
					<th scope="col" class="bold cm">팩스전화</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">모집분야</th>
					<th scope="col" class="bold cm">모집기한</th>
					<th scope="col" class="bold cm">모집인원</th>
					<th scope="col" class="bold cm">경력</th>
					<th scope="col" class="bold cm">혼인여부</th>
					<th scope="col" class="bold cm">성별</th>
					<th scope="col" class="bold cm">식수인원</th>
					<th scope="col" class="bold cm">근무시간</th>
					<th scope="col" class="bold cm">근무지역</th>
					<th scope="col" class="bold cm">급여</th>
					<th scope="col" class="bold cm">상여금</th>
					<th scope="col" class="bold cm">복리후생</th>
					<th scope="col" class="bold cm">제출서류</th>
					<th scope="col" class="bold cm">합격통보</th>
					<th scope="col" class="bold cm">기타</th>
					<th scope="col" class="bold cm">첨부파일</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="hunt">
				<tr>
					<td>${hunt.ecName}</td>
					<td>${hunt.ecPName}</td>
					<td>${hunt.ecTel}</td>
					<td>${hunt.ecFax}</td>
					<td>${hunt.ecEmail}</td>
					<td>
						${hunt.ecPart}
						<c:if test="${hunt.ecPart == '기타'}">
						(${hunt.ecPartText })
						</c:if>					
					</td>
					<td>
						${hunt.ecLimitDate}
					</td>
					<td>${hunt.ecNumber}</td>
					<td>${hunt.erHistory}</td>
					<td>${hunt.erMarry}</td>
					<td>${hunt.erSex}</td>
					<td>${hunt.erFamily}</td>
					<td>${hunt.etTime}</td>
					<td>${hunt.etLocation}</td>
					<td>연 ${hunt.etPrice}</td>
					<td>${hunt.etsPrice} %</td>
					<td>
						${hunt.etWel}
						<c:if test="${hunt.etWel == '기타'}">
						${hunt.etWelText}
						</c:if>
					</td>
					<td>
						${hunt.epPaper}
						<c:if test="${hunt.epPaper == '기타'}">
						(${hunt.epPaperText })
						</c:if>
					</td>					
					<td>${hunt.epReport}</td>
					<td>${hunt.epETC}</td>
					<td class="link"><a href="huntDown.do?idx=${hunt.eindex }">${hunt.bbs_file_name}</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="offerExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
