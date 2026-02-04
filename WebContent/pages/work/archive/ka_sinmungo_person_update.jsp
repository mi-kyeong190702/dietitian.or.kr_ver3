<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kda.SessionInfo" %>

<script>
function doMain(){
	//location.href="/index.do";
	location.href="work/archive/ka_sinmungo_list.do"
}

function openJusoPopup() 
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
	$("#cpost").val(zipNo);
	$("#company_add").val(roadAddrPart1);
	$("#company_add_detail").val(addrDetail + " " + roadAddrPart2);
}

$(document).ready(function() {	 
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
		, data		: "groupCode=001"		// 위탁업체
		, cache		: false
		, success	: handleLoadGroupCode001
	});
	
	$("#trust").hide();
});

function handleLoadGroupCode003(data)
{
	//근무처 분류
	//var code_part=$("#code_part").html(data).val;
	//if(code_part != '') {
	//		$("#code_part").val(code_part);
	//		//$("#code_part").val('${requestScope.info.code_part}').attr("selected", "selected");
	//}
	$("#code_part").html(data);
	$("#code_part").val('${requestScope.info.code_part}').attr("selected", "selected");
	onChangeCodePart();
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
	$("#code_great").html(data);
	$("#code_great").val('${requestScope.info.code_great}').attr("selected", "selected");
	
	onChangeCodeGreat();
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
	$("#code_small").html(data);
	$("#code_small").val('${requestScope.info.code_small}').attr("selected", "selected");
}

function handleLoadGroupCode001(data)
{
	//data = "<option value='0'>운영형태선택</option>" + data	;	
	//$("#code_user").html(data);
	//var code_user=$("#code_user").html(data).val();
	//if(code_user != '') {
	//		$("#code_user").val(code_use);
	//}
	$("#code_user").html(data);
	$("#code_user").val('${requestScope.info.code_user}').attr("selected", "selected");
}

function onChangeCodeUse()
{
	if ( $("#code_use").val() == 3 )
		$("#trust").show();
	else
		$("#trust").hide();	
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
	path   = "/getTrustCompanyinfo.do";

	var xx = screen.availWidth;
	var yy = screen.availHeight;
	var sxx = 0;
	var syy = 0;
	sxx = (xx/2) - 200;
	syy = (yy/2) - 90;

	shape = shape + ", top=" + syy + ", left=" + sxx;
	
	window.open(path, "deposit_val_check", shape);
}

$(document).on("submit",function(){
	
	if($("#pers_name").val()==""){
		alert("성명을 입력해주세요.");
		return false;
	}
	//if(!$(':input:radio[name=code_sex]:checked').val()) {
	//	alert("성별을 선택해주세요.");
	//	return false;
	//}
	
	if($("#lic_no").val()==""){
		alert("면허번호를 입력해주세요.");
		return false;
	}
	if($("#email").val()==""){
		alert("Email을 입력해주세요");
		return false;
	}
	if($("#email2").val()==""){
		alert("@ 뒤의 주소를 입력해주세요");
		return false;
	}
	if($("#pers_hp").val()==""){
		alert("휴대폰번호를 입력해주세요.");
		return false;
	}
	if($("#company_name").val()==""){
		alert("회사명을 입력해주세요.");
		return false;
	}
	if($("#code_part").val()=="0"){
		alert("근무처 분류를 선택해주세요.");
		return false;
	}
	if($("#code_user").val()=="0"){
		alert("운영 형태를 선택해주세요.");
		return false;
	}
	if($("#code_bran").val()=="0"){
		alert("소속 지부를 선택해주세요.");
		return false;
	}
	
	
})

