<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_Save() {
	if( $("#k_reply").val() == "" ) {
		alert("내용을 입력하여 주십시요");
		$("#k_reply").focus();
		return;
	}
	
	document.frm.action = "./${kind}_action.do";
	document.frm.submit();
}

</script>			
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양</mark>상담실</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_counsel_board.do" class="cm">영양상담실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height: 800px;">
		<form:form name="frm" modelAttribute="qna" method="post">
		<form:hidden path="crud" />
		<form:hidden path="bbs_idx" />
		<div class="box t3 bgs mt30 p10 pl15 text small">
			<div class="area">
				<h4 class="title i_b_t6">답변하기</h4>
			</div>
		</div>
		<div class="form">
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="bbs_contents" class="ff_title i_b"><strong>내용</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="bbs_contents" class="ti">기본주소</label>
							<form:textarea path="k_reply" class="textarea t1 h350"/>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="btn_wrap mt40">
			<ul>
				<li><a href="javascript:f_Save()" class="btn big t1">완료</a></li>
				<li><a href="javascript:window.history.back();" class="btn big">취소</a></li>
			</ul>
		</div>
		
		</form:form>
	</div>
</div>