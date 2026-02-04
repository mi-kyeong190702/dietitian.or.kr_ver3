<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common.jsp"%>

<script type="text/javascript">

function doc_print(detcode, doc_seq)
{
	shape  = "width=750,height=700,";
    shape += "toolbar=no,location=no,directories=no,status=no,";
    shape += "menubar=no,scrollbars=no,resizable=yes";
    path   = "/doc_form/docu_print_user.jsp?gubun=E&print_kind=1&code_kind=3&detcode=" + detcode + "&doc_seq="+ doc_seq;

    xx = screen.availWidth;
    yy = screen.availHeight;
    sxx = 0;
    syy = 0;
    sxx = (xx/2) - 200;
    syy = (yy/2) - 90;

    shape = shape + ", top=" + syy + ", left=" + sxx;
    window.open(path, "doc_print", shape);
}

function point_apply(str1,str2)
{
	if(confirm("점수가 반영이되면 변경이 불가합니다. \n점수를 반영하시겠습니까?")){			 
		$.ajax ( {
            type		: "POST"
			, url		: "/kmp_point_aply.do"
			, dataType  : "text"
			, data		: "type="+str1+"&seq="+str2
			, cache		: false
			, success	: handleLoad
		});
		
	}

}
function handleLoad(data)
{
	alert(data);
	location.reload(true);
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">스포츠유지</mark> 교육</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/mypage/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/mypage/kmp_education.do">MY 교육정보</a></li>
				<li><a href="/kmp_sport.do" class="cm">스포츠유지 교육</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="box p20">
		<c:choose>
			<c:when test="${fn:length(requestScope.myList) > 0 }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" height="25">
						<b>자격증 번호  :  ${requestScope.result_no} </b> / 유효기간  ${requestScope.result_start_dt} ~  ${requestScope.result_end_dt}   까지의 교육현황입니다.
					</td>
				</tr>
				<form name="edu" type="post">
					<tr>
						<td> 본회 : ${requestScope.col1} 점 / 기타 : ${requestScope.col2} 점  / 봉사 : ${requestScope.col3} 점  /  총점 ${requestScope.total} 점</td>
						<td align="right">
							<div class="area"><select name="no" class="select t2 fl w100" style="width: 380px;" onchange="document.edu.submit();">
								<c:forEach var="i" begin="0" end="${fn:length(requestScope.myList)-1 }">
									<option value="${i}" <c:if test="${i == requestScope.view_num}">selected</c:if>>${requestScope.myList[i]}</option>
								</c:forEach>
							</select> 
						</div>
						</td>
					</tr>
					<c:if test="${requestScope.view_num == '0' }" >
					<tr>
						<td  height= "30" colspan="2"><font color="#ff3300">미반영된 전문교육을 포함한 총점입니다. 미반영된 점수가 있는 경우 점수를 반영해 주세요.</font>
						</td>
					</tr>
					</c:if>
				</form>
			</table>
			</c:when>
			<c:otherwise><div class="title s1 i_b_t6">회원님께서는 해당사항이 없습니다.</div></c:otherwise>
			</c:choose>
		</div>

		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="90">
				<col width="*">
				<col width="50">
				<col width="70">
				<col width="70">
				<col width="70">
				<col width="70">
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">이수일</th>
				<th scope="col" class="bold cm">과목명</th>
				<th scope="col" class="bold cm">평점</th>
				<th scope="col" class="bold cm">평점종류</th>
				<th scope="col" class="bold cm">이수여부</th>
				<th scope="col" class="bold cm">평점적용</th>
				<th scope="col" class="bold cm">이수확인서</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${requestScope.myList2.size() >0 }">
					<c:forEach var="i" begin="0" end="${requestScope.myList2.size()-1 }">
						<tr <c:if test="${requestScope.myList2[i].rt == '11' || requestScope.myList2[i].rt == '10'}">style="background-color:#ffd3d0"</c:if>
							<c:if test="${requestScope.myList2[i].rt == '10' &&  requestScope.myList2[i].point_manage == '0' && requestScope.view_num == '0'}">style="background-color:#e8f3ff"</c:if>>
							<td>
								<fmt:parseDate value="${requestScope.myList2[i].oper_end_dt}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
								<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="oper_end_dt" scope="page"/>${oper_end_dt}
							</td>
							<td>${requestScope.myList2[i].yyyy}년도 ${requestScope.myList2[i].edutest_name} - ${requestScope.myList2[i].code_bran_str}
								<c:if test="${requestScope.myList2[i].btext != ''}">( ${requestScope.myList2[i].btext} )</c:if>
							</td>
							<td>${requestScope.myList2[i].result_point}</td>
							<td>
							<c:choose>
								<c:when test="${requestScope.myList2[i].outside_yn_code == 'N'}">본회</c:when>
								<c:when test="${requestScope.myList2[i].outside_yn_code == 'Y'}">기타</c:when>
								<c:when test="${requestScope.myList2[i].outside_yn_code == 'E'}">없음</c:when>
								<c:when test="${requestScope.myList2[i].outside_yn_code == 'S'}">봉사</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${requestScope.myList2[i].rt == '11' || requestScope.myList2[i].rt == '10'}">이수</c:when>
									<c:otherwise>미이수</c:otherwise>
								</c:choose>
							</td>
							<td><!-- 점수반영 -->
								<c:choose>
									<c:when test="${requestScope.myList2[i].rt == '10' &&  requestScope.myList2[i].point_manage == '0' && requestScope.view_num == '0'}"><a href="javascript:point_apply('5'
	,'${requestScope.myList2[i].code_kind}${requestScope.myList2[i].code_certifi}${requestScope.myList2[i].code_seq}${requestScope.myList2[i].code_bran}${requestScope.myList2[i].bran_seq}${requestScope.myList2[i].receipt_no}')" class="btn">점수반영</a></c:when>
									<c:otherwise>${requestScope.myList2[i].result_state}</c:otherwise>
								</c:choose>
							</td>
							<td><!-- 출력 -->
								<c:choose>
									<c:when test="${requestScope.myList2[i].result_no != '' && requestScope.myList2[i].rt >= 10 }"><a href="javascript:doc_print('${requestScope.myList2[i].detcode}','${requestScope.myList2[i].result_no}')" class="btn">출력</a></c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">스포츠유지 교육 목록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>	
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fl">
				<li><a href="mailto:kdasys@hanmail.net" class="btn big">문의하기</a></li>
			</ul>			
			<ul class="fr">
				<li><a href="javascript:history.back(-1);" class="btn big t1">이전</a></li>
			</ul>
		</div>
	</div>
</div>
