<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(){
	
	if($(":checkbox[name='chk_idx']:checked").length!=0){
		var checkIdx = "";
		$(":checkbox[name='chk_idx']:checked").each(function(index){
			if(checkIdx.length > 0) checkIdx += ",";
			checkIdx += $(this).val();
		});
	}else{
		alert("삭제할 항목을 선택해주세요.");
		return;
	}

	if( confirm("정말 삭제하시겠습니까?") ) {
		location.href="greenAction.do?crud=D&checkIdx="+checkIdx;
	}
	
}

</script>
<div id="adm_contents">
	<div class="c_page">
	
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		
		<div class="cp_contents">
			<h3 class="title t3 bold s1"><mark class="cm">논문초록신청</mark> 리스트</h3>			
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="30">
					<col width="50">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="50">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">선택</th>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">구분</th>
					<th scope="col" class="bold cm">분야</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">생년월일</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">휴대전화</th>
					<th scope="col" class="bold cm">전화번호</th>
					<th scope="col" class="bold cm">소속</th>
					
					
					<th scope="col" class="bold cm">제1저자-이름</th>
					<th scope="col" class="bold cm">제1저자-소속</th>
					<th scope="col" class="bold cm">제1저자-면허번호</th>
					<th scope="col" class="bold cm">파일</th>
					<th scope="col" class="bold cm">신청일시</th>
					<th scope="col" class="bold cm">수정일시</th>
					<th scope="col" class="bold cm">파일다운여부</th>
				</tr>
				<tr>
					<th scope="col" colspan="17" class="bold cm">초록제목</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="green">
				<tr>
					<td><input type="checkbox" name="chk_idx" id="chk_idx" value="${green.idx }"/></td>
					<td>${green.num}</td>
					<td>
					<c:choose>
						<c:when test="${green.gubun=='01'}">
						구연발표
						</c:when>
						<c:otherwise>
						포스터발표
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${green.edu_type=='01'}">급식경영/단체급식</c:when>
						<c:when test="${green.edu_type=='02'}">영양교육</c:when>
						<c:when test="${green.edu_type=='03'}">임상영양</c:when>
						<c:when test="${green.edu_type=='04'}">식품위생</c:when>
						<c:when test="${green.edu_type=='05'}">식품학/식품과학</c:when>
						<c:when test="${green.edu_type=='06'}">식품조리</c:when>
						<c:when test="${green.edu_type=='07'}">지역사회영양</c:when>
						<c:when test="${green.edu_type=='08'}">
							기타 <c:if test='${green.edu_type_etc != "" and  green.edu_type_etc ne null }'>( ${green.edu_type_etc} )</c:if>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
					<td>${green.name}</td>
					<td>${green.pers_birth}</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(green.email) > 6}">
							${fn:substring(green.email, 0, 5)}
						</c:when>
						<c:otherwise>
							${green.email}
						</c:otherwise>
					</c:choose>
					@
					<c:choose>
						<c:when test="${fn:length(green.email_sub) > 6}">
							${fn:substring(green.email_sub, 0, 5)}
						</c:when>
						<c:otherwise>
							${green.email_sub}
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(green.tel_hp) > 13}">
							${fn:substring(green.tel_hp, 0, 12)}
						</c:when>
						<c:otherwise>
							${green.tel_hp}
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(green.tel) > 13}">
							${fn:substring(green.tel, 0, 12)}
						</c:when>
						<c:otherwise>
							${green.tel}
						</c:otherwise>
					</c:choose>
					</td>
					
					<td>${green.branch_name}</td>
					
					<td>${green.name2}</td>
					<td>${green.branch_name2}</td>
					<td>${green.lic_no2}</td>
					<td class="link"><a href="greenDown.do?idx=${green.idx }">${green.file_flag}</a></td>
					<td>${green.reg_date}</td>
					<td>${green.up_date}</td>
					<td>${green.is_open}</td>
				</tr>
				<tr>
					<td colspan="17">${green.crtitle_name}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="javascript:f_action();" class="btn big">삭제</a></li>
					<li><a href="greenExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>
