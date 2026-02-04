<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
		$("document").ready(function(){
			// iinit 
			initEmail( "email_code", "email2");
			
			// Change Event
			$("#code_operation").change(function(){
				$.ajax({
					url : "ke_ajax_code_bran.do?codeOperation=1&t=" + Math.random(),
					success : function(data) {
						$("#code_bran option").remove();
						$("#code_bran").append("<option value=''>선택하세요</option>");
						for( var i = 0; i < data.length; i++ ) {
							var option = "<option value='" + data[i].code_bran + "'>" + data[i].code_bran_txt + "</option>";
							$("#code_bran").append( option );	
						}	
					}
				});
				
				
			});
		
			// Change Event
			$("#code_bran").change(function(){
				var codeBran = $("#code_bran").val();
				$.ajax({
					url : "ke_ajax_exam_list.do?codeBran=" + codeBran + "&t=" + Math.random(),
					success : function(data){
						$("#edu_test_key option").remove();
						$("#edu_test_key").append("<option value=''>선택하세요</option>");
						for(var i = 0; i < data.length; i++) {
							var option = "<option value='" + data[i].eduTestKey + "''>" + data[i].testName + "</option>";
							$("#edu_test_key").append( option );	
						}
					}	
				});
			});
			
			// Date picker
			$("#deposit_due_date").datepicker();
			
		});
		
		function f_imgUpload() {
			var imgfile =  $("#upload_picture").val(); 
			if( !isImage(imgfile) ) {
				alert("이미지 파일만 업로드 가능합니다.");
				 $("#upload_picture").val("");
				return;
			}
			
			window.open("#", "img_uplaod", "width=100,height=100");
			document.frmOperator.target = "img_uplaod";
			document.frmOperator.action = "./ke_exam_upload_picture.do";
			document.frmOperator.submit();
		}
		
		function imgUploadCallbak(imgUrl) {
			$("#disp_upload_picture").attr("src", imgUrl);
		}
		
		
		function jusoCallBack( roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo) {
			document.frmOperator.oper_comp_add1_2.value = roadAddrPart1  + " " + addrDetail + " " + roadAddrPart2;
			document.frmOperator.code_post.value 		= zipNo;//zipNo.substring(0,3) + zipNo.substring(4,7);
		}     
		
		
		function f_code_operation() {
			var operation = $("#code_operation").val();
			if( operation == "" || operation == "2" ) {
				$("#div_oper_add_file").hide();
			} else  {
				$("#div_oper_add_file").show();
			}
		}
		

                    
		
		 // 자격시험명 선택에 따른 하단 텍스트 노출
	    function SelectCertifi(obj) {
	        var target = $(obj).find("option:selected");

	        if(target.val() == '-1') {
	            alert("신청 종료된 시험입니다.");
	            $(obj).find("option:eq(0)").attr("selected", true);
	            return;
	        } else if(target.val() == '-2') {
	            alert("당해년도 이미 신청한건이 있습니다.");
	            $(obj).find("option:eq(0)").attr("selected", true);
	            return;
	        }  else if(target.val() == '-3') {
	            alert("이미 해당 자격증을 보유하고 있습니다.");
	            $(obj).find("option:eq(0)").attr("selected", true);
	            return;
	        }
		 }

	        
		function f_Send() {
			var f = document.frmOperator;
			var reg_pattern = "";

			f.oper_name.value = $.trim(f.oper_name.value);
			if(f.oper_name.value == "") {
            	alert("성명을 입력해 주세요.");
            	f.oper_name.focus();
            	return;
        	}

	        f.oper_birth.value = $.trim(f.oper_birth.value);
	        reg_pattern = /^\d{8}$/;
	        if(!reg_pattern.test(f.oper_birth.value)) {
	            alert("생년월일을 올바르게 입력해 주세요");
	            f.oper_birth.focus();
	            return;
	        }

		      
		       
	        f.oper_lic_no.value = $.trim(f.oper_lic_no.value);
	        reg_pattern = /^\d{1,6}$/;
	        if(!reg_pattern.test(f.oper_lic_no.value)) {
	            alert("영양사면허번호를 정확히 입력하세요.");
	            return false;
	        }

	        f.oper_comp_name1.value = $.trim(f.oper_comp_name1.value);
	        if(f.oper_comp_name1.value == "") {
	            alert("근무처명을 입력해 주세요.");
	            f.oper_comp_name1.focus();
	            return;
	        }

	        f.pers_tel.value = $.trim(f.pers_tel.value);
	        reg_pattern = /^\d{9,11}$/;
	        if(!reg_pattern.test(f.pers_tel.value)) {
	            alert("자택 전화번호를 입력해 주세요.");
	            f.pers_tel.focus();
	            return;
	        }

	        f.company_tel.value = $.trim(f.company_tel.value);
	        reg_pattern = /^\d{9,11}$/;
	        if(!reg_pattern.test(f.company_tel.value)) {
	            //alert("회사 전화번호를 입력해 주세요.");
	            //f.company_tel.focus();
	            //return;
	        }

	        f.oper_hp.value = $.trim(f.oper_hp.value);
	        reg_pattern = /^\d{9,11}$/;
	        if(!reg_pattern.test(f.oper_hp.value)) {
	            alert("휴대폰 전화번호를 입력해 주세요.");
	            f.oper_hp.focus();
	            return;
	        }

	        if(f.code_post.value == "" ) {
	            alert("우편번호를 검색해 주세요.");
	            return;
	        }

	        f.oper_comp_add1_2.value = $.trim(f.oper_comp_add1_2.value);
	        if(f.oper_comp_add1_2.value == "") {
	            alert("발송처 주소 상세를 입력해 주세요.");
	            f.oper_comp_add1_2.focus();
	            return;
	        }

	        if($("select[name='code_operation'] option:selected").val() == "") {
	            alert("시행대상 구분을 선택해 주세요.");
	            f.code_operation.focus();
	            return;
	        }

	        if($("select[name='code_bran'] option:selected").val() == "") {
	            alert("시험장소를 선택해 주세요.");
	            f.code_bran.focus();
	            return;
	        }

	        if($("select[name='edu_test_key'] option:selected").val() == "") {
	            alert("자격시험명을 선택하여 주세요.");
	            f.edu_test_key.focus();
	            return;
	        }

	        if($("select[name='edu_test_key'] option:selected").val() == "-1") {
	            alert("신청 종료된 시험입니다.");
	            f.edu_test_key.focus();
	            return;
	        }

	        if($("select[name='edu_test_key'] option:selected").val() == "-2") {
	            alert("당해년도 이미 신청한건이 있습니다.");
	            f.edu_test_key.focus();
	            return;
	        }

	        if($("select[name='edu_test_key'] option:selected").val() == "-3") {
	            alert("이미 해당 자격증을 보유하고 있습니다.");
	            f.edu_test_key.focus();
	            return;
	        }

	        f.remittor.value = $.trim(f.remittor.value);
	        if(f.remittor.value == "") {
	            alert("입금자명을 입력해 주세요.");
	            f.remittor.focus();
	            return;
	        }

	        f.deposit_due_date.value = $.trim(f.deposit_due_date.value);
	        if(f.deposit_due_date.value == "") {
	            alert("입금예정일을 입력해 주세요.");
	            f.deposit_due_date_y.focus();
	            return;
	        }

			/*
	        f.refund_bank.value = $.trim(f.refund_bank.value);
	        if(f.refund_bank.value == "") {
	            alert("환불시, 환불 받으실 은행명을 입력해 주세요");
	            f.refund_bank.focus();
	            return;
	        }

	        f.refund_account.value = $.trim(f.refund_account.value);
	        if(f.refund_account.value == "") {
	            alert("환불시, 환불 받으실 계좌를 입력해 주세요");
	            f.refund_account.focus();
	            return;
	        }

	        f.refund_account_owner.value = $.trim(f.refund_account_owner.value);
	        if(f.refund_account_owner.value == "") {
	            alert("환불시, 환불 받으실 예금주명을 입력해 주세요");
	            f.refund_account_owner.focus();
	            return;
	        }
	        */

	        f.email1.value = $.trim(f.email1.value);
	        if (f.email1.value == "")
	        {
	            alert("이메일을 입력해 주세요.");
	            f.email1.focus();
	            return;
	        }

	        f.email2.value = $.trim(f.email2.value);
	        if (f.email2.value == "")
	        {
	            alert("이메일을 입력해 주세요.");
	            f.email2.focus();
	            return;
	        }

	        f.pers_career_y.value = $.trim(f.pers_career_y.value);
	        if (f.pers_career_y.value == "")
	        {
	            alert("근무년수를 입력해 주세요.");
	            f.pers_career_y.focus();
	            return;
	        }

	        f.pers_career_m.value = $.trim(f.pers_career_m.value);
	        if (f.pers_career_m.value == "")
	        {
	            alert("근무년수를 입력해 주세요.");
	            f.pers_career_m.focus();
	            return;
	        }
			<% // 스토리 보드에 따른 제외 %>
	        /* 
	        if(f.imgfile.value.length < 1){
	            alert("사진 이미지를 올려주세요.");
	            return;
	        }
	        */

	        if(f.code_operation.selectedIndex > 1 && $.trim(f.oper_add_file.value) == "" ) {
	            alert("심사를 위한 첨부파일이 필요합니다.");
	            f.oper_add_file.focus();
	            return;
	        }
		        
			document.frmOperator.action = "ke_exam_action.do";
			document.frmOperator.submit();
		}
		</script>
		
		<div class="s_page">
			<div class="sp_head">
				<div class="sp_title">
					<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격시험</mark> 신청</h3>
				</div>
				<div class="sp_navi">
					<ul>
						<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
						<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
						<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
						<li><a href="/work/education/ke_exam.do" class="cm">자격시험 신청</a></li>
					</ul>
				</div>
			</div>
			<hr />
			<div class="sp_body">
				<!-- // Contents Start -->
				
				<form:form name="frmOperator" method="post" modelAttribute="operator" enctype="multipart/form-data"> 
				
				
					<h4 class="title bold t2 cm s1 i_b_t2 mt30">자격시험 신청</h4><br />
					<h5 class="title bold t3 s1 i_b_t3 mt50">자격시험 신청하기</h5>
					<p class="text s1 mt10 ml15">전문영양사 자격 취득을 원하시는 분은 시험 신청 기간에 아래 신청서를 작성하여 신청하고, 전형료를 입금해주시면 됩니다. <br/>
