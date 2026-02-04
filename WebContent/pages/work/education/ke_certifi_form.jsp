<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kdaFunc" uri="/WEB-INF/tld/kda-func.tld" %>
<script>
function f_Send() {
	<c:if test="${addFile1 == null }">
	if($("#add_file1").val() == "") {
		alert("사진이미지를 첨부하여 주십시요.");
		return;
	}
	</c:if>
	
	<c:if test="${addFile2 == null }">
	if($("#add_file2").val() == "") {
		alert("첨부파일을 선택하여 주십시요.");
		return;
	}
	</c:if>
	
	<c:choose>
		<c:when test="${addFile1 == null or addFile2 == null }">
		document.frmCertifi.action = "ke_certifi_form_action.do";
		document.frmCertifi.target = "";
		document.frmCertifi.submit();
		</c:when>
		<c:otherwise>
		alert("자격증 신청 처리 중 입니다.")
		</c:otherwise>
	</c:choose>
}

$(document).ready(function(){
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
	document.frmCertifi.target = "img_uplaod";
	document.frmCertifi.action = "./ke_exam_upload_picture.do";
	document.frmCertifi.submit();
}

function imgUploadCallbak(imgUrl) {
	$("#disp_upload_picture").attr("src", imgUrl);
	$("#add_file1").val(imgUrl);
}

</script>

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
				<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">자격증 발급안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">자격증 신청하기</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>									

		
		<!-- // Contents Start -->
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">자격증 신청하기</h4>
		<form:form name="frmCertifi" modelAttribute="certifi" method="post"  enctype="multipart/form-data">
			<form:hidden path="classify_code" />
			<form:hidden path="code_certifi" />
			<form:hidden path="print_state" />
			<form:hidden path="code_seq" />
			<form:hidden path="result_no" />
			<form:hidden path="add_file_no" />
			<form:hidden path="file_name" />
			<form:hidden path="img_file" />
			<form:hidden path="file_type" />
			<form:hidden path="file_size" />
			<fieldset>
			<legend><span class="ti">자격증 신청하기 입력</span></legend>
			<div class="box t2 bgs mt20 p20 text">
					<div class="area">
						<h5 class="title i_b_t6 bold s1"> 자격증 신청하기</h5>
						<div class="box t1 r5 mt10 p10">
							<h6 class="title s1 i_b_t3"><mark class="bold">신청인</mark></h6>
							<div class="form mt10 line bt bcm">
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area"> ${person.pers_name} </div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
								
									
									<div class="f_field div1">
										<label for="inputid2" class="ff_title i_b"><strong>사진 첨부</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<div class="box w130 h140 fl mr5">
													<c:choose>
														<c:when test="${addFile1 == null }">
															<img src="/images/sub/ke_photo.png" id="disp_upload_picture" width="130" height="140" class="fl"><!-- 없는 이미지일때 ke_photo.png 사용 -->	
														</c:when>
														<c:otherwise>
															<img src="${addFile1}" id="disp_upload_picture" width="130" height="140" class="fl">
														</c:otherwise>
													</c:choose>
												</div>
												<label for="inputid2" class="ti">사진</label>
												
												<input type="file" class="file_1 t1" name="upload_picture" id="upload_picture" onchange="f_imgUpload();" />
												
												<form:hidden path="add_file1" />
												<div class="mt5 ml5 text ca s1">
													gif, png 이미지 사용을 권장합니다. jpg는 화질이 저하될 수 있습니다.(불필요한 내용일 시 삭제)</p>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid3" class="ff_title i_b"><strong>생년월일</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												${person.pers_birth}
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid4" class="ff_title i_b"><strong>면허번호</strong></label>
										<div class="ff_wrap ml120">
											<div class="area"> ${person.lic_no}</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid4" class="ff_title i_b"><strong>E-mail</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">${person.email}</div>
										</div>
									</div>
								</div>
								
								
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid5" class="ff_title i_b"><strong>근무처명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area"> ${person.company_name} </div>
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
														<label for="inputid6" class="fl w80 text bold cm">자택</label>
														${person.pers_tel}
          										</div>
												</li>
												<li class="mt5">
													<div class="area">
														<label for="inputid7" class="fl w80 text bold cm">회사</label>
														${person.company_tel}
													</div>
												</li>
												<li class="mt5">
													<div class="area">
														<label for="inputid8" class="fl w80 text bold cm">휴대폰</label>
														${person.pers_hp}
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
											
											<c:choose>
											<c:when test="${person.code_place == '1' or  person.code_place == '3' }">
												<div class="area">
													<label for="inputid9" class="fl w80 text bold cm">우편번호</label>
	        										${person.code_post}
	        									</div>
	        									<div class="area mt5">
							        				<label for="inputid11" class="ti">상세주소</label> 
							        				
							        				${person.pers_add} ${person.pers_add_detail}
							        			</div>
        									</c:when>
	        								<c:otherwise>
	        									<div class="area">
		        									<label for="inputid9" class="fl w80 text bold cm">우편번호</label>
								        			${person.company_code_post}
							        			</div>
							        			<div class="area mt5">
							        				<label for="inputid11" class="ti">상세주소</label> 
							        				
							        				${person.company_add} ${person.company_add_detail}
							        			</div>
	        								</c:otherwise>
	        								</c:choose>
											
											<div class="area mt5 text ca s1">
												자격증은 <mark class="cm">택배로 발송</mark>되므로, 택배를 받아보실 수 있는 주소 및 연락처를 <mark class="cm">정확하게</mark> 기재해 주시기 바랍니다.
											</div>
										</div>
									</div>
								</div>
								
								<c:if test="${ certifi.classify_code != '1'}">
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>전문영양사 회비</mark></strong></div>
										<div class="ff_wrap ml120">
											<ul>
												<li>
													<div class="area">
														<label for="remittor" class="fl w80 text bold cm">입금자명</label>
														<form:input path="remittor" class="input t1 fl w100"/>
													</div>
												</li>
												<li class="mt5">
													<div class="area">
														<label for="deposit_due_date" class="fl w80 text bold cm">입금예정일</label>
														<form:input path="deposit_due_date" class="input t1 fl w100" readonly="true"/>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								</c:if>
								
								<c:if test="${ certifi.classify_code == '3'}">
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>재발급 사유</mark></strong></div>
										<div class="ff_wrap ml120">
											<form:textarea path="reissued_reason" class="input t1 fl"  />		
										</div>
									</div>
								</div>
								</c:if>
								
								<c:if test="${addFile2 == null && certifi.classify_code == '1'}"> <!-- 신규신청일때만 첨부파일 보임20160725 -->
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid27" class="ff_title i_b"><strong>첨부파일</strong></label>
										<div class="ff_wrap ml120 text ca s1">
											<div class="area">
												<label for="inputid27" class="ti">기본주소</label>
												<form:input type="file" path="add_file2" class="file t1" />
											</div>
											※ 영양사면허증 사본, 경력(재직)증명서를 압축하여 첨부 요망(용량:   50MB까지)
										</div>
									</div>
								</div>
								</c:if>
								
								<div class="pt30 center">
									위와 같이 전문영양사 자격증을 신청합니다.
									<div class="cm">
										${kdaFunc:formatDayKo(kdaFunc:getTodayString()) }
									</div>
									<div class="cm">
										신청인 <mark class="cm bold"> ${person.pers_name}</mark>
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
						<li><a href="/kmp_member_info.do" class="btn big t2">회원정보 수정하기</a></li>
						<li><a href="javascript:f_Send();" class="btn big t1">신청하기</a></li>
					</ul>
				</div>
			</fieldset>
		</form:form>
		
		<!-- // Contents End  -->
	
	</div>
</div>

	</c:otherwise>
</c:choose>
