<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<%@include file="/pages/common.jsp"%>

<script>
function f_SendIt() {
	if( $("#kname").val() == "" ){
		alert("성명을 잘못 입력하셨습니다.");
		 $("#kname").focus();
		return ;
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
	if( $("#heap").val() == ""  ) $("#heap").val(0);
	if( $("#fat").val() == ""  ) $("#fat").val(0);	

	if( $("#bloodph").val() == ""  ) $("#bloodph").val(0);	
	if( $("#bloodpl").val() == ""  ) $("#bloodpl").val(0);	
	if( $("#bloodsb").val() == ""  ) $("#bloodsb").val(0);	
	if( $("#bloodsa").val() == ""  ) $("#bloodsa").val(0);	
	
	
	document.audit.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비만도</mark>평가(성인)</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_obesity_adult.do" class="cm">비만도평가</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="h900 w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
		
				<p class="text middle s1">
				이 프로그램은 질병이 없는 18세 이상의 성인과 당뇨환자를 위한 건강상태 평가 프로그램입니다. <br />
				각 문항에 신상 및 신체계측자료를 입력하시면 기초건강상태 평가자료와 열량권장량을 알려드립니다. 허리 및 엉덩이둘레, 체지방(%), 혈압, 혈당은 선택사항입니다. 
				</p>
				
				<div class="tab_2 div2 mt20">
					<ul>
						<li><a href="/work/business/kb_c_obesity_adult.do" class="on">성인의 비만상태 평가</a></li>
						<li><a href="/work/business/kb_c_obesity_child.do">초중고생의 비만도 평가</a></li>
					</ul>
				</div>
				
			
				
				<form name="audit" METHOD="POST" action="kb_c_obesity_adult_result.do" >
					<fieldset>
						<legend><span class="ti">성인 비만상태 평가</span></legend>
						<div class="box t2 bgs mt50 p20 text">
							<div class="area">
								<div class="box t1 r5 mt10 p10">
									<div class="form">
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="kname" class="ff_title i_b"><strong>성명</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														
														<input type="text" name="kname" size="20"  class="input t1 fl w200" maxlength="20" ID="kname">
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<div class="ff_title i_b"><strong>성별</strong></div>
												<div class="ff_wrap ml120 text">
													<div class="area">
														<input type="radio" class="mr5" name="sex" id="sex_1"  value="1" checked="checked"/>
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
														<input type="text" name="fwit" size="20" class="input t1 fl w200" maxlength="3" ID="fwit">
														<p class="fl text ml10">kg</p>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="waist" class="ff_title i_b"><strong>허리둘레</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<input type="text" name="waist" size="20" class="input t1 fl w200" maxlength="3" ID="waist">
														<p class="fl text ml10">cm</p>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="heap" class="ff_title i_b"><strong>엉덩이둘레</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<input type="text" name="heap" size="20" class="input t1 fl w150" maxlength="3" ID="heap">
														<p class="fl text ml10">cm</p>
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
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="bloodph" class="ff_title i_b"><strong>혈압</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<input type="text" name="bloodph" size="8" class="input t1 fl w80" maxlength="3" ID="bloodph">
														<label for="inputid9" class="fl text ">/</label>
														<input type="text" name="bloodpl" size="8" class="input t1 fl w80 ml10" maxlength="3" ID="bloodpl">
														<p class="fl text ml10">mmHg</p>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="bloodsb" class="ff_title i_b"><strong>공복혈당</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<input type="text" name="bloodsb" size="20" class="input t1 fl w200" maxlength="5" ID="bloodsb">
														<p class="fl text ml10">mg/dl</p>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="bloodsa" class="ff_title i_b"><strong>식후혈당</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<input type="text" name="bloodsa" size="20" class="input t1 fl w200" maxlength="5" ID="bloodsa">
														<p class="fl text ml10">mg/dl</p>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="action" class="ff_title i_b"><strong>활동도</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<select name="action" class="input t2 w200" ID="action">
															<c:forEach items="${actList}" var="act">
															<option value="${act.act_seqno}"  <c:if test="${act.act_seqno == 3 }">selected</c:if>>${act.act_desc }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="body" class="ff_title i_b"><strong>신체상태</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<select name="body" class="input t2 w200" ID="body">
															<c:forEach items="${bodList}" var="bod">
															<option value="${bod.bod_seqno}">${bod.bod_desc }</option>
															</c:forEach>
														</select>
							
													</div>
												</div>
											</div>
										</div>
										<div class="f_wrap line bb p8">
											<div class="f_field div1">
												<label for="disease" class="ff_title i_b"><strong>현재질환</strong></label>
												<div class="ff_wrap ml120">
													<div class="area">
														<select name="disease" class="input t2 w200" ID="disease">
															<option value="1">없다</option>
															<option value="2">당뇨</option>
														</select>
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
								<li><a href="javascript:f_SendIt();" class="btn big t1 wide">평가하기</a></li>
							</ul>
						</div>
					</fieldset>
				</form>
				
				<!-- /비만도 평가 하는 부분 -->
			</c:otherwise>
		</c:choose>
	</div>
</div>
