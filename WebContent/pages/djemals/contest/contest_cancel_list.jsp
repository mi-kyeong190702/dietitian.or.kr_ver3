<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
$(document).ready(function(){
	
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
            $("input[name=chk_idx]").prop("checked",true);
        }else{
            $("input[name=chk_idx]").prop("checked",false);
        }
	});
	
});

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
		location.href="contestCancelAction.do?checkIdx="+checkIdx+"&crud=D";
	}
	
}
	
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<h3 class="title t2 s1 cm">학술대회 취소 신청 리스트</h3>
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="60">
					<col width="100">
					<col width="90">
					<col width="200">
					<col width="*">
					<col width="150">
					<col width="100">
					<col width="100">
					<col width="150">
					<col width="150">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">선택<input class="ml5" type="checkbox" id="checkAll" /></th>
					<th scope="col" class="bold cm">신청일</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">근무처명</th>
					<th scope="col" class="bold cm">연락처</th>
					<th scope="col" class="bold cm">참가방식</th>
					<th scope="col" class="bold cm">입금일</th>
					<th scope="col" class="bold cm">입금액</th>
					<th scope="col" class="bold cm">처리여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="contest">
				<tr>
					<td><input class="" type="checkbox" name="chk_idx" value="${contest.idx }"/></td>
					<td>
					${fn:substring(contest.dbindate, 0, 4) }-${fn:substring(contest.dbindate, 4, 6) }-${fn:substring(contest.dbindate, 6, 8) } 
					</td>
					<td class="link">
						<a href="contestCancelForm.do?idx=${contest.idx }">
						<c:choose>
							<c:when test="${null eq contest.name || contest.name == ''}">미등록자명</c:when>
							<c:otherwise>${contest.name}</c:otherwise>
						</c:choose>							
						</a>
					</td>
					<td>${contest.lic_no}</td>
					<td>${contest.office_name}</td>
					<td>${contest.tel_hp}</td>
					<td>
						<c:choose>
							<c:when test="${contest.online_yn=='Y'}">온라인</c:when>
							<c:when test="${contest.online_yn=='N'}">오프라인</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<td>${contest.in_payDate}</td>
					<td>${contest.in_payPrice}</td>
					<td>
						<c:choose>
							<c:when test="${contest.c_Flag == 'Y '}">환불완료</c:when>
							<c:otherwise>신청상태</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
		<div class="btn_wrap mt40">
			<ul class="fr">
				<li><a href="contestCancelExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				<li><a href="javascript:f_action();" class="btn big t3">선택항목삭제</a></li>
			</ul>
		</div>
		
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		</div>

	</div>
</div>
