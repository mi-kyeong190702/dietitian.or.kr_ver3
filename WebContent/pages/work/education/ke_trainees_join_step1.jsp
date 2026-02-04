<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<c:choose>
	<c:when test="${not empty errorKind }">
		<c:if test="${errorKind == '1'}">
			<script>
			alert('실명 확인 후 등록하여 주십시요');
			location.href="ke_trainees_join.do";
			</script>
		</c:if>
		
		<c:if test="${errorKind == '2' }">
			<script>
			alert('이미 등록된 교육생이나 회원이십니다.\n확인 후 등록하여 주십시요');
			location.href = "ke_curriculum.do";
			</script>
		</c:if>
	</c:when>
	<c:otherwise>
	
	
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
			, url		: "/common_groupcode_option.do?val=${join.job_line_code}" 
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode010							
		});
		
		var param = "groupCode=011"; // 직급
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do?val=${join.job_level_code}"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode070							
		});	
		
		var param = "groupCode=030"; // 우편물 발송지 구분
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do?val=${join.code_place}"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode030							
		});			
		
		var param = "groupCode=018"; // 호칭 구분
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do?val=${join.code_call}"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode018							
		});
		
	
		// --007 : 지회		
		var param = "groupCode=007"; // 지회
		$.ajax ( {
	            type		: "POST"
				, url		: "/common_groupcode_option.do?val=${join.code_bran}"
				, dataType  : "text"
				, data		: param
				, cache		: false
				, success	: handleLoadGroupCode007							
		});
	}
	
	
	
	function handleLoadGroupCode010(data)
	{
		data = "<option value='0'>직렬선택</option>" + data;
		$("#job_line_code").html(data);
		
		var job_line_code = '';		
		if(job_line_code != '') {
 			$("#job_line_code").val(job_line_code);
		}
	}
	
	function handleLoadGroupCode070(data)
	{
		data = "<option value='0'>직급선택</option>" + data
		$("#job_level_code").html(data);
		
		var job_level_code = '';		
		if(job_level_code != '') {
 			$("#job_level_code").val(job_level_code);
		}
	}

	function handleLoadGroupCode030(data)
	{
		data = "<option value='0'>수신처</option>" + data
		$("#code_place").html(data);
		
		var code_place = '';		
		if(code_place != '') {
 			$("#code_place").val(code_place);
		}
	}

	function handleLoadGroupCode018(data)
	{
		data = "<option value='0'>호칭</option>" + data
		$("#code_call").html(data);
		
		var code_call = '';		
		if(code_call != '') {
 			$("#code_call").val(code_call);
		}
	}
	
	function handleLoadGroupCode007(data)
	{
		data = "<option value=''>지회선택</option>" + data
		$("#code_bran").html(data);
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
		
		if( ck_license.length > 6){
			alert("사용가능한 면허번호가 아닙니다. 면허번호를 확인해  주세요.");
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
		if ( data == "" )
		{						
			alert("[" + ck_license + "] 사용가능한 면허번호입니다.");
			$("#use_button_license").show();
		}
		else
		{
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
			, url		: "/member_checkId.do"
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
			alert("[" + ck_id + "] 사용가능한 등록계정 입니다.");
			$("#use_button_id").show();
		}
		else
		{
			alert("[" + ck_id + "] 이미 등록된 계정 입니다.");
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
		document.join.code_post.value 		= zipNo;//zipNo.substring(0,3) + zipNo.substring(4,7);
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
		document.join.company_code_post.value 			= zipNo.substring(0,3) + zipNo.substring(4,7);
	}

	function check()
	{
		try
		{	
			<c:if test="${empty update}">
			if(document.join.id.value.length < 4){
				alert("등록계정은 영문,숫자 혹은 조합으로 4~12자 이내 이어야 합니다.");
				document.join.id.focus();
				return false;
			}
			
			var comp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			var string=document.join.id.value;
			var len=string.length;
			for( var i = 0 ; i < len ; i++ ) {
				if(comp.indexOf(string.substring(i,i+1))<0) 
				{
					alert("등록계정은 영문,숫자 혹은 조합으로 4~12자 이내 이어야 합니다.");
					document.join.id.value="";
					document.join.id.focus();
					return;
				}
			}
			
			
			if(!checkPassword("passwd")) {
				return false;
			}
			
			
			if(document.join.passwd.value != document.join.passwd2.value ){
				alert("비밀번호확인 번호가 서로 다릅니다.");
				document.join.passwd2.focus();
				return false;
			}			
			</c:if>
			
			
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
			
			if(document.join.code_post.value.length < 1){
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
			
			if( $("#code_bran").val == "" ) {
				alert("소속 지부를 정확히 입력하세요.");
				$("#code_bran").focus();
				return false;
			}
			
			if( $("#code_place").val() == "0" ) {
				alert("수신처를 선택하여 주십시요");
				$("#code_place").focus();
				return false;
			}
			
		} catch(e) {
			alert(e);
			return false;
		}
		return true;
	}
	
	function f_send(){
		if ( check() ) {			
			var f = document.forms["join"];
			f.method = "post";
			<c:if test="${empty update}">
			f.action = "ke_trainees_join_action.do";
			</c:if>
			<c:if test="${not empty update}">
			f.action = "ke_trainees_info_action.do";
			</c:if>
			f.submit();				
		}
	}
	
	function checkemailaddy(){
        if (join.email_select.value == '1') {
        	$("#email2").attr("readonly", false);
        	join.email2.value = '';
        	join.email2.focus();
        } else {
        	$("#email2").attr("readonly", true);
            join.email2.value = join.email_select.value;
        }
    }

</script>


	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1">
					<mark class="cm">교육생</mark> 
					<c:if test="${empty update}">등록</c:if>
					<c:if test="${not empty update}">정보수정</c:if>
				</h3>
			</div>
			<div class="sp_navi">
				<c:if test="${empty update}">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span
							class="ti">HOME</span></a></li>
					<li><a href="/work/member/km_join.do">회원가입</a></li>
					<li><a href="/work/member/km_join.do" class="cm">신규회원 가입</a></li>
				</ul>
				</c:if>
				<c:if test="${not empty update}">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span
							class="ti">HOME</span></a></li>
					<li><a href="ke_menu.do">교육</a></li>		
					<li><a href="ke_curriculum.do">교육과정신청</a></li>
					<li><a href="ke_trainees_info.do" class="cm">교육생 정보수정</a></li>
				</ul>
				</c:if>
			</div>
		</div>
		<hr />
		<div class="sp_body">
		<c:if test="${empty update}">
		<div class="area mt50">
		<h4 class="title bold t2 cm s1 i_b_t2">교육생 등록 절차</h4><span class="ib mt10 ml10 text small ca">교육신청 절차  교육생 등록과 교육신청은 다음과 같은 순서에 따라 진행됩니다. </span>
		</div>
		<ol class="step_join mt20">
			<li class="start"><span class="icon step1"></span><span class="txt"><strong>실명확인</strong></span></li>
			<li class="on"><span class="icon step3"></span><span class="txt">교육생 등록</span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		</c:if>
		
		<c:if test="${not empty update}">
		<div class="area">
			<h4 class="title bold t2 cm s1 i_b_t2">교육생 정보수정</h4>
		</div>
		</c:if>
		
		
			<div class="box t2 bgs mt50 p20 text">
			
				<form:form name="join" method="post" action="ke_join_do" modelAttribute="join">
				<form:hidden path="code_member" />
				<form:hidden path="pers_state" />
				<div class="area">
					<h5 class="title i_b_t6 bold s1">
						<mark class="cm">교육생</mark> 정보 입력
					</h5>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3">
							<mark class="bold">기본정보</mark>
							<span class="ssmall">( <span class="i_b_t5"> 표시는 필수항목입니다.</span> )
							</span>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
									<div class="ff_wrap ml120">
										<c:if test="${empty update}">
										<div class="area">
											<form:input path="pers_name" cssClass="input t1 fl w80" readonly="true" />
										</div>
										</c:if>
										<c:if test="${not empty update}">
										<form:hidden path="pers_name" />
										${join.pers_name}
										</c:if>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid2" class="ff_title i_b"><strong>생년월일</strong></label>
									<div class="ff_wrap ml120">
										<c:if test="${empty update}">
										<div class="area">
											<form:input path="pers_birth" cssClass="input t1 fl w80" readonly="true"/>
											<p class="fl text cp s1 ml10">예) 20150210</p>
										</div>
										</c:if>
										<c:if test="${not empty update}">
										<form:hidden path="pers_birth" />
										${join.pers_birth}
										</c:if>
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b">
										<strong>성별</strong>
									</div>
									<div class="ff_wrap ml120 text">
										<div class="area">
											<form:hidden path="code_sex" />
											<c:if test="${join.code_sex == '1' }">남자</c:if>
											<c:if test="${join.code_sex == '2' }">여자</c:if>
										</div>
									</div>
								</div>
							</div>
						
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid3" class="ff_title i_b"><strong>면허번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<form:input path="lic_no" cssClass="input t1 fl w200" onclick="doShowLicensePopup();" readonly="true" maxlength="6"/>
											<a href="javascript:doShowLicensePopup();" class="btn form p5 t1 fl ml5">면허번호 중복확인</a> 
											<a href="http://www.mw.go.kr/front_new/mw/smw0101mn.jsp?PAR_MENU_ID=01&MENU_ID=010601" target="_blank" class="btn form p5 t4 fl ml5">
											보건복지부 온라인 면허조회 바로가기
											</a>
										</div>
										<div class="area mt5 text ca s1">
											<mark class="cb bold">면허번호</mark>
											: 보건복지부 면허민원 안내를 통해 면허번호를 정확하게 확인하신 후 가입하여 주시기 바랍니다.<br />
											학생이나 영양사가 아니신 분은 면허번호를 공란으로 두십시오.
										</div>
									</div>
								</div>
							</div>
						
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid4" class="ff_title i_b"><strong>등록계정</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<c:if test="${empty update}">
											<form:input path="id" cssClass="input t1 fl w100" size="12" onclick="doShowIdPopup();" readonly="true" />
											<a href="javascript:doShowIdPopup();" class="btn form p5 t1 fl ml5">중복확인</a>
											</c:if>
											<c:if test="${not empty update}">
											${join.id}
											</c:if>
											<p class="fl text s1 ml10">
											
											※ 등록계정 : <span class="cp">협회 교육신청 및 확인 시 사용하는 계정</span>입니다. <br />
											※ 본 <span class="cp">등록계정</span>은 향후 협회 <span class="cp">정회원 가입시 회원 ID로 사용</span>됩니다. <br />
											※ 중복확인 : <span class="cp">첫 자는 영문, 그 외 문자는 영문, 숫자 혹은 그 조합으로 4~12자</span>
											
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid5" class="ff_title i_b"><strong>비밀번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<form:password path="passwd" size="20" cssClass="input t1 fl w200" />
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
											<input type="password" class="input t1 fl w200" id="passwd2" name="passwd2" size="20" value="" />
										</div>
									</div>
								</div>
							</div>
		
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid7" class="ff_title i_b"><strong>이메일</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<form:input path="email" cssClass="input t1 fl w200"/>
											<label for="email2" class="fl text ml10 mr10">@</label> 
											<form:input path="email2" cssClass="input t1 fl w150" readonly=""/>
											<label for="inputid9" class="ti">이메일 입력</label>
											<select class="select t2 fl w150 ml5" name="email_select" id="email_select" onChange="checkemailaddy();">
												<option value="" selected>선택하세요</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="chol.com" >chol.com</option>
												<option value="dreamwiz.com" >dreamwiz.com</option>
												<option value="empas.com">empas.com</option>
												<option value="freechal.com" >freechal.com</option>
												<option value="gmail.com" >gmail.com</option>
												<option value="hanafos.com" >hanafos.com</option>
												<option value="hanmail.net" >hanmail.net</option>
												<option value="hanmir.com" >hanmir.com</option>
												<option value="hitel.net" >hitel.net</option>
												<option value="hotmail.com" >hotmail.com</option>
												<option value="korea.com" >korea.com</option>
												<option value="lycos.co.kr" >lycos.co.kr</option>											
												<option value="msn.com" >msn.com</option>
												<option value="nate.com" >nate.com</option>
												<option value="naver.com" >naver.com</option>
												<option value="netian.com" >netian.com</option>
												<option value="paran.com" >paran.com</option>
												<option value="yahoo.co.kr" >yahoo.co.kr</option>
												<option value="yahoo.com" >yahoo.com</option>
												<option value="1">직접입력</option>
											</select>
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
													<label for="pers_tel" class="fl w80 text bold cm">자택</label>
													<form:input path="pers_tel" cssClass="input t1 fl w100" size="20" maxlength="11" cssStyle="ime-mode:disabled;" onKeyPress="return digit_check(event);" />
                     								<p class="fl text cp ml10">(&quot;-&quot;없이 입력 / 지역번호를 꼭 입력하십시오.)</>
												</div>
											</li>
											<li class="mt5">
												<div class="area">
													<label for="pers_hp" class="fl w80 text bold cm">휴대폰</label>
													<form:input path="pers_hp" cssClass="input t1 fl w100" cssStyle="ime-mode:disabled;" onkeypress="return digit_check(event);"/>
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
											<form:input path="code_post" cssClass="input t1 fl w200" onclick="javascript:openJusoPopup();" onfocus="document.join.pers_add.focus();" readonly="true" />
											
											<a href="javascript:openJusoPopup();" class="btn form t1 fl ml5">주소검색</a>
											<p class="fl text cp ml10">주소검색(우편번호) : - 없이 한 칸으로 만들어주세요.</p>
										</div>
										<div class="area mt5">
											<label for="inputid17" class="ti">상세주소</label> 
											<form:input path="pers_add" class="input t1"  readonly="true"/> <br />
											<form:input path="pers_add_detail" cssClass="input t1" readonly="true"/>
											
										</div>
										<div class="area mt5 text ca s1">
											우편 발송시 문제가 될수 있으니 <mark class="cm">새주소</mark>
											로 주소를 입력해 주시고 세부주소를 이어서 입력해 주세요.
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>소속지부 선택</strong></div>
									<div class="ff_wrap ml120">
										<ul>
											<li>
												<div class="area">
													<label for="code_bran" class="fl w80 text bold cm">소속지부</label>
													<form:select path="code_bran" cssClass="select t2 fr w150 ml5"></form:select>
												</div>
											</li>
										</ul>
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
													<form:input path="company_name" cssClass="input t1 fl w100" />
													
												</div>
											</li>
											<li class="mt5">
												<div class="area">
												
													<label for="job_dept" class="fl w80 text bold cm">부서 및 직급</label> 
													<form:input path="job_dept" cssClass="input t1 fl w200"/>
													
													<span class="fl text ml10 mr10">부</span> 
													<label for="job_line_code" class="ti">직렬</label>
													<form:select path="job_line_code" cssClass="select t2 fl w100"></form:select>
													
													<label for="job_level_code" class="ti">직급</label> 
													<form:select path="job_level_code" cssClass="select t2 fl w100 ml5"></form:select>
													
												</div>
											</li>
											<li class="mt5 pt5 line bt">
												<div class="area">
													<label for="inputid22" class="fl w80 text bold cm">근무처 주소</label>
													<div class="ml80">
														<div class="area">
															<form:input path="company_code_post" cssClass="input t1 fl w200" onclick="javascript:openJusoPopup();" readonly=""/>
															<a href="javascript:openJusoPopup2();" class="btn form t1 fl ml5">주소검색</a>
														</div>
														<div class="area mt5">
															<label for="company_add" class="ti">상세주소</label> 
															<form:input path="company_add" cssClass="input t1" readonly=""/><br> 
															<form:input path="company_add_detail" cssClass="input t1" readonly="" />
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
													<form:input path="company_tel" cssClass="input t1 fl w100" cssStyle="ime-mode:disabled;" onkeypress="return digit_check(event);"/>
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
											<form:select path="code_place" cssClass="select t2 w150" onchange="getMailAddChk(this.value);"></form:select>
										</div>
									</div>
								</div>
								<div class="f_field div2">
									<label for="code_call" class="ff_title"><strong>수취인 호칭</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<form:select path="code_call" cssClass="select t2 w150"></form:select>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						</form:form>
						
					</div>
				</div>
			</div>
			<div class="btn_wrap mt30">
				<ul>
					
					<li>
					<a href="javascript:f_send();" class="btn big t2">
							<c:if test="${empty update}">등록</c:if>
							<c:if test="${not empty update}">수정</c:if>
						</a>
					</li>
					<li><a href="javascript:document.join.reset();" class="btn big t1">취소</a></li>
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
							name="ck_license" maxlength="6" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);  if (event.keyCode==13){ doCheckLicense();event.returnValue=false}"/> <a href="javascript:doCheckLicense();"
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
				<h2 class="title t3 cw bold s1 i_b_t6">등록계정 중복확인</h2>
			</div>
			<div class="p_body text ca small center">
				<div class="p30">
					<div class="area">등록계정을 입력해주세요.</div>
					<div class="area mt20">
						<input type="text" class="input t1 w200" id="ck_id" name="ck_id" onKeyPress="if (event.keyCode==13){ doCheckId();event.returnValue=false}"/>
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


	</c:otherwise>
</c:choose>