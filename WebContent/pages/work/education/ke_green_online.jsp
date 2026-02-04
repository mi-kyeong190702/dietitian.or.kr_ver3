<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_send(){
    
	if (document.frmGreen.name.value == ""){
			alert("성명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.name.focus();
		return;
	}
	if (document.frmGreen.pers_birth.value == ""){
			alert("생년월일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.pers_birth.focus();
		return;
	}

	if (document.frmGreen.pers_birth.value.length != 8){
			alert("생년월일을 형식에 맞춰 입력해 주십시오.\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.pers_birth.focus();
		return;
	}

	if (document.frmGreen.email.value == ""){
			alert("이메일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.email.focus();
		return;
	}
	
	if (document.frmGreen.email_sub.value == ""){
			alert("이메일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.email_sub.focus();
		return;
	}
	
	var ckMail = $("#email").val()+"@"+$("#email_sub").val();
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(regex.test(ckMail) === false) {  
		$("#email_sub").focus();
	    alert("잘못된 이메일 형식입니다.");  
	    return;  
	}
		
	/*
	if (document.frmGreen.email_list.value == "etc"){
		if (document.frmGreen.email_sub.value == ""){
				alert("이메일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				document.frmGreen.email_sub.focus();
			return;
		}
	} else {
		document.frmGreen.email_sub.value = document.frmGreen.email_list.value;
	}
	*/
	if (document.frmGreen.tel_hp.value == ""){
			alert("휴대전화를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			document.frmGreen.tel_hp.focus();
		return;
	}
	<c:if test="${green.crud == 'C' }">
	if (document.frmGreen.add_file.value == ""){
			alert("초록논문을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	
	if(document.frmGreen.add_file.value.substring(document.frmGreen.add_file.value.length-3,document.frmGreen.add_file.value.length+1)!="hwp"){
		alert("첨부 파일은 한글 파일만 사용 가능합니다.\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	</c:if>
	
	document.frmGreen.submit();
}

function f_delete() {
	if(confirm("정말 취소하시겠습니까?") ) {
		$("#crud").val("D");
		document.frmGreen.submit();
	}
}

function f_email(){
	document.frmGreen.email_sub.value = document.frmGreen.email_list.value;
}

$(document).ready(function()
{
	// 20200519 추가
	$("#persBirthDt").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	$("#persBirthDt").focusout(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	
	$("#lic_no").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	$("#lic_no").focusout(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	
	$("#hp_no").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	$("#hp_no").focusout(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	
	$("#tel_no").keyup(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
	$("#tel_no").focusout(function(event){
		$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	});
});

</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">초록</mark>접수</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_green.do" class="cm">초록접수</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_green.do">접수안내</a></li>
				<li><a href="/work/education/ke_green_online.do" <c:if test="${green.crud == 'C' }"> class="on" </c:if> >온라인접수</a></li>
				<li><a href="/work/education/ke_green_verification.do" <c:if test="${green.crud == 'U' }"> class="on" </c:if> >접수확인 및 심사결과</a></li>
				
				<!-- 
					온라인접수 시작/종료 처리시 4군데 수정
					ke_green_list.jsp
					ke_green_online.jsp
					ke_green_verification.jsp
					ke_green.jsp
				 -->
				
				
			</ul>
		</div>	
		
		<!-- // Contents Start -->
	
		<form:form method="post" name="frmGreen" modelAttribute="green" action="./ke_green_online_action.do"  enctype="multipart/form-data">
		<form:hidden path="idx" />
		<form:hidden path="crud" />
			<fieldset>
			<legend><span class="ti">초록 접수</span></legend>
				<div class="box t2 bgs mt50 p20 text">
					<div class="area">
					<h5 class="title i_b_t6 bold s1">
						<c:if test="${green.crud == 'C' }">
						<mark class="cm">온라인</mark> 접수</h5>
						</c:if>
						<c:if test="${green.crud == 'U' }">
						<mark class="cm">온라인</mark> 접수확인 및 수정</h5>
						</c:if>
						
						
					<!-- <div class="w550 ac mt40">
						<div class="box t2 mt10 p30"> -->
								<!-- <div class="box t1 r5 p30 text s1 center">
								<p class="middle bold cb mb30"><mark class="cm">초록접수</mark>가 마감되었습니다.</p>
								<p class="small mt10">기타 문의는 아래 연락처로 연락바랍니다.<br />감사합니다.<p>
								<ul class="mt10">
									<li class="link"><a href="mailto:kdasys@hanmail.net" title="메일쓰기">E-mail : kdasys@hanmail.net</a></li>
									<li class="ca">Tel. 02-823-5680 (내선 514)</li>
								</ul>
								<p class="small mt10">※ 통화량 많아 연결이 어려울 수 있습니다.<br />메일로 문의 주시면, 바로 확인이 가능합니다.</p>
							</div>
					<!--	</div>
					 </div> -->
 					
						<div class="box t1 r5 mt10 p10">
							<h6 class="title s1 i_b_t3"><mark class="bold">회원정보</mark></h6>
							<div class="form mt10 line bt bcm">
								<%-- <div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>구분</strong></div>
										<div class="ff_wrap ml120 text">
											<div class="area">
												<form:radiobutton path="gubun" id="gubun1" class="mr5" value="01"/>
												<label for="gubun1" class="mr20">포스터전시</label>
												<form:radiobutton path="gubun" id="gubun2" class="mr5" value="02"/>
												<label for="gubun2" class="mr20">포스터구연</label>
											</div>
										</div>
									</div>
								</div> --%>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>분야</strong></div>
										<div class="ff_wrap ml120 text">
											<div class="area">
												<form:radiobutton path="edu_type" id="edu_type_1" value="01" class="mr5"/>
												<label for="edu_type_1" class="mr20">급식경영/단체급식</label>
												<form:radiobutton path="edu_type" id="edu_type_2" value="02" class="mr5"/>
												<label for="edu_type_2" class="mr20">영양교육</label>
												<form:radiobutton path="edu_type" id="edu_type_3" value="03" class="mr5"/>
												<label for="edu_type_3" class="mr20">임상영양</label>
												<form:radiobutton path="edu_type" id="edu_type_4" value="04" class="mr5"/>
												<label for="edu_type_4" class="mr20">식품위생</label>
											</div>
											<div class="area mt10">
												<form:radiobutton path="edu_type" id="edu_type_5" value="05" class="mr5"/>
												<label for="edu_type_5" class="mr20">식품학/식품과학</label>
												<form:radiobutton path="edu_type" id="edu_type_6" value="06" class="mr5"/>
												<label for="edu_type_6" class="mr20">식품조리</label>
												<form:radiobutton path="edu_type" id="edu_type_7" value="07" class="mr5"/>
												<label for="edu_type_7" class="mr20">지역사회영양(영양조사/식습관)</label>
												
											</div>
											<div class="area mt10">
												<form:radiobutton path="edu_type" id="edu_type_9" value="09" class="mr5"/>
												<label for="edu_type_9" class="mr20">식생활관리</label>
												<form:radiobutton path="edu_type" id="edu_type_10" value="10" class="mr5"/>
												<label for="edu_type_10" class="mr20">생애주기영양학</label>
												<form:radiobutton path="edu_type" id="edu_type_8" value="08" class="mr5"/>
												<label for="edu_type_8" class="mr20">기타</label>
												<form:input path="edu_type_etc" class="input t1 w150" />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="name" class="ff_title i_b"><strong>이름</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="name" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="pers_birth" class="ff_title i_b"><strong>생년월일</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="pers_birth" id="persBirthDt" name="persBirthDt" class="input t1 fl w200"/>
												<p class="fl text cp s1 ml10">생년월일을 19990101 형식으로 숫자만 입력해 주세요.</p>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="email" class="ff_title i_b"><strong>이메일</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="email"  class="input t1 fl w200" />
												<label for="inputid3" class="fl text ml10 mr10">@</label>
												<form:input path="email_sub"  class="input t1 fl w150" />
												
												<label for="inputid5" class="ti">이메일 입력</label>
												<select name="email_list" class="select t2 fl w150 ml5" id="inputid5" onchange="f_email()">
													<option>직접입력</option>
													<option>chol.com</option>
													<option>daum.net</option>
													<option>dreamwiz.com</option>
													<option>empal.com</option>
													<option>freechal.com</option>
													<option>gmail.com</option>
													<option>hanafos.com</option>
													<option>hanmir.com</option>
													<option>hitel.net</option>
													<option>hotmail.com</option>
													<option>korea.com</option>
													<option>lycos.com</option>
													<option>nate.com</option>
													<option>naver.com</option>
													<option>netian.com</option>
													<option>paran.com</option>
													<option>yahoo.com</option>
													<option>yahoo.co.kr</option>
													<option>hanmail.net</option>

												</select>
												 
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="tel_hp" class="ff_title i_b"><strong>휴대전화</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="tel_hp" id="hp_no" name="hp_no" class="input t1 fl w200" placeholder="숫자만 입력가능 정확히 기재요망"/>
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<label for="tel" class="ff_title i_b"><strong>전화번호</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="tel" id="tel_no" name="tel_no" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="branch_name" class="ff_title i_b"><strong>소속</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="branch_name" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
								</div>
							</div>
							<h6 class="title s1 i_b_t3 mt40"><mark class="bold">논문초록 제목</mark> <span class="ssmall">(제 1저자)</span></h6>
								
							<div class="form mt10 line bt bcm">
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="cr_title" class="ff_title i_b"><strong>논문초록 제목</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="crtitle_name" class="input t1 fl"/>
											</div>
											<div class="area mt5 text ca s1">
												*논문초록 제목이 145자를 초과할 경우 업로드가 되지 않을 수 있습니다.
											</div>
										</div>
									</div>
								</div>
								
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="name1" class="ff_title i_b"><strong>이름</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="name2" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<label for="branch_name1" class="ff_title i_b"><strong>소속</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="branch_name2" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="lic_no1" class="ff_title i_b"><strong>면허번호</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="lic_no2" id="lic_no" name="lic_no" class="input t1 fl w200"/>
												<p class="fl text cp s1 ml10">숫자만 입력가능, 정확히 기재요망</p>
											</div>
<!-- 											<div class="area mt5 text ca s1"> -->
<!-- 												신청 시 전문영양사(노인, 스포츠영양사) 전문연수교육 기타 1평점 자동 인정됩니다. -->
<!-- 											</div> -->
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="add_file" class="ff_title i_b"><strong>첨부파일</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<label for="add_file" class="ti">기본주소</label>
												<form:input path="add_file" class="file t1" type="file" />
												<form:hidden path="file_flag" />
												<form:hidden path="file_add" />
											</div>
											<div class="area mt5 text ca s1">
												<c:if test="${green.crud == 'U' }">
												기존 첨부파일 : <a href="${green.file_add }">${green.file_flag}</a></br>
												</c:if>
												파일명이 45자를 초과할 경우 업로드가 되지 않을 수 있습니다. 한글파일만 첨부가능
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap mt30">
					<c:if test="${green.crud == 'C' }">
					<ul>
						<li><a href="javascript:f_send()" class="btn big t1 wide">신청완료</a></li>
					</ul>
					</c:if>
					
					<c:if test="${green.crud == 'U' }">
						<ul>
							<li><a href="javascript:f_send()" class="btn big t2">접수 수정</a></li>
							<li><a href="javascript:f_delete()" class="btn big t1">접수 취소</a></li>
						</ul>
					</c:if>
					
				</div>
			</fieldset>
		</form:form>
		
		<!--  // Contents End -->
	</div>
</div>
