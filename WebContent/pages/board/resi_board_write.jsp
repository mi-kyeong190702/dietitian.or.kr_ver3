<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>
<script type="text/javascript">
	
	var editor;
	
	$(document).ready(function()
	{
		editor = $("#resi_content2").ckeditor();	
	});
	
	function doWrite() 
	{
		if($("#resi_address").val() == "" ) {
			alert("음식명을 꼭 써주셔야 합니다.");
			$("#resi_address").focus();
			return;
		}

		if($("#resi_url").val() == "") {
			alert("작성자를 꼭 써주셔야 합니다.");
			$("#resi_url").focus();
			return;
		}

		if($("#resi_content2").val() == "") {
			alert("내용을 꼭 써주셔야 합니다.");
			$("#resi_content2").focus();
			return;
		}
		
		if($("#resi_password").val() == "") {
			alert("비밀번호를 꼭 써주셔야 합니다.");
			$("#resi_password").focus();
			return;
		}
		
		var serial_no=document.board.resi_serial_no.value;
		$("#resi_serial_no").val(serial_no);
		document.frmWrite.resi_content2.value = $("#resi_content2").val();
		
		<c:if test="${param.board_form == 'write'}">
		document.frmWrite.action = "/resi_board_insert.do";
		</c:if>
		
		<c:if test="${param.board_form != 'write'}">
		document.frmWrite.action = "/resi_board_update.do";
		</c:if>
		
		document.frmWrite.submit();
	} 
	
	function doCancel() {
		document.board.bbs_form.value="list";
		document.board.submit();
	}
	
	function doComplete(){
		document.board.bbs_form.value="list";
		document.board.submit();
	}
	
</script>

<form name="frmWrite"  method="post">
<input type="hidden" name="resi_serial_no" id="resi_serial_no" value=""/>
<div class="form line bt bcm bw2">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>음식명</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1" id="resi_address" name="resi_address"  value="${boardRow.resi_address}"  />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid2" class="ff_title i_b"><strong>작성자</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 w200" id="resi_url" name="resi_url" value="${boardRow.resi_url}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid4" class="ff_title i_b"><strong>총분량</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 w200" id="resi_user_name" name="resi_user_name" value="${boardRow.resi_user_name}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid4" class="ff_title i_b"><strong>조리온도</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 w200" id="resi_title" name="resi_title"  value="${boardRow.resi_title}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid4" class="ff_title i_b"><strong>조리시간</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 w200" id="resi_content1" name="resi_content1" value="${boardRow.resi_content1}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid18" class="ff_title i_b"><strong>재료 및 조리방법</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid19" class="ti">기본주소</label>
					<textarea class="textarea t1 h350" id="resi_content2" name="resi_content2">${boardRow.resi_content2}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid4" class="ff_title i_b"><strong>비밀번호</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 w200" id="resi_password" name="resi_password" />
				</div>
			</div>
		</div>
	</div>
</div>
	
<div class="btn_wrap mt40">
	<ul>
		<li><a href="javascript:doWrite();" class="btn big t1">완료</a></li>
		<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
	</ul>
</div>
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>