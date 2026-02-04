<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%
	String code_pers 		= ParamUtils.getParameter(request, "user_code");
	
	String uName 			= ParamUtils.getParameter(request, "uName");
	//String ssn 				= ParamUtils.getParameter(request, "ssn");
	String pers_birth		= ParamUtils.getParameter(request, "pers_birth");
	String sendName	 		= ParamUtils.getParameter(request, "sendName");
	String tel 				= ParamUtils.getParameter(request, "tel");
	String code_bran		= ParamUtils.getParameter(request, "code_bran");
	String method			= ParamUtils.getParameter(request, "method");
	
	String local_name 		= ParamUtils.getParameter(request, "local_name");
	String bank 			= ParamUtils.getParameter(request, "bank");
	String account_num 		= ParamUtils.getParameter(request, "account_num");
	String local_tel		= ParamUtils.getParameter(request, "local_tel");
	String local_email 		= ParamUtils.getParameter(request, "local_email");
	String account_owner 	= ParamUtils.getParameter(request, "account_owner");
	
	String mem_level 		= ParamUtils.getParameter(request, "mem_level");
	
	String sendDate 		= ParamUtils.getParameter(request, "sendDate");
	String refMsg 			= ParamUtils.getParameter(request, "refMsg");
	
	String mem_l_name		= "";

	
    if( code_pers == "" ){
    	/*
        Set rs = Server.CreateObject("ADODB.RecordSet")
		sql = "SELECT CODE_PERS FROM PERSON_M_TBL WHERE DBO.GETPERSNODECORD(PERS_NO, '1') = '" + ssn + "' "
        'Response.write " sql = "&sql
        rs.Open sql, oConn

        if  (Rs.eof  or Rs.bof ) Then
            Response.write("<script type='text/javascript'>")
            Response.write("alert('회원가입후 이용하시기 바랍니다.');")
            Response.write("opener.location.href = '/member.asp';")
            Response.write("self.close();")
            Response.write("</script>")
            rs.close
            Set rs = Nothing
            oConn.close
            Set oConn = Nothing
            Response.end
        End If
        rs.close
        Set rs = Nothing
        oConn.close
        Set oConn = Nothing*/
    }


    if( mem_level == "21") mem_l_name = "신규취업회원";		
	else if( mem_level == "22") mem_l_name = "신규미취업";		
	//else if( mem_level == "03") mem_l_name = "재취업회원";	
	//else if( mem_level == "04") mem_l_name = "재미취업회원";	
	else if( mem_level == "25") mem_l_name = "기취업회원";		
	else if( mem_level == "26") mem_l_name = "기미취업회원";	
	else if( mem_level == "07") mem_l_name = "학생회원";		
	else if( mem_level == "28") mem_l_name = "신규특별회원";	
	else if( mem_level == "29") mem_l_name = "기특별회원";		
	else if( mem_level == "30") mem_l_name = "신규평생정회원";	
	else if( mem_level == "31") mem_l_name = "기평생정회원";	
	else if( mem_level == "32") mem_l_name = "신규평생특별회원";	
	else if( mem_level == "33") mem_l_name = "기평생특별회원";	
	else if( mem_level == "14") mem_l_name = "단체신규평생회원1";	
	else if( mem_level == "15") mem_l_name = "단체기평생회원1";	
	else if( mem_level == "16") mem_l_name = "단체신규평생회원2";	
	else if( mem_level == "17") mem_l_name = "단체기평생회원2";
	

//------------------------------------------------------------------------------------------------
//	메일 보내는 스크립트
//------------------------------------------------------------------------------------------------


	//Server.ScriptTimeout = 300;
	String mbody = "";

	mbody =	"<style>body,td{font-family:돋움;font-size:9pt;}</style>";
	mbody += "<br><table width='616' border='0' cellpadding='4' cellspacing='1' bgcolor='#CCCCCC' align=center>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<th height='32' colspan='2' bgcolor='#FFFFFF'><div align='center' class='style11'>입금 확인 요청</div></th>";
	mbody += "</tr>";


	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td width='154' height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>";
	mbody += "<div align='center'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</div>";
	mbody += "</div></td>";
	mbody += "<td width='443' bgcolor='#FFFFFF'><span class='style9'>" + uName + "</span><span class='style6'> - " + mem_l_name+ "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>생년월일</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + pers_birth + "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>입금자명</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + sendName + "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='32' bgcolor='#EFEFEF'><div align='center' class='style11'>연락처</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + tel + "</span></td>";
	mbody += "</tr>";


	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>소속시도회</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + local_name + "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금방법</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + method + "</span></td>";
	mbody += "</tr>";

	if( method == "계좌이체" || method == "중앙회" ){
	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금계좌</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>[" + bank + "] " + account_num + "</span></td>";
	mbody += "</tr>";
	}

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>회원종류</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + mem_l_name + "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>입금일</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + sendDate + "</span></td>";
	mbody += "</tr>";

	mbody += "<tr bgcolor='#EFEFEF'>";
	mbody += "<td height='31' bgcolor='#EFEFEF'><div align='center' class='style11'>참고사항</div></td>";
	mbody += "<td bgcolor='#FFFFFF'><span class='style9'>" + refMsg + "</span></td>";
	mbody += "</tr>";


	mbody += "</table><br><br>";

	out.println(mbody);
	
	/*
	set mail=Server.CreateObject("CDO.Message");
	mail.Subject="This is an email";

	mail.To			= "dietitian@paran.com," + local_email; //받는사람
    //mail.To			= "soppe@naver.com"
	//mail.To			= "ksm1349@nate.com"
	//mail.To			= "jangkh@dongbu.com"
	//mail.To			= "jhsshine@naver.com, cloudhyun@korea.com,"	 + local_email	// 받는사람
	mail.From		= "center@dietitian.or.kr";	// 보내는사람

	mail.Subject	= uName + " 님께서 회원 재가입을 위해 입금확인 요청을 하셨습니다. - " + now();

	//mail.TextBody			= mbody							// 내용
	mail.HTMLBody			= mbody;
	mail.BodyPart.Charset = "ks_c_5601-1987";
    mail.HTMLBodyPart.Charset = "ks_c_5601-1987";
    //mail.HTMLBodyPart.Charset = "ks_c_5601-1987";
	mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=1;
	//SMTP server
	mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="scriptmail.intermedia.net";
	//SMTP port
	mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25; 
	mail.Configuration.Fields.Update

	mail.Send;
	set mail=nothing									// 메일보내기
	*/


%>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="refresh" content="0;url=javascript:self.close();">
<script language="javascript">
<!--
	alert("관리자에게 전달됐습니다.\r\n입금확인까지 24시간 소요됩니다.\r\n문의사항은 소속영양사회로 연락부탁드립니다.");
	self.close();
//-->
</script>