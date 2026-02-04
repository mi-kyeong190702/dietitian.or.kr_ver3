<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(){
	
	if($("#bateSubject").val()== ""){
		alert("주제를 입력하세요.");
		$("#bateSubject").focus();
		return;
	}
	document.frmDiscuss.submit();
}
           
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<form:form name="frmDiscuss" modelAttribute="discuss" method="post" action="discussAction.do">
		<form:hidden path="crud" />
		<form:hidden path="bateIndex" />
		<div class="cp_contents">
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title"><strong>주제</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<form:input path="bateSubject" class="input t1 fl w50p ml5"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="javascript:f_action();" class="btn big t1">저장합니다</a></li>
				</ul>
			</div>
		</div>
		</form:form>

	</div>
</div>
