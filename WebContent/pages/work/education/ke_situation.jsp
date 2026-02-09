<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<script>
function f_CancelOper(appId) {
	var title = $.trim($("#title_" + appId).text());
	if( confirm( title + "교육을 취소하시겠습니까?") ) {
		$("#operKey").val(appId);
		document.frmOper.action = "./ke_edu_pay_cancel.do";
		document.frmOper.submit();
	}
}

function doc_print(str1, str2, doc_name, person_yn, operkey, isMember)
{
	shape  = "width=750,height=700,";
    shape += "toolbar=no,location=no,directories=no,status=no,";
    shape += "menubar=no,scrollbars=no,resizable=yes";
    path   = "/doc_form/docu_print_edu.jsp?doc_code="+str1+"&doc_seq='"+str2+"'"+"&doc_name='"+doc_name+"'"+"&person_yn='"+ person_yn+"'"+"&operkey='"+ operkey+"'"+"&isMember='"+ isMember+"'";
	
    xx = screen.availWidth;
    yy = screen.availHeight;
    sxx = 0;
    syy = 0;
    sxx = (xx/2) - 200;
    syy = (yy/2) - 90;

    shape = shape + ", top=" + syy + ", left=" + sxx;

    window.open(path, "doc_print_edu", shape);
}

//신규
function rcp_doc_print(str1, str2, doc_name, person_yn, operkey, isMember)
{
    
    var rating = 'N';
     
    shape  = "width=780,height=700,";
    shape += "toolbar=no,location=no,directories=no,status=no,";
    shape += "menubar=no,scrollbars=no,resizable=yes";
    path   = "/work/education/situation_print.do?isMember="+isMember+"&operkey="+operkey+"&person_yn="+person_yn+"&rating="+rating;
    
    xx = screen.availWidth;
    yy = screen.availHeight;
    sxx = 0;
    syy = 0;
    sxx = (xx/2) - 200;
    syy = (yy/2) - 90;

    shape = shape + ", top=" + syy + ", left=" + sxx;

    window.open(path, "rcp_doc_print", shape);
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육과정</mark> 신청현황</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_curriculum.do" >교육과정 신청</a></li>
				<li><a href="./ke_situation.do" class="cm">교육과정 신청현황</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
		<!-- // Contents Start -->
		<div class="box t2 mb10 p20">	
			<h4 class="title bold s1">＊ 현재 신청중인 교육과정만 보여집니다.</h4>
			<h4 class="title bold s1">＊ 수강하신 교육 현황은 회원 로그인 → 마이페이지 → My 교육정보  → 교육현황에서 확인 가능합니다.</h4>
		</div>
		<hr />
	
	
		
			<form name="frmOper" method="post">
				<input type="hidden" name="operKey" id="operKey" value="" />
			</form>
			<c:if test="${fn:length(operatorList) == 0 }">
			<div class="area">
				<table class="table t1 text s1 ssmall ca center mt50">
					<colgroup>
						<col width="300">
						<col width="*">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">교육명</th>
						<th scope="col" class="bold cm">교육시작일</th>
						<th scope="col" class="bold cm">교육비</th>
						<th scope="col" class="bold cm">교육장소</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td scope="row" colspan="4"> 교육 신청 내역이 존재하지 않습니다.</td>
					</tr>
				</tbody>
				</table>
			</c:if>
			
			<c:forEach items="${operatorList}" var="oper">
			<div class="area">
				<table class="table t1 text s1 ssmall ca center mt50">
					<colgroup>
						<col width="*">
						<col width="80">
						<col width="130">
						<col width="130">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">교육명</th>
						<th scope="col" class="bold cm">교육시작일</th>
						<th scope="col" class="bold cm">교육비</th>
						<th scope="col" class="bold cm">교육장소</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td scope="row" id="title_${oper.operkey}${oper.receipt_no}">
							${oper.edutest_name}
							<%-- <c:if test="${not empty oper.btext }">( ${oper.btext} )</c:if> --%>
						</td>
						<td scope="row">${kdaFunc:formatDay2(oper.oper_start_dt)}</td>
						<td scope="row">
						<c:choose>
							<c:when test="${isMember}">
								회원 : <fmt:formatNumber value="${oper.new_cost}" type="number"/> 원
								<c:set var="cost" value="${oper.new_cost}" />
							</c:when>
							<c:otherwise>
								비회원 : <fmt:formatNumber value="${oper.new_cost_nomem}" type="number"/> 원
								<c:set var="cost" value="${oper.new_cost_nomem}" />
							</c:otherwise>
						</c:choose>
						</td>
						<td scope="row">${oper.operation_place}</td>
					</tr>
					<tr>
						<td scope="col" class="bold cm bgs">입금 계좌번호</td>
						<td colspan="2" scope="col" class="bold cm bgs">결제 및 결제방법 변경</td>
						<td scope="col" class="bold cm bgs">신청취소</td>
					</tr>
					<tr>
						<td scope="row">${oper.test_bank_name} ${oper.test_bank_acc} ${oper.test_bank_acc_owner }</td>
                        <td scope="row">
                        <c:choose>
                            <c:when test="${oper.payname eq '' }">-</c:when>
                            <c:otherwise>${oper.payname}</c:otherwise>
                        </c:choose>
                        </td>
                        <td scope="row">
                        <c:choose>
                            <c:when test="${ oper.oper_start_dt > today  }">
                            <c:choose>
                                <c:when test="${oper.oper_state ne '11' }">
                                    <a href="./ke_edu_pay_select.do?pay_appid=${oper.operkey}${oper.receipt_no}" class="btn t2">확인</a>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                        </td>
                        <td scope="row">
                        <c:choose>
                            <c:when test="${ oper.oper_start_dt > today  }">
                            <c:choose>
                                <c:when test="${oper.oper_state ne '11' }">
                                    <a href="javascript:f_CancelOper('${oper.operkey}${oper.receipt_no}')" class="btn t3">취소</a>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                        </td>
					</tr>
					
					<!--입금내역 확인 부분 -->
					
					<tr>
						<td scope="col" class="bold cm bgs">입금 확인</td>
						<td colspan="3" scope="col" class="bold cm bgs">영수증 출력</td>
					</tr>
					<tr>
						<td scope="row">
						<c:choose>
							<c:when test="${oper.oper_state eq '11' }">입금완료</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
						</td>
						<td scope="row" colspan="3">
						<c:choose>
							<c:when test="${oper.oper_state eq '11' }"><input type="button" class="btn t2" value="출력" onclick="rcp_doc_print('0109', '9', '교육결제영수증','${oper.person_yn}','${oper.operkey}${oper.receipt_no}', '${isMember}')"/></c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
						</td>
					</tr>
					
					<!-- 입금내역 확인 부분  -->
					</tbody>
				</table>
			</div>
			</c:forEach>
	

	
		
		<!-- // Contents Start -->
	</div>
</div>