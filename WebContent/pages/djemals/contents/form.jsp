<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>
<script>
var editor;
$(document).ready(function(){
	editor = $("#html").ckeditor();	
});

function f_Send() {
	if($("#contents_name").val() == "" ) {
		alert("콘텐츠명을 입력하여 주십시요");
		$("#contents_name").focus();
		return;
	}
	
	if($("#path").val() == "" ) {
		alert("파일 위치를 입력하여 주십시요");
		$("#path").focus();
		return;
	}
	
	document.frmContents.html.value = $("#html").val();
	
	document.frmContents.action = "./action.do";
	document.frmContents.submit();
	
}

function f_GetContents() {
	if($("#path").val() == "" ) {
		alert("파일 위치를 입력하여 주십시요");
		$("#path").focus();
		return;
	}
	
	
	$.ajax({
		  type		: "POST"
		, data 		: "path=" + $("#path").val()
		, url		: "./contents_load_ajax.do"
		, success : function(data){
			$("#html").val(data.html);
			$("#head").val(data.head);
		}
	});
}


</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">콘텐츠 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> 홈페이지 관리</li>
					<li><span>&gt;</span> 콘텐츠 관리</li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<div class="ib fl">
				<div class="text mt5">
						아래 컨텐츠 수정은 보안상의 이유로 사용을 금지합니다. 변경하셔도 보안 프로그램에서<br />
						원복함에 따라 다시 변경되어 집니다.
				</div>
			</div>
			
			
			<form:form name="frmContents" method="post" modelAttribute="contents">
			<form:hidden path="idx" />
			<form:hidden path="crud" />
			<form:hidden path="head" />
			<div class="form line bt bw2 bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>대분류</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="depth1"  class="input t1 fl"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>콘텐츠명</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="contents_name"  class="input t1 fl"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>파일위치</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
							<c:if test="${contents.crud == 'C' }">
								<form:input path="path"  class="input t1 fl w800"/>
								<a href="javascript:f_GetContents()" class="btn ml20 fl t1">로딩</a>
							</c:if>
							<c:if test="${contents.crud == 'U' }">
								<form:hidden path="path" />
								<span class="text">${contents.path}</span>
							</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<form:textarea path="html" rows="20" cols="50"/>
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
