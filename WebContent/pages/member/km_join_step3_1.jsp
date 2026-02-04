
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.MEMBER_JOIN"%>

<%
	MEMBER_JOIN member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);

	String code_member      = member_join.getCode_member();	    //회원구분코드
	//-------------Person_M_TBL
	String	pers_career 	= member_join.getPers_career();//경력 ..년
	String	code_scholar 	= member_join.getCode_scholar(); //최종학력
	String	code_univer 	= member_join.getCode_univer(); //학위
	String	code_school 	= member_join.getCode_school(); //출신학교
	String 	certifi_view	= member_join.getCertifi_view(); //자격증종류-영양교사
	String 	certifi_view2	= member_join.getCertifi_view2(); //자격증종류-운동처방사
	String 	certifi_view3	= member_join.getCertifi_view3(); //자격증종류-조리사
	String 	certifi_view4	= member_join.getCertifi_view4(); //자격증종류-기타
	String 	certifi_view5	= member_join.getCertifi_view5(); //자격증종류-임상영양사국가자격증
	
	String	code_use 	= member_join.getCode_use();//경력 ..년
	String	code_part 	= member_join.getCode_part();//경력 ..년
	String	code_great	= member_join.getCode_great();//경력 ..년
	String	code_small	= member_join.getCode_small();//경력 ..년
	
	//-------------pers_company
	int 	company_meal 			= member_join.getCompany_meal(); //1식 재료비
	int 	company_sick_bad 		= member_join.getCompany_sick_bad(); //허가병상
	int 	company_count_mom 		= member_join.getCompany_count_mom(); //아침
	int 	company_count_lunch		= member_join.getCompany_count_lunch(); //점심
	int 	company_count_dinner	= member_join.getCompany_count_dinner(); //저녁
	int 	company_count_midnig	= member_join.getCompany_count_midnig(); //야식
	int 	join_con 				= member_join.getJoin_con(); //공동관리
	int 	join_cook				= member_join.getJoin_cook(); //공동조리
	String 	pers_multy 				= member_join.getPers_multy(); //겸직/겸직안함
	int 	lic_pay 				= member_join.getLic_pay(); //영양사면허수당
	int 	year_pay	 			= member_join.getYear_pay(); //연봉	

