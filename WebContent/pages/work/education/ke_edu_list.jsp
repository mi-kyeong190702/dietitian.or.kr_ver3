<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>		
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<script>
function f_DoOperator( edu_name, code_kind, code_certifi, code_seq, code_bran, bran_seq ) {
	if( confirm(  edu_name+ "을 교육신청 하시겠습니까?") )  {
		$("#code_kind").val(code_kind);
		$("#code_certifi").val(code_certifi);
		$("#code_seq").val(code_seq);
		$("#code_bran").val(code_bran);
		$("#bran_seq").val(bran_seq);
		
		document.operator.action = "ke_edu_reg_act.do";
		document.operator.submit();
	}
}

function f_DoNoOperetor() {
	alert('교육생은 신청이 불가능 합니다');
	return;
}
</script>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육과정</mark> 신청</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
							<li><a href="/work/education/ke_curriculum.do" >교육과정 신청</a></li>
							<li><a href="/work/education/ke_curriculum.do" class="cm">교육과정 신청</a></li>
						</ul>
					</div>
				</div>
				
				
				<hr />
				<div class="sp_body">
				<!-- // Contents start -->
				
					<div class="tab div5">
						<ul>
							<li><a href="./ke_edu_list.do" <c:if test="${param.detcode eq null }">class="on"</c:if>>전체</a></li>
							<c:forEach items="${departList}" var="dep">
								<c:if test='${dep.detcode != "00" }'>
								<li>
									<a href="ke_edu_list.do?detcode=${dep.detcode}" <c:if test="${param.detcode eq dep.detcode }">class="on"</c:if> >${dep.tempcd1}</a>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					
					<div class="area right">
						<a class="btn t1 bbig mt20" href="/member/sso_login2.do" title="새창으로 이동" target="_blank">온라인교육센터 바로가기</a>
					</div>				
					
					
					<div class="area">
						<table class="table t1 text s1 ssmall ca center mt20 mb50">
							<colgroup>
								<col width="70">
								<col width="*">
								<col width="170">
								<col width="110">
								<col width="120">
								<col width="80">
							</colgroup>
							<thead>
							<tr>
								<th scope="col" class="bold cm">지역</th>
								<th scope="col" class="bold cm">교육명</th>
								<th scope="col" class="bold cm">교육기간</th>
								<th scope="col" class="bold cm">교육장소</th>
								<th scope="col" class="bold cm">교육비</th>
								<th scope="col" class="bold cm">신청하기</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${eduList}" var="edu">
							<tr>
								<td>${edu.instrument}</td>
								<td class="left">${edu.edutest_name}
								<c:if test="${not empty edu.btext }">( ${edu.btext} )</c:if>
								</td>
								<td>${kdaFunc:formatDay2(edu.oper_start_dt)} ~ ${kdaFunc:formatDay2(edu.oper_end_dt)}</td>
								<td>${edu.operation_place}</td>
								
								<td class="left">
								 	회원 : <fmt:formatNumber value="${edu.new_cost}" type="number"/> 원
									<c:if test="${ edu.code_target == '2' or edu.code_target == '3'  }">
									<br>비회원 : <fmt:formatNumber value="${edu.new_cost_nomem}" type="number"/> 원
									</c:if>
								</td>
								<td>
									<c:choose>
										<c:when test="${ edu.code_target == '1'  and isStudent  }">
										<a href="javascript:f_DoNoOperetor()" class="btn small t3">신청하기</a>
										</c:when>
										<c:otherwise>
										<a href="javascript:f_DoOperator('${edu.edutest_name}', '${edu.code_kind}', '${edu.code_certifi}', '${edu.code_seq}', '${edu.code_bran}', '${edu.bran_seq}');" class="btn small t3">신청하기</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						
					</div>
					
				
					<form:form method="post" name="operator" modelAttribute="operator">
						<form:hidden path="code_kind" />
						<form:hidden path="code_certifi" />
						<form:hidden path="code_seq" />
						<form:hidden path="code_bran"/>
						<form:hidden path="bran_seq"/>			
					</form:form>
					
					<!-- // Contents end -->
				</div>
			</div>