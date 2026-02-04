<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

	$(document).ready(function(){		
		var cal = new Date();
		var yyyy = cal.getFullYear();
		var mm = cal.getMonth() + 1;
		var dd = cal.getDate();
		var today = yyyy + "년 " + mm + "월 " + dd + "일"; 
		$("#getDate").text(today);
		
		$("#pers_year,#lic_no,#cs_con_education").keyup(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		$("#pers_year,#lic_no,#cs_con_education").focusout(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		
	});
	/*
	function doActive(id){
		if(id=='1'){
			$("#cs_non_target_txt").text("기관 소재지");
		}else{
			$("#cs_non_target_txt").text("자택 소재지");
		}
	}
	
	function selectMail(txt){
		$("#mail2").val(txt);
	}
	
	function openJusoPopup() 
	{
		var url = "/pages/work/research/juso/research_jusoPopup.jsp";
		var pop = window.open(url,"jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack( roadFullAddr
			 , roadAddrPart1
			 , addrDetail
			 , roadAddrPart2
			 , engAddr
			 , jibunAddr
			 , zipNo
			 , admCd
			 , rnMgtSn
			 , bdMgtSn)
	{
		$("#pers_add").val(roadAddrPart1 + " " + addrDetail + " " + roadAddrPart2 );		
		$("#code_post").val(zipNo);			
	}
	*/
	function f_check(){
		
		var pers_name=$("#pers_name");
		var lic_no=$("#lic_no");
		var cs_con_education=$("#cs_con_education");
		var cs_non_target_detail=$("#cs_non_target_detail");
		var image_file=$("#image_file");
		
		if(pers_name.val() ==""){
			alert("성명을 입력하세요");
			pers_name.focus();
			return false;
		}
		if(lic_no.val() ==""){
			alert("면허번호를 입력하세요");
			lic_no.focus();
			return false;
		}
		
		if(cs_con_education.val() ==""){
			alert("보수교육년도를 입력하세요");
			cs_con_education.focus();
			return false;
		}
		
		var radio3 = $(':input[name=cs_non_target]:radio:checked').val();
		if(!radio3) {
			alert("미대상 사유를 선택하세요.");
			$("#auth3_1").focus();
			return false;
		}
		var target = $(':radio[name="cs_non_target"]:checked').val();
		if(target == "4"){
			if(cs_non_target_detail.val() ==""){
				alert("기타 내용을 입력하세요");
				cs_non_target_detail.focus();
				return false;
			}
		}
		if(target == "1" || target == "2" || target == "3" || target == "4" ){
			if(image_file.val() ==""){
				alert("파일을 선택하세요");
				image_file.focus();
				return false;
			}
		}
		
		return true;
	}
	
	function f_action(){
		
		if(f_check()){
			frmRecipient.submit();
		}
	}
	
	function f_cancel(){
		location.href="recipientModify.do";
	}

</script>

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

	<form:form name="frmRecipient" modelAttribute="vo" method="post" enctype="multipart/form-data" action="recipientModifyAction.do">
			<div class="sp_body">
					<div class="box t2 bgs p20 text">
						<div class="area">
							<h5 class="title i_b_t6 bold s1">보수교육 미대상자 <mark class="cm">신청서</mark></h5>
							<div class="box t1 r5 mt10 p10">
								<h6 class="title s1 i_b_t3"><mark class="bold">현재 인적사항</mark></h6>
								<div class="form mt10 line bt bcm">
									<div class="f_wrap line bb p8">
										<div class="f_field div2">
											<label for="pers_name" class="ff_title i_b"><strong>성명</strong></label>
											<div class="ff_wrap ml130">
												<div class="area">
													<form:input path="pers_name" class="input t1 w200" maxlength="20" readonly="true"/>
												</div>
											</div>
										</div>
										<div class="f_field div2">
											<label for="lic_no" class="ff_title i_b"><strong>면허번호</strong></label>
											<div class="ff_wrap ml130">
												<div class="area">
													<form:input path="lic_no" class="input t1 w200" maxlength="6" readonly="true"/>
												</div>
											</div>
										</div>
									</div>
									
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="pers_year" class="ff_title i_b"><strong>미대상자 신청연도</strong></label>
											<div class="ff_wrap ml130">
												<div class="area">
													<%-- <form:input path="cs_con_education" class="input t1 fl w100" maxlength="4"/> --%>
													<form:input path="cs_con_education" class="input t1 fl w100" value="${vo.cs_con_education}" maxlength="4" readonly="true"/>
													<p class="fl text cp s1 ml10">예) 2013</p>
												</div>
											</div>
										</div>
									</div>
									
									
									
									
								</div>
								<h6 class="title s1 i_b_t3 mt30"><mark class="bold">미대상 사유</mark></h6>
								<div class="form mt10 line bt bcm">
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<div class="ff_title i_b"><strong>사유선택</strong></div>
											<div class="ff_wrap ml130 text">
												<div class="area">
													<ul>
														<li>
															<form:radiobutton path="cs_non_target" id="radio3_1" class="mr5" value="1" />
															<label for="radio3_1"><font size = '13'></font><strong>1.</strong></font> 다른분야 근무, 국민영양관리법에 의한 영양사 보수교육 대상 근무처(보건소, 보건지소,<br/> <span class="ml30"></span>집단급식소, 육아지원종합센터, 어린이급식관리지원센터, 건강기능식품판매업소) 외에 <br/> <span class="ml30"></span>근무하고 있음.</label>
															<p class="area text cp"><span class="ml30"></span><span class="ml5"></span><span class="ml2"></span>※ 첨부서류 (당해년도 1월부터 12월까지 기간이 명시된 재직증명서 또는 경력증명서)</p>
														</li>
														<%-- <li class="mt5">
															<form:radiobutton path="cs_non_target" id="radio3_2" class="mr5" value="2" />
															<label for="radio3_2"><strong>2.</strong> 대학교 및 대학원 진학 등 학업 계속 상태로 미취업 상태임.</label>
															<p class="area text cp"><span class="ml30"></span><span class="ml5"></span><span class="ml2"></span>※ 첨부서류 (당해년도 1월부터 12월까지 기간이 명시된 재학증명서 또는 졸업증명서)</p>
														</li> --%>
														<li class="mt5">
															<form:radiobutton path="cs_non_target" id="radio3_3" class="mr5" value="3" />	
															<label for="radio3_3"><strong>2.</strong> 미취업, 중도 퇴사, 취업경험 없음 등</label>
															<p class="area text cp"><span class="ml30"></span><span class="ml5"></span><span class="ml2"></span>※ 첨부서류 (당해년도 1월부터 12월까지 기간이 명시된 건강보험자격득실확인서)</p>
														</li>
														<li class="mt5">
															<form:radiobutton path="cs_non_target" id="radio3_4" class="mr5" value="4" />
															<label for="radio3_4"><strong>3.</strong> 기타(해외체류 등 / 출산・육아・질병휴직 등은 보수교육 면제대상자로 보수교육센터에서 면제<br/><span class="ml30">신청)</label>
															<form:input path="cs_non_target_detail" class="input t1 w400 m110" maxlength="90"/>
															<p class="area text cp"><span class="ml30"></span><span class="ml5"></span><span class="ml2"></span>※ 첨부서류 (출입국 사실 증명서 등 사유에 따른 해당 증빙서류)</p>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="box t1 r5 mt10 p20 text small">
									<div class="area">
										<p class="mb20">본인은 상기 사유로 영양사 보수교육 미대상자 신청서를 제출하며, 상기의 내용이 틀림없음을 서약합니다.</p>
										<p class="right" id="getDate"></p>
										<p class="right">신고인 <strong class="bold cm">${vo.pers_name }</strong></p>
										<p class="mt10 center"><strong class="big s1 bold cm">대한영양사협회장</strong> 귀하</p>
									</div>
								</div>
								<div class="form mt10 line bt bcm">
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="bbs_file1" class="ff_title i_b"><strong>첨부서류1</strong></label>
											<div class="ff_wrap ml130">
												<div class="area text">
													보수교육 미대상자임을 증명할 수 있는 서류<font color = "red"><strong>(필수)</strong></font>
												</div>
												<div class="area">
													<form:input path="image_file"  type="file" class="file t1" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form mt10 line bt bcm">
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="bbs_file2" class="ff_title i_b"><strong>첨부서류2</strong></label>
											<div class="ff_wrap ml130">
												<div class="area">
													<form:input path="image_file2"  type="file" class="file t1" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form mt10 line bt bcm">
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="bbs_file3" class="ff_title i_b"><strong>첨부서류3</strong></label>
											<div class="ff_wrap ml130">
												<div class="area">
													<form:input path="image_file3"  type="file" class="file t1" />
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
							<li><a href="javascript:f_action();" class="btn big t1">제출</a></li>
							<li><a href="javascript:f_cancel();" class="btn big">취소</a></li>
						</ul>
					</div>
					<div class="box t1 r5 mt40 p20 text s1 small">
						<div class="area">
							<ul>
								<li>※ 증빙서류는 <mark class="bold ck">기관장 직인을 포함</mark>하고, 반드시 <mark class="bold ck">발행일자가 명시</mark>되어 있어야 승인됩니다.</li>
								<li>※ 보수교육 미대상자 확인은 당해 연도에 한하므로, 동일한 사유에 해당하더라도 <mark class="bold ck">면허신고가 있는 해에 신고해야 하는 보수교육<br/><span class="ml15"></span> 마다 미대상자 신청</mark>을 해야 합니다.</li>
								<li>※ 보수교육 미대상자는 보수교육 미대상자를 신청하고 <mark class="bold ck">“접수완료”가 확인된 후 초기화면으로 가서 면허신고</mark>를 하시면 됩니다.</li>
							</ul>
						</div>
					</div>
				</div>	
				
				</form:form>			
			</div>
