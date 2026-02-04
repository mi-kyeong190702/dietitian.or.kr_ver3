<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<script>
function f_Reload() {
	document.frmSurvey.action = "./form.do";
	document.frmSurvey.submit();
}

function f_Send() {
	if($("#tms_title").val() == "" ) {
		alert("설문제목을 입력하여 주십시요");
		$("#tms_title").focus();
		return;
	}
	
	document.frmSurvey.action = "./action.do";
	document.frmSurvey.submit();
	
}


function f_Main_Show() {
	$("#main_select").hide();
	$("#main_input").show();
}

function f_Main_Add() {

	if($("#main_tms_title").val() == "" ) {
		alert("설문명을 입력하여 주십시요");
		$("#main_tms_title").focus();
		return;
	}
	
	document.frmSurvey.action = "./mainAction.do";
	document.frmSurvey.submit();
}



</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">설문 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">설문 관리</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<form:form name="frmSurvey" method="post" modelAttribute="subject">
			<form:hidden path="crud" />
			<div class="form line bt bw2 bcm">
				<div class="f_wrap line bb p8" id="main_select">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>설문</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="tms_cnt"  class="select t2 fl w500 ml5" items="${mainList}" itemValue="tms_cnt" itemLabel="tms_title">
								</form:select>
								
								<a href="javascript:f_Main_Show()" class="btn ml20 fl t0">추가</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8" style="display:none" id="main_input">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>설문</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="main_tms_title"  class="input t1 fl w500"/>
								<a href="javascript:f_Main_Add()" class="btn ml20 fl t1">저장</a>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>설문제목</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="tms_title"  class="input t1" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title">
							<strong>항목</strong>
							<form:select path="subject_count"  class="select t2 fl ml5" onchange="f_Reload()">
								<c:forEach begin="1" end="10" var="cnt">
									
									<option value="${cnt}" <c:if test="${ subject.subject_count == cnt }"> selected</c:if> >${cnt}건</option>
								</c:forEach>
							</form:select>
						</div>
						<ul class="ff_wrap ml120">
							<c:forEach begin="1" end="${subject.subject_count}" var="cnt">
							<li class="mt5">
								<label for="inputid2" class="ti">${cnt}.</label>
								<form:input path="tmc_titles" class="input t1"/>
								
							</li>
							</c:forEach>
							
						</ul>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="./list.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_Send()" class="btn big t1">저장</a></li>
					
				</ul>
			</div>
			</form:form>
			
		</div>
	</div>
</div>
