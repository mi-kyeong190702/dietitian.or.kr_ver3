<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ page import="kda.SessionInfo, kda.member.data.MEMBER_PAY, kda.login.data.LOGININFO, kda.utils.KdaStringUtil"%>

<%

	MEMBER_PAY mPay = (MEMBER_PAY)request.getAttribute("mPay");


	String pers_name 	= mPay.getPers_name();
	String pers_birth	= mPay.getPers_birth();
	String user_id		= mPay.getUser_id();
	String pers_tel		= mPay.getPers_tel();
	String pers_hp		= mPay.getPers_hp(); 
	String email		= mPay.getEmail();
	String code_member 	= mPay.getCode_member();
	String code_bran 	= mPay.getCode_bran();	
	String method 		= mPay.getMethod();
	String good_name 	= mPay.getGood_name();

	
	if( code_bran.equals("") ||  code_bran == null)
	    code_bran = "02";
	else
	    code_bran = DeSetBran(code_bran);
%>
<%!
	public String  SetBran(String Strbran){
	
	System.out.println(" Strbran() :"+ Strbran);
	
	Strbran = Strbran.trim();
	String code_bran_S = "";
	
    if( Strbran.equals("0") || Strbran.equals("00") ) 			code_bran_S = "0";
   		else if( Strbran.equals("1") || Strbran.equals("01"))	code_bran_S = "0";
        else if( Strbran.equals("2") || Strbran.equals("02"))   code_bran_S = "10";
        else if( Strbran.equals("3") || Strbran.equals("03"))   code_bran_S = "20";
        else if( Strbran.equals("4") || Strbran.equals("04"))   code_bran_S = "30";
        else if( Strbran.equals("5") || Strbran.equals("05"))   code_bran_S = "40";
        else if( Strbran.equals("6") || Strbran.equals("06"))   code_bran_S = "50";
        else if( Strbran.equals("7") || Strbran.equals("07"))   code_bran_S = "60";
        else if( Strbran.equals("8") || Strbran.equals("08"))   code_bran_S = "70";
        else if( Strbran.equals("9") || Strbran.equals("09"))   code_bran_S = "80";
        else if( Strbran.equals("10"))						    code_bran_S = "90";
        else if( Strbran.equals("11"))					        code_bran_S = "100";
        else if( Strbran.equals("12"))					        code_bran_S = "110";
        else if( Strbran.equals("13"))					        code_bran_S = "120";
        else if( Strbran.equals("14"))				            code_bran_S = "130";
        else													code_bran_S =  Strbran;
    
    System.out.println(" code_bran_S :"+ code_bran_S);
    return code_bran_S;
}

public String DeSetBran(String Strbran2) {
	Strbran2 = Strbran2.trim();
	String code_bran_S2 = "";
	
   if( Strbran2.equals("10"))       		code_bran_S2 = "02";
   		else if( Strbran2.equals("20"))  	code_bran_S2 = "03";
   	 	else if( Strbran2.equals("30")) 	code_bran_S2 = "04";
        else if( Strbran2.equals("40"))		code_bran_S2 = "05";
        else if( Strbran2.equals("50"))  	code_bran_S2 = "06";
        else if( Strbran2.equals("60"))  	code_bran_S2 = "07";
        else if( Strbran2.equals("70"))		code_bran_S2 = "08";
        else if( Strbran2.equals("80"))  	code_bran_S2 = "09";
        else if( Strbran2.equals("90"))  	code_bran_S2 = "10";
        else if( Strbran2.equals("100")) 	code_bran_S2 = "11";
        else if( Strbran2.equals("110")) 	code_bran_S2 = "12";
        else if( Strbran2.equals("120"))	code_bran_S2 = "13";
        else if( Strbran2.equals("130")) 	code_bran_S2 = "14";
        else								code_bran_S2 =  Strbran2;
   
   System.out.println(" code_bran_S2 :"+ code_bran_S2);
   return code_bran_S2;

}
%>
<script type="text/javascript">
$(document).ready(function()  {
	var code_bran = "<%=code_bran%>";		
	var param = "code_bran=" + code_bran + "&pay=card";
	
	$.ajax ( {
	      	 type		: "POST"
			, url		: "/member_dues_bran.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadDuesBranList							
	});
});
		
