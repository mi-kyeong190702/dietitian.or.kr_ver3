<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>
<script>
var editor;

$(document).ready(function(){
	editor = $("#faq_contents").ckeditor();	
});
		
		
function f_Send() {
	if( $("#faq_subject").val() == "" ) {
		alert("질문을 입력해 주세요");
		$("#faq_subject").focus();
		return;
	}
	
	if( $("#faq_contents").val() == "" ) {
		alert("답변을 입력해 주세요");
		$("#faq_contents").focus();
		return;
	}

	document.frmFaq.faq_contents.value =  $("#faq_contents").val();	
	document.frmFaq.submit();
}

function f_Delete() {
	if( confirm("정말 삭제하시겠습니까?") ) {
		$("#crud").val("D");
		document.frmFaq.submit();	
	}
}

</script>
<div class="s_page">
	<c:import url="/pages/faq/inc_header.jsp"></c:import>
	
	<!--  contents -->
	<form:form name="frmFaq" method="post" modelAttribute="faq" action="action.do">
	<form:hidden path="idx" />
	<form:hidden path="faq_category"/>
	<form:hidden path="crud"/>
	<div class="form line bt bcm bw2">
		<div class="f_wrap line bb p8">
			<div class="f_field div1">
				<label for="inputid1" class="ff_title i_b"><strong>질문</strong></label>
				<div class="ff_wrap ml120">
					<div class="area">
						<form:input path="faq_subject" class="input t1" />
					</div>
				</div>
			</div>
		</div>

		<div class="f_wrap line bb p8">
			<div class="f_field div1">
				<label for="inputid1" class="ff_title i_b"><strong>목록 순서</strong></label>
				<div class="ff_wrap ml120">
					<div class="area">
						<form:input path="order_num" class="input t1" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="f_wrap line bb p8">
			<div class="f_field div1">
				<label for="inputid18" class="ff_title i_b"><strong>답변</strong></label>
				<div class="ff_wrap ml120">
					<div class="area">
						<label for="inputid19" class="ti">답변</label>
						<form:textarea path="faq_contents" class="textarea t1 h350" />
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</form:form>
		
	<div class="btn_wrap mt40">
		<ul>
			<li><a href="javascript:f_Send();" class="btn big t1">저장</a></li>
			<c:if test="${faq.crud == 'U' }">
			<li><a href="javascript:f_Delete();" class="btn big t1">삭제</a></li>
			</c:if>
			<li><a href="javascript:document.frmFaq.reset();" class="btn big">취소</a></li>
		</ul>
	</div>
		
		<!-- contents end -->
	</div>
</div>