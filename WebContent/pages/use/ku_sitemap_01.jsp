<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
  	String lic_ck_val =""; //면허중복확인
%>
<script type="text/javascript">

	var interval;

	$(document).ready(function() 
	{
		$("#use_button_license").hide();		
		$("#use_button_id").hide();
		
		loadGroupCode();
	});
	
	function loadGroupCode()
	{
		// --030 :우편물 발송지 구분, 018:발송호칭 010:직렬, 011:직급, 027:최종학력, 019:학위, 028:출신학교
		
		var param = "groupCode=010"; // 직렬
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode010							
		});
		
		var param = "groupCode=011"; // 직급
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode070							
		});	
		
		var param = "groupCode=030"; // 우편물 발송지 구분
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode030							
		});			
		
		var param = "groupCode=018"; // 우편물 발송지 구분
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode018							
		});			
	
	}
	
	function handleLoadGroupCode010(data)
	{
		data = "<option value='0'>직렬선택</option>" + data
		$("#job_line_code").html(data);
		$("#job_line_code").val('${requestScope.memberInfo.job_line_code}').attr("selected", "selected");
	}
	
	function handleLoadGroupCode070(data)
	{
		data = "<option value='0'>직급선택</option>" + data
		$("#job_level_code").html(data);
		$("#job_level_code").val('${requestScope.memberInfo.job_level_code}').attr("selected", "selected");
	}

	function handleLoadGroupCode030(data)
	{
		data = "<option value='0'>수신처</option>" + data
		$("#code_place").html(data);
		$("#code_place").val('${requestScope.memberInfo.code_place}').attr("selected", "selected");
	}

	function handleLoadGroupCode018(data)
	{
		data = "<option value='0'>호칭</option>" + data
		$("#code_call").html(data);
		$("#code_call").val('${requestScope.memberInfo.code_call}').attr("selected", "selected");
	}
	
	function doShowLicensePopup()
	{  	
		interval = setInterval(setFocusLicense,1);
		$("#use_button_license").hide();
		$("#ck_license").val( $("#lic_no").val() );
  		$('#popup_license').bPopup();  		
	}
	
	function setFocusLicense()
	{
		$("#ck_license").focus();
		clearInterval(interval);
	}
	
	function doCheckLicense()
	{		
		var ck_license = $("#ck_license").val();
		
		if( ck_license == $("#lic_no").val() ) {
			alert("수정할 면허번호를 입력하여 주십시요");
			$("#ck_license").focus();
			return;
		}
		
		var param = "ck_val=" + ck_license;
		$.ajax ( {
              type		: "POST"
			, url		: "/member_checkLicNo.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLicenseCheck							
		});
	}
	
	function handleLicenseCheck(data)
	{
		var ck_license = $("#ck_license").val();
		if ( data == "" ){						
			alert("[" + ck_license + "] 사용가능한 면허번호입니다.");
			$("#use_button_license").show();
		} else {
			alert("[" + ck_license + "] 이미 등록된 면허번호입니다.");
		}
	}

	function doUseLicense()
	{
		var ck_license = $("#ck_license").val();
		$("#lic_no").val ( ck_license );
		$('#popup_license').bPopup();
		
		$(".bClose").click();
	}
	
	function doShowIdPopup()
	{	
		interval = setInterval(setFocusId,1);
		$("#use_button_id").hide();
		$('#popup_id').bPopup();
		$(".bClose").click();
	}
	
	function setFocusId()
	{
		$("#ck_id").focus();
		clearInterval(interval);
	}
	
	function doCheckId()
	{
		var ck_id = $("#ck_id").val();
		var param = "ck_val=" + ck_id;		
		
		$.ajax ( {
              type		: "POST"
			, url		: "/member_checkLicNo.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleIdCheck							
		});
	}
	
	function handleIdCheck(data)
	{
		var ck_id = $("#ck_id").val();
		if ( data == "" )
		{						
			alert("[" + ck_id + "] 사용가능한 아이디 입니다.");
			$("#use_button_id").show();
		}
		else
		{
			alert("[" + ck_id + "] 이미 등록된 아이디 입니다.");
		}
	}	

	function doUseId()
	{
		var ck_id = $("#ck_id").val();
		$("#id").val ( ck_id );
		$(".bClose").click();
	}	

	function getMailAddChk(item)
	{
		if(item == "직장")
		{
			if(    document.join.code_post3.value == "" 
				|| document.join.code_post4.value == "" 
				|| document.join.company_add.value == "" )
			{
				alert("근무처주소를 입력하지 않으면 '직장'으로 선택 할 수 없습니다.");
				document.join.code_place.options[0].selected=true;
				document.join.code_place.options[1].selected=false;
			}
		}
	}

	function openJusoPopup() 
	{
		var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
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
		document.join.pers_add.value 		= roadAddrPart1 ;		
		document.join.pers_add_detail.value = addrDetail + " " + roadAddrPart2;
/*		document.join.ppost.value 		= zipNo.substring(0,3) + zipNo.substring(4,7);*/
		document.join.ppost.value 		= zipNo ;
	}

	function openJusoPopup2() 
	{
		var pop = window.open("/pages/juso/jusoPopup2.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack2( roadFullAddr
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
		document.join.company_add.value 		= roadAddrPart1;
		document.join.company_add_detail.value 	= addrDetail + " " + roadAddrPart2;
//		document.join.cpost.value 			= zipNo.substring(0,3) + zipNo.substring(4,7);
		document.join.cpost.value 			= zipNo ;
	}

	function check()
	{	
		try
		{
			
			document.join.code_sex.value = $("input:radio[name='code_sex']:checked").val();
			
			if(document.join.lic_no.value.length < 1){
				alert("면허번호를 정확히 입력하세요.");
				document.join.lic_no.focus();
				return false;
			}
			

			var pw = document.join.passwd.value;
			if( pw.length > 0 ) {
				if( !checkPassword("passwd") )
					return false;
			}
			
			if(document.join.passwd.value != document.join.passwd2.value ){
				alert("비밀번호확인 번호가 서로 다릅니다.");
				document.join.passwd2.focus();
				return false;
			}		
			
			
			if(document.join.email.value.length < 1){
				alert("이메일을 정확히 입력하세요.");
				document.join.email.focus();
				return false;
			}			
			
			if(document.join.email2.value.length < 4){
				alert("이메일을 정확히 입력하세요.");
				document.join.email2.focus();
				return false;
			}
			
			document.join.email.value = document.join.email.value + "@" + document.join.email2.value;
			
			if(document.join.pers_tel.value.length < 2 || document.join.pers_tel.value.length > 11){
				alert("자택 전화번호를 정확히 입력하세요.");
				document.join.pers_tel.focus();
				return false;
			}
			
			if(document.join.pers_hp.value.length < 3 || document.join.pers_hp.value.length > 11){
				alert("휴대전화 번호를 정확히 입력하세요.");
				document.join.pers_hp.focus();
				return false;
			}
			
			if(document.join.ppost.value.length < 1){
				alert("자택 주소를 정확히 입력하세요.");
				document.join.code_post.focus();
				return false;
			}
			
			if(document.join.pers_add.value.length < 1){
				alert("자택 주소를 정확히 입력하세요.");
				document.join.pers_add.focus();
				return false;
			}
			
			if(document.join.pers_add_detail.value.length < 1){
				alert("자택 주소를 정확히 입력하세요.");
				document.join.pers_add_detail.focus();
				return false;
			}
			
			if( $("#code_place").val() == "0" ) {
				alert("수신처를 선택하여 주십시요");
				$("#code_place").focus();
				return false;
			}
		}
		catch(e)
		{
			alert(e);
		}
		
		return true;
	}
	
	function doWrite()
	{
		if ( check() ) {			
			var f = document.forms["join"];
			f.method = "post";
			f.action = "/update_member_info.do";
			f.submit();				
		}
	}
</script>

<form name="join" method="post">
<input type='hidden' name="code_pers" id="code_pers" value="${requestScope.memberInfo.code_pers}" title="회원번호">
<input type="text" name="comp_seq" value="${requestScope.memberInfo.comp_seq}" title="">
 
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1">
					<mark class="cm">기본</mark>정보수정
				</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/mypage/kmp_member_info.do">마이페이지</a></li>
					<li><a href="/mypage/kmp_member_info.do">회원정보 관리</a></li>
					<li><a href="/mypage/kmp_member_info.do" class="cm">기본정보 수정</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<div class="box t2 bgs mt50 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1">
						<mark class="cm">회원</mark> 정보 수정 
					</h5>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3">
							<mark class="bold">기본정보</mark>
							<span class="ssmall">( <span class="i_b_t5"> 표시는
									필수항목입니다.</span> )
							</span>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w80" id="pers_name"
												name="pers_name" value="${requestScope.memberInfo.pers_name}" readonly />
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid2" class="ff_title i_b"><strong>생년월일</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w80" id="pers_birth"
												name="pers_birth" value="${requestScope.memberInfo.pers_birth}" readonly />
										</div>
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b">
										<strong>성별</strong>
									</div>
									<div class="ff_wrap ml120 text">
										<div class="area">
											<input type="radio" class="mr5" id="code_sex" name="code_sex"	value="1" <c:if test="${requestScope.memberInfo.code_sex == '1'}"> checked </c:if>> 
												<label for="radio1_1" class="mr20">남자</label> 
												<input type="radio" class="mr5" id="code_sex" name="code_sex" value="0"
												<c:if test="${requestScope.memberInfo.code_sex == '0' || requestScope.memberInfo.code_sex == ''}"> checked </c:if> />
												<label for="radio1_2" class="mr20">여자</label>
										</div>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${(requestScope.memberInfo.code_member == '07') || (requestScope.memberInfo.code_member == '08')|| (requestScope.memberInfo.code_member == '12') }">
									<input type="hidden" name="lic_no" id="lic_no" value="0">
								</c:when>
								<c:otherwise>
									<div class="f_wrap line bb p8">
										<div class="f_field div1">
											<label for="inputid3" class="ff_title i_b"><strong>면허번호</strong></label>
											<div class="ff_wrap ml120">
												<div class="area">
													<input type="text" class="input t1 fl w200" id="lic_no" name="lic_no" 
														value="${requestScope.memberInfo.lic_no}" onKeyPress="onlyNumber()" maxlength="6" readonly /> 
													<a href="javascript:doShowLicensePopup();" class="btn form p5 t1 fl ml5">면허번호 중복확인</a> 
													<a href="http://www.mw.go.kr/front_new/mw/smw0101mn.jsp?PAR_MENU_ID=01&MENU_ID=010601" target="_blank" 
														class="btn form p5 t4 fl ml5">보건복지부 온라인 면허조회 바로가기</a>
												</div>
												<div class="area mt5 text ca s1">
													<mark class="cb bold">면허번호</mark>
													: 보건복지부 면허민원 안내를 통해 면허번호를 정확하게 확인하신 후 가입하여 주시기 바랍니다.<br />
													학생이나 영양사가 아니신 분은 면허번호를 공란으로 두십시오.
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid4" class="ff_title i_b"><strong>이용자ID</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w100" id="id" name="id"
												size="12" value="${requestScope.memberInfo.id}" readonly />
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid5" class="ff_title i_b"><strong>비밀번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="password" class="input t1 fl w200" id="passwd"	name="passwd" size="20" value=""/>
										</div>
										<div class="area">
											<p class="fl text cp s1 ml10">영문, 숫자, 특수문자 2종류, 8자리 이상</p>
										</div>
									</div>
								</div>
								<div class="f_field div2">
									<label for="inputid6" class="ff_title i_b"><strong>재입력</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="password" class="input t1 fl w200" id="passwd2" name="passwd2" size="20"  value=""/>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid7" class="ff_title i_b"><strong>이메일</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="email" name="email" value="${fn:split(requestScope.memberInfo.email,'@')[0]}" />
												<label for="email2"	class="fl text ml10 mr10">@</label> 
												<input type="text" class="input t1 fl w150" id="email2" name="email2" value="${fn:split(requestScope.memberInfo.email,'@')[1]}" />
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b">
										<strong>전화번호</strong>
									</div>
									<div class="ff_wrap ml120">
										<ul>
											<li>
												<div class="area">
													<label for="inputid10" class="fl w80 text bold cm">자택</label>
													<input type="text" class="input t1 fl w100"  id="pers_tel" name="pers_tel"
														size="20" value="${requestScope.memberInfo.pers_tel}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
												</div>
											</li>
											<li class="mt5">
												<div class="area">
													<label for="inputid13" class="fl w80 text bold cm">휴대폰</label>
													<input type="text" class="input t1 fl w100" id="pers_hp" name="pers_hp" size="20" 
													value="${requestScope.memberInfo.pers_hp}" maxlength="12"  style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<h6 class="title s1 i_b_t3 mt40">
							<mark class="bold">자택 및 근무처 정보</mark>
							<span class="ssmall">( 우편물 수신처 )</span>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid16" class="ff_title i_b"><strong>자택주소</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="ppost"
												name="ppost" value="${requestScope.memberInfo.ppost}"
												onFocus="document.join.pers_add.focus();" readonly /> <a
												href="javascript:openJusoPopup();"
												class="btn form t1 fl ml5">주소검색</a>
											<p class="fl text cp ml10">주소검색(우편번호) : - 없이 한 칸으로
												만들어주세요.</p>
										</div>
										<div class="area mt5">
											<label for="inputid17" class="ti">상세주소</label> 
											<input type="text" class="input t1" id="pers_add" name="pers_add" value="${requestScope.memberInfo.pers_add}" readonly /> 
											<br> <input type="text"	class="input t1" id="pers_add_detail" name="pers_add_detail" value="${requestScope.memberInfo.pers_add_detail}" readonly />
										</div>
										<div class="area mt5 text ca s1">
											우편 발송시 문제가 될수 있으니
											<mark class="cm">새주소</mark>
											로 주소를 입력해 주시고 세부주소를 이어서 입력해 주세요.
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>근무처</strong>
									</div>
									<div class="ff_wrap ml120">
										<ul>
											<li>
												<div class="area">
													<label for="company_name" class="fl w80 text bold cm">근무처명</label>
													<input type="text" class="input t1 fl w100" id="company_name" name="company_name" value="${requestScope.memberInfo.company_name}" />
													<input type="hidden" name="company_name_org" value="${requestScope.memberInfo.company_name}" />
												</div>
											</li>
											<li class="mt5">
												<div class="area">
													<label for="job_dept" class="fl w80 text bold cm">부서 및 직급</label> 
													<input type="text" class="input t1 fl w200" id="inputid19" name="job_dept" value="${requestScope.memberInfo.job_dept}" /> 
													<span class="fl text ml10 mr10">부</span> 
													<label for="job_line_code" class="ti">직렬</label>
													<select	class="select t2 fl w100" id="job_line_code" name="job_line_code"></select> 
													<label for="job_level_code" class="ti">직급</label> 
													<select class="select t2 fl w100 ml5" id="job_level_code" name="job_level_code"></select>
											</li>
											<li class="mt5 pt5 line bt">
												<div class="area">
													<label for="inputid22" class="fl w80 text bold cm">근무처	주소</label>
													<div class="ml80">
														<div class="area">
															<input type="text" class="input t1 fl w200" id="inputid22" name="cpost" value="${requestScope.memberInfo.cpost}" readonly/> 
															<a href="javascript:openJusoPopup2();" class="btn form t1 fl ml5">주소검색</a>
														</div>
														<div class="area mt5">
															<label for="company_add" class="ti">상세주소</label> 
															<input type="text" class="input t1" id="company_add" name="company_add" value="${requestScope.memberInfo.company_add}" readonly /> 
															<br> <input type="text"	class="input t1" id="company_add_detail" name="company_add_detail" value="${requestScope.memberInfo.company_add_detail}" readonly/>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>전화번호</strong>
									</div>
									<div class="ff_wrap ml120">
										<ul>
											<li>
												<div class="area">
													<label for="inputid24" class="fl w80 text bold cm">근무처</label>
													<input type="text" class="input t1 fl w100"
														id="company_tel" name="company_tel"
														value="${requestScope.memberInfo.company_tel}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="code_place" class="ff_title"><strong>우편물 수신처</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<select class="select t2 w150" id="code_place" size="1"
												name="code_place" onChange="getMailAddChk(this.value);"></select>
										</div>
									</div>
								</div>
								<div class="f_field div2">
									<label for="code_call" class="ff_title"><strong>수취인 호칭</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<select class="select t2 w150" id="code_call" name="code_call"></select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br /><br /><br />
					<h6 class="title s1 i_b_t3"><mark class="bold">면허관련정보</mark></h6>
					<div class="form mt10 line bt bcm">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="code_part" class="ff_title i_b"><strong>근무처분류</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 fl w200" id="code_part" name="code_part" onChange="javascript:onChangeCodePart();"></select>
										<label for="code_great" class="ti"><strong>근무처분류2</strong></label>
										<select class="select t2 fl w200 ml5" id="code_great" name="code_great" onChange="javascript:onChangeCodeGreat();">
											<option value="">없음</option>
										</select>
									</div>
									<div class="area mt5">
										<label for="code_small" class="ti"><strong>근무처분류3</strong></label>										
										<select class="select t2 fl w200 ml5" id="code_small" name="code_small">
											<option value="">없음</option>
										</select>										
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="code_use" class="ff_title i_b"><strong>운영형태</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 w200" id="code_use" name="code_use" onChange="javascript:onChangeCodeUse();"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8" id="trust">
							<div class="f_field div1">
								<label for="code_use" class="ff_title i_b"><strong>위탁 업체</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<p class="fl text cp s1 ml10">* 운영형태가 위탁인 경우 업체검색 버튼을 통해 입력해 주세요.</p>
								  		<table class="fl w500">
											<tr>
												<td width="70" >업체명</td>
												<td>
													<input type='text' id='trust_name' name='trust_name' value="${requestScope.licenseInfo.trust_name}"  size= '20'  class="input t1 fl w200"  readonly >
													<input type='hidden' id='trust_code' name='trust_code' value="${requestScope.licenseInfo.trust_code}"  size= '20' >
													<a href="javascript:deposit_val_check()" class="btn form p5 t1 fl ml5">업체검색</a>
												</td>
											<tr/>
											<tr>
												<td>연락처</td>
												<td><input type='text' id='trust_tel' name='trust_tel' size='20' value="${requestScope.licenseInfo.trust_tel}"  class="input t1 fl w200"   readonly ></td>
											<tr/>
											<tr>
												<td>주소</td>
												<td><input type='text' id='trust_addr' name='trust_addr' size= '20' value="${requestScope.licenseInfo.trust_addr}" class="input t1 fl" readonly ></td>
											<tr/>
										</table> 
									</div>
								</div>
							</div>
						</div>
												
						<div class="f_wrap line bb p8">
							<div class="f_field div2">
								<label for="inputid5" class="ff_title i_b"><strong>1식 재료비</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 fl w80" id="inputid5" name="company_meal" value="${requestScope.licenseInfo.company_meal}"  style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
									</div>
								</div>
							</div>
							<div class="f_field div2">
								<label for="inputid6" class="ff_title i_b"><strong>허가병상</strong></label>
								<div class="ff_wrap ml120 text">
									<div class="area">
										<input type="text" class="input t1 fl w80" id="inputid6"  name="company_sick_bad" value="${requestScope.licenseInfo.company_sick_bad}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
										<p class="fl text cp s1 ml10">* 병원인경우 입력</p>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<div class="ff_title i_b"><strong>1일 급식인원</strong></div>
								<div class="ff_wrap ml120">
									<div class="area">
										<label for="inputid7" class="fl text mr5">아침</label>
										<input type="text" class="input t1 fl w40" id="inputid7"  name="company_count_mom"  value="${requestScope.licenseInfo.company_count_mom}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid8" class="fl text mr5">점심</label>
										<input type="text" class="input t1 fl w40" id="inputid8"  name="company_count_lunch" value="${requestScope.licenseInfo.company_count_lunch}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid9" class="fl text mr5">저녁</label>
										<input type="text" class="input t1 fl w40" id="inputid9"  name="company_count_dinner"  value="${requestScope.licenseInfo.company_count_dinner}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid10" class="fl text mr5">야식</label>
										<input type="text" class="input t1 fl w40" id="inputid10"  name="company_count_midnig" value="${requestScope.licenseInfo.company_count_midnig}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
										<span class="fl text ml5 mr20">명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<div class="ff_title i_b"><strong>공동여부</strong></div>
								<div class="ff_wrap ml120">
									<div class="area">
										<label for="inputid11" class="fl text mr5">공동관리</label>
										<input type="text" class="input t1 fl w40" id="inputid11"  name="join_con" value="${requestScope.licenseInfo.join_con}" />
										<span class="fl text ml5 mr20">개소</span>
										<label for="inputid12" class="fl text mr5">공동조리</label>
										<input type="text" class="input t1 fl w40" id="inputid12"  name="join_cook" value="${requestScope.licenseInfo.join_cook}" />
										<span class="fl text ml5 mr20">개소</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<div class="ff_title i_b"><strong>겸직여부</strong></div>
								<div class="ff_wrap ml120 text">
									<div class="area">
										<input type="radio" class="mr5" id="pers_multy"  name="pers_multy" <c:if test="${requestScope.licenseInfo.pers_multy == '1' || requestScope.licenseInfo.pers_multy == 'Y'}">checked</c:if> value="Y" />
										<label for="radio1_1" class="mr20">겸직</label>
										<input type="radio" class="mr5" id="pers_multy" name="pers_multy" <c:if test="${requestScope.licenseInfo.pers_multy == '0' || requestScope.licenseInfo.pers_multy == '' || requestScope.licenseInfo.pers_multy == 'N'}">checked</c:if> value="N" />
										<label for="radio1_2" class="mr20">겸직안함</label>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div2">
								<label for="inputid13" class="ff_title i_b"><strong>영양사면허수당</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 w200" id="lic_pay" name="lic_pay" >
											<fmt:parseNumber var="lic_pay" type="number" value="${requestScope.licenseInfo.lic_pay}"/>
											<option value="">선택</option>
											<option value="0" <c:if test="${lic_pay <= 0 }"> selected </c:if>>없음</option>
											<option value="7500" <c:if test="${lic_pay > 0 && lic_pay <= 10000 }"> selected </c:if>>5,000~10,000원</option>
											<option value="15000"  <c:if test="${lic_pay > 10000 && lic_pay <= 20000 }"> selected </c:if>>10,000~20,000원</option>
											<option value="25000"  <c:if test="${lic_pay > 20000 && lic_pay <= 30000 }"> selected </c:if>>20,000~30,000원</option>
											<option value="35000"  <c:if test="${lic_pay > 30000 && lic_pay <= 40000 }"> selected </c:if>>30,000~40,000원</option>
											<option value="45000"  <c:if test="${lic_pay > 40000 && lic_pay <= 50000 }"> selected </c:if>>40,000~50,000원</option>
											<option value="55000"  <c:if test="${lic_pay > 50000 && lic_pay <= 60000 }"> selected </c:if>>50,000~60,000원</option>
											<option value="65000"  <c:if test="${lic_pay > 60000 && lic_pay <= 70000 }"> selected </c:if>>60,000~70,000원</option>
											<option value="75000"  <c:if test="${lic_pay > 70000  }"> selected </c:if>>70,000~80,000원</option>
										</select>
									</div>
								</div>
							</div>
							<div class="f_field div2">
								<label for="inputid14" class="ff_title i_b"><strong>연봉</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 w200" id="year_pay"  name="year_pay">
											<fmt:parseNumber var="year_pay" type="number" value="${requestScope.licenseInfo.year_pay}"/>
											<option value="0">선택</option>
											<option value="950" <c:if test="${year_pay > 0 && year_pay <= 1000 }"> selected </c:if>>900~1,000만원</option>
											<option value="1250" <c:if test="${year_pay > 1000 && year_pay <= 1500 }"> selected </c:if>>1,000~1,500만원</option>
											<option value="1750" <c:if test="${year_pay > 1500 && year_pay <= 2000 }"> selected </c:if>>1,500~2,000만원</option>
											<option value="2250" <c:if test="${year_pay > 2000 && year_pay <= 2500 }"> selected </c:if>>2,000~2,500만원</option>
											<option value="2750" <c:if test="${year_pay > 2500 && year_pay <= 3000 }"> selected </c:if>>2,500~3,000만원</option>
											<option value="2750" <c:if test="${year_pay > 3000 && year_pay <= 3500 }"> selected </c:if>>3,000~3,500만원</option>
											<option value="3250" <c:if test="${year_pay > 3500 && year_pay <= 4000 }"> selected </c:if>>3,500~4,000만원</option>
											<option value="4250" <c:if test="${year_pay > 4000 && year_pay <= 4500 }"> selected </c:if>>4,000~4,500만원</option>
											<option value="4750" <c:if test="${year_pay > 4500 && year_pay <= 5000 }"> selected </c:if>>4,500~5,000만원</option>
											<option value="5250" <c:if test="${year_pay > 5000 && year_pay <= 5500 }"> selected </c:if>>5,000~5,500만원</option>
											<option value="5750" <c:if test="${year_pay > 5500 && year_pay <= 6000 }"> selected </c:if>>5,500~6,000만원</option>
											<option value="6500" <c:if test="${year_pay > 6000 }"> selected </c:if>>6,000~7,000만원</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<h6 class="title s1 i_b_t3 mt40"><mark class="bold">기타정보</mark></h6>
					<div class="form mt10 line bt bcm">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<div class="ff_title i_b"><strong>학력</strong></div>
								<div class="ff_wrap ml120">
									<ul>
										<li>
											<div class="area">
												<label for="code_scholar" class="fl w80 text bold cm">최종학력</label>
												<select class="select t2 fl w200" id="code_scholar"  name="code_scholar"></select>
											</div>
										</li>
										<li class="mt5">
											<div class="area">
												<label for="code_univer" class="fl w80 text bold cm">학위</label>
												<select class="select t2 fl w200" id="code_univer" name="code_univer"></select>
											</div>
										</li>
										<li class="mt5">
											<div class="area">
												<label for="code_school" class="fl w80 text bold cm">출신학교</label>
												<select class="select t2 fl w200" id="code_school" name="code_school" ></select>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
							<div class="ff_title i_b"><strong>자격증 종류</strong></div>
							<div class="ff_wrap ml120 text">
								<ul class="area"><!-- 실제 데이타 베이스 에서는 영양교사? : lic_kind9 로 인식 -->
										
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view" name="certifi_view" value="1" <c:if test="${fn:substring(requestScope.licenseInfo.certifi_view,0,1) == '1'}">checked</c:if> /><label for="certifi_view">영양교사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view2" name="certifi_view2" value="1" <c:if test="${fn:substring(requestScope.licenseInfo.certifi_view,1,2) == '1'}">checked</c:if>/><label for="certifi_view2">운동처방사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view3" name="certifi_view3" value="1" <c:if test="${fn:substring(requestScope.licenseInfo.certifi_view,2,3) == '1'}">checked</c:if>/><label for="certifi_view3">조리사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view4" name="certifi_view4" value="1" <c:if test="${fn:substring(requestScope.licenseInfo.certifi_view,3,4) == '1'}">checked</c:if>/><label for="certifi_view4">기타</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view5" name="certifi_view5" value="1" <c:if test="${fn:substring(requestScope.licenseInfo.certifi_view,4,5) == '1'}">checked</c:if>/><label for="certifi_view5">임상영양사국가자격증</label></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid18" class="ff_title i_b"><strong>경력</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 fl w100" id="pers_career" name="pers_career">
											<option value="F">선택</option>
											<c:forEach var="i" begin="0" end="50">
												<c:choose>
													<c:when test="${i < 10}">
														<option value="0${i}00" <c:if test="${(fn:length(requestScope.licenseInfo.pers_career) > 0 ) && '0'+i == fn:substring(requestScope.licenseInfo.pers_career,0,2)}">selected</c:if>> 0${i}</option>
													</c:when>
													<c:otherwise>
														<option value="${i}00" <c:if test="${(fn:length(requestScope.licenseInfo.pers_career) > 0 ) && i == fn:substring(requestScope.licenseInfo.pers_career,0,2)}"> selected </c:if>>${i}</option>	
													</c:otherwise>
													</c:choose>
											</c:forEach>
										</select>
										<span class="fl text ml5">년</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid19" class="ff_title i_b"><strong>산하단체/분야회</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 w200" id="code_sub" name="code_sub" title="산하단체/분야회 DB">
											<option value="">선택</option>
											<option value="00" <c:if test="${requestScope.licenseInfo.code_sub == '00'}">selected</c:if>>알수없음</option>
											<option value="01" <c:if test="${requestScope.licenseInfo.code_sub == '01'}">selected</c:if>>전국학교영양사회</option>
											<option value="02" <c:if test="${requestScope.licenseInfo.code_sub == '02'}">selected</c:if>>전국교정영양사회릉대</option>
											<option value="03" <c:if test="${requestScope.licenseInfo.code_sub == '03'}">selected</c:if>>전국교정영양사회</option>
											<option value="04" <c:if test="${requestScope.licenseInfo.code_sub == '04'}">selected</c:if>>전국당뇨병영양사회</option>
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
					<li><a href="javascript:doWrite();" class="btn big t2">확인</a></li>
					<li><a href="javascript:history.back();" class="btn big t1">취소</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="popup_license" class="p_style"
		style="width: 600px; height: 270px">
		<div id="popup">
			<div class="p_head" style="width: 570px;">
				<h2 class="title t3 cw bold s1 i_b_t6">면허번호 중복확인</h2>
			</div>
			<div class="p_body text ca small center">
				<div class="p30">
					<div class="area">면허번호를 입력해주세요.</div>
					<div class="area mt20">
						<input type="text" class="input t1 w200" id="ck_license"
							name="ck_license" /> <a href="javascript:doCheckLicense();"
							class="btn form p5 t1">검색</a> <a
							href="javascript:doUseLicense();" class="btn form p5 t3"
							id="use_button_license">사용</a>
					</div>
				</div>
			</div>
			<div class="p_foot line bt">
				<div class="btn_wrap mt20">
					<ul>
						<li><a href="#" class="bClose">닫기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="popup_id" class="p_style" style="width: 600px; height: 270px">
		<div id="popup">
			<div class="p_head" style="width: 570px;">
				<h2 class="title t3 cw bold s1 i_b_t6">아이디 중복확인</h2>
			</div>
			<div class="p_body text ca small center">
				<div class="p30">
					<div class="area">아이디를 입력해주세요.</div>
					<div class="area mt20">
						<input type="text" class="input t1 w200" id="ck_id" name="ck_id" />
						<a href="javascript:doCheckId();" class="btn form p5 t1">검색</a> <a
							href="javascript:doUseId();" class="btn form p5 t3"
							id="use_button_id">사용</a>
					</div>
				</div>
			</div>
			<div class="p_foot line bt">
				<div class="btn_wrap mt20">
					<ul>
						<li><a href="#" class="bClose">닫기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</form>