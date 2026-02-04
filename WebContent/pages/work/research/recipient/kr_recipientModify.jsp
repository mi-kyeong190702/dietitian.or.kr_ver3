<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function(){
		//180402 추가
		$("#lic_no").keyup(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		$("#lic_no").focusout(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		$("#pers_hp").keyup(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		$("#pers_hp").focusout(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
	
	});

	var msg ='${msg}';
	if(msg !=""){
		alert(msg);
	}

	function doSearch(){
		
		var pers_name = $("#pers_name");
		var lic_no = $("#lic_no");
		var pers_hp = $("#pers_hp");
		
		if(pers_name.val() == ""){
			alert("성명을 입력하세요");
			pers_name.focus();
			return
		}
		
		if(lic_no.val() == ""){
			alert("면허번호를 입력하세요");
			lic_no.focus();
			return
		}
		
		if(pers_hp.val() == ""){
			alert("휴대폰 번호를 입력하세요");
			pers_hp.focus();
			return
		}
		
		recipientForm.method="POST";
		recipientForm.action = "recipientModifyCheck.do";
		recipientForm.submit();

	}

	
	function doCancel(){
		$(".w150").val("");
	}
	
</script>
<form name="recipientForm">

<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">보수교육</mark> 미대상자 수정</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/recipient/recipient.do">보수교육 미대상자</a></li>
							<li><a href="/work/research/recipient/recipientModify.do" class="cm">보수교육 미대상자 수정</a></li>
						</ul>
					</div>
				</div>
				<hr />
<div class="sp_body">
	<!-- 2022.12.29 신규 오픈으로 주석처리 및 이미지 디스플레이-->
	<!-- <img src="/assets/ver2/popup/images/popup_20221229.png" width="700" alt="" usemap="#imgmap" border="0"> -->
					<h4 class="title bold t2 cm s1 i_b_t2">보수교육 미대상자 수정</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="pers_name"  name="pers_name"/>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="lic_no" name="lic_no" maxlength="6" />
										<span style="font-size: 15px; line-height: 30px; text-indent: 15px; color: red;" >&nbsp;&nbsp;(숫자만 입력)</span>
										<a href="http://lic.mw.go.kr/login/login.do" target="_blank" class="fr btn t2_1 form ml5" title="새창으로 열기">보건복지부 면허번호 확인하기</a>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="pers_hp" class="ff_title i_b"><strong>휴대폰 번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 fl w150" id="pers_hp" name="pers_hp" maxlength="11" />
										<p class="fl text cp s1 ml10">예) 01012345678</p>
									</div>
								</div>
							</div>
						</div>
					<div class="btn_wrap mt20">
						<ul>
							<li><a href="javascript:doSearch();" class="btn big t1">확인</a></li>
							<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
						</ul>
					</div>
	</div>
</div>
</div>
</form>