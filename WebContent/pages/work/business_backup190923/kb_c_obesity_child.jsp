<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_SendIt() {
	if( $("#kname").val() == "" ){
		alert("성명을 잘못 입력하셨습니다.");
		 $("#kname").focus();
		return ;
	}
	
	if( $("#fage").val() ==  "" ) {
		alert("만나이를 입력하여 주십시요");
		$("#fage").focus();
		return;
	}
	
	var age = $("#fage").val();
	
	if( age < 4){
		alert("연령은 초,중,고등학생을 대상으로 합니다. 죄송합니다.");
		return;
	}
	if(age > 18){
		alert("연령은 초,중,고등학생을 대상으로 합니다. 죄송합니다.");
		return;
	}
	
	
	if( $("#fhit").val() == "" ){
		alert("비만도 측정을 위해서는 신장을 꼭 입력해야 합니다.");
		 $("#fhit").focus();
		return ;
	}

	if($("#fwit").val() == "" ){
		alert("비만도 측정을 위해서는 몸무게를 꼭 입력해야 합니다.");
		$("#fwit").focus();
		return;
	}
	
	if( $("#fage").val() == ""  ) $("#fage").val(0);
	if( $("#waist").val() == ""  ) $("#waist").val(0);	
	if( $("#fat").val() == ""  ) $("#fat").val(0);	
	
	
	document.audit.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비만도</mark>평가</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_obesity_adult.do" class="cm">비만도평가</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body h800">
	
		<div class="tab_2 div2">
			<ul>
				<li><a href="/work/business/kb_c_obesity_adult.do">성인의 비만상태 평가</a></li>
				<li><a href="/work/business/kb_c_obesity_child.do" class="on">초중고생의 비만도 평가</a></li>
			</ul>
		</div>
		
		<form name="audit" METHOD="POST" action="kb_c_obesity_child_result.do" >
			<fieldset>
				<legend><span class="ti">초중고생을 비만상태 평가</span></legend>
				<div class="box t2 bgs mt50 p20 text">
					<div class="area">
						<div class="box t1 r5 mt10 p10">
							<div class="form">
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="kname" class="ff_title i_b"><strong>성명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input type="text" name="kname" size="20"  class="input t1 w200" maxlength="20" ID="kname">
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>성별</strong></div>
										<div class="ff_wrap ml120 text">
											<div class="area">
												<input type="radio" class="mr5" name="sex" id="sex_1" value="1" checked="checked" />
												<label for="sex_1" class="mr20">남자</label>
												<input type="radio" class="mr5" name="sex" id="sex_2" value="2" />
												<label for="sex_2" class="mr20">여자</label>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="fage" class="ff_title i_b"><strong>나이</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<p class="fl text mr10">만</p>
												<input type="text" name="fage" size="17"  class="input t1 fl w150" maxlength="3" ID="fage">
												<p class="fl text ml10">세</p>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="fhit" class="ff_title i_b"><strong>신장</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input type="text" name="fhit" size="20" class="input t1 fl w150" maxlength="3" ID="fhit">
												<p class="fl text ml10">cms</p>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="fwit" class="ff_title i_b"><strong>몸무게</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input type="text" name="fwit" size="20" class="input t1 fl w150" maxlength="3" ID="fwit">
												<p class="fl text ml10">kg</p>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="fat" class="ff_title i_b"><strong>체지방</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input type="text" name="fat" size="20" class="input t1 fl w150" maxlength="5" ID="fat">
												<p class="fl text ml10">%</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btn_wrap mt30">
					<ul>
						<li><a href="javascript:f_SendIt();" class="btn big t1 wide">결과보기</a></li>
					</ul>
				</div>
			</fieldset>
		</form>
					
		
		<!-- /비만도 평가 하는 부분 -->
	
	</div>
</div>
