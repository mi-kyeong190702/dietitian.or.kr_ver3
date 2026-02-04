<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common.jsp"%>
<%@ page import="kda.SessionInfo" %>

<%
	String code_pers = session.getAttribute(SessionInfo.CODE_PERS).toString();
%>

<script type="text/javascript">
function doc_print(str1, str2, doc_name)
{
	shape  = "width=750,height=700,";
    shape += "toolbar=no,location=no,directories=no,status=no,";
    shape += "menubar=no,scrollbars=no,resizable=yes";
    path   = "/doc_form/docu_print.jsp?doc_code="+str1+"&doc_seq='"+str2+"'" + "&doc_name='" + doc_name + "'";
	
    xx = screen.availWidth;
    yy = screen.availHeight;
    sxx = 0;
    syy = 0;
    sxx = (xx/2) - 200;
    syy = (yy/2) - 90;

    shape = shape + ", top=" + syy + ", left=" + sxx;

    window.open(path, "doc_print", shape);
}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">회비</mark> 납입내역</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/mypage/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/mypage/kmp_payment.do" class="cm">회비 납입내역</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<p class="text middle cb s1 mt10">
			※ 2022년 6월부터 인터넷 익스플로러(Internet Explorer, IE) 지원이 종료됨에 따라<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;크롬(Chrome)에서 ‘IE Tab’ 확장프로그램 설치 후 회원증 및 영수증을 출력하실 수 있습니다.<br>
			※ 1회 설치 후 지속적으로 사용이 가능하오니<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아래의 [IE Tab 설치방법 바로가기]를 참고하신 후 이용해주시기 바랍니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/assets/ver2/mypage/docu/2022/Chrome_IETab_Guide.pdf" class="btn t2" target="_blank" title="새창으로 보기">IE Tab 설치 방법 바로가기<span class="icon quick"></span></a>
			<br><br>
		</p>
		
		<div class="box p20">
			<div class="title s1 i_b_t6">
				회비납입내역
			</div>
		</div>
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="90">
				<col width="90">
				<col width="90">
				<col width="90">
				<col width="*">
				<col width="70">
			</colgroup>
			<thead>			
			<tr>
				<th scope="col" class="bold cm">납입년도</th>
				<th scope="col" class="bold cm">회비구분</th>
				<th scope="col" class="bold cm">금액</th>
				<th scope="col" class="bold cm">비고</th>
				<th scope="col" class="bold cm">회원유효기간</th>
				<th scope="col" class="bold cm">출력</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${requestScope.myList.size() > 0 }">
					<c:forEach var="i" begin="0" end="${requestScope.myList.size()-1 }">
						<tr>
							<td>${fn:substring(requestScope.myList[i].auth_start,0,4)}</td>
							<td>${requestScope.myList[i].cm_name}</td>
							<td><fmt:formatNumber type="currency" value="${requestScope.myList[i].pres_money}" pattern="###,###" />원</td>
							<td><c:choose>
							<c:when test="${requestScope.myList[i].incom_flag == 'Y'}">완납</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${requestScope.myList[i].incom_flag != 'D' && requestScope.myList[i].code_inout_gubun == '2'}"><font color='#ff0000'>출금</font></c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${requestScope.myList[i].pers_state == '07'}">입금확인중</c:when>
											<c:otherwise>입금
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
							</c:choose></td>
							
							<td><c:if test="${requestScope.myList[i].auth_start != ''}"><fmt:parseDate value="${requestScope.myList[i].auth_start}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
								<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="auth_start" scope="page"/>
								${auth_start}</c:if> ~ 
								<c:if test="${requestScope.myList[i].auth_end != ''}">
								<fmt:parseDate value="${requestScope.myList[i].auth_end}" pattern="yyyyMMdd" var="dateformat" scope="page"/>
								<fmt:formatDate value="${dateformat}" pattern="yyyy.MM.dd" var="auth_end" scope="page"/>
								${auth_end}</c:if>
							</td>
							<td>
								<c:if test="${requestScope.myList[i].conform_yn == 3}">
										
										<a href="javascript:doc_print('0105', '<%=code_pers%>${requestScope.myList[i].dues_gubun}${requestScope.myList[i].dues_h_seq}', '${requestScope.doc_name}')" class="btn">출력</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">회비 납입내역이 존재 하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
</div>
