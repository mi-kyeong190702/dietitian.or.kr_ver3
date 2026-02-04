<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ page import="kda.SessionInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<script type="text/javascript">

	var group_004_data = "";
	
	$(document).ready(function() {	 
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: "groupCode=001"		// 위탁업체
			, cache		: false
			, success	: handleLoadGroupCode001
		});

		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: "groupCode=003"		// 근무처분류
			, cache		: false
			, success	: handleLoadGroupCode003
		});
		
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: "groupCode=019"		// 학위선택
			, cache		: false
			, success	: handleLoadGroupCode019
		});
		
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: "groupCode=027"		// 최종학력
			, cache		: false
			, success	: handleLoadGroupCode027
		});
		
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: "groupCode=028"		// 출신학교
			, cache		: false
			, success	: handleLoadGroupCode028
		});
		
		if( '${requestScope.licenseInfo.code_use}' == '3'){
			$("#trust").show();
		} else { 
			$("#trust").hide();
		}
		
		if( '${requestScope.licenseInfo.code_use}' == '4'){
			$("#nonGroup").hide();
		} else { 
			$("#nonGroup").show();
		}
	
	});

	function handleLoadGroupCode001(data)
	{
		data = "<option value='0'>운영형태선택</option>" + data	;	
		$("#code_use").html(data);
		
		var code_use = ${requestScope.licenseInfo.code_use};		
		if(code_use != '') {
 			$("#code_use").val(code_use);
 			$("#code_use").val('${requestScope.licenseInfo.code_use}').attr("selected", "selected");
		}
	}

	function handleLoadGroupCode003(data)
	{
		//근무처 분류
		$("#code_part").html(data);
		var code_part = ${requestScope.licenseInfo.code_part};		
		if(code_part != '') {
 			$("#code_part").val(code_part);
 			$("#code_part").val('${requestScope.licenseInfo.code_part}').attr("selected", "selected");
 			onChangeCodePart();
		}
	}

	function handleLoadGroupCode019(data)
	{
		data = "<option value='0'>학위선택</option>" + data;
		$("#code_univer").html(data);
		
		var code_univer = ${requestScope.licenseInfo.code_univer};		
		
		if(code_univer != '') {
 			$("#code_univer").val(code_univer);
 			$("#code_univer").val('${requestScope.licenseInfo.code_univer}').attr("selected", "selected");
		}
	}
	
	function handleLoadGroupCode027(data)
	{
		data = "<option value='0'>최종학력선택</option>" + data;
		$("#code_scholar").html(data);
		
		var code_scholar = ${requestScope.licenseInfo.code_scholar};		
		if(code_scholar != '') {
 			$("#code_scholar").val(code_scholar);
 			$("#code_scholar").val('${requestScope.licenseInfo.code_scholar}').attr("selected", "selected");
		}
	}
	
	function handleLoadGroupCode028(data)
	{
		data = "<option value='0'>출신학교선택</option>" + data;
		$("#code_school").html(data);
				
		var code_school = ${requestScope.licenseInfo.code_school};
		if(code_school != '') {
 			$("#code_school").val(code_school);
 			$("#code_school").val('${requestScope.licenseInfo.code_school}').attr("selected", "selected");
		}
	}	
	
	function doShowCompanyPopup()
	{  	
		interval = setInterval(setFocusCompany,1);
  		$('#popup_company').bPopup();  		
	}
	
	function setFocusCompany()
	{
		//$("#ck_license").focus();
		clearInterval(interval);
	}
	
	function onChangeCodePart()
	{
		var tempcd2 = $("#code_part").val();		
		var param = "groupCode=004&tempcd2="+tempcd2; // 근무처 구분
	
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode004
		});
		
	}
	
	function handleLoadGroupCode004(data)
	{
		data = "<option value=''></option>" + data	;	
		$("#code_great").html(data);
		$("#code_small").html("<option value=''></option>");
		var code_great = ${requestScope.licenseInfo.code_great};
		if(code_great != '') {
 			$("#code_great").val(code_great);
 			$("#code_great").val('${requestScope.licenseInfo.code_great}').attr("selected", "selected");
 			onChangeCodeGreat();
		}
	}
	
	function onChangeCodeGreat()
	{
		var tempcd2 = $("#code_great").val();		
		var param = "groupCode=005&tempcd2="+tempcd2; // 근무처 구분
	
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode005
		});
	}
	
	function handleLoadGroupCode005(data)
	{
		data = "<option value=''></option>" + data	;
		$("#code_small").html(data);
		var code_small = ${requestScope.licenseInfo.code_small};	
		if(code_small != '') {
 			$("#code_small").val(code_small);
 			$("#code_big").val($("#code_great").val());
 			$("#code_small").val('${requestScope.licenseInfo.code_small}').attr("selected", "selected");
		}
	}
	
	function onChangeCodeUse()
	{
		if ( $("#code_use").val() == 3 )
			$("#trust").show();
		else
			$("#trust").hide();	
		
		if($("#code_use").val() == 4){
			$("#nonGroup").hide();
		}
		else {
			$("#nonGroup").show();
		}
	}

	function check()
	{
		var f = document.join;

		try
		{	
			if(f.code_part.value == ''){
				alert("근무처 분류를 선택하세요.");
				f.code_part.focus();
				return false;
			}
			
			if(f.code_great.value == ''){
				alert("근무처 대분류를 선택하세요.");
				f.code_great.focus();
				return false;
			}

			if(f.code_small.value == ''){
				alert("근무처 소분류를 선택하세요.");
				f.code_small.focus();
				return false;
			}
			
			if ( $("#code_use").val() == 3 )
			{
				if ( $("#trust_name").val() == "" || $("#trust_code").val() == "" )
				{
					alert("업체를 선택 주세요.");
					f.trust_name.focus();					
					return;
				}
				
				if ( $("#trust_tel").val() == "" )
				{
					alert("업체를 선택 주세요.");
					f.trust_tel.focus();					
					return;					
				}
				
				if ( $("#trust_addr").val() == "" )
				{
					alert("업체를 선택 주세요.");
					f.trust_addr.focus();					
					return;					
				}			
								
			}
			
			if(f.code_use.value =="0"){
				
				alert("근무처 운영형태를 선택하세요.");
				f.code_use.focus();
				return false;
			}

			if(f.company_meal.value ==""){
				alert("1식재료비를 입력하세요.");
				f.company_meal.focus();
				return false;
			}
			
			if(f.company_count_mom.value ==""){
				alert("아침급식인원을 입력하세요.");
				f.company_count_mom.focus();
				return false;
			}
			
			if(f.company_count_lunch.value ==""){
				alert("점심급식인원을 입력하세요.");
				f.company_count_lunch.focus();
				return false;
			}
			
			if(f.company_count_dinner.value ==""){
				alert("저녁급식인원을 입력하세요.");
				f.company_count_dinner.focus();
				return false;
			}
			
			if(f.company_count_midnig.value ==""){
				alert("야식급식인원을 입력하세요.");
				f.company_count_midnig.focus();
				return false;
			}
			
			if(f.join_con.value ==""){
				alert("공동관리 수를 입력하세요.");
				f.join_con.focus();
				return false;
			}
			
			if(f.join_cook.value ==""){
				alert("공동조리 수를 입력하세요.");
				f.join_cook.focus();
				return false;
			}
			
			if(f.lic_pay.value == "" ){
				alert("영양사 면허수당을 선택하세요.");
				f.lic_pay.focus();
				return false;
			}

			if(f.year_pay.value =="0"){
				alert("연봉을 선택하세요.");
				f.year_pay.focus();
				return false;
			}

			if(f.code_sub.value == "F"){
				alert("산하단체를 선택하세요.");
				f.code_sub.focus();
				return false;
			}
	
			if(f.code_scholar.value =="0"){
				alert("최종학력을 선택하세요.");
				f.code_scholar.focus();
				return false;
			}
			
			
			if(f.code_univer.value =="0"){
				alert("학위를 선택하세요.");
				f.code_univer.focus();
				return false;
			}
			
			if(f.code_school.value =="0"){
				alert("출신학교를 선택하세요.");
				f.code_school.focus();
				return false;
			}
			
			if(f.pers_career.value =="F"){
				alert("경력을 선택하세요.");
				f.pers_career.focus();
				return false;
			}
			
			if(f.code_sub.value == ""){
				alert("산하단체를 선택하세요.");
				f.code_sub.focus();
				return false;
			}
			
			var lic1_val = "0";
			var lic2_val = "0";
			var lic3_val = "0";
			var lic4_val = "0";
			var lic5_val = "0";


			if(document.join.certifi_view.checked ==  true){
				lic1_val = "1";
			}
			if(document.join.certifi_view2.checked == true){
				lic2_val = "1";
			}
			if(document.join.certifi_view3.checked == true){
				lic3_val = "1";
			}
			if(document.join.certifi_view4.checked == true){
				lic4_val = "1";
			}
			if(document.join.certifi_view5.checked == true){
				lic5_val = "1";
			}

			f.certifi_view_text.value = lic1_val +lic2_val+ lic3_val+ lic4_val+ lic5_val ;
			
		} catch(e){
			alert(e);
		}
		return true;
	}

	function onlyNumber()  //숫자만을 기입받게 하는 방법
	{
	   if((event.keyCode<48)||(event.keyCode>57))
		  event.returnValue=false;
	}
	
	function deposit_val_check()
	{
		var ck_val = "";
		
		var shape  = "width=600,height=500,";
		shape += "toolbar=no,location=no,directories=no,status=no,";
		shape += "menubar=no,scrollbars=no,resizable=no";
		path   = "/getTrustCompanyList.do";

		var xx = screen.availWidth;
		var yy = screen.availHeight;
		var sxx = 0;
		var syy = 0;
		sxx = (xx/2) - 200;
		syy = (yy/2) - 90;

		shape = shape + ", top=" + syy + ", left=" + sxx;
		
		window.open(path, "deposit_val_check", shape);
	}
	
	function doWrite() {
		if ( check() ) {
			var f = document.forms["join"];
			f.action = "/update_license_info.do";
			f.method = "post";
			f.submit();		
		}
	}

