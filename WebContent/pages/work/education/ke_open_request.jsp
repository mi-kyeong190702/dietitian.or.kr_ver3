<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
<c:otherwise>
	
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육과정</mark> 안내</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_elderly_info.do" >교육과정 안내</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
		<div class="box t2 bgs mt50 p20 text">
				<form name="frmRequest" method="post">
					<fieldset>
						<legend><span class="ti">교육과정 개설요청</span></legend>
						<div class="area">
							<div class="box t1 r5 mt10 p10">
								<div class="form">
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="name" class="ff_title i_b"><strong>이름</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="name" class="input t1 w300" id="name" size="20" value="${name}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="pers_birth" class="ff_title i_b"><strong>생년월일</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="pers_birth" class="input t1 w300" id="pers_birth" size="20" value="${pers_birth}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="lic_no" class="ff_title i_b"><strong>면허번호</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="lic_no" class="input t1 w300" id="lic_no" size="20" value="${lic_no}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="pers_hp" class="ff_title i_b"><strong>연락처</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="pers_hp" class="input t1 w300" id="pers_hp" size="20" value="${pers_hp}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="email" class="ff_title i_b"><strong>이메일</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="email" class="input t1 w300" id="email" size="20" value="${email}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="edu_area" class="ff_title i_b"><strong>소속지부</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="edu_area" class="input t1 w300" id="edu_area" size="20" value="${bran_name}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="big_name" class="ff_title i_b"><strong>소속분과</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="big_name" class="input t1 w300" id="big_name" size="20" value="${big_name}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="company_name" class="ff_title i_b"><strong>근무처명</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="company_name" class="input t1 w300" id="company_name" size="20" value="${company_name}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="edu_type_text" class="ff_title i_b"><strong>교육과정</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input name="edu_type_text" class="input t1 w300" id="edu_type_text" size="20" value="${edu_name}" readonly />
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap line bb p8">
										<label for="chk" class="ff_title i_b"><strong>본 교육과정이 개설되는 경우, 교육과정 안내를 수신하는 것에 동의합니다.</strong></label>
										<input type="checkbox" class="mr5" name="accept" id="accept" name='accept' value='0' />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<ul>
							<li><a href="javascript:send();" class="btn big wide t1">개설요청</a></li>
						</ul>
					</div>
				</fieldset>
			</form>
		</div>
		
	</div>
</div>

<script>

function send(){
	if(document.frmRequest.accept.checked != true){
		alert("수신여부에 동의 하셔야 합니다");
		return false;
	}
	
	if( document.frmRequest.name.value == ""){
		alert("이름이 없습니다.");
		 document.frmRequest.name.focus();
		return;
	} else if( document.frmRequest.edu_type_text.value == ""){
		alert("교육과정이 없습니다.");
		 document.frmRequest.edu_type_text.focus();
		return;
	}

	document.frmRequest.action = "ke_open_request_action.do";
	document.frmRequest.submit();
}
</script>
	</c:otherwise>
</c:choose>