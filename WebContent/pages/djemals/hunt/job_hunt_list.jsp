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
					<col width="50">
					<col width="50">
					<col width="40">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="50">
					<col width="70">
					<col width="70">
					<col width="50">
					<col width="130">
					<col width="50">
					<col width="130">
					<col width="50">
					<col width="50">
					<col width="130">
					<col width="60">
					<col width="50">
					<col width="*">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">성명</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">성별</th>
					<th scope="col" class="bold cm">전화번호</th>
					<th scope="col" class="bold cm">휴대전화</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">혼인여부</th>
					<th scope="col" class="bold cm">주소</th>
					<th scope="col" class="bold cm">최종학교</th>
					<th scope="col" class="bold cm">최종학력</th>
					<th scope="col" class="bold cm">경력</th>
					<th scope="col" class="bold cm">경력일</th>
					<th scope="col" class="bold cm">자격증</th>
					<th scope="col" class="bold cm">취득년도</th>
					<th scope="col" class="bold cm">희망급여</th>
					<th scope="col" class="bold cm">희망분야</th>
					<th scope="col" class="bold cm">희망근무지</th>
					<th scope="col" class="bold cm">상태</th>
					<th scope="col" class="bold cm">기타</th>
					<th scope="col" class="bold cm">날짜</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="hunt">
				<tr>
					<td>${hunt.strName}</td>
					<td>${hunt.strLicenseNum}</td>
					<td>
						<c:choose>
							<c:when test="${hunt.bitSex == '1' }">
								남
							</c:when>
							<c:otherwise>
								여
							</c:otherwise>	
						</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(hunt.strPhone) > 10}">
							${fn:substring(hunt.strPhone, 0, 9)}
						</c:when>
						<c:otherwise>
							${hunt.strPhone}
						</c:otherwise>
					</c:choose>
					</td>
					<td>${hunt.strHP}</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(hunt.strEmail) > 19}">
							${fn:substring(hunt.strEmail, 0, 18)}
						</c:when>
						<c:otherwise>
							${hunt.strEmail}
						</c:otherwise>
					</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${hunt.bitMarriage == '1' }">
								미혼
							</c:when>
							<c:otherwise>
								기혼
							</c:otherwise>	
						</c:choose>
					</td>
					<td>${hunt.strZipcode}<br>${hunt.strAddr}</td>
					<td>${hunt.strLastSchool}</td>
					<td>${hunt.strLastScholarly}</td>
					<td>
						<c:if test="${null ne hunt.strCareer1 && hunt.strCareer1 != '' }">	${hunt.strCareer1}<br></c:if>
						<c:if test="${null ne hunt.strCareer2 && hunt.strCareer2 != '' }">	${hunt.strCareer2}<br></c:if>
						<c:if test="${null ne hunt.strCareer3 && hunt.strCareer3 != '' }">	${hunt.strCareer3}<br></c:if>
						<c:if test="${null ne hunt.strCareer4 && hunt.strCareer4 != '' }">	${hunt.strCareer4}<br></c:if>
						<c:if test="${null ne hunt.strCareer5 && hunt.strCareer5 != '' }">	${hunt.strCareer5}<br></c:if>
						<c:if test="${null ne hunt.strCareer6 && hunt.strCareer6 != '' }">	${hunt.strCareer6}<br></c:if>
						<c:if test="${null ne hunt.strCareer7 && hunt.strCareer7 != '' }">	${hunt.strCareer7}<br></c:if>
						<c:if test="${null ne hunt.strCareer8 && hunt.strCareer8 != '' }">	${hunt.strCareer8}<br></c:if>
						<c:if test="${null ne hunt.strCareer9 && hunt.strCareer9 != '' }">	${hunt.strCareer9}<br></c:if>
						<c:if test="${null ne hunt.strCareer10 && hunt.strCareer10 != '' }">${hunt.strCareer10}</c:if>						
					</td>
					<td>
						<c:if test="${null ne hunt.strCareer_year1 && hunt.strCareer_year1 != '' }">	${hunt.strCareer_year1}년 ${hunt.strCareer_mon1}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year2 && hunt.strCareer_year2 != '' }">	${hunt.strCareer_year2}년 ${hunt.strCareer_mon2}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year3 && hunt.strCareer_year3 != '' }">	${hunt.strCareer_year3}년 ${hunt.strCareer_mon3}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year4 && hunt.strCareer_year4 != '' }">	${hunt.strCareer_year4}년 ${hunt.strCareer_mon4}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year5 && hunt.strCareer_year5 != '' }">	${hunt.strCareer_year5}년 ${hunt.strCareer_mon5}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year6 && hunt.strCareer_year6 != '' }">	${hunt.strCareer_year6}년 ${hunt.strCareer_mon6}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year7 && hunt.strCareer_year7 != '' }">	${hunt.strCareer_year7}년 ${hunt.strCareer_mon7}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year8 && hunt.strCareer_year8 != '' }">	${hunt.strCareer_year8}년 ${hunt.strCareer_mon8}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year9 && hunt.strCareer_year9 != '' }">	${hunt.strCareer_year9}년 ${hunt.strCareer_mon9}월<br></c:if>
						<c:if test="${null ne hunt.strCareer_year10 && hunt.strCareer_year10 != '' }">${hunt.strCareer_year10}년 ${hunt.strCareer_mon10}월</c:if>
					</td>
					<td>
						<c:if test="${null ne hunt.strLicense1 && hunt.strLicense1 != '' }">	${hunt.strLicense1}<br></c:if>
						<c:if test="${null ne hunt.strLicense2 && hunt.strLicense2 != '' }">	${hunt.strLicense2}<br></c:if>
						<c:if test="${null ne hunt.strLicense3 && hunt.strLicense3 != '' }">	${hunt.strLicense3}<br></c:if>
						<c:if test="${null ne hunt.strLicense4 && hunt.strLicense4 != '' }">	${hunt.strLicense4}<br></c:if>
						<c:if test="${null ne hunt.strLicense5 && hunt.strLicense5 != '' }">	${hunt.strLicense5}<br></c:if>
						<c:if test="${null ne hunt.strLicense6 && hunt.strLicense6 != '' }">	${hunt.strLicense6}<br></c:if>
						<c:if test="${null ne hunt.strLicense7 && hunt.strLicense7 != '' }">	${hunt.strLicense7}<br></c:if>
						<c:if test="${null ne hunt.strLicense8 && hunt.strLicense8 != '' }">	${hunt.strLicense8}<br></c:if>
						<c:if test="${null ne hunt.strLicense9 && hunt.strLicense9 != '' }">	${hunt.strLicense9}<br></c:if>
						<c:if test="${null ne hunt.strLicense10 && hunt.strLicense10 != '' }">${hunt.strLicense10}</c:if>
					</td>
					<td>
						<c:if test="${null ne hunt.strLicense_year1 && hunt.strLicense_year1 != '' }">	${hunt.strLicense_year1}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year2 && hunt.strLicense_year2 != '' }">	${hunt.strLicense_year2}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year3 && hunt.strLicense_year3 != '' }">	${hunt.strLicense_year3}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year4 && hunt.strLicense_year4 != '' }">	${hunt.strLicense_year4}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year5 && hunt.strLicense_year5 != '' }">	${hunt.strLicense_year5}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year6 && hunt.strLicense_year6 != '' }">	${hunt.strLicense_year6}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year7 && hunt.strLicense_year7 != '' }">	${hunt.strLicense_year7}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year8 && hunt.strLicense_year8 != '' }">	${hunt.strLicense_year8}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year9 && hunt.strLicense_year9 != '' }">	${hunt.strLicense_year9}년<br></c:if>
						<c:if test="${null ne hunt.strLicense_year10 && hunt.strLicense_year10 != '' }">${hunt.strLicense_year10}년</c:if>
					</td>
					<td>${hunt.intHopePrice}</td>
					<td>${hunt.strHopeRealm}</td>
					<td>${hunt.strHopeLocation}</td>
					<td>
						<c:choose>
							<c:when test="${hunt.bitState == '1' }">
								구직중
							</c:when>
							<c:otherwise>
								구직완료
							</c:otherwise>	
						</c:choose>
					</td>
					<td>${hunt.etc}</td>
					<td>${hunt.regdate}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="huntExcel.do" class="btn big">엑셀로 보기</a></li>
				</ul>
			</div>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
