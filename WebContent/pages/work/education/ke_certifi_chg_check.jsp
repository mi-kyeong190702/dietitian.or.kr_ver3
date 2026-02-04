<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">
function f_Send(){
<c:choose>
	<c:when test="${ in_total_marks >= 8 and total_marks >= 20 } ">
	    document.frmCertifi.submit();
	</c:when>
	<c:otherwise>
	    alert("갱신 대상은 20평점 이수자(단, 본회 평점 8평점 이상 이수) 및 \n자격기간동안 대한영양사협회 회원자격을 유지한 자입니다.");
	    document.frmCertifi.submit();
	</c:otherwise>
</c:choose>
};
</script>


<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격증</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">자격증 발급안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">자격증 신청하기</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>	
		
		<!-- // Contents Start -->
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">자격증 신청하기</h4><br />
			
			<c:if test="${certifi.classify_code == '1' }">
				<c:set var="f_title" value="신규 발급" />				
			</c:if>
			
			<c:if test="${certifi.classify_code == '2' }">
				<c:set var="f_title" value="갱신 발급" />				
			</c:if>
			
			<c:if test="${certifi.classify_code == '3' }">
				<c:set var="f_title" value="재발급" />				
			</c:if>
		
			<div class="text s1 center mt50">		
				<span class="big cm">현재 <u>${name}</u> 님의 평점 유지현황은</span><br />
				<span class="mt10">* 평점 : 본회 <u> ${in_total_marks} </u> 점, 기타 <u> ${out_total_marks} </u> 점, 총 <u> ${total_marks} </u> 점 입니다.</span>
			</div>
			
			<form:form name="frmCertifi" method="post" modelAttribute="certifi" action="./ke_certifi_form.do">
			<form:hidden path="add_file_no" />
			<form:hidden path="classify_code" />
			<form:hidden path="certifi_text" />
			<form:hidden path="code_certifi" />
			
			</form:form>
			
			<li><a href="javascript:f_Send();" class="btn big t1">신청하기</a></li>
													
		<!-- // Contents Start -->
	</div>
</div>
	