※ 현재 교육을 수강하고 계신 분은 자격시험 신청 대상이 아닙니다.
 
					</p>
					
						<fieldset>
						<legend><span class="ti">자격시험신청서</span></legend>
						<div class="box t2 bgs mt20 p20 text">
								<div class="area">
									<h5 class="title i_b_t6 bold s1"><mark class="cm">전문영양사</mark> 자격시험 신청서</h5>
									<div class="box t1 r5 mt10 p10">
										<h6 class="title s1 i_b_t3"><mark class="bold">신청인</mark></h6>
										<div class="form mt10 line bt bcm">
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="oper_name" class="ff_title i_b"><strong>성명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="oper_name" size="20" class="input t1 w200"/>
														
														</div>
													</div>
												</div>
											</div>
											<% // 스토리보드에 따른 제외 %>
											<!-- 
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid2" class="ff_title i_b"><strong>사진 첨부</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<div class="box w130 h140 fl mr5">
																<img src="/images/sub/ke_photo.png" width="130" height="140" id="disp_upload_picture" class="fl">
																
															</div>
															<label for="inputid2" class="ti">사진</label>
															<input type="file" class="file_1 t1" name="upload_picture" id="upload_picture" onchange="f_imgUpload();" />
															<input type="hidden" name="imgfile" id="imgfile" />
															<div class="mt5 ml5 text ca s1">
																gif, png 이미지 사용을 권장합니다. jpg는 화질이 저하될 수 있습니다.(불필요한 내용일 시 삭제)</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											 -->
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid2" class="ff_title i_b"><strong>생년월일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="oper_birth" size="20" class="input t1 w200" maxlength="8"/>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="oper_lic_no" class="ff_title i_b"><strong>영양사면허번호</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="oper_lic_no" size="16" class="input t1 w200" maxlength="6"/>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="oper_comp_name1" class="ff_title i_b"><strong>근무처명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="oper_comp_name1" size="16" maxlength="15" class="input t1 w200" />
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_title i_b"><strong>연락처</strong></div>
													<div class="ff_wrap ml120">
														<ul>
															<li>
																<div class="area">
																	<label for="pers_tel" class="fl w80 text bold cm">자택</label>
																	<form:input path="pers_tel" size="11" class="input t1 fl w150"/>
																	<p class="fl text s1 ml10 mr20">(지역번호 포함)</p>
																</div>
															</li>
															<li class="mt5">
																<div class="area">
																	<label for="company_tel" class="fl w80 text bold cm">회사</label>
																	<form:input path="company_tel" size="11"  type="text" class="input t1 fl w150"  />
																	<p class="fl text s1 ml10 mr20">(지역번호 포함)</p>
																</div>
															</li>
															<li class="mt5">
																<div class="area">
																	<label for="oper_hp" class="fl w80 text bold cm">휴대폰</label>
																	<form:input path="oper_hp" size="11"  class="input t1 fl w150"/>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_title i_b"><strong>발송처 주소</strong></div>
													<div class="ff_wrap ml120">
														<div class="area">
															<label for="inputid9" class="fl w80 text bold cm">우편번호</label>
															<form:input path="code_post" size="6"  class="input t1 fl w100" readonly="" />
															
															<a href="javascript:C_Address();" class="btn form t1 fl ml5">우편번호 검색</a>
														</div>
														<div class="area mt5">
															<label for="oper_comp_add1_2" class="ti">상세주소</label>
															<form:input path="oper_comp_add1_2" size="60" class="input t1"/>
														</div>
														
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="code_operation" class="ff_title i_b"><strong>시행대상 구분</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="code_operation" class="select t2 w200" onchange="f_code_operation()">
										        				<form:option value="">선택하세요</form:option>
										        				<option value="1">교육이수</option>
										        				<option value="2">재시험</option>
										                    	<option value="3">석사이상</option>
										                    	<option value="4">말소자</option>
										                    	<option value="5">일반인</option>
										        			</form:select>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="code_bran" class="ff_title i_b"><strong>시험장소</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="code_bran" class="select t2 w200">
										        				<form:option value="">선택하세요</form:option>
										        			</form:select>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="edu_test_key" class="ff_title i_b"><strong>자격시험명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="edu_test_key"  class="select t2" onchange="SelectCertifi(this)">
										        				<form:option value="">선택하세요</form:option>
										        			</form:select>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_title i_b"><strong>전문영양사<br /><mark class="ml15">자격시험 전형료</mark></strong></div>
													<div class="ff_wrap ml120">
														<ul>
															<li>
																<div class="area">
																	<label for="remittor" class="fl w80 text bold cm">입금자명</label>
																	<form:input path="remittor" size="12" maxlength="10" class="input t1 fl w100"/>
																	
																</div>
															</li>
															<li class="mt5">
																<div class="area">
																	<label for="deposit_due_date" class="fl w80 text bold cm">입금예정일</label>
																	<form:input path="deposit_due_date"  class="input t1 fl w150" readonly="true"/>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<!-- 고객 요청으로 삭제
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_title i_b"><strong>환불계좌</strong></div>
													<div class="ff_wrap ml120">
														<ul>
															<li>
																<div class="area">
																	<label for="refund_bank" class="fl w80 text bold cm">은행명</label>
																	<form:input path="refund_bank" size="30" class="input t1 fl w200"/>
																</div>
															</li>
															<li class="mt5">
																<div class="area">
																	<label for="refund_account" class="fl w80 text bold cm">계좌번호</label>
																	<form:input path="refund_account" size="30" class="input t1 fl w200"/>
																	
																</div>
															</li>
															<li class="mt5">
																<div class="area">
																	<label for="refund_account_owner" class="fl w80 text bold cm">예금주명</label>
																	<form:input path="refund_account_owner" size="12" class="input t1 fl w200"/>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
											 -->
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="email1" class="ff_title i_b"><strong>E-mail</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="email1" class="input t1 fl w200"/>
															<label for="inputid8" class="fl text ml10 mr10">@</label>
															<form:input path="email2" class="input t1 fl w150" />
															<label for="inputid9" class="ti">이메일 입력</label>
															<select class="select t2 fl w150 ml5" id="email_code">
																
															</select>
														</div>
													</div>
												</div>
											</div>
											
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid25" class="ff_title i_b"><strong>근무년수</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="pers_career_y" size="2" class="input t1 fl w100" maxlength="2" />
															<span class="fl text ml10 mr10">년</span>
															<form:input path="pers_career_m" size="2" class="input t1 fl w100" maxlength="2"/>
															<span class="fl text ml10 mr10">개월</span>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8" id="div_oper_add_file" style="display:none;">
												<div class="f_field div1">
													<label for="inputid27" class="ff_title i_b"><strong>첨부파일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<label for="oper_add_file" class="ti">첨부파일</label>
															<form:input type="file" path="oper_add_file"  class="file t1" />
														</div>
													</div>
												</div>
											</div>
											 
											<div class="pt30 center">
												위와 같이 전문영양사 자격시험을 신청합니다.
												<div class="cm">
													${kdaFunc:formatDayKo(kdaFunc:getTodayString()) }
												</div>
												<div class="cm">
													신청인 <mark class="cm bold">${operator.oper_name }</mark>
												</div>
												<div class="big mt30 mb20">
													사단법인 대한영양사협회장 귀하
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="btn_wrap mt30">
								<ul>
									<!-- 
									<li><a href="#" class="btn big t2">수정하기</a></li>
									 -->
									<li><a href="javascript:f_Send()" class="btn big t1">신청하기</a></li>
								</ul>
							</div>
						</fieldset>
					<h5 class="title bold t3 s1 i_b_t3 mt50">제출하여야 할 서류</h5>
					<p class="text small ml10">(한 개의 폴더에 모든 제출 파일을 넣어서 압축하여, 압축한 폴더 하나만 첨부함)</p>
					<p class="text bold s1 mt10 i_b_t4 ml15">석사이상 자격시험 신청자</p>
					<ul class="text s1 small mt5 ml25">
						<li>1) 영양사 면허증 사본</li>
						<li>2) 경력증명서 또는 재직증명서 사본(6개월 이상 영양사 경력 기재, 직무 또는 직책에 ‘영양사’ 기재 시 인정)</li>
						<li>3) 최종학위 증명서 사본</li>
					</ul>
					<p class="text bold s1 mt10 i_b_t4 ml15">말소자 자격시험 신청자</p>
					<ul class="text s1 small mt5 ml25">
						<li>1) 영양사 면허증 사본</li>
						<li>2) 교육과정 수료증 사본</li>
					</ul>
					<p class="text bold s1 mt10 i_b_t4 ml15">외국의 면허 소지자 자격시험 신청자</p>
					<ul class="text s1 small mt5 ml25">
						<li>1) 영양사 면허증 사본</li>
						<li>2) 경력증명서 또는 재직증명서 사본(1년 이상 영양사 경력 기재, 직무 또는 직책에 ‘영양사’ 기재 시 인정)</li>
						<li>3) 외국에서 취득한 영양사 자격증 사본</li>
					</ul>
					<ul class="text s1 small mt20 mb50 ml15">
						<li>※ <mark class="bold">시험비 입금처 </mark>: 신한은행 100-026-174963(예금주 (사)대한영양사협회)<br />
						</li>
						<li>※ <mark class="bold">문의처</mark> : 대한영양사협회 교육국 02) 823-5680(교514)</li>
					</ul>
				</form:form>
				<!-- // Contents end -->
			</div>
		</div>
		
		
	</c:otherwise>
</c:choose>

