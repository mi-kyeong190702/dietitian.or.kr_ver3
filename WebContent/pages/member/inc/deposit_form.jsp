<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function showPopup(){  		
 	$('#popup_form').bPopup();  		
}

function jusoCallBack( roadFullAddr
		 , roadAddrPart1
		 , addrDetail
		 , roadAddrPart2
		 , engAddr
		 , jibunAddr
		 , zipNo) {
	
	document.frm.pers_add.value = roadAddrPart1 + " " + addrDetail + " " + roadAddrPart2;
	/*  document.frm.code_post.value 		= zipNo.substring(0,3) + zipNo.substring(4,7); */
	document.frm.code_post.value 		= zipNo;
}    


function f_Send(){
	f = document.frm;
	if (f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	if (f.code_post.value==""  || f.pers_add.value==""  ){
		alert("주소를 정확히 입력하세요");
		return;
	} 
	
	if (f.tel.value==""){
		alert("연락 가능한 번호를 입력하세요");
		f.tel.focus();
		return;
	} 
	
	f.submit();
}
</script>
<div id="popup_form" class="popup_box_1">
	<span class="popup_btn">X</span>
	<div id="popup" class="popup_wrap_1">					
		<div class="p_head_1 p15">
			<h2 class="title t3 cw bold s1 i_b_t6">지로용지 신청</h2>
		</div>
		<form name="frm" method="post" action="km_deposit_manner_action.do">
		<input type="hidden" name="kind" value="${param.kind}" />
			<fieldset>							
				<div class="area p10 w500 ml5">
					<span class="text s1 i_b_t6">지로의 경우, 회원 인증시까지 최소 2 주정도가 소요되므로 참고하시기 바랍니다.</span>
					<table class="table t1 text s1 ssmall ca center mt5">
						<colgroup>
							<col width="80">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<td scope="row" class="bold cm bgs_2">성명</td>
							<td class="left"><input type="text"  class="input t1 w200" name="name" id="name" /></td>
						</tr>
						<tr>
							<td scope="row" rowspan="2" class="bold cm bgs_2">주소</td>
							<td scope="row" class="left">
								<input type="text" name="code_post" id="code_post" class="input t1 w100"  onclick="C_Address();"  readonly="true"/> 
								<a href="javascript:C_Address();" class="btn form t1  ml5">주소검색</a> 
							</td>
						</tr>
						<tr>
							<td class="left"><input type="text" name="pers_add" id="pers_add" class="input t1 w350"  onclick="C_Address()"  /></td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs_2">연락처</td>
							<td class="left"><input type="text" name="tel" id="tel" class="input t1 w200"  /></td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs_2">요청사항</td>
							<td class="left"><input type="text" name="request_msg"  class="input t1 w350"  /></td>
						</tr>
						</tbody>
					</table>
					
					<div class="area mt10">※ 접수된 요청서는 발송 요청한 주소로 3~4 일이내 발송하여 드리도록 하겠습니다 .</div>
				</div>
				
				<div class="btn_wrap mt10 mb20">
					<ul>
						<li><a href="javascript:f_Send();" class="btn big t1">신청</a></li>
					</ul>
				</div>									
			</fieldset>
		</form>
	</div>
</div>







