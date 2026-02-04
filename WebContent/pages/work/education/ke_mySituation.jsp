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

</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육</mark> 현황</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_curriculum.do" >교육과정 신청</a></li>
				<li><a href="./ke_mySituation.do" class="cm">교육현황</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="190">
				<col width="*">
				<col width="50">
				<col width="70">
				<col width="70">
				<!-- 
				<col width="70">
				 -->
				<col width="70">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">교육기간</th>
				<th scope="col" class="bold cm">과목명</th>
				<th scope="col" class="bold cm">평점</th>
				<th scope="col" class="bold cm">평점종류</th>
				<th scope="col" class="bold cm">수료증</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${requestScope.myList.size() > 0 }">
					<c:forEach var="i" begin="0" end="${requestScope.myList.size()-1 }">
						<tr>
							<fmt:parseDate value="${requestScope.myList[i].oper_start_dt}" pattern="yyyyMMdd" var="dateformat1" scope="page"/>
							<fmt:parseDate value="${requestScope.myList[i].oper_end_dt}" pattern="yyyyMMdd" var="dateformat2" scope="page"/>
							<td>
								<fmt:formatDate value="${dateformat1}" pattern="yyyy.MM.dd" var="oper_start_dt" scope="page"/>
								<fmt:formatDate value="${dateformat2}" pattern="yyyy.MM.dd" var="oper_end_dt" scope="page"/>
								${oper_start_dt} ~ ${oper_end_dt}
							</td>
							<td>${requestScope.myList[i].yyyy} 년도  ${requestScope.myList[i].edutest_name}
								<c:if test="${requestScope.myList[i].btext != ''}"> - ( ${requestScope.myList[i].btext} )</c:if>		
							</td>
							<td>
								<c:if test="${requestScope.myList[i].edu_marks != '0'  }">
								${requestScope.myList[i].edu_marks}
								</c:if>
								<c:if test="${requestScope.myList[i].service_marks != '0'  }">
								${requestScope.myList[i].service_marks}
								</c:if>
							</td>
							<c:choose>
								<c:when test="${requestScope.myList[i].outside_yn == 'N'}">
									<td>본회</td>
								</c:when>
								<c:when test="${requestScope.myList[i].outside_yn == 'Y'}">
									<td>기타</td>
								</c:when>
								<c:when test="${requestScope.myList[i].outside_yn == 'E'}">
									<td>없음</td>
								</c:when>
								<c:when test="${requestScope.myList[i].outside_yn == 'S'}">
									<td>봉사</td>
								</c:when>
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
							<td>
								<c:if test="${requestScope.myList[i].rt >= 10 && requestScope.myList[i].rt != '' && fn:trim(requestScope.myList[i].result_no) != '' }">
									<a href="javascript:doc_print('${requestScope.myList[i].detcode}','${requestScope.myList[i].result_no}','${requestScope.myList[i].code_kind}')" class="btn">출력</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">교육현황 목록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<!-- 
		<div class="btn_wrap mt20">
			<ul class="fl">
				<li><a href="mailto:kdasys@hanmail.net" class="btn big">문의하기</a></li>
			</ul>			
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
		 -->
	</div>
</div>