<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<%@include file="/pages/common.jsp"%>

<script>
function showHideAns(idx) {
	if( $("#faq_ans" + idx).css("display") != "none" ) {
		$("#faq_ans" + idx).hide();
		$("#faq_icon" + idx).removeClass("close");
		$("#faq_icon" + idx).addClass("open");
	} else {
		$("#faq_ans" + idx).show();
		$("#faq_icon" + idx).removeClass("open");	
		$("#faq_icon" + idx).addClass("close");
		
	}
}

</script>

<div class="s_page">
	<c:import url="/pages/faq/inc_header.jsp"></c:import>
	
	<div class="sp_body">
		<c:choose>
			<c:when test="${faq_category == 3 && g_userid == ''}">
				<div class="w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
		
				<!--  contents -->
				<div class="list_faq text small">
					<ul>
						<c:forEach items="${faqList}" var="faq">
						<li>
							<div class="lf_wrap question">
								<div class="lf_icon">Q</div>
								<div class="lf_subject bold"  onclick="javascript:showHideAns(${faq.idx})">
									${faq.faq_subject}
								</div>
								<div class="lf_state" onclick="javascript:showHideAns(${faq.idx})"  style="cursor:hand !important;">
									<span class="icon open"  id="faq_icon${faq.idx}"><span class="ti">열기</span></span>
								</div>
							</div>
							<div class="lf_wrap answer" style="display:none;" id="faq_ans${faq.idx}">
								<div class="lf_icon">A</div>
								<div class="lf_txt">
									${faq.faq_contents}
									
									<c:if test="${ isAdmin  }">
									<div class="right"><a href="faq_form.do?idx=${faq.idx}&faq_category=${faq.faq_category}" class="btn t2 small">수정/삭제</a></div>
									</c:if>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<c:if test="${ isAdmin  }">
				<div class="btn_wrap mt20">
					<ul class="fr">
						<li><a href="faq_form.do?faq_category=${faq_category}" class="btn big t1">글쓰기</a></li>
					</ul>
				</div>
				</c:if>
				<!-- contents end -->
			</c:otherwise>
		</c:choose>
	</div>
</div>