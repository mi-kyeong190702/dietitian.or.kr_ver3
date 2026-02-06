<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common.jsp"%>
<script>
	function doc_print_pre(detcode, doc_seq) {
		
		shape  = "width=750,height=700,";
		shape += "toolbar=no,location=no,directories=no,status=no,";
		shape += "menubar=no,scrollbars=no,resizable=yes";
		
		path   = "/doc_form/docu_print_user.jsp?gubun=E&print_kind=1&code_kind=1&detcode=" + detcode + "&doc_seq=" + doc_seq;

		xx = screen.availWidth;
		yy = screen.availHeight;
		sxx = 0;
		syy = 0;
		sxx = (xx/2) - 200;
		syy = (yy/2) - 90;

		shape = shape + ", top=" + syy + ", left=" + sxx;
  		window.open(path, "doc_print", shape);
	}
	
	function doc_print2(str1, str2, doc_name, person_yn, operkey, isMember){
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
	
	function rcp_doc_print(str1, str2, doc_name, person_yn, operkey, isMember)
	{
		
		var rating = 'N';
	    	    
	    shape  = "width=780,height=700,";
	    shape += "toolbar=no,location=no,directories=no,status=no,";
	    shape += "menubar=no,scrollbars=no,resizable=yes";
	    path   = "/print/rcp_print.do?isMember="+isMember+"&operkey="+operkey+"&person_yn="+person_yn+"&rating="+rating;
	    
	    xx = screen.availWidth;
	    yy = screen.availHeight;
	    sxx = 0;
	    syy = 0;
	    sxx = (xx/2) - 200;
	    syy = (yy/2) - 90;

	    shape = shape + ", top=" + syy + ", left=" + sxx;

	    window.open(path, "rcp_doc_print", shape);
	}
	function doc_print(code_kind, doc_seq, detcode){
		
		var rating = 'N';
	    //if (confirm("이수자 평점을 표시할까요?")) {
	    //    rating = 'Y';
	    //} 
	    shape  = "width=780,height=700,";
	    shape += "toolbar=no,location=no,directories=no,status=no,";
	    shape += "menubar=no,scrollbars=no,resizable=yes";
	    path   = "/print/certi_print.do?detcode="+detcode+"&doc_seq="+doc_seq+"&code_kind="+code_kind+"&rating="+rating;
	     
	    xx = screen.availWidth;
	    yy = screen.availHeight;
	    sxx = 0;
	    syy = 0;
	    sxx = (xx/2) - 200;
	    syy = (yy/2) - 90;

	    shape = shape + ", top=" + syy + ", left=" + sxx;

	    window.open(path, "certi_doc_print", shape);
	    }
	function goPrint_new(print_kind,detcode, doc_seq, code_kind){
	    
	    var rating = 'N';
	    // 선택된 행 번호 배열
	    
	    //if (confirm("이수자 평점을 표시하시겠습니까?")) {
	    //    rating = 'Y';
	    //} 
	    
	    var param  = "print_kind=" + print_kind
	    + "&code_kind=" + code_kind
	    + "&detcode="   + detcode
	    + "&rating=" + rating
	    + "&doc_seq=" + doc_seq;

	    // 팝업 설정
	    var width  = 794;
	    var height = 1122;
	    var left   = Math.floor((screen.availWidth  - width ) / 2);
	    var top    = Math.floor((screen.availHeight - height) / 2);

	    var opts = [
	    "width=" + width,
	    "height=" + height,
	    "toolbar=no",
	    "location=no",
	    "directories=no",
	    "status=no",
	    "menubar=no",
	    "scrollbars=no",
	    "resizable=yes",
	    "top=" + top,
	    "left=" + left
	    ];
	 
	    var popupOpts = opts.join(",");
	    
	    var url = "/print/certi_user.do?" + param;
	    window.open(url, "certi_user", popupOpts);

	    
	}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">전문교육</mark>과정 현황</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/kmp_situation.do">MY 교육정보</a></li>
				<li><a href="/kmp_license.do" class="cm">전문교육과정 현황</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height:800px;">
	    <h4 class="title bold t2 cm s1 mt50">■ 교육 이수 현황</h3>
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="190">
                <col width="*">
                <col width="100">
                <col width="70">
                <col width="70">
                <col width="70">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">교육기간</th>
				<th scope="col" class="bold cm">교육명</th>
				<th scope="col" class="bold cm">결과</th>
				<th scope="col" class="bold cm">영수증</th>
				<th scope="col" class="bold cm">이수확인서</th>
				<th scope="col" class="bold cm">수료증</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(myList) > 0 }">
						<c:forEach items="${myList}" var="edu">
							<tr>
							    <fmt:parseDate value="${edu.oper_start_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
                                <fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_start_dt" scope="page"/>
                                <fmt:parseDate value="${edu.oper_end_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
                                <fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_end_dt" scope="page"/>
                                <td>${oper_start_dt} ~ ${oper_end_dt}</td> 
							    
								<%-- <c:set var="rowCount" value="${rowMap[edu.code_certifi]}" />
								<c:if test="${prev_code_certifi != edu.code_certifi}">
									<td <c:if test="${rowCount > 1 }"> rowspan="${rowCount}"</c:if>>${edu.certifi_txt}</td>
								</c:if>
								<td>${edu.yyyy}</td> --%>
								
								<td class="left">
									${edu.edutest_full_name}
								</td>
								
								
								<c:choose>
									<c:when test="${edu.result_state == -1}">
										<td>${edu.oper_state_txt} </td>
									</c:when>
									<c:otherwise>
										<td>${edu.result_state_txt}</td>
									</c:otherwise>
								</c:choose>
								
								<td>
                                    <input type="button" class="btn t2" value="출력" onclick="rcp_doc_print('0109', '9', '교육결제영수증','${edu.person_yn}','${edu.operkey}${edu.receipt_no}', '${isMember}')"/>
                                </td>
								<td>
									<c:if test="${edu.result_state == 10 }">
										<a href="javascript:doc_print('0109', '${edu.result_no}','${edu.detcode}')" class="btn">출력</a>
									</c:if>
									<c:if test="${prev_code_certifi != edu.code_certifi}">
                                        <c:set var="prev_code_certifi" value="${edu.code_certifi}"/>
                                    </c:if>
								</td>
								<td>
                    
                                    <c:if test="${edu.result_no != '' && edu.result_state ==10}">
                                        <a href="javascript:goPrint_new('${edu.print_kind}','${edu.detcode}','${edu.result_no}','${edu.code_kind}')" class="btn">출력</a>
                                    </c:if>
                            </td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">교육 현황 목록이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<%-- <h4 class="title bold t2 cm s1 mt50">■ 자격증 취득 현황</h3>
		<table class="table t1 text s1 ca center mt20">
            <colgroup>
                <col width="*">
                <col width="120">
                <col width="190">
            </colgroup>
            <thead>
            <tr>
                <th scope="col" class="bold cm">자격명</th>
                <th scope="col" class="bold cm">자격증 번호</th>
                <th scope="col" class="bold cm">유효기간</th>
            </tr>
            </thead>
            <tbody>
                <td colspan="3">자격증 취득 현황 목록이 없습니다.</td>
                <c:choose>
                    <c:when test="${fn:length(myList) > 0 }">
                        <c:forEach items="${myList}" var="edu">
                            <tr>
                                <fmt:parseDate value="${edu.oper_start_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
                                <fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_start_dt" scope="page"/>
                                <fmt:parseDate value="${edu.oper_end_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
                                <fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_end_dt" scope="page"/>
                                <td>${oper_start_dt} ~ ${oper_end_dt}</td> 
                                
                                <td class="left">
                                    ${edu.edutest_full_name}
                                </td>
                                
                                <c:choose>
                                    <c:when test="${edu.result_state == -1}">
                                        <td>${edu.oper_state_txt} </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${edu.result_state_txt}</td>
                                    </c:otherwise>
                                </c:choose>
                                
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4">자격증 취득 현황 목록이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table> --%>
		
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
	</div>
</div>
