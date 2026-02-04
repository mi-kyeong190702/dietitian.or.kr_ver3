<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.PERSON_M_TBL"%>

<%
	PERSON_M_TBL member_join = (PERSON_M_TBL)request.getAttribute("person");
	
	String pers_name 		= member_join.getPers_name();		//회원명
	String lic_no			= member_join.getLic_no();			//면허번호
	int   sum_dues			= member_join.getSum_dues();		//입금회비 
	String code_member 		= member_join.getCode_member(); 	//회원종류코드
	String code_pay_flag	= member_join.getCode_pay_flag(); 	//입금방법 코드 (10:무통장 20:카드 30:계산서)
	String code_pay_name	= member_join.getCode_pay_name(); 	//입금방법 이름

	
	//String mem_level 		= "07";//member_join.getCode_member();
	String code_bran = member_join.getCode_bran();	//지부
	System.out.println("pers_name:"+ pers_name);
	System.out.println("sum_dues:"+ sum_dues);
	System.out.println("code_member:"+ code_member);
	System.out.println("code_pay_flag:"+ code_pay_flag);
	System.out.println("code_bran:"+ code_bran);
	
	String mem_l_name = "";
	String lifetime_notice 	= "";//	문의처
	String local_name		= "";
	   String bank				= "";
	   String account_num	    = "";
	   String tel_num         	= "";
	   String fax_num         	= "";
	   String local_email		= "";
	
	
	if( code_bran.equals("02") ){
		local_name		= "서울";
		bank			= "신한은행";
		account_num	    = "140-012-521054";
		tel_num         = "02)3289-7200";
		fax_num         = "02)3289-7201";
		local_email		= "kdas29@hanmail.net";
	}else if( code_bran.equals("03")){
		local_name		= "부산";
		bank			= "부산은행";
		account_num	    = "022-13-000008-9";
		tel_num         = "051)634-7640";
		fax_num         = "051)631-6136";
		local_email		= "kdabs333@hanmail.net";
	}else if( code_bran.equals("04") ){
		local_name		= "인천";
		bank			= "수협";
		account_num	    = "163-61-005928";
		tel_num         = "032)435-5990";
		fax_num         = "032)432-5199";
		/*2022.04.18 인천지부 메일계정 변경*/
		/* local_email		= "incho599@unitel.co.kr"; */
		local_email		= "kdaic@naver.com";
	}else if( code_bran.equals("05") ){
		local_name		= "경기";
		bank			= "신한은행";
        account_num	    = "100-023-367042";
        tel_num         = "031)468-9417";
        fax_num         = "031)448-9890";
        local_email		= "kdakg@hanmail.net";
    }else if( code_bran.equals("06") ){
        local_name		= "강원";
        bank			= "농협";
        account_num	    = "203-01-225733";
        tel_num         = "033)251-7576";
        fax_num         = "033)251-7579";
        /*2022.04.13 강원지부 메일계정 변경*/
        /* local_email		= "kda123@unitel.co.kr"; */
        local_email		= "gwd-kda@naver.com";
    }else if( code_bran.equals("07") ){
        local_name		= "충북";
        bank			= "농협";
        account_num	    = "304-17-000096";
        tel_num         = "043)268-4798";
        fax_num         = "043)266-0166";
        local_email		= "ssyj0310@hanmail.net";
    }else if( code_bran.equals("08") ){
        local_name		= "대전충남세종";
        bank			= "농협";
        account_num	    = "407-01-100377";
        tel_num         = "042)252-4346";
        fax_num          = "042)252-9110";
        local_email		= "kdatj22@daum.net";
    }else if( code_bran.equals("09") ){
        local_name		= "전북";
        bank			= "농협";
        account_num	    = "301-0011-9700-11";
        tel_num         = "063)272-0175";
        fax_num         = "063)255-1811";
        local_email		= "kdajb@hanmail.net";
    }else if( code_bran.equals("10") ){
        local_name		= "광주전남";
        bank			= "신한은행";
        account_num	    = "100-024-993030";
        tel_num         = "062)364-6773";
        fax_num         = "062)364-6772";
        local_email		= "kdakj@hanmail.net";
    }else if( code_bran.equals("11") ){
        local_name	= "대구경북";
        bank		= "대구은행";
        account_num	= "090-05-000936-4";
        tel_num         = "053)563-6066";
        fax_num         = "053)563-6466";
        local_email	= "kdadk@hanmail.net";
    }else if( code_bran.equals("12") ){
        local_name		= "경남";
        bank			= "경남은행";
        account_num	    = "578-07-0022469";
        tel_num         = "055)268-6846";
        fax_num         = "055)268-6847";
        local_email		= "kdakn@hanmail.net";
    }else if( code_bran.equals("13") ){
        local_name		= "울산";
        bank			= "경남은행";
        account_num	    = "531-35-0003039";
        tel_num         = "052)258-6069";
        fax_num         = "052)275-2823";
        local_email		= "ukda@hanmail.net";
    }else if( code_bran.equals("14") ){
        local_name		= "제주";
        //2022.02.24 은행 및 계좌번호 변경
        //bank			= "농협";
        //account_num	= "957-01-104080";
        bank			= "제주은행";
        account_num	    = "57-01-026633";
        tel_num         = "064)721-9062";
        fax_num         = "064)721-9062";
        local_email		= "2jejukda@hanmail.net";
    }

	if( code_member ==  "01" || code_member ==  "21")
		mem_l_name = "신규취업회원";
	else if( code_member == "02" || code_member ==  "22")
		mem_l_name = "신규미취업";
	else if( code_member == "03" || code_member ==  "23" )
			mem_l_name = "재취업회원";
	else if( code_member == "04" || code_member ==  "24" )
			mem_l_name = "재미취업회원";
	else if( code_member == "05" || code_member ==  "25" )
			mem_l_name = "기취업회원";
	else if( code_member == "06" || code_member ==  "26" )
			mem_l_name = "기미취업회원";
	else if( code_member == "-1" )
			//mem_l_name = "(기)준회원";
			mem_l_name = "학생회원";
	else if( code_member == "07" )
			mem_l_name = "학생회원";
	else if( code_member =="08" || code_member ==  "28" )
			mem_l_name = "신규특별회원";
	else if( code_member =="09" || code_member ==  "29" )
			mem_l_name = "기특별회원";
	else if( code_member =="10" || code_member ==  "30" ){
			mem_l_name = "신규평생정회원";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";
	
	}else if( code_member =="11" || code_member ==  "31" ){
			mem_l_name = "기평생정회원";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";
	
	}else if( code_member =="12" || code_member ==  "32" ){
			mem_l_name = "신규평생특별회원";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";
	
	}else if( code_member =="13" || code_member ==  "33" ){
			mem_l_name = "기평생특별회원";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";
	
	}else if( code_member =="14" || code_member ==  "34" ){
			mem_l_name = "단체신규평생회원1";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";

	}else if( code_member =="15" || code_member ==  "35" ){
			mem_l_name = "단체기평생회원1";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";

	}else if( code_member =="16" || code_member ==  "36" ){
			mem_l_name = "단체신규평생회원2";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";

	}else if( code_member =="17" || code_member ==  "37" ){
			mem_l_name = "단체기평생회원2";
			lifetime_notice = "-평생회원으로 가입하신 분께서는 중앙회로 연락 주시기바랍니다.<br>- 중앙회 02-823-5680 / 내선 311, 312";
	}