</script>
<form name="join" id="join" action="ka_sinmungo_person_update_ok.do" method="post">
<input type="hidden" id="idx" name="idx" value="${requestScope.info.idx }">
<input type="hidden" id="pers_id" name="pers_id" value="${requestScope.info.pers_id}">
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양사</mark>신문고</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
					<li><a href="/work/archive/ka_sinmungo_check.do" class="cm">영양사신문고</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
		<!--  
			<div class="box t2 bgs mt20 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1"><mark class="cm">개인정보</mark> 수집 및 이용안내</h5>
					<div class="box t1 r5 mt10 p10">
						<div class="area h170 scroll text small" style="height: 300px;">
							<ul class="text mt10 ml10">
							<li><b>1. 개인정보의 수집 및 이용 목적</b></li>
							<li>영양사신문고는 회원에게 양질의 서비스 제공을 위하여 다음과 같이 개인정보를 수집 및 이용합니다. 수집된 개인정보는 정해진 목적 이외의 용도로는 이용되지 않으며 수집 목적이 변경될 경우 개인정보보호법 제 18조에 따라 사전에 알리고 별도의 동의를 받을 예정입니다.</li>
							<li>		
								<ol class="mt15 ml10">
									<li class="ml10">가. 민원 접수ㆍ처리ㆍ사후관리 서비스 제공
										<ul class="text" style="margin-left: 23px;">
											<li>민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락ㆍ통지, 처리결과 통보 등 업무 수행을 위한 목적으로 개인정보를 이용합니다.</li>
										</ul>
									</li>
									<li class="mt10 ml10">나. 영양사신문고 정책지원
										<ul class="text" style="margin-left: 23px;">
											<li>접수된 민원은 영양사신문고 서비스 향상 및 정책평가를 위하여 분석ㆍ평가 및 처리결과의 사후관리를 시행합니다.</li>
										</ul>
									</li>
								</ol>
							</li>
							</ul>
							<ul class="text mt10 ml10">
								<li><b>2. 수집하는 개인정보의 항목</b></li>
								<li>
									<ol class="ml15 mb20">
										<li class="mt10">가. 필수항목 : 성명, 영양사 면허번호, 비밀번호, 연락처(휴대폰), E-mail, 근무처명, 근무처분류(근무</li>
										<li style="margin-left: 23px;">처주소), 운영형태</li>
										<li class="mt10">나. 자동수집항목 : 인터넷 서비스 이용과정에서 자동으로 생성ㆍ수집되는 개인정보항목이 수집될 수</li>
										<li style="margin-left: 23px;">있습니다.</li>
									</ol>
								</li>
							</ul>
							<ul class="text mt10 ml10">
								<li><b>3. 개인정보 이용 및 보유 기간</b></li>
								<li>
									<ol class="ml15 mb20">
										<li class="mt10">가. 협회는 법령에 따른 개인정보 보유ㆍ이용 기간 또는 정보주체로부터 개인정보를 수집시에 동의 받</li>
										<li style="margin-left: 23px;">은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.</li>
										<li class="mt10">나. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
											<ul class="text ml10">
												<li style="margin-left: 16px;">- 보유 근거 : 정관, 홈페이지 이용 및 약관 및 정보 주체의 동의</li>
												<li style="margin-left: 16px;">- 보유 기간 : 영구</li>
											</ul>
										</li>
									</ol>
								</li>
							</ul>
							<ul class="text mt10 ml10">
								<li class="mt10"><b>4. 동의를 거부한 권리와 거부에 따른 불이익 내용</b></li>
								<li class="ml20">귀하는 개인정보 수집에 거부할 권리가 있으나 개인정보 수집 동의 거부 시에는 영양사신문고 서비스가 제한됩니다.</li>
							</ul>
						</div>
						<div class="line bt dot mt10 p8 pb0 text ssmall left">
							<input type="checkbox" class="mr5" id="accept2" name="accept2" value="1" />
							<label for="accept2" class="mr20">개인정보 수집 및 이용안내에 동의 합니다.</label>
						</div>
					</div>
				</div>
			</div>
			-->
			
			<div class="box t2 bgs mt50 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1">
						<mark class="cm">회원</mark> 정보 입력 
					</h5>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3">
							<mark class="bold">기본정보</mark>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>성명</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w80" id="pers_name" name="pers_name" value="${requestScope.info.pers_name }"/>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title">
										<strong>성별</strong>
									</div>
									<div class="ff_wrap ml120 text">
										<div class="area">
											<c:choose>
												<c:when test="${requestScope.info.code_sex==1 }">
													<label class="mr20">남자</label> 
												</c:when>
												<c:otherwise>
													<label class="mr20">여자</label> 
												</c:otherwise>
											</c:choose>
											<input type="hidden" id="code_sex" name="code_sex" value="${requestScope.info.code_sex }">
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>면허번호</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="lic_no" name="lic_no" onKeyPress="onlyNumber()" maxlength="6" value="${requestScope.info.lic_no}"/> 
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>이메일</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="email" name="email" value="${fn:split(requestScope.info.email,'@')[0]}" />
											<label for="email2"	class="fl text ml10 mr10">@</label> 
											<input type="text" class="input t1 fl w150" id="email2" name="email2" value="${fn:split(requestScope.info.email,'@')[1]}" />
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>전화번호</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<label for="inputid13" class="fl w80 text bold cm">휴대폰</label>
											<input type="text" class="input t1 fl w100" id="pers_hp" name="pers_hp" size="20" maxlength="12" value="${requestScope.info.pers_hp}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<h6 class="title s1 i_b_t3 mt20">
							<mark class="bold">근무처 정보</mark>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>근무처</strong>
									</div>
									<div class="ff_wrap ml120">
										<ul>
											<li>
												<div class="area">
													<input type="text" class="input t1 fl w100" id="company_name" name="company_name" value="${requestScope.info.company_name}"/>
													<!-- <input type="hidden" id="company_name" name="company_name" value="" /> -->
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="form mt10 bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>근무처분류</strong>
									</div>
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
											<select class="select t2 fl w200" id="code_small" name="code_small">
												<option value="">없음</option>
											</select>										
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>운영형태</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<select class="select t2 w200" id="code_user" name="code_user" onChange="javascript:onChangeCodeUse();">
												<option value="">운영형태선택</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title">
										<strong>소속지부</strong>
									</div>
									<div class="ff_wrap ml120">
										<div class="area">
											<select class="select t2 w200" id="code_bran" name="code_bran">
												<option value="">전체</option>
												<option value="서울" 		<c:if test="${ requestScope.info.code_bran == '서울' }">selected</c:if>>서울</option>
												<option value="부산" 		<c:if test="${ requestScope.info.code_bran == '부산' }">selected</c:if>>부산</option>
												<option value="인천" 		<c:if test="${ requestScope.info.code_bran == '인천' }">selected</c:if>>인천</option>
												<option value="경기" 		<c:if test="${ requestScope.info.code_bran == '경기' }">selected</c:if>>경기</option>
												<option value="충북" 		<c:if test="${ requestScope.info.code_bran == '충북' }">selected</c:if>>충북</option>
												<option value="대전충남세종" <c:if test="${ requestScope.info.code_bran == '대전충남세종' }">selected</c:if>>대전충남세종</option>
												<option value="전북" 		<c:if test="${ requestScope.info.code_bran == '전북' }">selected</c:if>>전북</option>
												<option value="광주전남" 	<c:if test="${ requestScope.info.code_bran == '광주전남' }">selected</c:if>>광주전남</option>
												<option value="대구경북" 	<c:if test="${ requestScope.info.code_bran == '대구경북' }">selected</c:if>>대구경북</option>
												<option value="경남" 		<c:if test="${ requestScope.info.code_bran == '경남' }">selected</c:if>>경남</option>
												<option value="울산" 		<c:if test="${ requestScope.info.code_bran == '울산' }">selected</c:if>>울산</option>
												<option value="제주" 		<c:if test="${ requestScope.info.code_bran == '제주' }">selected</c:if>>제주</option>
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
					<li><input type="submit" class="btn big t1" value="확인" style="height: 40px; width: 100px;"></li>
					<li><input type="button" class="btn big t2" value="취소" style="height: 40px; width: 100px;" onclick="doMain();"></li>
				</ul>
			</div>
		</div>
	</div>
</form>