function handleLoadDuesBranList(data) {
	data = "<option value='0'>선택하세요</option>" + data
	$("#dues_bran").html(data);
}
		
function onChangeCodeBran() {
	var code_bran 	= $("#temp_code_bran").val();			
	var param 		= "code_bran="+code_bran; 
	
	$.ajax ( {
           type		: "POST"
		, url		: "/member_dues_bran.do"
		, dataType  : "text"
		, data		: param
		, cache		: false
		, success	: handleLoadDuesBranList
	});
}
		
function handleLoadDuesBranList(data){
	$("#dues_bran").html(data);
}

function f_SendCard(){

		var f = document.forms["frm"];
		var l = f.dues_bran.selectedIndex;
		
		
		
		
		
		
		
		if(f.buyr_name.value==""){
			alert("이름을 입력하세요");
			f.buyr_name.focus();
			return;
		}

	    reg_pattern = /^\d{8}$/;
	    if(!reg_pattern.test(f.pers_birth.value)) {
			alert("생년월일은 숫자 8자리로 입력하여 주십시요.");
			f.pers_birth.focus();
			return;
		}


		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return;
		}

		if(f.buyr_tel1.value==""){
			alert("연락처를 입력하세요");
			f.buyr_tel1.focus();
			return;
		}
		
		if(f.buyr_tel2.value==""){
			alert("연락처를 입력하세요");
			f.buyr_tel2.focus();
			return;
		}
		if(f.temp_code_bran.value==""){
			alert("시도회를 선택하세요");
			f.temp_code_bran.focus();
			return;
		}
		
		if(f.dues_bran.value==""){
			alert("회원 종류/입금액 선택하세요");
			f.dues_bran.focus();
			return;
		}
				
		var tmp_opt_selected_txt = $("select[name='dues_bran'] option:selected").text();
        var opt_selected_txt = tmp_opt_selected_txt.split("￦");
        
        f.good_mny.value = $.trim(opt_selected_txt[1].replace(eval("/,/gi"), ""));
        f.good_name.value = $.trim(opt_selected_txt[0]) + $("#good_name").val();
        
        var tempCodeBran = $("#temp_code_bran").val();
		var codeBran = "0";
		
		switch(tempCodeBran) {
		case "02":
			codeBran =  "10";
			break;
		case "03" :
			codeBran = "20";
			break;
		case "04" :
			codeBran = "30";
			break;
		case "05" :
			codeBran = "40";
			break;
		case "06" :
			codeBran = "50";
			break;
		case "07" :
			codeBran = "60";
			break;
		case "08" :
			codeBran = "70";
			break;
		case "09" :
			codeBran = "80";
			break;
		case "10" :
			codeBran = "90";
			break;
		case "11" :
			codeBran = "100";
			break;
		case "12" :
			codeBran = "110";
			break;
		case "13" :
			codeBran = "120";
			break;
		case "14" :
			codeBran = "130";
			break;
		}
		
		// 평생회원일 경우 해당 지부를 본부로
		var duesBran = parseInt($("#dues_bran").val());
		if( duesBran >= 90 ) {
			codeBran = "0";
		}
        
		$("#code_bran").val(codeBran);
		
		f.method ="post";
		f.action = "/payment/${param.menu}/chk_plugin.do";
		f.submit();
}
</script>
		
					<!-- 
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">기존회원 재가입 및 입금 확인</h4><br />
					-->
					<p class="text s1 mt5">해당하는 정보를 정확히 입력 하세요. 정보 입력 후 카드결제로 이동합니다.</p>
					<form name="frm"  method="post">
					<input type="hidden" name="O_gubun" value="MEMBER_UP">
					<input type="hidden" name="good_name" id="good_name" value="<%=good_name%>" />
					<input type="hidden" name="goods_code_num" value="0" />
					<input type="hidden" name="code_bran" id="code_bran" />
						<fieldset>
						<legend><span class="ti">자격증 신청하기 입력</span></legend>
						<div class="box t2 bgs mt20 p20 text">
								<div class="area">
									<div class="box t1 r5 p10">
										<div class="form">
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="buyr_name" id="buyr_name" type="text" class="input t1 w200" maxlength=40 value="<%=pers_name%>" >
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid2" class="ff_title i_b"><strong>생년월일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="pers_birth" type="text"  class="input t1 fl w200"  maxlength=14  value="<%=pers_birth%>" >
															<span class="fl text ml10 mr10">예) 20150510</span>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid3" class="ff_title i_b"><strong>사용아이디</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="user_id" type="text" class="input t1 w200" maxlength=40 value="<%=user_id%>" >
															
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid4" class="ff_title i_b"><strong>연락가능 전화번호</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="buyr_tel1" type="text" class="input t1 fl w200" value="<%=pers_tel%>" maxlength=20 >
															<span class="fl text ml10 mr10">"-" 없이 입력</span>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid5" class="ff_title i_b"><strong>연락가능 핸드폰</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="buyr_tel2" type="text" class="input t1 fl w200"  maxlength=20 value="<%=pers_hp%>"> ("-"없이 입력)
															<span class="fl text ml10 mr10">"-" 없이 입력</span>
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid6" class="ff_title i_b"><strong>이메일 정보</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input name="buyr_mail" type="text" class="input t1 w200"  maxlength=70  value="<%=email%>">
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid7" class="ff_title i_b"><strong>소속시도회</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<select name="temp_code_bran" id="temp_code_bran" class="select t2 w200"   onChange="javascript:onChangeCodeBran();">
																<option value="" <% if( code_bran.equals("")){%>selected<%}%>>선택하세요.</option>
											                    <option value="02" <% if( code_bran.equals("02")){%>selected<%}%>>서울특별시 영양사회</option>
											                    <option value="03" <% if( code_bran.equals("03")){%>selected<%}%>>부산광역시 영양사회</option>
											                    <option value="04" <% if( code_bran.equals("04")){%>selected<%}%>>인천광역시 영양사회</option>
											                    <option value="05" <% if( code_bran.equals("05")){%>selected<%}%>>경기도 영양사회</option>
											                    <option value="06" <% if( code_bran.equals("06")){%>selected<%}%>>강원도 영양사회</option>
											                    <option value="07" <% if( code_bran.equals("07")){%>selected<%}%>>충청북도 영양사회</option>
											                    <option value="08" <% if( code_bran.equals("08")){%>selected<%}%>>대전.충남.세종 영양사회</option>
											                    <option value="09" <% if( code_bran.equals("09")){%>selected<%}%>>전라북도 영양사회</option>
											                    <option value="10" <% if( code_bran.equals("10")){%>selected<%}%>>광주.전남 영양사회</option>
											                    <option value="11" <% if( code_bran.equals("11")){%>selected<%}%>>대구.경북 영양사회</option>
											                    <option value="12" <% if( code_bran.equals("12")){%>selected<%}%>>경상남도 영양사회</option>
											                    <option value="13" <% if( code_bran.equals("13")){%>selected<%}%>>울산광역시 영양사회</option>
											                    <option value="14" <% if( code_bran.equals("14")){%>selected<%}%>>제주도 영양사회</option>
															</select>
											                <input type="hidden" name="good_mny" value="" >
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid8" class="ff_title i_b"><strong>회원종류/입금액</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<select class="select t2 w200" id="dues_bran" name="dues_bran">
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
									<li><a href="javascript:f_SendCard()" class="btn big t1 wide">확인</a></li>
								</ul>
							</div>
						</fieldset>
					</form>
					
							
  	