</script>

<form name="join">
<input type='hidden' name="code_pers" value="${requestScope.licenseInfo.code_pers}" title="회원번호">
<input type='hidden' name="comp_seq" value="${requestScope.licenseInfo.comp_seq}" title="">
<input type="hidden" name="certifi_view_text" id="certifi_view_text" />
<input type="hidden" name="code_big" id="code_big" value="${requestScope.licenseInfo.code_big}">
<input type="hidden" name="code_great_org" value="${requestScope.licenseInfo.code_great}" />
<input type="hidden" name="code_part_org" value="${requestScope.licenseInfo.code_part}" />
<input type="hidden" name="code_small_org" value="${requestScope.licenseInfo.code_small}" />


	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기타정보</mark>수정</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/kmp_member_info.do">마이페이지</a></li>
					<li><a href="/kmp_member_info.do">회원정보 관리</a></li>
					<li><a href="/kmp_license_modify.do" class="cm">기타정보 수정</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<p class="text middle cb s1 mt10">
				※ 정보수정이 원활하게 되지 않을 경우,<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">기타정보 수정 요청서</font>를 다운로드 후 작성하시어 담당자에게<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의주시면 처리해드리겠습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 기타정보수정 요청서.docx" class="btn t2" target="_blank" title="새창으로 보기">기타정보 수정 요청서(docx.)<span class="icon quick"></span></a>
				<a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 기타정보수정 요청서.hwp" class="btn t2" target="_blank" title="새창으로 보기">기타정보 수정 요청서(hwp.)<span class="icon quick"></span></a>
				<br>
			</p>
			
		<div class="box t2 bgs mt50 p20 text2">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">상세</mark>정보 입력</h5>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">근무처관련정보</mark></h6>
					<div class="form mt10 line bt bcm">
						<div class="f_wrap line bb p5">
							<!-- 
							<div class="f_field div1">
								<label for="code_part" class="ff_title2 i_b"><strong>근무처분류</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 fl w200" id="code_part" name="code_part" onChange="javascript:onChangeCodePart();"></select>
										<label for="code_great" class="ti"><strong>근무처분류2</strong></label>
										<select class="select s2 fl w200 ml5" id="code_great" name="code_great" onChange="javascript:onChangeCodeGreat();">
											<option value="">없음</option>
										</select>
									</div>
									<div class="area mt5">
										<label for="code_small" class="ti"><strong>근무처분류3</strong></label>										
										<select class="select s2 fl w200 ml5" id="code_small" name="code_small">
											<option value="">없음</option>
										</select>										
									</div>
								</div>
							</div>-->
							<div class="f_field div1">
								<label for="code_part" class="ff_title2 i_b"><strong>근무처분류</strong></label>
								<div class="ff_wrap ml120">
									<!-- 190626modi -->
                                    <div class="area">
										<select class="select s2 fl w150" id="code_part" name="code_part" onChange="javascript:onChangeCodePart();"></select>
										<label for="code_great" class="ti"><strong>근무처분류2</strong></label>
										<select class="select s2 fl w150 ml5" id="code_great" name="code_great" onChange="javascript:onChangeCodeGreat();">
											<option value="">없음</option>
										</select>
                                        <label for="code_small" class="ti"><strong>근무처분류3</strong></label>										
										<select class="select s2 fl w150 ml5" id="code_small" name="code_small">
											<option value="">없음</option>
										</select>
									</div>
                                    <div class="area">
                                        <p class="fl text2 cp mt5">※근무처에 따라 근무처분류가 변경될 수 있습니다.</p><a href="javascript:doShowCompanyPopup();" class="btn form_s1 p5 t1 fl ml5 mt5">근무처분류 상세보기</a> 
                                    </div>
									<!--div class="area mt5">
										<label for="code_small" class="ti"><strong>근무처분류3</strong></label>										
										<select class="select s2 fl w200 ml5" id="code_small" name="code_small">
											<option value="">없음</option>
										</select>										
									</div-->
                                    <!--// 190626modi -->
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<label for="code_use" class="ff_title2 i_b"><strong>운영형태</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 w200" id="code_use" name="code_use" onChange="javascript:onChangeCodeUse();"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5" id="trust">
							<div class="f_field div1">
								<label for="code_use" class="ff_title2 i_b"><strong>위탁 업체</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<p class="fl text2 cp s1 ml10">* 운영형태가 위탁인 경우 업체검색 버튼을 통해 입력해 주세요.</p>
								  		<table class="fl w500">
											<tr>
												<td width="70" >업체명</td>
												<td>
													<input type='text' id='trust_name' name='trust_name' value="${requestScope.licenseInfo.trust_name}"  size= '20'  class="input s1 fl w200"  readonly >
													<input type='hidden' id='trust_code' name='trust_code' value="${requestScope.licenseInfo.trust_code}"  size= '20' >
													<a href="javascript:deposit_val_check()" class="btn form_s1 p5 t1 fl ml5">업체검색</a>
												</td>
											<tr/>
											<tr>
												<td>연락처</td>
												<td><input type='text' id='trust_tel' name='trust_tel' size='20' value="${requestScope.licenseInfo.trust_tel}"  class="input s1 fl w200"   readonly ></td>
											<tr/>
											<tr>
												<td>주소</td>
												<td><input type='text' id='trust_addr' name='trust_addr' size= '20' value="${requestScope.licenseInfo.trust_addr}" class="input s1 fl" readonly ></td>
											<tr/>
										</table> 
									</div>
								</div>
							</div>
						</div>
						<div id="nonGroup">						
						<div class="f_wrap line bb p5">
							<div class="f_field div2">
								<label for="inputid5" class="ff_title2 i_b"><strong>1식 재료비</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input s1 fl w80" id="inputid5" name="company_meal" value="${requestScope.licenseInfo.company_meal}"  style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
									</div>
								</div>
							</div>
							<div class="f_field div2">
								<label for="inputid6" class="ff_title2 i_b"><strong>허가병상</strong></label>
								<div class="ff_wrap ml120 text2">
									<div class="area">
										<input type="text" class="input s1 fl w80" id="inputid6"  name="company_sick_bad" value="${requestScope.licenseInfo.company_sick_bad}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
										<p class="fl text2 cp s1 ml10">* 병원인경우 입력</p>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<div class="ff_title2 i_b"><strong>1일 급식인원</strong></div>
								<div class="ff_wrap ml120">
									<div class="area">
										<label for="inputid7" class="fl text2 mr5">아침</label>
										<input type="text" class="input s1 fl w40" id="inputid7"  name="company_count_mom"  value="${requestScope.licenseInfo.company_count_mom}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text2 ml5 mr20">명</span>
										<label for="inputid8" class="fl text2 mr5">점심</label>
										<input type="text" class="input s1 fl w40" id="inputid8"  name="company_count_lunch" value="${requestScope.licenseInfo.company_count_lunch}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text2 ml5 mr20">명</span>
										<label for="inputid9" class="fl text2 mr5">저녁</label>
										<input type="text" class="input s1 fl w40" id="inputid9"  name="company_count_dinner"  value="${requestScope.licenseInfo.company_count_dinner}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text2 ml5 mr20">명</span>
										<label for="inputid10" class="fl text2 mr5">야식</label>
										<input type="text" class="input s1 fl w40" id="inputid10"  name="company_count_midnig" value="${requestScope.licenseInfo.company_count_midnig}" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
										<span class="fl text2 ml5 mr20">명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<div class="ff_title2 i_b"><strong>공동여부</strong></div>
								<div class="ff_wrap ml120">
									<div class="area">
										<label for="inputid11" class="fl text2 mr5">공동관리</label>
										<input type="text" class="input s1 fl w40" id="inputid11"  name="join_con" value="${requestScope.licenseInfo.join_con}" />
										<span class="fl text2 ml5 mr20">개소</span>
										<label for="inputid12" class="fl text2 mr5">공동조리</label>
										<input type="text" class="input s1 fl w40" id="inputid12"  name="join_cook" value="${requestScope.licenseInfo.join_cook}" />
										<span class="fl text2 ml5 mr20">개소</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<div class="ff_title2 i_b"><strong>겸직여부</strong></div>
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
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div2">
								<label for="inputid13" class="ff_title2 i_b"><strong>영양사면허수당</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 w200" id="lic_pay" name="lic_pay" >
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
								<label for="inputid14" class="ff_title2 i_b"><strong>연봉</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 w200" id="year_pay"  name="year_pay">
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
					<h6 class="title s1 i_b_t3 mt20"><mark class="bold">기타정보</mark></h6>
					<div class="form mt10 line bt bcm">
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<div class="ff_title2 i_b"><strong>학력</strong></div>
								<div class="ff_wrap ml120">
									<ul>
										<li>
											<div class="area">
												<label for="code_scholar" class="fl w80 text2 bold cm">최종학력</label>
												<select class="select s2 fl w200" id="code_scholar"  name="code_scholar"></select>
											</div>
										</li>
										<li class="mt5">
											<div class="area">
												<label for="code_univer" class="fl w80 text2 bold cm">학위</label>
												<select class="select s2 fl w200" id="code_univer" name="code_univer"></select>
											</div>
										</li>
										<li class="mt5">
											<div class="area">
												<label for="code_school" class="fl w80 text2 bold cm">출신학교</label>
												<select class="select s2 fl w200" id="code_school" name="code_school" ></select>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
							<div class="ff_title2 i_b"><strong>자격증 종류</strong></div>
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
						
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<label for="inputid18" class="ff_title2 i_b"><strong>경력</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 fl w100" id="pers_career" name="pers_career">
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
										<span class="fl text2 ml5">년</span>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p5">
							<div class="f_field div1">
								<label for="inputid19" class="ff_title2 i_b"><strong>산하단체/분야회</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select s2 w200" id="code_sub" name="code_sub" title="산하단체/분야회 DB">
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

<div id="popup_company" class="p_style"
	style="width: 530px; height: 750px">
	<div id="popup">
		<div class="p_head" style="width: 500px;">
			<h2 class="title t3 cw bold s1 i_b_t6">근무처분류 상세보기</h2>
		</div>
		<div class="p_body text ca small center">
			<div class="p30">
			<img src="/images/common/popup_company.png" width="500" alt="" usemap="#imgmap" border="0">
			<div class="p_foot line bt">
				<div class="btn_wrap mt20">
					<ul>
						<li><a href="#" class="bClose">닫기</a></li>
					</ul>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
	
</form>