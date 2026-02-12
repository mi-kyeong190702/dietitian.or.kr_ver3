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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격증</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">등록민간자격</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">등록민간자격증 발급 안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">등록민간자격증 발급 신청</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>	
		
		<!-- // Contents Start -->
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">등록민간자격증 발급 신청</h4><br />
			
			<c:if test="${param.classifyCode == '1' }">
				<c:set var="f_title" value="신규 발급" />				
			</c:if>
			
			<c:if test="${param.classifyCode == '2' }">
				<c:set var="f_title" value="갱신 발급" />				
			</c:if>
			
			<c:if test="${param.classifyCode == '3' }">
				<c:set var="f_title" value="재발급" />				
			</c:if>
		
			
			<form:form name="frmCertifi" method="post" modelAttribute="certifi">
			<form:hidden path="add_file_no" />
			<form:hidden path="classify_code" />
			<form:hidden path="certifi_text" />
			
			<fieldset>
			<legend><span class="ti">${f_title} 신청하기</span></legend>
				<div class="box t2 bgs w300 mt30 p20 text ac">
					<div class="area">
						<h5 class="title i_b_t6 bold s1">
							<mark class="cm">${f_title}</mark> 신청하기</h5>
						<div class="box t1 r5 mt10 p10">
							<div class="form">
								<div class="f_wrap p8">
									<div class="f_field div1">
										<div class="ff_wrap ml20 text">
											<c:forEach items="${certifiCodes}" var="certifiCode" varStatus="status">
											    <c:if test="${param.classifyCode == '1' }">
													<c:if test="${certifiCode.code_certifi =='6' or certifiCode.code_certifi =='7' or certifiCode.code_certifi =='8' }">
													<div class="area">
														<form:radiobutton path="code_certifi" id="code_certifi${certifiCode.code_certifi}" value="${certifiCode.code_certifi}"  class="mr5" label="" onclick="onValidCertifi(this)"/>
														<label for="code_certifi${certifiCode.code_certifi}" class="mr20">
															${certifiCode.certifi_name} <span id="certifi_${certifiCode.code_certifi}_txt"></span>
														</label>
													</div>
													</c:if>
												</c:if>
												<c:if test="${param.classifyCode == '2' }">
                                                    <c:if test="${certifiCode.code_certifi =='5' or certifiCode.code_certifi =='6' or certifiCode.code_certifi =='7' or certifiCode.code_certifi =='8' }">
                                                    <div class="area">
                                                        <form:radiobutton path="code_certifi" id="code_certifi${certifiCode.code_certifi}" value="${certifiCode.code_certifi}"  class="mr5" label="" onclick="onValidCertifi(this)"/>
                                                        <label for="code_certifi${certifiCode.code_certifi}" class="mr20">
                                                            ${certifiCode.certifi_name} <span id="certifi_${certifiCode.code_certifi}_txt"></span>
                                                        </label>
                                                    </div>
                                                    </c:if>
                                                </c:if> 					
											</c:forEach>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap mt30 mb50">
					<ul>
						<li><a href="javascript:f_Send()" class="btn big t1">확인</a></li>
						<li><a href="./ke_application.do" class="btn big t4">취소</a></li>
					</ul>
				</div>
			</fieldset>
		</form:form>
													
		<!-- // Contents Start -->
	</div>
</div>
	
	
	<script>
	function onValidCertifi(object){
		$("#add_file_no").val("");
		
		var codeCertifi = $(object).val();
		
		$.ajax({
			url : "/work/education/ke_ajax_valid_certifi.do?classifyCode=${param.classifyCode}&codeCertifi=" + codeCertifi + "&t=" + Math.random(),
					
			success : function(data) {
				if( data.valid == "N" ) {
					if( !data.msg ) {
						alert( "발급 대상이 아닙니다." );	
					} else {
						alert(data.msg);
					}
					$(object).removeAttr("checked");
				} else {
					$("#certifi_" + codeCertifi + "_txt").html("<font color='red'>(신청가능)</font>");
					$("#add_file_no").val( data.addFileNo );
				}	
			}
		});
	}
	
	function f_Send() {
		var codeCertifi = $("input:radio[name='code_certifi']:checked").val();
		$("input[type='radio']:checked").each(function(){
			var idVal = $(this).attr("id");
	        var codeCertifiText =  $("label[for='"+idVal+"']").text();
	        $("#certifi_text").val( codeCertifiText );
		});
		
        
		if( codeCertifi == "" || codeCertifi == undefined ) {
			alert("자격증 종류를 선택하세요.");
			return;
		}
	<c:choose>
		<c:when test="${param.classifyCode == '2' }">
			document.frmCertifi.action = "ke_certifi_chg_check.do";
			
		</c:when>
		<c:otherwise>
			document.frmCertifi.action = "ke_certifi_form.do";
		</c:otherwise>
	</c:choose>
		document.frmCertifi.submit();
	}
	
	
	
	</script>
	</c:otherwise>
</c:choose>