%>

<script type="text/javascript">
	function doComplete()
	{
		document.location.href = "/index.jsp"
	}
</script>

<form>
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
				<li><span class="icon step3"></span><span class="txt">회원정보 입력</span></li>
				<li><span class="icon step4"></span><span class="txt">입금 및 확인</span></li>
				<li class="on"><span class="icon step5"></span><span class="txt"><strong>가입완료</strong></span></li>
			</ol>
			<div class="box t2 bgs mt40 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1"><mark class="cm">가입</mark>완료</h5>
					<div class="box t1 r5 mt10 p10">
						<p class="p10 ssmall">
							<mark class="bold">회원가입이 완료되었습니다.</mark><br />
							회비 송금 후 약 24시간 후부터 홈페이지 상의 회원 전용공간을 이용하실 수 있습니다.<br />
							<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3"><mark class="bold">회원가입정보</mark> <span class="ssmall"></span></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="pers_name" class="ff_title i_b"><strong>이름</strong></label>
									<div class="ff_wrap ml150">
										<div class="area">
											<%=pers_name%>
										</div>
									</div>
								</div>
							</div>
							<%if(  code_member != "08" //
								&& code_member != "12" //
								&& code_member != "07" // 학생회원
								&& code_member != "28" // 신규특별회원
								&& code_member != "32" // 신규평생특별회원
								&& code_member != "-1" // 
								){ %>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="lic_no" class="ff_title i_b"><strong>면허번호</strong></label>
									<div class="ff_wrap ml150">
										<div class="area">
											<%=lic_no%>
										</div>
									</div>
								</div>
							</div>
							<%}%>
							
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="sum_dues" class="ff_title i_b"><strong>납입금</strong></label>
									<div class="ff_wrap ml150">
										<div class="area"> 
											<%=sum_dues%>
										</div>
									</div>
								</div>
							</div>
							<% if((    code_member != "10" // 
									&& code_member != "11" //
									&& code_member != "12" //
									&& code_member != "13" //
									&& code_member != "14" //
									&& code_member != "15" //
									&& code_member != "16" //
									&& code_member != "17" //
									&& code_member != "30" //신규평생정회원
									&& code_member != "31" //기평생정회원
									&& code_member != "32" //신규평생특별회원
									&& code_member != "33" //기편생특별회원
									&& code_member != "34" //
									&& code_member != "35" // 
									&& code_member != "36" //
									&& code_member != "37" //
									) && code_pay_flag.equals("10") //납부방법  10:무통장 20:카드 30:계산서
								){%>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="bank" class="ff_title i_b"><strong>거래은행</strong></label>
									<div class="ff_wrap ml150">
										<div class="area">
											<%=bank%>													
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="account_num" class="ff_title i_b"><strong>계좌번호</strong></label>
									<div class="ff_wrap ml150 text">
										<div class="area">
											<%=account_num%>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="inputid10" class="ff_title i_b"><strong>예금주</strong></label>
									<div class="ff_wrap ml150">
										<div class="area">
											(사)대한영양사협회
											
										</div>
									</div>
								</div>
							</div>
							<%}%>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<label for="code_pay_name" class="ff_title i_b"><strong>입금형태</strong></label>
									<div class="ff_wrap ml150">
										<div class="area">
											<%=code_pay_name%>
										</div>
									</div>
								</div>						
							</div>
							<% if( code_member != "10" 
									&& code_member != "11"
									&& code_member != "12" 
									&& code_member != "13"
									&& code_member != "14" 
									&& code_member != "15" 
									&& code_member != "16" 
									&& code_member != "17" 
									&& code_member != "30" 
									&& code_member != "31" 
									&& code_member != "32" 
									&& code_member != "33" 
									&& code_member != "34" 
									&& code_member != "35" 
									&& code_member != "36" 
									&& code_member != "37" ){%>									
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
								  <div class="ff_title i_b"><strong>문의처</strong></div>
									<div class="ff_wrap ml150 text">
										<ul>
											<li>
												<div class="area">
												<p class="text s1">T : <%=tel_num%>    F : <%=fax_num %></p>
												</div>
											</li>
										</ul>
									</div>
								</div>
						    </div>
					    <%}else{%>
						    <div class="f_wrap line bb p8">
								<div class="f_field div1">
								  <div class="ff_title i_b"><strong>문의처</strong></div>
									<div class="ff_wrap ml150 text">
										<ul>
											<li>
												<div class="area">
												<p class="text s1"><%=lifetime_notice%></p>
												</div>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						 <%}%>
					  </div>						
					</div>
				</div>
			</div>
		 </div>				
	 </div>
	 <div class="btn_wrap mt30">
		<ul>
			<li><a href="javascript:doComplete();" class="btn big t1">처음으로</a></li>
		</ul>
	</div>
			 
	<!--메일보내기 기능 추가해야 함.	 
	email =""
	If email <> "" then
		set mail=Server.CreateObject("CDO.Message")
		mail.Subject = pers_name & "님께서 회원 가입을 요청하셨습니다. - " & now()

		mail.To			= "dietitian@paran.com," & local_email ' 받는사람
		'mail.To			= "ksm1349@nate.com"
		'mail.To			= "jhsshine@naver.com, cloudhyun@korea.com,"	 & local_email	' 받는사람
		mail.From		= email	' 보내는사람


		'mail.TextBody		= mbody							' 내용
		 mail.HTMLBody		= mbody
		mail.BodyPart.Charset = "ks_c_5601-1987"
		mail.HTMLBodyPart.Charset = "ks_c_5601-1987"
		'mail.HTMLBodyPart.Charset = "ks_c_5601-1987"
		mail.Configuration.Fields.Item _
		("http://schemas.microsoft.com/cdo/configuration/sendusing")=1
		'SMTP server
		mail.Configuration.Fields.Item _
		("http://schemas.microsoft.com/cdo/configuration/smtpserver")="scriptmail.intermedia.net"
		'SMTP port
		mail.Configuration.Fields.Item _
		("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
		mail.Configuration.Fields.Update

		mail.Send
		set mail=nothing									' 메일보내기

	End If
	-->
			 
</form>