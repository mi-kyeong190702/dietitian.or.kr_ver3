
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.util.Date date = calendar.getTime();

String today	= new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>
<script>

$("document").ready(function(){
		$("#lic_no,#birth,#tel,#tel_hp").keyup(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});
   		$("#lic_no,#birth,#tel,#tel_hp").focusout(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});
		
   		/*2022.06.23*/
		$("#nice_agree_yn1").attr("disabled", "disabled");
		$("#nice_agree_yn2").attr("disabled", "disabled");
		$("#nice_no").attr("disabled", "disabled");
   		
});

function jusoCallBack( roadFullAddr
		 , roadAddrPart1
		 , addrDetail
		 , roadAddrPart2
		 , engAddr
		 , jibunAddr
		 , zipNo
		 , admCd
		 , rnMgtSn
		 , bdMgtSn
		) {
	
	document.frmJoin.zip.value 		= zipNo;//zipNo.substring(0,3) + zipNo.substring(4,7);
	document.frmJoin.addr.value = roadAddrPart1 + " " + addrDetail + " " + roadAddrPart2;
}           

function Change_Value(Price){
	$("#pay_amount").val(Price);
}

function f_CheckPay(chgJikmuYn) {
	$("#pay_amount").val("");
	<c:choose>
		<c:when test="${ meeting.member_flag == '0' }">
			$(".member").attr("disabled", "disabled");
			$(".nomem").removeAttr("disabled");
		</c:when>
		<c:otherwise>
			$(".nomem").attr("disabled", "disabled");
			$(".member").removeAttr("disabled");
		</c:otherwise>
	</c:choose>	
	
	//참가일자 및 온/오프라인 체크 시 로직
	//참가일자 선택 해제 시 온/오프라인 체크 해제
	if(chgJikmuYn == "N"){
		if (C_hasCheck("join_flag1", "Y")) {
			$("#onLineY1").removeAttr("disabled");
			$("#onLineN1").removeAttr("disabled");
		}else{
			$("#onLineY1").removeAttr("checked");
			$("#onLineN1").removeAttr("checked");
			
			$("#onLineY1").attr("disabled", "disabled");
			$("#onLineN1").attr("disabled", "disabled");			
		}
		
	}else if(chgJikmuYn == "NN"){
		if (C_hasCheck("join_flag2", "Y")) {
			$("#onLineY2").removeAttr("disabled");
			$("#onLineN2").removeAttr("disabled");
		}else{
			$("#onLineY2").removeAttr("checked");
			$("#onLineN2").removeAttr("checked");
			
			$("#onLineY2").attr("disabled", "disabled");
			$("#onLineN2").attr("disabled", "disabled");
		}
	}
	
	var checkCnt = 0;
	var checkOnlineYn = $('input[name="online_yn"]:checked').val();
	var checkOnlineYn2 = $('input[name="online_yn2"]:checked').val();
	
	if(  C_hasCheck("join_flag1", "Y") && checkOnlineYn != null ) {
		checkCnt ++;
	} 
	
	if(  C_hasCheck("join_flag2", "Y") && checkOnlineYn2 != null ) {
		checkCnt ++;
	}
	
	if( checkCnt == 2 ) {
		if(checkOnlineYn == "Y"){
			$(".day1Off").attr("disabled", "disabled");	
			$(".day1On").attr("disabled", "disabled");
		}else{
			$(".day1On").attr("disabled", "disabled");	
			$(".day1Off").attr("disabled", "disabled");
		}
	}	

	if( checkCnt == 1 ) {
		if(checkOnlineYn == "Y"){
			$(".day2Off").attr("disabled", "disabled");
			$(".day2On").attr("disabled", "disabled");
		}else{
			$(".day2On").attr("disabled", "disabled");
			$(".day2Off").attr("disabled", "disabled");
		}
	}
	
	if( checkCnt == 0 ) {
		$(".day1Off").attr("disabled", "disabled");
		$(".day2Off").attr("disabled", "disabled");
		$(".day1On").attr("disabled", "disabled");
		$(".day2On").attr("disabled", "disabled");
	}
	
	/* if( $("#big_name").val() == "영양교사" || $("#big_name").val() == "" ){
		if(chgJikmuYn == "N"){
			$("#onLineY1").removeAttr("checked");
			$("#onLineN1").removeAttr("checked");
			f_CheckPay("Y");
		}else if(chgJikmuYn == "NN"){
			$("#onLineY2").removeAttr("checked");
			$("#onLineN2").removeAttr("checked");
			f_CheckPay("Y");
		} else if(chgJikmuYn == "sel"){
			f_CheckPay("Y");
		} else if(chgJikmuYn == "Y"){
			$('#nice_agree_yn1').prop('checked', true);
			niceCheck('0');
			
			if(checkOnlineYn == "Y" && checkOnlineYn2 == "Y"){
				$("#nice_agree_yn1").attr("disabled", "disabled");
				$("#nice_agree_yn2").attr("disabled", "disabled");
				
			}else if(checkOnlineYn == "N" && checkOnlineYn2 == "Y"){
				$("#nice_agree_yn1").removeAttr("disabled");
				$("#nice_agree_yn2").removeAttr("disabled");
			}else if(checkOnlineYn == "Y" && checkOnlineYn2 == "N"){
				$("#nice_agree_yn1").removeAttr("disabled");
				$("#nice_agree_yn2").removeAttr("disabled");
			}else if(checkOnlineYn == "Y" || checkOnlineYn2 == "Y"){
				$("#nice_agree_yn1").attr("disabled", "disabled");
				$("#nice_agree_yn2").attr("disabled", "disabled");
			}else{
				$("#nice_agree_yn1").removeAttr("disabled");
				$("#nice_agree_yn2").removeAttr("disabled");
			}
		}
	} else if($("#big_name").val() != "영양교사" ){
		if(chgJikmuYn == "N"){
			$("#onLineY1").removeAttr("checked");
			$("#onLineN1").removeAttr("checked");
		}else if(chgJikmuYn == "NN"){
			$("#onLineY2").removeAttr("checked");
			$("#onLineN2").removeAttr("checked");
		}
		$("#nice_agree_yn1").attr("disabled", "disabled");
		$("#nice_agree_yn2").attr("disabled", "disabled");
	} */
		
	
	/* 2022.04 센터구분(어린이급식관리지원센터 선택) */
	if(chgJikmuYn == "sel" || chgJikmuYn == "sect"){
		var size = $("#sect_name option").size();
		for(var i=0; i<size; i++){
			$("#sect_name option:last").remove();
		}
		
		if ($("#branch_name").val() != "" && $("#big_name").val() == "어린이급식관리지원센터"){
			$("#sect_name").append("<option value=''>선택하세요</option>");
			
			switch($("#branch_name").val()){
			case '서울' :
				var data = ['중구', '성동구', '성북구', '강북구', '도봉구', '노원구', '은평구', '강서구', '구로구', '금천구', '서초구', '송파구', '강동구', '종로구', '동작구', '양천구', '동대문구', '중랑구', '서대문구', '마포구', '영등포구', '용산구', '강남구', '관악구', '광진구'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '부산' :
				var data = ['중동구', '서영도구', '부산진구', '동래구', '남구', '북구', '해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '대구' :
				var data = ['중구', '동구', '서구', '남구', '북구', '북구강북', '수성구', '달서구', '달성군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '인천' :
				var data = ['중구', '동구', '미추홀구', '연수구', '남동구', '부평구', '계양구', '서구', '서구검단', '강화군', '옹진'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '광주' :
				var data = ['동구', '서구', '남구', '북구', '광산'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '대전' :
				var data = ['동구', '중구', '서구', '유성구', '대덕구'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '울산' :
				var data = ['중구', '남구', '동구', '북구', '울주군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '세종' :
				var data = ['세종시'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '경기' :
				var data = ['수원시', '성남시', '의정부시', '안양시', '부천시', '평택시', '동두천시', '안산시', '고양시', '구리시', '과천시', '오산시', '시흥시', '군포시', '의왕시', '하남시', '용인시', '파주시', '이천시', '안성시', '김포시', '화성시', '광주시', '양주시', '포천시', '여주시', '가평군', '양평군', '연천군', '남양주시', '광명시'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '강원' :
				var data = ['춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시', '홍천군', '횡성군', '영월군', '평창군', '정선군', '철원군', '화천군', '양구군', '인제군', '고성군', '양양군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '충북' :
				var data = ['청주시상당서원', '청주시흥덕청원', '청주시소규모전담', '충주시', '제천시', '보은군', '옥천군', '영동군', '증평군', '진천군', '괴산군', '음성군', '단양군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '충남' :
				var data = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '전북' :
				var data = ['전주시덕진구', '전주시완산구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '고창군', '부안군', '순창군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '전남' :
				var data = ['전라남도', '목포시', '여수시', '순천시', '광양시', '담양군', '곡성군', '고흥군', '보성군', '화순군', '장흥군', '해남군', '영암군', '무안군', '영광군', '장성군', '완도군', '진도군', '신안군', '강진군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '경북' :
				var data = ['포항시1', '포항시2', '경주시', '김천시', '안동시', '구미시', '영주시', '영천시', '상주시', '문경시', '경산시', '군위군', '의성군', '청송군', '영양군', '영덕군', '청도군', '고령군', '성주군', '칠곡군', '예천군', '봉화군', '울진군', '울릉군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '경남' :
				var data = ['창원시1', '창원시2', '김해시', '통영시', '거제시', '양산시', '의령군', '함안군', '창녕군', '고성군', '남해군', '하동군', '함양군', '합천군', '밀양시', '산청군', '진주시', '사천시', '거창군'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			case '제주' :
				var data = ['제주시1', '제주시2', '제주시3', '제주시4'];
				for(var i=0; i<data.length; i++){
					$("#sect_name").append("<option value='" + data[i] + "'>" + data[i] + "</option>");
				}
				break;
			}
			
		}else{
			$("#sect_name").append("<option value=''>없음</option>");
		}
	}
	
}

function check_send() {
	if ($("#name").val() == "") {
		$("#name").focus();
		alert("성명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if ($("#lic_no").val() == ""){
		$("#lic_no").focus();
		alert("면허번호를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if ($("#birth").val() == ""){
		$("#birth").focus();
		alert("생년월일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	
     if ($("#office_name").val() == ""){
		$("#office_name").focus();
		alert("근무처명(학교명)을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if ($("#tel").val() == ""){
		$("#tel").focus();
		alert("전화번호를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	
	if ($("#tel_hp").val() == ""){
		$("#tel_hp").focus();
		alert("핸드폰번호를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
     
    if ($("#branch_name").val() == ""){
		alert("소속시·도영양사회를 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
     
    if ($("#big_name").val() == ""){
		alert("소속분과를 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
    
    if ($("#big_name").val() == "어린이급식관리지원센터" && $("#sect_name").val() == ""){
		alert("지원센터를 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if ($("#email").val() == ""){
		$("#email").focus();
		alert("이메일을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	var ckMail = $("#email").val();
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(regex.test(ckMail) === false) {  
		$("#email").focus();
	    alert("잘못된 이메일 형식입니다.");  
	    return;  
	}

	if ($("#addr").val() == ""){
		$("#addr").focus();
		alert("주소를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	} 
	
	if ( !$("input:checkbox[name='join_flag1']").is(":checked") 
			&&  !$("input:checkbox[name='join_flag2']").is(":checked") ) 	{
			$("#join_flag1").focus();
			alert("참가일자를 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
			return;
	}


	if ($("#pay_amount").val() == ""){
		alert("입금액을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

    if ($("#baccname").val() == ""){
		$("#baccname").focus();
		alert("입금자명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
    
    //2023.05 참가일 선택 시 온/오프라인 미선택인 경우 경고창
    var checkOnlineYn = $('input[name="online_yn"]:checked').val();
	var checkOnlineYn2 = $('input[name="online_yn2"]:checked').val();
	if(C_hasCheck("join_flag1", "Y") && checkOnlineYn == null){
		alert("온/오프라인을 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
		
	}else if(C_hasCheck("join_flag2", "Y") && checkOnlineYn2 == null){
		alert("온/오프라인을 선택하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
    
    //2023.05 주석처리
    /* if (!($('input:radio[name=nice_agree_yn]:checked').val() == "Y" 
     || $('input:radio[name=nice_agree_yn]:checked').val() == "N")){
    	
		$("#nice_agree_yn1").focus();
		alert("영양교사 대상 시간제 직무연수 신청 여부를\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
    
    if ($('input:radio[name=nice_agree_yn]:checked').val() == "Y"){
    	if ($("#nice_no").val() == ""){
    		$("#nice_no").focus();
    		alert("NEIS개인번호를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
    		return;
    	}
   	} */
   	
    document.frmJoin.submit();
}

function niceCheck(str)
{

	if(str=="1")	
	{ 
		niceArea.style.display = 'block';
	}		 	 
	else
	{ 
		niceArea.style.display = 'none';
	} 
}

/* function f_Caaaa(){
	alert("123456789");
}

$("input:radio[name=online_yn]").click(function(){
	 f_Caaaa();
}); */

</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">등</mark>록</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="./ke_menu.do">KDA 교육</a></li>
				<li><a href="./ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="./ke_receipt.do" class="cm">등록</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // Contents Start -->	
		<%@include file="inc/receipt.jsp" %>
		

<!-- limit 는 EducationMeetingController.java 에 선언 -->
<c:choose>
	<c:when test="${not empty limit }">
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<!-- -->
				<h5 class="title i_b_t6 bold s1"><mark class="cm">등록이 마감 되었습니다.</h5>
				<!-- 
				<h5 class="title i_b_t6 bold s1"><mark class="cm">5월 11일(월)부터 신청 가능합니다.</h5>
				 -->
	 		</div>
		</div>
	</c:when>
	<c:otherwise>
		<h4 class="title bold cm t2 s1 i_b_t2 mt20">학술대회 등록신청</h4><br />
		<form:form name="frmJoin" method="post" modelAttribute="meeting" action="ke_receipt_application_action.do">
			<form:hidden path="member_flag"/>
						<fieldset>
						<legend><span class="ti">참가신청서입력</span></legend>
							<div class="box t2 bgs mt50 p20 text">
								<div class="area">
									<h5 class="title i_b_t6 bold s1"><mark class="cm">참가</mark> 신청서</h5>
									<div class="box t1 r5 mt10 p10">
										<h6 class="title s1 i_b_t3"><mark class="bold">인적사항</mark></h6>
										<div class="form mt10 line bt bcm">
											<div class="f_wrap line bb p8">
												<div class="f_field div2">
													<label for="name" class="ff_title i_b"><strong>성명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="name"  class="input t1 w200" />
														</div>
													</div>
												</div>
												<div class="f_field div2">
													<div class="ff_title i_b"><strong>구분</strong></div>
													<div class="ff_wrap ml120 text">
														<div class="area">
															<c:if test="${meeting.member_flag == '0' }">비회원</c:if>
															<c:if test="${meeting.member_flag == '1' }">회원</c:if>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div2">
													<label for="lic_no" class="ff_title i_b"><strong>면허번호</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="lic_no" class="input t1 w200"/>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="pers_birth" class="ff_title i_b"><strong>생년월일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<c:if test="${meeting.member_flag == '0' }">
															<form:input path="birth"  class="input t1 fl w200"/>
															</c:if>
															<c:if test="${meeting.member_flag == '1' }">
															<form:hidden path="birth" />
															${meeting.birth}
															</c:if>
															<span class="fl text cp s1 ml10">생년월일을 19990101 형식으로 숫자만 입력해 주세요.</span>
														</div>
													</div>
												</div>
											</div>
											
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="office_name" class="ff_title i_b"><strong>근무처명(학교명)</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="office_name" class="input t1 w200"/>
														</div>
													</div>
												</div>
											</div>
											
											<div class="f_wrap line bb p8">
												<div class="f_field div2 mt5">
													<div class="area">
														<label for="tel" class="ff_title i_b fl"><strong>전화번호</strong></label>
														<div class="ff_wrap ml120">
															<form:input path="tel" class="input t1 w140"/>
															<span class="fr text ml5 mr10">"-"없이</span>
														</div>
													</div>
												</div>
												<div class="f_field div2 mt5">
													<div class="area">
														<label for="class" class="ff_title i_b fl"><strong>휴대폰</strong></label>
														<div class="ff_wrap ml120">
															<form:input path="tel_hp" class="input t1 w140"/>
															<span class="fr text mr10">"-"없이</span>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div2">
													<label for="branch_name" class="ff_title i_b"><strong>시도</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="branch_name" onchange="f_CheckPay('sect')" class="select t2 fl w200">
																<form:option value="">선택하세요</form:option>
																<form:option value="서울"  >서울</form:option> 
																<form:option value="부산"  >부산</form:option> 
																<form:option value="인천"  >인천</form:option> 
																<form:option value="경기"  >경기</form:option> 
																<form:option value="강원"  >강원</form:option> 
																<form:option value="충북"  >충북</form:option> 
																<form:option value="대전"  >대전</form:option> 
																<form:option value="충남"  >충남</form:option> 
																<form:option value="세종"  >세종</form:option> 
																<form:option value="전북"  >전북</form:option> 
																<form:option value="광주"  >광주</form:option> 
																<form:option value="전남"  >전남</form:option> 
																<form:option value="대구"  >대구</form:option> 
																<form:option value="경북"  >경북</form:option> 
																<form:option value="경남"  >경남</form:option> 
																<form:option value="울산"  >울산</form:option> 
																<form:option value="제주"  >제주</form:option>
															</form:select>
														</div>
													</div>
												</div>
												<div class="f_field div2">
													<label for="big_name" class="ff_title i_b"><strong>근무처분류</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="big_name" onchange="f_CheckPay('sel')" class="select t2 fl w200">
																<form:options items="${departs}"/>
															</form:select>
														</div>
													</div>
												</div>
												
												<div class="f_field div3">
													<label for="sect_name" class="ff_title i_b"><strong>센터선택</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:select path="sect_name" class="select t2 fl w200">
																<option value="">없음</option>
															</form:select>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												
												<div class="f_field div2">
													<label for="email" class="ff_title i_b"><strong>이메일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="email" class="input t1 w200" />
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid7" class="ff_title i_b"><strong>주소</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<form:input path="zip" class="input t1 fl w200" readonly="true" />
															<a href="javascript:C_Address();" class="btn form t1 fl ml5">주소검색</a>
														</div>
														<div class="area mt5">
															<label for="inputid8" class="ti">상세주소</label>
															<form:input path="addr" class="input t1"/>
														</div>
														
														<span class="fr text ml5 mr10"><mark class="bold"><u>※ 해당 주소로 학술대회 자료집이 발송되오니, 주소를 다시 한번 확인해 주시기 바랍니다.</u></mark></span>
													</div>
												</div>
											</div>
										</div>
										
<!-- 										<h6 class="title s1 i_b_t3 mt40"><mark class="bold">참여방법</mark></h6> -->
<!-- 										<div class="form mt10 line bt bcm"> -->
<!-- 											<div class="f_wrap line bb p8"> -->
<!-- 												<div class="f_field div1"> -->
<!-- 													<div class="ff_wrap ml5 text"> -->
<!-- 														<div class="area"> -->
<!-- <!-- 															<input type='radio' class="mr5" id="onLineN"  name='online_yn' value="N" onchange="f_CheckPay('Y')" /> -->
<!-- <!-- 															<label for="offLine" class="mr20">오프라인</label> --> 
<!-- <!-- 															<input type='radio' class="mr5" id="onLineY"  name='online_yn' value="Y" onchange="f_CheckPay('Y')" checked/> --> 
<!-- <!-- 															<label for="onLine" class="mr20">온라인</label> --> 
<%-- 															<% if( yyyyMMdd <= 20200818 ) { %>
<%-- 																<input type='radio' class="mr5" id="onLineN"  name='online_yn' value="N" onchange="f_CheckPay('Y')" readonly/> --%>
<%-- 																<label for="offLine" class="mr20">오프라인</label> --%>
<%-- 															<% } %> --%> 
<!-- 															<input type='radio' class="mr5" id="onLineY"  name='online_yn' value="Y" onchange="f_CheckPay('Y')" checked/> -->
<!-- 															<label for="onLine" class="mr20">온라인</label> -->
<!-- 															<input type='radio' class="mr5" id="onLineN"  name='online_yn' value="N" onchange="f_CheckPay('Y')" readonly/> -->
<!-- 																<label for="offLine" class="mr20">오프라인</label> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="area ssmall mt5" style="color:red;"> -->
<!-- 														&nbsp;&nbsp;※ 온라인 신청 시 학술대회 자료집이 작성하여주신 주소로 사전 발송됩니다. -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div>						 -->
										
										<h6 class="title s1 i_b_t3 mt40"><mark class="bold">참가일자</mark></h6>
										<div class="form mt10 line bt bcm">
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_wrap ml5 text">
														<div class="area">
															<form:checkbox path="join_flag1" value="Y" onchange="f_CheckPay('N')"/>
															<label for="join_flag11" class="mr190">2025년 7월 24일(목)</label>
													  &nbsp;<form:checkbox path="join_flag2" value="Y" onchange="f_CheckPay('NN')"/>
															<label for="join_flag21" class="mr20">2025년 7월 25일(금)</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div>
										<input type='radio' class="mr5" id="onLineY1"  name='online_yn' value="Y" onchange="f_CheckPay('Y')" disabled="disabled"/>
										<label for="onLine" class="mr20">온라인</label>
										<input type='radio' class="mr5" id="onLineN1"  name='online_yn' value="N" onchange="f_CheckPay('Y')" disabled="disabled"/>
										<label for="offLine" class="mr20">오프라인</label>
										&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
										<input type='radio' class="mr5" id="onLineY2"  name='online_yn2' value="Y" onchange="f_CheckPay('Y')" disabled="disabled"/>
										<label for="onLine" class="mr20">온라인</label>
										<input type='radio' class="mr5" id="onLineN2"  name='online_yn2' value="N" onchange="f_CheckPay('Y')" disabled="disabled"/>
										<label for="offLine" class="mr20">오프라인</label>
										</div>
										<br>
										
										<h6 class="title s1 i_b_t3 mt40"><mark class="bold">학술대회 자료집</mark></h6>
										<div class="form mt10 line bt bcm">
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_wrap ml5 text">
														<div class="area">
															<input type='radio' id="eBookY"  name='ebook_yn' value="Y" checked/>
															<label for="eBook" class="mr190">e-Book 자료집</label>
													  &nbsp;<input type='radio' id="eBookN"  name='ebook_yn' value="N"/>
															<label for="book" class="mr190">책자 자료집</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div><span class="ff_title i_b"><mark class="bold"><u>※ e-Book 자료집 선택 시 책자는 따로 발송되지 않습니다.</u></mark></span></div>
										
										<br>
										<div>
										<!-- <span class="fr text ml5 mr10">※ 7월 25일(월), 26일(화)에 온라인 사전등록 하실 경우 자료집 발송이 늦어질 수 있는 점 양해를 부탁드립니다.</span> -->
										</div>						
										<h6 class="title s1 i_b_t3 mt40"><mark class="bold">입금내역</mark></h6>
										<div class="form mt10 line bt bcm">
											<div class="f_wrap p8">
												<div class="f_field div1">
													<div class="area w630 ac ml20">
														<%-- <% if( 20200801 <= yyyyMMdd ) { %>
															<span class="bold  mb10 middle">2차 사전등록:8월1일~8월7일</span>
														<% } else {%>
															<span class="bold  mb10 middle">1차 사전등록:5월11일~7월31일</span>
														<% } %> --%>
														<table class="table t2 text small s1 ca center mt20 mb20">
															<colgroup>
																<col width="100" />
																<col width="100" />
																<col width="*" />
																<col width="120" />
																<col width="120" />
															</colgroup>
															<thead>
															<tr>
																<th colspan="5" scope="col" class="bold cm">참가비</th>
															</tr>
															<tr>
																<th colspan="3" scope="col" class="bold cm"></th>
																<th scope="col" class="bold cm">1일 등록(원)</th>
																<th scope="col" class="bold cm">2일 등록(원)</th>
															</tr>
															</thead>
															<tbody>
															<tr>
																<td rowspan="2" scope="row" class="bold bgf7">회원</td>
																<td colspan ="2">영양사/교수/대학원생</td>
																<% if( yyyyMMdd >= 20250718 ) { %>
																	<td class="left">
																		<input type='radio' onClick="Change_Value('80000');" class="mr5 day1Off member" id="onc1"  name='onc' disabled="disabled" />
																		<label for="onc1" class="mr20">80,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off member" onClick="Change_Value('130000');" name='onc' id="onc2" disabled="disabled" />
																		<label for="onc2" class="mr20">130,000원</label>
																	</td>
																<% } else if( yyyyMMdd >= 20250701 ) { %>
																	<td class="left">
																		<input type='radio' onClick="Change_Value('70000');" class="mr5 day1Off member" id="onc1"  name='onc' disabled="disabled" />
																		<label for="onc1" class="mr20">70,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off member" onClick="Change_Value('110000');" name='onc' id="onc2" disabled="disabled" />
																		<label for="onc2" class="mr20">110,000원</label>
																	</td>
																<% } else {%>
																	<td class="left">
																		<input type='radio' onClick="Change_Value('50000');" class="mr5 day1Off member" id="onc1"  name='onc' disabled="disabled" />
																		<label for="onc1" class="mr20">50,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off member" onClick="Change_Value('90000');" name='onc' id="onc2" disabled="disabled" />
																		<label for="onc2" class="mr20">90,000원</label>
																	</td>
																<% } %>
																
															</tr>
															<tr>
																<td colspan ="2">학생</td>
																<% if( yyyyMMdd >= 20250718 ) { %>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off  member"  onClick="Change_Value('30000');" name='onc' id="onc3"
																			disabled="disabled" />
																		<label for="onc3" class="mr20">30,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off  member" onClick="Change_Value('45000');"  name='onc' id="onc4" 
																			disabled="disabled" />
																		<label for="onc4" class="mr20">45,000원</label>
																	</td>
																<% } else if( yyyyMMdd >= 20250701 ) { %>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off  member"  onClick="Change_Value('25000');" name='onc' id="onc3"
																			disabled="disabled" />
																		<label for="onc3" class="mr20">25,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off  member" onClick="Change_Value('40000');"  name='onc' id="onc4" 
																			disabled="disabled" />
																		<label for="onc4" class="mr20">40,000원</label>
																	</td>
																<% } else {%>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off  member"  onClick="Change_Value('20000');" name='onc' id="onc3"
																			disabled="disabled" />
																		<label for="onc3" class="mr20">20,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off  member" onClick="Change_Value('35000');"  name='onc' id="onc4" 
																			disabled="disabled" />
																		<label for="onc4" class="mr20">35,000원</label>
																	</td>
																<% } %>
															</tr>
															<tr>
																<td rowspan="2" scope="row" class="bold bgf7">비회원</td>
																<% if( yyyyMMdd >= 20250718 ) { %>
																	<td colspan ="2">영양사/교수/대학원생</td>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('130000');"  name='onc' id="onc5" disabled="disabled" />
																		<label for="onc5" class="mr20">130,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('220000');" name='onc' id="onc6" disabled="disabled" />
																		<label for="onc6" class="mr20">220,000원</label>
																	</td>
																<% } else if( yyyyMMdd >= 20250701 ) { %>
																	<td colspan ="2">영양사/교수/대학원생</td>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('120000');"  name='onc' id="onc5" disabled="disabled" />
																		<label for="onc5" class="mr20">120,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('200000');" name='onc' id="onc6" disabled="disabled" />
																		<label for="onc6" class="mr20">200,000원</label>
																	</td>
																<% } else {%>
																	<td colspan ="2">영양사/교수/대학원생</td>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('100000');"  name='onc' id="onc5" disabled="disabled" />
																		<label for="onc5" class="mr20">100,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('180000');" name='onc' id="onc6" disabled="disabled" />
																		<label for="onc6" class="mr20">180,000원</label>
																	</td>
																<% } %>
															</tr>
															<tr>
																<td colspan ="2">학생</td>
																<% if( yyyyMMdd >= 20250718 ) { %>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('35000');" name="onc" id="onc7"
																			disabled="disabled" />
																		<label for="onc7" class="mr20">35,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('55000');"  name='onc' id="onc8"
																			disabled="disabled" />
																		<label for="onc8"  class="mr20">55,000원</label>
																	</td>
																<% } else if( yyyyMMdd >= 20250701 ) { %>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('30000');" name="onc" id="onc7"
																			disabled="disabled" />
																		<label for="onc7" class="mr20">30,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('50000');"  name='onc' id="onc8"
																			disabled="disabled" />
																		<label for="onc8"  class="mr20">50,000원</label>
																	</td>
																<% } else {%>
																	<td class="left">
																		<input type="radio" class="mr5 day1Off nomem"  onClick="Change_Value('30000');" name="onc" id="onc7"
																			disabled="disabled" />
																		<label for="onc7" class="mr20">30,000원</label>
																	</td>
																	<td class="left">
																		<input type="radio" class="mr5 day2Off nomem"  onClick="Change_Value('50000');"  name='onc' id="onc8"
																			disabled="disabled" />
																		<label for="onc8"  class="mr20">50,000원</label>
																	</td>
																<% } %>
															</tr>
<!-- 															<tr> -->
<!-- 																<td rowspan="4" scope="row" class="bold bgf7">온라인</td> -->
<!-- 																<td rowspan="2" scope="row" class="bold bgf7">회원</td> -->
<!-- 																<td>영양사/교수/대학원생</td> -->
<%-- 																<% if( 20200801 <= yyyyMMdd ) { %>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type='radio' onClick="Change_Value('60000');" class="mr5 day1On member" id="onc9"  name='onc' --%>
<%-- 																			disabled="disabled" /> --%>
<%-- 																		<label for="onc1" class="mr20">60,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day2On member" onClick="Change_Value('100000');" name='onc' id="onc10"  --%>
<%-- 																			disabled="disabled" /> --%>
<%-- 																		<label for="onc2" class="mr20">100,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																<% } else {%> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type='radio' onClick="Change_Value('50000');" class="mr5 day1On member" id="onc9"  name='onc' --%>
<%-- 																			disabled="disabled" /> --%>
<%-- 																		<label for="onc1" class="mr20">50,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day2On member" onClick="Change_Value('90000');" name='onc' id="onc10"  --%>
<%-- 																			disabled="disabled" /> --%>
<%-- 																		<label for="onc2" class="mr20">90,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																<% } %> --%>
<!-- 																<td class="left"> -->
<!-- 																	<input type='radio' onClick="Change_Value('50000');" class="mr5 day1On member" id="onc9"  name='onc' disabled="disabled" /> -->
<!-- 																	<label for="onc1" class="mr20">50,000원</label> -->
<!-- 																</td> -->
<!-- 																<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day2On member" onClick="Change_Value('90000');" name='onc' id="onc10" disabled="disabled" /> -->
<!-- 																	<label for="onc2" class="mr20">90,000원</label> -->
<!-- 																</td> -->
<!-- 															</tr> -->
<!-- 															<tr> -->
<!-- 																<td>학생</td> -->
<!-- 																<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day1On  member"  onClick="Change_Value('20000');" name='onc' id="onc11" -->
<!-- 																		disabled="disabled" /> -->
<!-- 																	<label for="onc3" class="mr20">20,000원</label> -->
<!-- 																</td> -->
<!-- 																<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day2On  member" onClick="Change_Value('35000');"  name='onc' id="onc12"  -->
<!-- 																		disabled="disabled" /> -->
<!-- 																	<label for="onc4" class="mr20">35,000원</label> -->
<!-- 																</td> -->
<!-- 															</tr> -->
<!-- 															<tr> -->
<!-- 																<td rowspan="2" scope="row" class="bold bgf7">비회원</td> -->
<%-- 																<% if( 20200801 <= yyyyMMdd ) { %>
<%-- 																	<td>영양사/교수/대학원생</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day1On nomem"  onClick="Change_Value('100000');"  name='onc' id="onc13"  --%>
<%-- 																			 disabled="disabled" /> --%>
<%-- 																		<label for="onc5" class="mr20">100,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day2On nomem"  onClick="Change_Value('180000');" name='onc' id="onc14" --%>
<%-- 																			 disabled="disabled" /> --%>
<%-- 																		<label for="onc6" class="mr20">180,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																<% } else {%> --%>
<%-- 																	<td>영양사/교수/대학원생</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day1On nomem"  onClick="Change_Value('90000');"  name='onc' id="onc13"  --%>
<%-- 																			 disabled="disabled" /> --%>
<%-- 																		<label for="onc5" class="mr20">90,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																	<td class="left"> --%>
<%-- 																		<input type="radio" class="mr5 day2On nomem"  onClick="Change_Value('170000');" name='onc' id="onc14" --%>
<%-- 																			 disabled="disabled" /> --%>
<%-- 																		<label for="onc6" class="mr20">170,000원</label> --%>
<%-- 																	</td> --%>
<%-- 																<% } %> --%>
<!-- 																<td>영양사/교수/대학원생</td> -->
<!-- 																	<td class="left"> -->
<!-- 																		<input type="radio" class="mr5 day1On nomem"  onClick="Change_Value('90000');"  name='onc' id="onc13" disabled="disabled" /> -->
<!-- 																		<label for="onc5" class="mr20">90,000원</label> -->
<!-- 																	</td> -->
<!-- 																	<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day2On nomem"  onClick="Change_Value('170000');" name='onc' id="onc14" disabled="disabled" /> -->
<!-- 																	<label for="onc6" class="mr20">170,000원</label> -->
<!-- 																</td> -->
<!-- 															</tr> -->
<!-- 															<tr> -->
<!-- 																<td>학생</td> -->
<!-- 																<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day1On nomem"  onClick="Change_Value('25000');" name="onc" id="onc15" -->
<!-- 																		disabled="disabled" /> -->
<!-- 																	<label for="onc7" class="mr20">25,000원</label> -->
<!-- 																</td> -->
<!-- 																<td class="left"> -->
<!-- 																	<input type="radio" class="mr5 day2On nomem"  onClick="Change_Value('45000');"  name='onc' id="onc16" -->
<!-- 																		disabled="disabled" /> -->
<!-- 																	<label for="onc8"  class="mr20">45,000원</label> -->
<!-- 																</td> -->
<!-- 															</tr> -->
															
															<tr>
																<td scope="row" class="bold bgf7" colspan="2">입금(예정일) 예) 20250512</td>
																<td class="left">
																	<div class="area">
																		<form:input path="pay_date" class="input t1 w200" />
																	</div>
																</td>
																<td class="bold bgf7">입금액</td>
																<td>
																	<div class="area">
																		<label for="inputid9" class="ti">입금액</label>
																		<form:input path="pay_amount"  class="input t1 fl w80 ml5" readonly="true" />
																		<span class="fl text mt5 ml10">원</span>
																	</div>
																</td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
												
												<div class="ff_title i_b"><font color = "red"><strong>[필독] 회원일 경우 로그인 후 신청해야 회원가 혜택을 받을 수 있습니다!</strong></font></div>
												
												
											</div>
										</div>
										
										<div class="form mt10 line bt bcm">

											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid12" class="ff_title i_b"><strong>입금자명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input type="text" name="baccname" id="baccname" maxlength="20" class="input t1 fl w200" />
														</div>
													</div>
												</div>
											</div>
											
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<div class="ff_title i_b"><strong>입금방법</strong></div>
													<div class="ff_wrap ml120 text">
														<div class="area">
															<form:radiobutton path="pay_flag" value="B" class="mr5" />
															<label for="pay_flag1" class="mr20">무통장입금</label>
															<%-- <form:radiobutton path="pay_flag" value="G" class="mr5" />
															<label for="pay_flag2" class="mr20">지로</label> --%>
															<c:if test="${meeting.member_flag == '1' }">
															<form:radiobutton path="pay_flag" value="C" class="mr5" />
															<label for="pay_flag3" class="mr20">영양사카드 결제(회원)</label>
															</c:if>

														</div>
													</div>
												</div>
											</div>
											
											<div class="f_wrap line bb p8">
												<div class="f_field div1 mb5">
													<div class="ff_title i_b"><strong>입금계좌</strong></div>
													<div class="ff_wrap ml120">
														<div class="area ssmall mt5">
															신한은행, 140-006-740632 (예금주:(사)대한영양사협회)
														</div>
													</div>
												</div>
											</div>
										</div>
								</div>
								
								<!-- 2023.05 주석처리 -->
                                <!-- <div class="box t1 r5 mt10 p10">
                                    <h6 class="title s1 i_b_t3 mt10"><mark class="bold cr" >영양교사 대상 시간제 직무연수 신청 여부  (해당 프로그램은 선착순 마감되었습니다)</mark></h6>	
                                    <div class="box bga bw0 p10 mt10">
                                        <div class="text small center">
                                            <div class="area">
                                                <input type="radio" class="mr5" name="nice_agree_yn" id="nice_agree_yn1" value="N" onClick="niceCheck('0')" checked/>
                                                <label for="nice_agree_yn1" class="mr20">해당없음</label>
                                                <input type="radio" class="mr5" name="nice_agree_yn" id="nice_agree_yn2" value="Y" onClick="niceCheck('1')"/>
                                                <label for="nice_agree_yn2" class="mr20">신청함</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text s1 small mt10 p5">
                                        <p class="ml10">전국영양사 학술대회 프로그램 중 일부가 한국교원단체총연합회 종합교육연수원의 시간제 직무연수로 인정 받음에 따라<br />본 학술대회 참석시 직무연수 1일 3시간, 2일 6시간이 인정됩니다.<br>영양교사만 해당되며, 직무연수 신청을 원하시는 분은 <mark class="bold cr" >NEIS개인번호</mark>를 등록 시 반드시 입력하셔야 합니다.<br />인적사항의 <mark class="bold cr" >근무처명(학교명)</mark>을 반드시 확인해주세요.<br />
                                        </p>
                                        <li class="text sm mt10"><mark class="bold" style="color: #006AB6;">* 시간제 직무연수 강좌는 사회적 거리두기 단계에 따라서 오프라인 또는 온라인 연수로 진행될 예정입니다.<br>아울러 방역지침에 의거하여 선착순 마감(나이스 번호 소지자)되며, 마감 후 등록하신 분들은 우선 대기자로 <br>접수하여 인원 변동 시 개별 연락드리겠습니다.</mark>
                            			</li>
                                    </div>
                                    <div id="niceArea">
	                                    <div class="form mt15 line bt bcm" >
	                                        <div class="f_wrap line bb p8">
	                                            <div class="f_field div2">
	                                                <label for="name" class="ff_title i_b"><strong>NEIS개인번호</strong></label>
	                                                <div class="ff_wrap ml120">
	                                                    <div class="area">
	                                                        <input id="nice_no" name="nice_no" class="input t1 w140" type="text" value=""/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>                                            
	                                    <div class="text s1 small mt10 p5">
	                                        <div class="text s1 small mt10 bold">※ 유의사항</div>
	                                        <div class="text s1 small ml10">시간제 직무연수를 신청하신 분은 정해진 Session 시간에 반드시 <mark class="bold cr">출석 및 퇴실 체크</mark>를 하셔야 하며,<br />이를 지키지 않을 시에는 사전 신청을 했어도 연수 평점이 인정되지 않으니 반드시 지켜주시기 바랍니다.</div>
	                                    </div>
	                                 </div>
								</div> -->
								
								<div class="box t1 r5 mt10 p10">
										<div class="text s1 small mt10 p5">
												<h6 class="middle bold cr i_b_t4">※ 임상영양사 국가자격 소지자만 응답해주시기 바랍니다.</h6>
												<span class="bold  mb10">임상영양사 전문연수교육(CPD) 평점 신청</span>
												<p class="ml10">한국영양교육평가원의 "임상영양 전문연수교육(CPD)규정"에 따라 본 학술대회에 참석 시 <mark class="bold">1일 6평점, 2일 10평점</mark>이 인정됩니다.</p>
												<p class="mt5  ml10">임상영양사 전문연수교육(CPD) 인정을 위해 개인정보보호법 제 15조에 따라 한국영양교육평가원에 명단을 제공하는 것에 대한 동의 여부를 체크해주시기 바랍니다.</p>
												<h6 class="bold mt10 i_b_t5">개인정보의 제 3자 제공 동의<mark class="cr">[필수]</mark></h6>
												<div class="area">
													<table class="table t2 text ssmall s1 ca center mt5">
														<colgroup>
															<col width="25%" />
															<col width="25%" />
															<col width="25%" />
															<col width="25%" />
														</colgroup>
														<thead>
														<tr>
															<th scope="col" class="bold cm">개인정보를<br />제공받는 자</th>
															<th scope="col" class="bold cm">제공하는 개인정보의<br />항목</th>
															<th scope="col" class="bold cm">개인정보를<br />제공받는 자의<br />개인정보 이용목적</th>
															<th scope="col" class="bold cm">개인정보를<br />제공받는 자의<br />개인정보 이용기간<br /> 및 보유기간</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td>한국영양교육평가원</td>
															<td>이름, 영양사면허번호</td>
															<td>본인 식별 절차, 임상영양사 자격번호 확인, 임상영양사 전문연수교육평점 등의 관리를 위한 관련 업무 절차를 위해 수집 이용</td>
															<td>관리기간동안</td>
														</tr>
														</tbody>
													</table>
												</div>
												<div class="text s1 small mt10">※ 귀하께서는 개인정보 제공 및 활용에 대하여 거부할 권리가 있으며, 동의 거부 시 한국영양 교육평가원에 <mark class="bold" style="text-decoration: underline">직접 증빙서류를 제출</mark>하여 임상영양사 전문연수교육(CPD) 평점 인정을 받으시기 바랍니다.</div>


												<div class="box bga bw0 p10 mt10">
													<div class="text small center">
														<div class="area">
															<input type="radio" class="mr5" name="agree_yn" id="radio1_18" value = "Y" />
															<label for="radio1_18" class="mr20">동의함</label>
															<input type="radio" class="mr5" name="agree_yn" id="radio1_19" value="N"/>
															<label for="radio1_19" class="mr20">동의하지 않음</label>
														</div>
													</div>
												</div>
												
												<div class="text s1 small mt10">본인은 본 "개인정보의 제 3자 제공 동의" 내용을 읽고 명확히 이해하였으며, 이에 동의합니다.</div>
											</div>
									</div>
								</div>
							</div>
							<div class="text s1 middle cm center mt10">■ 참가신청서를 작성하신 후 학술대회 등록안내의 입금방법을 참고하여 <mark class="bold">입금</mark>하여 주시기 바랍니다.</div>
							<div class="btn_wrap mt30">
								<ul>
									<li><a href="javascript:check_send();" class="btn t1 big">완료</a></li>
									<li><a href="javascript:document.frmJoin.reset();" class="btn t4 big">취소</a></li>				
								</ul>
							</div>
						</fieldset>
				</form:form>
				
	</c:otherwise>
</c:choose> 
				</div>
			</div>
	

	  
      

