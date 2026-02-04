<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="kda.SessionInfo, kda.member.data.MEMBER_PAY, kda.login.data.LOGININFO, kda.utils.KdaStringUtil"%>

<%
	
	MEMBER_PAY mPay = (MEMBER_PAY)request.getAttribute("mPay");

	String pers_name 	= mPay.getPers_name();
	String pers_birth	= mPay.getPers_birth();
	String sendName 	= mPay.getSend_name();
	String pers_hp		= mPay.getPers_hp();
	String code_bran	= mPay.getCode_bran();
	String code_member 	= mPay.getCode_member();
	String method 		= mPay.getMethod();

	String account_owner = "예금주 : 대한영양사협회";
	String bank 		= "";
	String account_num 	= "";
	String local_name 	= "";
	String local_tel 	= "";
	String local_fax 	= "";
	String local_email 	= "";

	//현재 DB에 중앙회에 관한 데이터는 없어서 임시 처리
    if( method.equals("중앙회"))
        code_bran = "02";
	
    if( method.equals("중앙회") ){
		
        bank			= "은행명 : 신한은행";
        account_num	    = "계좌번호 : 385-05-006540";
        local_tel       = "전화번호 : 02)823-5680";
        local_fax       = "팩스번호 : 02)823-5689";
        
	} else if( method.equals("지로") ){
		
		bank			= "지로입금";
		account_num	    = "";
		local_tel		= "";
        local_fax       = "";
        account_owner   = "";
        
	} else {
        /*------------------------------------------------------------------------------------------------------------
        '01 중앙회	                신한은행	385-05-006540	    대한영양사협회	        02)823-5680 / 02)823-5689
        '02 서울특별시영양사회	    국민은행	384701-04-151254	대한영양사협회	        02)3289-7200 / 02)3289-7201
        '03 부산광역시영양사회	    부산은행	022-13-000008-9 	대한영양사협회	        051)634-7640 / 051)631-6136
        '04 인천광역시영양사회	    수협	    163-61-005928 	    대한영양사협회	        032)435-5990 / 032)432-5199
        '05 경기도영양사회	        신한은행	100-023-367042  	대한영양사협회	        031)468-9417 / 031)448-9890
        '06 강원도영양사회	        농협	    203-01-225733 	    대한영양사협회	        033)251-7576 / 033)251-7579
        '07 충청북도영양사회	    농협	    304-17-000096 	    대한영양사협회	        043)268-4798 / 043)266-0166
        '08 대전충남영양사회	    농협	    407-01-100377	    대한영양사협회	        042)252-4346 / 042)252-9110
        '09 전라북도영양사회	    농협	    301-0011-9700-11	대한영양사협회 	        063)272-0175 / 063)255-1811
        '10 광주전남영양사회	    신한은행	100-024-993030	    대한영양사협회	        062)364-6773 / 062)364-6772
        '11 대구경북영양사회	    대구은행	090-05-000936-4 	대한영양사협회 	        053)563-6066 / 053)563-6466
        '12 경상남도영양사회	    경남은행	578-07-0022469 	    대한영양사협회	        055)268-6846 / 055)268-6847
        '13 울산광역시영양사회	    경남은행	531-35-0003039 	    대한영양사협회          052)258-6069 / 052)275-2823
		2022.02.24 은행/계좌번호 변경
        '14 제주특별자치도영양사회	   농협	    957-01-104080 	    대한영양사협회	        064)721-9062 / 064)721-9062 =>>
		'14 제주특별자치도영양사회    제주은행	57-01-026633 	    대한영양사협회	        064)721-9062 / 064)721-9062
        '------------------------------------------------------------------------------------------------------------*/
		if( code_bran.equals("01")){			
			local_name      = "중앙회";
			bank			= "은행명 : 신한은행";
			account_num	    = "계좌번호 : 385-05-006540";
            local_tel       = "전화번호 : 02)823-5680";
            local_fax       = "팩스번호 : 02)823-5689";		
		}else if( code_bran.equals("02")){
			local_name		= "서울";
			bank			= "은행명 : 신한은행";
			account_num	    = "계좌번호 : 140-012-521054";
            local_tel       = "전화번호 : 02)3289-7200";
            local_fax       = "팩스번호 : 02)3289-7201";
            local_email		= "kdas29@hanmail.net";            
		}else if( code_bran.equals("03")){			
			local_name		= "부산";
			bank			= "은행명 : 부산은행";
			account_num	    = "계좌번호 : 022-13-000008-9";
            local_tel       = "전화번호 : 051)634-7640";
            local_fax       = "팩스번호 : 051)631-6136";
            local_email		= "kdabs333@hanmail.net";
		}else if( code_bran.equals("04")){
            local_name		= "인천";
			bank			= "은행명 : 수협";
			account_num	    = "계좌번호 : 163-61-005928";
            local_tel       = "전화번호 : 032)435-5990";
            local_fax       = "팩스번호 : 032)432-5199";
            /*2022.04.18 인천지부 메일계정 변경*/
            /* local_email		= "incho599@unitel.co.kr"; */
            local_email		= "kdaic@naver.com";
        }else if( code_bran.equals("05")){
            local_name		= "경기";
			bank			= "은행명 : 신한은행";
			account_num	    = "계좌번호 : 100-023-367042";
            local_tel       = "전화번호 : 031)468-9417";
            local_fax       = "팩스번호 : 031)448-9890";
            local_email		= "kdakg@hanmail.net";
        }else if( code_bran.equals("06")){
            local_name		= "강원";
			bank			= "은행명 : 농협";
			account_num	    = "계좌번호 : 203-01-225733";
            local_tel       = "전화번호 : 033)251-7576";
            local_fax       = "팩스번호 : 033)251-7579";
            /*2022.04.13 강원지부 메일계정 변경*/
            /* local_email		= "kda123@unitel.co.kr"; */
            local_email		= "gwd-kda@naver.com";
        }else if( code_bran.equals("07")){
            local_name		= "충북";
			bank			= "은행명 : 농협";
			account_num	    = "계좌번호 : 304-17-000096";
            local_tel       = "전화번호 : 043)268-4798";
            local_fax       = "팩스번호 : 043)266-0166";
            local_email		= "cbdietian@naver.com";
        }else if( code_bran.equals("08")){
            local_name		= "대전충남세종";
			bank			= "은행명 : 농협";
			account_num	    = "계좌번호 : 407-01-100377";
            local_tel       = "전화번호 : 042)252-4346";
            local_fax       = "팩스번호 : 042)252-9110";
            local_email		= "kdatj22@daum.net";
        }else if( code_bran.equals("09")){
            local_name		= "전북";
			bank			= "은행명 : 농협";
			account_num	    = "계좌번호 : 301-0011-9700-11";
            local_tel       = "전화번호 : 063)272-0175";
            local_fax       = "팩스번호 : 063)255-1811";
            local_email		= "kdajb@hanmail.net";
        }else if( code_bran.equals("10")){
            local_name		= "광주전남";
			bank			= "은행명 : 신한은행";
			account_num	    = "계좌번호 : 100-024-993030";
            local_tel       = "전화번호 : 062)364-6773";
            local_fax       = "팩스번호 : 062)364-6772";
            local_email		= "kdakj@hanmail.net";
        }else if( code_bran.equals("11")){
            local_name		= "대구경북";
			bank			= "은행명 : 대구은행";
			account_num	    = "계좌번호 : 090-05-000936-4";
            local_tel       = "전화번호 : 053)563-6066";
            local_fax       = "팩스번호 : 053)563-6466";
            local_email		= "kdadk@hanmail.net";
        } else if( code_bran.equals("12")){
            local_name		= "경남";
			bank			= "은행명 : 경남은행";
			account_num	    = "계좌번호 : 578-07-0022469";
            local_tel       = "전화번호 : 055)268-6846";
            local_fax       = "팩스번호 : 055)268-6847";
            local_email		= "kdakn@hanmail.net";
        }else if( code_bran.equals("13")){
            local_name		= "울산";
			bank			= "은행명 : 경남은행";
			account_num	    = "계좌번호 : 531-35-0003039";
            local_tel       = "전화번호 : 052)258-6069";
            local_fax       = "팩스번호 : 052)275-2823";
            local_email		= "ukda@hanmail.net";
        }else if( code_bran.equals("14")){
            local_name		= "제주";
            //2022.02.24 은행 및 계좌번호 변경
			//bank			= "은행명 : 농협";
			//account_num	    = "계좌번호 : 957-01-104080";
			bank			= "은행명 : 제주은행";
			account_num	    = "계좌번호 : 57-01-026633";
            local_tel       = "전화번호 : 064)721-9062";
            local_fax       = "팩스번호 : 064)721-9062";
            local_email		= "2jejukda@hanmail.net";
        }
	}

	String mem_level 	= "";
	String send_date 	= "";
	String ref_msg 		= "";
	
	mem_level 	= ParamUtils.getParameter(request, "mem_level");
	send_date  	= ParamUtils.getParameter(request, "send_date");
	ref_msg		= ParamUtils.getParameter(request, "ref_msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>무통장, 지로입금 확인 요청</title>
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/layout.css">
	<link rel="shortcut icon" href="/css/favicon.ico" />
   
	<link rel="stylesheet" href="/css/jquery-ui-1.10.4.custom.min.css" />
	<link rel="stylesheet" href="/css/jquery.ui.timepicker.css" />
		

	<script src="/js/jquery-1.11.2.min.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.timepicker.js"></script>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>

	
<script type="text/javascript">

	$(document).ready(function() 
	{
		$("#send_date").datepicker();
		
		var code_bran = "<%=code_bran%>";		
		var param = "code_bran=" + code_bran;
					
		$.ajax ( {
	        type		: "POST"
			, url		: "/member_dues_bran.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadDuesBranList							
		});
	});
	
	function handleLoadDuesBranList(data)
	{
		data = "<option value='0'>선택하세요</option>" + data
		$("#dues_bran").html(data);
	}
	
	function onChangeCodeBran()
	{
		document.frm.submit();
	}
	
	function handleLoadDuesBranList(data)
	{
		$("#dues_bran").html(data);
	}

	function code_bran_chk(){
		f=document.frm;
		f.action = "/member/popup/km_deposit_receipt.do";
		f.submit();
	}

	function central_chk(){ 
		f=document.frm;
		f.action = "/member/popup/km_deposit_receipt.do";
		f.submit();
	}


	function send() {
		f = document.frm;
		
        f.pers_name.value = $.trim(f.pers_name.value);
		if(f.pers_name.value == ""){
			alert("이름을 입력하세요");
			f.pers_name.focus();
			return;
		}

        f.pers_birth.value = $.trim(f.pers_birth.value);
		if(f.pers_birth.value == ""){
			alert("생년월일을 입력하세요");
			f.pers_birth.focus();
			return;
		}

        f.send_name.value = $.trim(f.send_name.value);
		if(f.send_name.value == ""){
			alert("입금자 성명을 입력하세요");
			f.send_name.focus();
			return;
		}

        f.pers_hp.value = $.trim(f.pers_hp.value);
        reg_pattern = /^\d{9,11}$/;
		if(!reg_pattern.test(f.pers_hp.value)){
			alert("연락처를 입력하세요");
			f.pers_hp.focus();
			return;
		}

		if(f.code_bran.value == "" && $("input:radio[name='method']:checked").val() != "중앙회"){
			alert("시도회를 선택하세요");
			f.code_bran.focus();
			return;
		}
		
		var method = $(':input[name=method]:radio:checked').val();
        
        if( !method ){ 
            alert("입금방법을 선택하세요");
            return;
        }    

		if(f.dues_bran.value == ""){
			alert("회원 종류를 선택하세요");
			f.dues_bran.focus();
			return;
		}
		
		$("#dues_name").val($("#dues_bran option:selected").text());
		

		if($.trim(f.send_date.value) == ""){
			alert("입금일을 입력하세요");
			f.sendDate.focus();
			return;
		}
		
		$("#btn_msg").html("처리중입니다.")
		
		f.action = "km_deposit_receipt_action.do";
		f.submit();
		
		
	}
</script>
	
</head>
<body>

  <form name="frm" method="post">
    <input type="hidden" name="local_name" 		value="<%=local_name%>" />
    <input type="hidden" name="bank" 			value="<%=bank%>" />
    <input type="hidden" name="account_num" 	value="<%=account_num%>" />
    <input type="hidden" name="local_tel" 		value="<%=local_tel%>" />
    <input type="hidden" name="local_email" 	value="<%=local_email%>" />
    <input type="hidden" name="account_owner" 	value="<%=account_owner%>" />
    <input type="hidden" name="dues_name" 		id="dues_name"/>
<div id="popup">
	<div class="p_head">
		<h2 class="title t3 cw bold s1 i_b_t6">입금했어요</h2>
	</div>
	<div class="p_body text ca small">
		<div class="p20">
			<div class="area">
				<div class="form mt10 line bt bcm">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input name="pers_name" type="text" class="input t1 w200"  value="<%=pers_name%>">
								
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>생년월일</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input name="pers_birth" type="text"  class="input t1 w200" value="<%=pers_birth%>">
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>입금자</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input name="send_name" type="text" class="input t1 w200" value="<%=sendName%>">
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>연락가능 전화번호</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input name="pers_hp" type="text"  class="input t1 w200" value="<%=pers_hp%>"> ("-"없이 입력)
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid2" class="ff_title i_b"><strong> 소속시도회</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<select name="code_bran"  class="select t2 fl" onChange="code_bran_chk();">
					                    <option value="" <% if( code_bran.equals("")){%>selected<%}%>>선택하세요.</option>
					                    <option value="02" <% if( code_bran.equals("02")){%>selected<%}%>>서울특별시영양사회</option>
					                    <option value="03" <% if( code_bran.equals("03")){%>selected<%}%>>부산광역시영양사회</option>
					                    <option value="04" <% if( code_bran.equals("04")){%>selected<%}%>>인천광역시영양사회</option>
					                    <option value="05" <% if( code_bran.equals("05")){%>selected<%}%>>경기도영양사회</option>
					                    <option value="06" <% if( code_bran.equals("06")){%>selected<%}%>>강원특별자치도영양사회</option>
					                    <option value="07" <% if( code_bran.equals("07")){%>selected<%}%>>충청북도영양사회</option>
					                    <option value="08" <% if( code_bran.equals("08")){%>selected<%}%>>대전·충남·세종영양사회</option>
					                    <option value="09" <% if( code_bran.equals("09")){%>selected<%}%>>전라북도영양사회</option>
					                    <option value="10" <% if( code_bran.equals("10")){%>selected<%}%>>광주·전남영양사회</option>
					                    <option value="11" <% if( code_bran.equals("11")){%>selected<%}%>>대구·경북영양사회</option>
					                    <option value="12" <% if( code_bran.equals("12")){%>selected<%}%>>경상남도영양사회</option>
					                    <option value="13" <% if( code_bran.equals("13")){%>selected<%}%>>울산광역시영양사회</option>
					                    <option value="14" <% if( code_bran.equals("14")){%>selected<%}%>>제주특별자치도영양사회</option>
					                </select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid2" class="ff_title i_b"><strong> 입금방법</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									  <input name="method"  type="radio" value="계좌이체" <% if( method.equals("계좌이체")){%>checked<%}%> onClick="central_chk();">
								      소속시도 무통장입금
								      <input name="method" type="radio" value="지로" <% if( method.equals("지로")){%>checked<%}%> onClick="central_chk();">
								      지로 입금
								      <input name="method"   type="radio" value="중앙회" <% if( method.equals("중앙회")){%>checked<%}%> onClick="central_chk();">
								      중앙회 신한은행(평생회비 입금시)
									      
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid2" class="ff_title i_b"><strong> 입금계좌번호</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									  &nbsp;&nbsp;<%=bank%><br />
					                    &nbsp;&nbsp;<%=account_num%><br />
					                    &nbsp;&nbsp;<%=account_owner%><br />
					                    &nbsp;&nbsp;<%=local_tel%>
									<input type="hidden" name="local_email" value="<%=local_email%>" />   
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid3" class="ff_title i_b"><strong>회원종류/입금액</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<select	 class="select t2 fl" id="dues_bran" name="dues_bran">
									
									</select>
									<!-- <br>&nbsp;&nbsp;&nbsp;준회원에서 정회원으로 재가입시 신규회원을 선택해주세요. -->
								</div>
							</div>
						</div>
					</div>

					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid4" class="ff_title i_b"><strong>입금일</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input name="send_date" id="send_date" type="text" size="20"  class="input t1 w200" readonly="readonly" value="<%=send_date%>"> (년월일 입력) 
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid7" class="ff_title i_b"><strong>참고사항</strong></label>
							<div class="ff_wrap ml120">
								<div class="area mt5">
									 <textarea name="ref_msg" rows="5" class="input t1"><%=ref_msg%></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="area mt10">
				위와 같이 입금 하였습니다. 
			</div>
		</div>
	</div>
	<div class="p_foot line bt">
		<div id="btn_msg" class="btn_wrap mt20">
			<ul>
				<li><a href="javascript:send();" class="btn big t1">확인</a></li>
				<li><a href="javascript:window.close()" class="btn big">취소</a></li>
			</ul>
		</div>
	</div>
</div>
</form>


</body>
</html>
