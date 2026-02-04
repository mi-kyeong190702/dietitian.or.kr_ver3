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
		location.href="contestAction.do?checkIdx="+checkIdx;
	}
	
}
	
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<h3 class="title t2 s1 cm">학술대회 신청서 리스트</h3>
		
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="60">
					<col width="100">
					<col width="90">
					<col width="90">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="*">
					<col width="140">
					<col width="140">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">선택<input class="ml5" type="checkbox" id="checkAll" /></th>
					<th scope="col" class="bold cm">신청일</th>
					<th scope="col" class="bold cm">회원구분</th>
					<th scope="col" class="bold cm">신청자</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">전화번호</th>
					<th scope="col" class="bold cm">Day1 참여방식</th>
					<th scope="col" class="bold cm">Day2 참여방식</th>
					<th scope="col" class="bold cm">학술대회 자료집</th>
					<th scope="col" class="bold cm">참가일</th>
					<th scope="col" class="bold cm">참가비</th>
					<th scope="col" class="bold cm">입금방식</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="contest">
				<tr>
					<td><input class="" type="checkbox" name="chk_idx" value="${contest.idx }"/></td>
					<td>
					<fmt:parseDate var="dateString" value="${contest.reg_date}" pattern="yyyyMMdd" />
					<fmt:formatDate value="${dateString}"  pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${contest.member_flag=='0'}">비회원</c:when>
							<c:when test="${contest.member_flag=='1'}">회원</c:when>
							<c:otherwise>미선택</c:otherwise>
						</c:choose>
					</td>
					<td class="link"><a href="contestForm.do?idx=${contest.idx }">${contest.name}</a></td>
					<td>${contest.lic_no}</td>
					<td>${contest.tel}</td>
					<td>
						<c:choose>
							<c:when test="${contest.online_yn=='Y'}">온라인</c:when>
							<c:when test="${contest.online_yn=='N'}">오프라인</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${contest.online_yn2=='Y'}">온라인</c:when>
							<c:when test="${contest.online_yn2=='N'}">오프라인</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${contest.ebook_yn=='Y'}">e-Book 자료집</c:when>
							<c:when test="${contest.ebook_yn=='N'}">책자 자료집</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${contest.join_flag=='1'}">7월 24일(목)</c:when>
							<c:when test="${contest.join_flag=='2'}">7월 25일(금)</c:when>
							<c:when test="${contest.join_flag=='3'}">7월 24일(목), 7월 25일(금)</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td><fmt:formatNumber value="${contest.pay_amount}" pattern="#,###.##"/></td>
					<td>
						<c:choose>
							<c:when test="${contest.pay_flag=='B'}">무통장</c:when>
							<c:when test="${contest.pay_flag=='G'}">지로입금</c:when>
							<c:when test="${contest.pay_flag=='C'}">카드입금선택-결제완결</c:when>
							<c:otherwise>선택안함</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
		<div class="btn_wrap mt40">
			<ul class="fr">
				<li><a href="contestExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				<li><a href="javascript:f_action();" class="btn big t3">선택항목삭제</a></li>
			</ul>
		</div>
		
		<kda:paging listHelper="${listHelper}" layout="admin"/>
	</div>
	</div>
</div>
