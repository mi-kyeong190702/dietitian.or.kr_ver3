<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="kda.SessionInfo"%>
<%@ page import="kda.member.data.MEMBER_JOIN"%>

<%
	MEMBER_JOIN member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);

	//-------------ID_TBL
	String id 				= member_join.getId();				//아이디
	String passwd			= member_join.getPers_add();		//패스워드
	String passwd2			= "";								//패스워드 재확인용-DB에 없는 컬럼임
	
	//-------------Person_M_TBL
	//String code_pers        	= member_join.getCode_pers();	    //회원코드 onChangeCode
	String code_member      	= member_join.getCode_member();	    //회원구분코드
	String pers_name        	= member_join.getPers_name();	    //이름
	String pers_birth       	= member_join.getPers_birth();	    //생년월일 
	String lic_no           	= member_join.getLic_no();	        //면허번호
	//String lic_pr//int_dt     = member_join.getLic_pr//int_dt();	//면허발급일자
	//String code_add_gubun   	= member_join.getCode_add_gubun();	//주소지 구분
	String code_post        	= member_join.getCode_post();	    //우편번호
	String pers_add         	= member_join.getPers_add();	    //주소
	String pers_add_detail  	= member_join.getPers_add_detail();	//상세주소
	String pers_tel         	= member_join.getPers_tel();	    //전화               
	String pers_hp          	= member_join.getPers_hp();	        //휴대전화           
	String email            	= member_join.getEmail();	        //이메일
	String email2            	= member_join.getEmail2();		   	//이메일 뒷자리용-DB에 없는 컬럼임             
	//String code_email_comp  	= member_join.getCode_email_comp();	//메일업체   
	String code_sex         	= member_join.getCode_sex();	    //성별             
	//String code_religion   	= member_join.getCode_religion();	//종교       
	//String code_marry       	= member_join.getCode_marry();	    //결혼여부           
	//String code_bran        	= member_join.getCode_bran();	    //지부               
	String code_big         	= member_join.getCode_big();	    //소속분과           
	String code_sect        	= member_join.getCode_sect();	    //소속분회           
	//String code_scholar     	= member_join.getCode_scholar();	//최종 학력  
	//String code_univer      	= member_join.getCode_univer();   	//학위               
	//String code_school      	= member_join.getCode_school();		//학교               
	String code_call        	= member_join.getCode_call();	    //발송호칭           
	String code_place       	= member_join.getCode_place();		//수신처             
	//String pers_career      	= member_join.getPers_career(); 	//경력       
	//String certifi_view     	= member_join.getCertifi_view();	//자격현황   
	//String code_sub         	= member_join.getCode_sub();	    //산하단체.분여회 소속 
	//String regi_date        	= member_join.getRegi_date();	    //등록일자           
	//String up_date          	= member_join.getUp_date();	    	//수정일자           
	String kda_level        	= member_join.getKda_level();	    //협회직급           
	String recommender     	 	= member_join.getRecommender();	    //추천인             
	String recm_division    	= member_join.getRecm_division();	//추천인근무처
	String recm_hp         		= member_join.getRecm_hp();	        //추천인핸드폰번호    
	//String pers_state			= member_join.getPers_state();		//상태               
	//String register			= member_join.getRegister();	    //등록자             
	//String agree_dt			= member_join.getAgree_dt();	    //개인정보수집동의일   
	//String ipinno           	= member_join.getIpinno();	    	//I pin 번호
	
	//-------------pers_company
	//int    comp_seq				= member_join.getComp_seq();			//근무처 순번	
	String company_name		   	 	= member_join.getCompany_name();		//근무처명	
  	String company_code_post		= member_join.getCompany_code_post();	//우편번호
	String company_add		    	= member_join.getCompany_add();			//근무처 주소	
	String company_add_detail		= member_join.getCompany_add_detail();	//근무처 상세주소
	String company_tel		    	= member_join.getCompany_tel();			//전화번호	
	//String company_fax			= member_join.getCompany_fax();			//팩스번호	
	//String code_part		    	= member_join.getCode_part();			//근무처구분	
	//String code_great		    	= member_join.getCode_great();			//근무처 대분류	
	//String code_small		    	= member_join.getCode_small();			//근무처 소분류	
	//String pers_in_dt		    	= member_join.getPers_in_dt();			//입사일		
	//String pers_out_dt			= member_join.getPers_out_dt();			//퇴사 일자	
	//String code_use				= member_join.getCode_use();			//운영형태	
	String job_dept			    	= member_join.getJob_dept();			//부서		
	String job_level_code			= member_join.getJob_level_code();		//직급		
	String job_line_code			= member_join.getJob_line_code();		//직렬	

	
	//int    lic_pay				= member_join.getLic_pay();				//영양사 면허수당	
	//int    year_pay				= member_join.getYear_pay();			//연봉(만원)	
	//int    company_sick_bad		= member_join.getCompany_sick_bad();	//허가병상	
	//int    company_meal			= member_join.getCompany_meal();		//1식재료비	
	//int    join_con				= member_join.getJoin_con();			//공동관리	
	//int    join_cook		    	= member_join.getJoin_cook();			//공동조리	
	//String primary_flag			= member_join.getPrimary_flag();		//우선 근무처	
	//String pers_multy		    	= member_join.getPers_multy();			//겸직여부	
	//int    company_count_mom		= member_join.getCompany_count_mom();	//급식인원_아침	
	//int    company_count_lunch	= member_join.getCompany_count_lunch();	//급식인원_점심	
	//int    company_count_dinner	= member_join.getCompany_count_dinner();//급식인원_저녁	
	//int    company_count_midnig	= member_join.getCompany_count_midnig();//급식인원_야식	
	//String trust_code		    	= member_join.getTrust_code();			//위탁업체코드	
	//String trust_name		   		= member_join.getTrust_name();			//위탁업체명	
	//String trust_addr		    	= member_join.getTrust_addr();			//위탁업체주소	
	//String trust_tel		    	= member_join.getTrust_tel();			//위탁업체 전화	
	//String secu_no			    = member_join.getSecu_no();				//산재번호
	
 	String ssn2						= "";	//request("ssn2");
	String ssn						= "";	//ssn1 & ssn2;	
	String authcheck 				= "";	//Trim(request("authcheck"));

	String url =""; //다음 화면
	String lic_ck_val =""; //면허중복확인
	

	//	81 2015 신규취업회원 연회원 
	//	82 2015 신규미취업회원 연회원 
	//	88 2015 신규특별회원 연회원 
	//	90 2015 신규평생정회원 평생회원 
	//	92 2015 신규평생특별회원 평생회원 

		
	if(code_member.equals("07")) {	//mem_l_name = "학생회원";		
		url = "km_join_step4.do";
		lic_ck_val = "Y";		
	} else if	(code_member.equals("81")) {	//mem_l_name = "신규취업회원";		
		url = "km_join_step3_1.do";
		lic_ck_val = "N";		
	} else if	(code_member.equals("82")) {	//mem_l_name = "신규미취업";
		url = "km_join_step3_1.do";
		lic_ck_val = "N";		
	} else if	(code_member.equals("88")) {	//mem_l_name = "신규특별회원";
		url = "km_join_step4.do";
		lic_ck_val = "Y";		
	} else if	(code_member.equals("90")) {	//mem_l_name = "신규평생정회원";
		url = "km_join_step3_1.do";
		lic_ck_val = "N";		
	} else if	(code_member.equals("92")) {	//mem_l_name = "신규평생특별회원";
		url = "km_join_step4.do";
		lic_ck_val = "Y";
	}
	
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
		data = "<option value='0'>직렬선택</option>" + data;
		$("#job_line_code").html(data);
		
		var job_line_code = '<%=job_line_code%>';		
		if(job_line_code != '') {
 			$("#job_line_code").val(job_line_code);
		}
	}
	
	function handleLoadGroupCode070(data)
	{
		data = "<option value='0'>직급선택</option>" + data
		$("#job_level_code").html(data);
		
		var job_level_code = '<%=job_level_code%>';		
		if(job_level_code != '') {
 			$("#job_level_code").val(job_level_code);
		}
	}

	function handleLoadGroupCode030(data)
	{
		data = "<option value='0'>수신처</option>" + data
		$("#code_place").html(data);
		
		var code_place = '<%=code_place%>';		
		if(code_place != '') {
 			$("#code_place").val(code_place);
		}
	}

	function handleLoadGroupCode018(data)
	{
		data = "<option value='0'>호칭</option>" + data
		$("#code_call").html(data);
		
		var code_call = '<%=code_call%>';		
		if(code_call != '') {
 			$("#code_call").val(code_call);
		}
	}
	
	function doShowLicensePopup()
	{  	
		interval = setInterval(setFocusLicense,1);
		$("#use_button_license").hide();
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
		document.join.company_code_post.value 			= zipNo;//zipNo.substring(0,3) + zipNo.substring(4,7);
	}

	function check()
	{
		try
		{
			<% 
			// 학생회원, 특별회원 면허번호 제외
			//  07 학생회원 						-- 면허번호 제외
			//	81 2015 신규취업회원 연회원 0 정회원 81 Y 
			//	82 2015 신규미취업회원 연회원 0 정회원 -- 면허번호 제외
			//	88 2015 신규특별회원 연회원 0 특별회원 -- 면허번호 제외 
			//	90 2015 신규평생정회원 평생회원 1 평생정회원 90 Y 
			//	92 2015 신규평생특별회원 평생회원 1 평생특별회원 -- 면허번호제외
							
			if (  !( code_member.equals("07") ||  code_member.equals("88") || code_member.equals("92") ) )  { %>	
			if(document.join.lic_no.value.length < 1){
				alert("면허번호를 정확히 입력하세요.");
				document.join.lic_no.focus();
				return false;
			}
			<% } %>
			
			if(document.join.id.value.length < 4){
				alert("아이디는 영문,숫자 혹은 조합으로 4~12자 이내 이어야 합니다.");
				document.join.id.focus();
				return false;
			}
			
			var comp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			var string=document.join.id.value;
			var len=string.length;
			for( var i = 0 ; i < len ; i++ ) {
				if(comp.indexOf(string.substring(i,i+1))<0) 
				{
					alert("아이디는 영문,숫자 혹은 조합으로 4~12자 이내 이어야 합니다.");
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
	
	function doPrev()
	{
		document.location.href = "/member/km_join_step2.do";
	}

	function doNext()
	{
		if ( check() ) {			
			var f = document.forms["join"];
			f.method = "post";
			f.action = "/member_join_step3_1.do";
			f.submit();				
		}
	}
	
	function checkemailaddy(){
        if (join.email_select.value == '1') {
        	$("#email2").attr("readonly", false);
        	join.email2.value = '';
        	join.email2.focus();
        }
        else {
        	$("#email2").attr("readonly", true);
            join.email2.value = join.email_select.value;
        }
    }

</script>

<form name="join">
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1">
					<mark class="cm">신규</mark>
					회원가입
				</h3>
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
				<h4 class="title bold t2 cm s1 i_b_t2">회원가입 절차</h4>
				<span class="ib mt10 ml10 text small ca">회원가입은 다음과 같은 순서에 따라
					진행됩니다.</span>
			</div>
			<ol class="step_join mt20">
				<li class="start"><span class="icon step1"></span><span
					class="txt">실명확인</span></li>
				<li><span class="icon step2"></span><span class="txt">회원종류
						선택</span></li>
				<li class="on"><span class="icon step3"></span><span
					class="txt"><strong>회원정보 입력</strong></span></li>
				<li><span class="icon step4"></span><span class="txt">입금
						및 확인</span></li>
				<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
			</ol>
			
			<p class="text middle cb s1 mt10">
				※ 회원정보 입력이 원활하게 되지 않을 경우 <font color="blue">신규회원등록 신청서</font>를<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다운로드 후 작성하시어 담당자에게 문의주시면 처리해드리겠습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 신규회원등록 신청서.docx" class="btn t2" target="_blank" title="새창으로 보기">신규회원등록 신청서(docx.)<span class="icon quick"></span></a>
				<a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 신규회원등록 신청서.hwp" class="btn t2" target="_blank" title="새창으로 보기">신규회원등록 신청서(hwp.)<span class="icon quick"></span></a>
				<br>
			</p>
			
			<div class="box t2 bgs mt50 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1">
						<mark class="cm">회원</mark>
						정보 입력
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
												name="pers_name" value="<%=pers_name%>" readonly />
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
												name="pers_birth" value="<%=pers_birth%>" readonly />
											<p class="fl text cp s1 ml10">예) 20150210</p>
										</div>
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b">
										<strong>성별</strong>
									</div>
									<div class="ff_wrap ml120 text">
										<div class="area">
											<input type="radio" class="mr5" id="code_sex" name="code_sex" value="<%=code_sex%>"
												<% if( code_sex.equals("1")){%> checked <%}%> /> <label
												for="radio1_1" class="mr20">남자</label> 
											<input type="radio" class="mr5" id="code_sex" name="code_sex" value="<%=code_sex%>"
												<% if( code_sex.equals("0") || code_sex.equals("")) {%>
												checked <%}%> /> <label for="radio1_2" class="mr20">여자</label>
										</div>
									</div>
								</div>
							</div>
							<% if(  code_member.equals("07") //학생회원
								|| code_member.equals("08") //
								|| code_member.equals("12") //
								){%>
							<input type="hidden" name="lic_no" value="0">
							<%}else{%>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid3" class="ff_title i_b"><strong>면허번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="lic_no"
												name="lic_no" value="<%=lic_no%>" onClick="doShowLicensePopup();"
												maxlength="6" readonly /> <a
												href="javascript:doShowLicensePopup();"
												class="btn form p5 t1 fl ml5">면허번호 중복확인</a> <a
												href="http://lic.mohw.go.kr/login/login.do?THROW_URL=/mypage/lcnsInfo.do&MENU_ID=M-01-01"
												target="_blank" class="btn form p5 t4 fl ml5">보건복지부 온라인
												면허조회 바로가기</a>
										</div>
										<div class="area mt5 text ca s1">
											<mark class="cb bold">면허번호</mark>
											: 보건복지부 면허민원 안내를 통해 면허번호를 정확하게 확인하신 후 가입하여 주시기 바랍니다.<br />
											학생이나 영양사가 아니신 분은 면허번호를 공란으로 두십시오.
										</div>
									</div>
								</div>
							</div>
							<%}%>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid4" class="ff_title i_b"><strong>이용자ID</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w100" id="id" name="id"
												size="12" value="<%=id%>" onClick="doShowIdPopup();" readonly /> <a
												href="javascript:doShowIdPopup();"
												class="btn form p5 t1 fl ml5">중복확인</a>
											<p class="fl text cp s1 ml10">(첫자는 영문, 그외 문자는 영문,숫자 혹은 그
												조합으로 4~12자 이내)</p>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid5" class="ff_title i_b"><strong>비밀번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="password" class="input t1 fl w200" id="passwd"
												name="passwd" size="20" maxlength="12" value="<%=passwd%>" />
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
											<input type="password" class="input t1 fl w200" id="passwd2"
												name="passwd2" size="20" maxlength="12" value="<%=passwd2%>" />
										</div>
									</div>
								</div>
								
							</div>
		
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid7" class="ff_title i_b"><strong>이메일</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" class="input t1 fl w200" id="email"
												name="email" value="<%=email%>" /> <label for="email2"
											class="fl text ml10 mr10">@</label> <input type="text"
											class="input t1 fl w150" id="email2" name="email2"
											value="<%=email2%>" readonly="true" />
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
													<input type="text" class="input t1 fl w100"
														style="width: 200px" id="pers_tel" name="pers_tel"
														size="20" value="<%=pers_tel%>"  maxlength="11" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
                      <p class="fl text cp ml10">(&quot;-&quot;없이 입력 / 지역번호를 꼭 입력하십시오.)</>
												</div>
											</li>
											<li class="mt5">
												<div class="area">
													<label for="pers_hp" class="fl w80 text bold cm">휴대폰</label>
													<input type="text" class="input t1 fl w100"
														style="width: 200px" id="pers_hp" name="pers_hp"
														size="20" value="<%=pers_hp%>" maxlength="11"
														style="ime-mode:disabled;"  onKeyPress="return digit_check(event);"/>
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
											<input type="text" class="input t1 fl w200" id="code_post"
												name="code_post" value="<%=code_post%>"
												onFocus="document.join.pers_add.focus();" onClick="javascript:openJusoPopup();" readonly /> <a
												href="javascript:openJusoPopup();"
												class="btn form t1 fl ml5">주소검색</a>
											<p class="fl text cp ml10">주소검색(우편번호) : - 없이 한 칸으로
												만들어주세요.</p>
										</div>
										<div class="area mt5">
											<label for="inputid17" class="ti">상세주소</label> 
											<input type="text" class="input t1" id="pers_add" name="pers_add"
												value="<%=pers_add%>"   readonly /> <br> 
											<input type="text"
												class="input t1" id="pers_add_detail" name="pers_add_detail"
												value="<%=pers_add_detail%>"  readonly  />
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
													<input type="text" class="input t1 fl w100" id="company_name" name="company_name" value="<%=company_name%>" />
												</div>
											</li>
											<li class="mt5">
												<div class="area">
													<label for="job_dept" class="fl w80 text bold cm">부서 및 직급</label> 
													<input type="text" class="input t1 fl w200" id="inputid19" name="job_dept" value="<%=job_dept%>" /> 
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
															<input type="text" class="input t1 fl w200" id="company_code_post" name="company_code_post" value="<%=company_code_post%>" onClick="javascript:openJusoPopup();" readonly /> 
															<a href="javascript:openJusoPopup2();" class="btn form t1 fl ml5">주소검색</a>
														</div>
														<div class="area mt5">
															<label for="company_add" class="ti">상세주소</label> 
															<input type="text" class="input t1" id="company_add" name="company_add" value="<%=company_add%>" readonly/> 
															<br> <input type="text"	class="input t1" id="company_add_detail" name="company_add_detail"  value="<%=company_add_detail%>" readonly />
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
														value="<%=company_tel%>" maxlength="11" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="code_place" class="ff_title"><strong>우편물
											수신처</strong></label>
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
						<h6 class="title s1 i_b_t3 mt40">
							<mark class="bold">추천인 정보</mark>
							<span class="ssmall">( 회원가입을 권유해 주신 분 정보를 입력해 주세요. )</span>
						</h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div3">
									<label for="code_call" class="ff_title"><strong>추천인 성명</strong></label>
									<div class="ff_wrap ml100">
										<div class="area">
											<input type="text" class="input t1 fl w100" id="recommender" name="recommender" value="<%=recommender%>" />
										</div>
									</div>
								</div>
								<div class="f_field div3">
									<label for="recm_division" class="ff_title"><strong>근무처명</strong></label>
									<div class="ff_wrap ml100">
										<div class="area">
											<input type="text" class="input t1 fl w100"
												id="recm_division" name="recm_division"
												value="<%=recm_division%>" />
										</div>
									</div>
								</div>
								<div class="f_field div3">
									<label for="recm_division" class="ff_title"><strong>휴대폰</strong></label>
									<div class="ff_wrap ml100">
										<div class="area">
											<input type="text" class="input t1 fl w100"
												id="recm_division" name="recm_hp" value="<%=recm_hp%>" maxlength="11" style="ime-mode:disabled;"  onKeyPress="return digit_check(event);" />
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
					<!-- li><a href="/member/km_join_step2.do" class="btn big t2">이전</a></li>
				<li><a href="/member/km_join_step3_1.do" class="btn big t1">다음</a></li-->
					<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
					<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
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
				<h2 class="title t3 cw bold s1 i_b_t6">아이디 중복확인</h2>
			</div>
			<div class="p_body text ca small center">
				<div class="p30">
					<div class="area">아이디를 입력해주세요.</div>
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
</form>