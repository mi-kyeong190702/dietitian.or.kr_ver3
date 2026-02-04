<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@include file="../common.jsp"%>

<script>
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
function doc_print_pre(detcode, doc_seq, code_kind){
	
	var rating = 'N';
    var path = "/doc_form/docu_print_user.jsp?gubun=E&print_kind=1&code_kind=" + code_kind + "&detcode=" + detcode + "&doc_seq=" + doc_seq;
    location.href = path;
  	var win = window.open(path, "doc_print",  "width=750,height=700,scrollbars=no,resizable=yes" );
    win.focus();
}

function doc_print(detcode, doc_seq, code_kind){
	
	var rating = 'N';
	 
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

function doc_print2(str1, str2, doc_name, person_yn, operkey, isMember)
{
	
	
	shape  = "width=750,height=700,";
    shape += "toolbar=no,location=no,directories=no,status=no,";
    shape += "menubar=no,scrollbars=no,resizable=yes";
    path   = "/doc_form/docu_print_edu.jsp?doc_code='"+encodeURI(str1)+"'&doc_seq='"+encodeURI(str2)+"'"+"&doc_name='"+encodeURI(doc_name)+"'"+"&person_yn='"+ encodeURI(person_yn)+"'"+"&operkey='"+ encodeURI(operkey)+"'"+"&isMember='"+ encodeURI(isMember)+"'";
	
    xx = screen.availWidth;
    yy = screen.availHeight;
    sxx = 0;
    syy = 0;
    sxx = (xx/2) - 200;
    syy = (yy/2) - 90;

    shape = shape + ", top=" + syy + ", left=" + sxx;

    window.open(path, "doc_print_edu", shape);
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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">직무교육</mark> 현황</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/kmp_situation.do">MY 교육정보</a></li>
				<li><a href="/kmp_situation.do" class="cm">직무교육 현황</a></li>
			</ul>
		</div>
	</div>
	<hr/>
	<div class="sp_body">
		<!-- <p class="text middle cb s1 mt10">
			※ 2022년 6월부터 인터넷 익스플로러(Internet Explorer, IE) 지원이 종료됨에 따라<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;크롬(Chrome)에서 ‘IE Tab’ 확장프로그램 설치 후 회원증 및 영수증을 출력하실 수 있습니다.<br>
			※ 1회 설치 후 지속적으로 사용이 가능하오니<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아래의 [IE Tab 설치방법 바로가기]를 참고하신 후 이용해주시기 바랍니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/assets/ver2/mypage/docu/2022/Chrome_IETab_Guide.pdf" class="btn t2" target="_blank" title="새창으로 보기">IE Tab 설치 방법 바로가기<span class="icon quick"></span></a>
			<br><br>
		</p> -->
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
							<%-- <td>
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
							</c:choose> --%>
							
							<td>${requestScope.myList[i].result_state}</td>
							
							<td>
								<input type="button" class="btn t2" value="출력" onclick="rcp_doc_print('0109', '9', '교육결제영수증','${requestScope.myList[i].person_yn}','${requestScope.myList[i].operkey}${requestScope.myList[i].receipt_no}', '${isMember}')"/>
							</td>
							<td>
								<c:if test="${requestScope.myList[i].rt >= 10 && requestScope.myList[i].rt != ''  }">
									<a href="javascript:doc_print('${requestScope.myList[i].detcode}','${requestScope.myList[i].result_no}','${requestScope.myList[i].code_kind}')" class="btn">출력</a>
								</c:if>
							</td>
							<td>
                                <c:if test="${requestScope.myList[i].rt >= 10 && requestScope.myList[i].rt != '' && fn:trim(requestScope.myList[i].result_no) != '' }">
                                    <a href="javascript:goPrint_new('${requestScope.myList[i].print_kind}','${requestScope.myList[i].detcode}','${requestScope.myList[i].result_no}','${requestScope.myList[i].code_kind}')" class="btn">출력</a>
                                </c:if>
                            </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">직무교육 현황 목록이 없습니다. </td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
	</div>
</div>