%>

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
		
		$("#trust").hide();
		
	});
	
	function handleLoadGroupCode001(data)
	{
		data = "<option value='0'>운영형태선택</option>" + data	;	
		$("#code_use").html(data);
		
		var code_use = '<%=code_use%>';		
		if(code_use != '') {
 			$("#code_use").val(code_use);
		}
	}
	
	function handleLoadGroupCode003(data)
	{
		//근무처 분류
		$("#code_part").html(data);
		var code_part = '<%=code_part%>';		
		if(code_part != '') {
 			$("#code_part").val(code_part);
		}
	}
	
	function handleLoadGroupCode019(data)
	{
		data = "<option value='0'>학위선택</option>" + data;
		$("#code_univer").html(data);
		
		var code_univer = '<%=code_univer%>';		
		
		if(code_univer != '') {
 			$("#code_univer").val(code_univer);
		}
	}
	
	function handleLoadGroupCode027(data)
	{
		data = "<option value='0'>최종학력선택</option>" + data;
		$("#code_scholar").html(data);
		
		var code_scholar = '<%=code_scholar%>';		
		if(code_scholar != '') {
 			$("#code_scholar").val(code_scholar);
		}
	}
	
	function handleLoadGroupCode028(data)
	{
		data = "<option value='0'>출신학교선택</option>" + data;
		$("#code_school").html(data);
				
		var code_school = '<%=code_school%>';
		if(code_school != '') {
 			$("#code_school").val(code_school);
		}
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
	}
	
	function onChangeCodeUse()
	{
		if ( $("#code_use").val() == 3 )
			$("#trust").show();
		else
			$("#trust").hide();	
	}
	
	function check()
	{
		var f = document.join;

		try
		{	
			<% 
			//  07 학생회원 						-- 근무처 제외
			//	81 2015 신규취업회원 연회원 0 정회원 81 Y 
			//	82 2015 신규미취업회원 연회원 0 정회원 -- 근무처 제외
			//	88 2015 신규특별회원 연회원 0 특별회원 -- 근무처 제외 
			//	90 2015 신규평생정회원 평생회원 1 평생정회원 90 Y 
			//	92 2015 신규평생특별회원 평생회원 1 평생특별회원 -- 근무처 제외
			if (  !( code_member.equals("07") || code_member.equals("82") || code_member.equals("88") || code_member.equals("92") ) )  { %>	
			if(f.code_part.value == 0){
				alert("근무처 분류를 선택하세요.");
				f.code_part.focus();
				return false;
			}
			
			if(f.code_great.value =="N"){
				alert("근무처 대분류를 선택하세요.");
				f.code_great.focus();
				return false;
			}

			if(f.code_small.value =="0"){
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
			<% } %>
			
			if(f.code_sub.value == "F"){
				alert("산하단체를 선택하세요.");
				f.code_sub.focus();
				return false;
			}
	
			/*
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
			*/
			
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
			
		}
		catch(e)
		{
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
		
	function doPrev()
	{
		document.location.href = "/member/km_join_step3.do";
	}

	function doNext()
	{
		if ( check() )
		{
			var f = document.forms["join"];
			f.action = "/member_join_step4.do";
			f.method = "post";
			f.submit();		
		}
	}

</script>

<form name="join">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신규</mark>회원가입</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/member/km_join.do">회원가입</a></li>
				<li><a href="/member/km_join.do" class="cm">신규회원 가입</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<h4 class="title bold t2 cm s1 i_b_t2">회원가입 절차</h4><span class="ib mt10 ml10 text small ca">회원가입은 다음과 같은 순서에 따라 진행됩니다.</span>
		</div>
		<ol class="step_join mt20">
			<li class="start"><span class="icon step1"></span><span class="txt">실명확인</span></li>
			<li><span class="icon step2"></span><span class="txt">회원종류 선택</span></li>
			<li class="on"><span class="icon step3"></span><span class="txt"><strong>회원정보 입력</strong></span></li>
			<li><span class="icon step4"></span><span class="txt">입금 및 확인</span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">회원</mark>정보 입력</h5>
				<div class="box t1 r5 mt10 p10">
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
										<input type="text" class="input t1 fl w80" id="inputid5" name="company_meal" value="<%=company_meal%>"  style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
									</div>
								</div>
							</div>
							<div class="f_field div2">
								<label for="inputid6" class="ff_title i_b"><strong>허가병상</strong></label>
								<div class="ff_wrap ml120 text">
									<div class="area">
										<input type="text" class="input t1 fl w80" id="inputid6"  name="company_sick_bad" value="<%=company_sick_bad%>" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
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
										<input type="text" class="input t1 fl w40" id="inputid7"  name="company_count_mom"  value="<%=company_count_mom%>" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid8" class="fl text mr5">점심</label>
										<input type="text" class="input t1 fl w40" id="inputid8"  name="company_count_lunch" value="<%=company_count_lunch%>" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid9" class="fl text mr5">저녁</label>
										<input type="text" class="input t1 fl w40" id="inputid9"  name="company_count_dinner"  value="<%=company_count_dinner%>" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
										<span class="fl text ml5 mr20">명</span>
										<label for="inputid10" class="fl text mr5">야식</label>
										<input type="text" class="input t1 fl w40" id="inputid10"  name="company_count_midnig" value="<%=company_count_midnig%>" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
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
										<input type="text" class="input t1 fl w40" id="inputid11"  name="join_con" value="<%=join_con%>" />
										<span class="fl text ml5 mr20">개소</span>
										<label for="inputid12" class="fl text mr5">공동조리</label>
										<input type="text" class="input t1 fl w40" id="inputid12"  name="join_cook" value="<%=join_cook%>" />
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
										<input type="radio" class="mr5" id="pers_multy"  name="pers_multy" <%=pers_multy%> value="Y" />
										<label for="radio1_1" class="mr20">겸직</label>
										<input type="radio" class="mr5" id="pers_multy" name="pers_multy" <%=pers_multy%> value="N" checked />
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
											<option value="">선택</option>
											<option value="0" <% if( lic_pay <= 0){%> selected <%}%>>없음</option>
											<option value="7500" <% if( lic_pay > 0 && lic_pay <= 10000 ){%> selected <%}%>>5,000~10,000원</option>
											<option value="15000"  <% if( lic_pay > 10000 && lic_pay <= 20000 ){%> selected <%}%>%>10,000~20,000원</option>
											<option value="25000"  <% if( lic_pay > 20000 && lic_pay <= 30000 ){%> selected <%}%>%>20,000~30,000원</option>
											<option value="35000"  <% if( lic_pay > 30000 && lic_pay <= 40000 ){%> selected <%}%>%>30,000~40,000원</option>
											<option value="45000"  <% if( lic_pay > 40000 && lic_pay <= 50000 ){%> selected <%}%>%>40,000~50,000원</option>
											<option value="55000"  <% if( lic_pay > 50000 && lic_pay <= 60000 ){%> selected <%}%>%>50,000~60,000원</option>
											<option value="65000"  <% if( lic_pay > 60000 && lic_pay <= 70000 ){%> selected <%}%>%>60,000~70,000원</option>
											<option value="75000"  <% if( lic_pay > 70000  ){%> selected <%}%>%>70,000~80,000원</option>
										</select>
									</div>
								</div>
							</div>
							<div class="f_field div2">
								<label for="inputid14" class="ff_title i_b"><strong>연봉</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<select class="select t2 w200" id="year_pay"  name="year_pay" value="<%=year_pay%>">
											<option value="0">선택</option>
											<option value="950" <% if( year_pay > 0 && year_pay <= 1000 ){%> selected <%}%>>900~1,000만원</option>
											<option value="1250" <% if( year_pay > 1000 && year_pay <= 1500 ){%> selected <%}%>>1,000~1,500만원</option>
											<option value="1750" <% if( year_pay > 1500 && year_pay <= 2000 ){%> selected <%}%>>1,500~2,000만원</option>
											<option value="2250" <% if( year_pay > 2000 && year_pay <= 2500 ){%> selected <%}%>>2,000~2,500만원</option>
											<option value="2750" <% if( year_pay > 2500 && year_pay <= 3000 ){%> selected <%}%>>2,500~3,000만원</option>
											<option value="2750" <% if( year_pay > 3000 && year_pay <= 3500 ){%> selected <%}%>>3,000~3,500만원</option>
											<option value="3250" <% if( year_pay > 3500 && year_pay <= 4000 ){%> selected <%}%>>3,500~4,000만원</option>
											<option value="4250" <% if( year_pay > 4000 && year_pay <= 4500 ){%> selected <%}%>>4,000~4,500만원</option>
											<option value="4750" <% if( year_pay > 4500 && year_pay <= 5000 ){%> selected <%}%>>4,500~5,000만원</option>
											<option value="5250" <% if( year_pay > 5000 && year_pay <= 5500 ){%> selected <%}%>>5,000~5,500만원</option>
											<option value="5750" <% if( year_pay > 5500 && year_pay <= 6000 ){%> selected <%}%>>5,500~6,000만원</option>
											<option value="6500" <% if( year_pay > 6000 ){%> selected <%}%>>6,000~7,000만원</option>
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
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view" name="certifi_view" value="1" /><label for="certifi_view">영양교사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view2" name="certifi_view2" value="1" /><label for="certifi_view2">운동처방사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view3" name="certifi_view3" value="1" /><label for="certifi_view3">조리사</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view4" name="certifi_view4" value="1" /><label for="certifi_view4">기타</label></li>
										<li class="fl mr20 p3"><input type="checkbox" class="mr5" id="certifi_view5" name="certifi_view5" value="1" /><label for="certifi_view5">임상영양사국가자격증</label></li>
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
											<%
												for ( int i = 0; i <= 50; i++ ){
													if( i < 10 ){%>
													<option value="0<%=i%>00" <% if( (pers_career.length() > 0) && ("0" + Integer.toString(i)).equals(pers_career.substring(0, 2))){%> selected <%}%>>0<%=Integer.toString(i)%></option>	
												<%}else{%>
													<option value="<%=i%>00" <% if( (pers_career.length() > 0) && (Integer.toString(i).equals(pers_career.substring(0,2)))){%> selected <%}%> ><%=i%></option>	
												<%}
												}
											%>
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
											<option value="00">알수없음</option>
											<option value="01">전국학교영양사회</option>
											<option value="02">전국교정영양사회릉대</option>
											<option value="03">전국교정영양사회</option>
											<option value="04">전국당뇨병영양사회</option>
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
				<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
				<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
			</ul>
		</div>
	</div>
</div>
</form>