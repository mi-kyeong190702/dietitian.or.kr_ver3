
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function frmChk(){

	f=document.form1;
	f.uname.value = "정아라";
	f.ussn1.value = "20150303";
	f.pers_hp.value = "0101112222";
		
	if( f.uname.value=="" ){
		alert("이름을 입력하세요");
		f.uname.focus();
		return false;
	} else if ( f.ussn1.value == "") {
		alert("생년월일을 입력하세요");
		return false;
	} else if (f.ussn1.value.length!=8){
		alert("생년월일을 정확하게 입력하세요.\n(예: 19800101과 같이 숫자만 입력)");
		return false;
	} else if ( f.pers_hp.value == "") {
		alert("휴대전화번호를 입력하세요");
		return false;
	}
	
	f.action = "member_selectMemberId";
	
	f.submit();
}

function frm2Chk(){

	f=document.form2;
	if( f.uid.value=="" ){
		alert("아이디를 입력하세요");
		f.uid.focus();
		return false;
	}else if( f.uname.value=="" ){
		alert("이름을 입력하세요");
		f.uname.focus();
		return false;
	} else if ( f.ussn1.value == "") {
		alert("생년월일을 입력하세요");
		return false;
	}else if (f.ussn1.value.length!=8){
		alert("생년월일을 정확하게 입력하세요.\n(예: 19800101과 같이 숫자만 입력)");
		return false;
	} 
	f.submit();
}

function onlyNumber()  //숫자만을 기입받게 하는 방법
{
   if((event.keyCode<48)||(event.keyCode>57))
      event.returnValue=false;
}

</script>

<link rel="stylesheet" href="../css/kdastyle.css" type="text/css">
<style type="text/css">
<!--
.text {  font-size: 9pt}
-->
</style>
<br>
<table width="550" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><img src="../images/member/m3_img04.gif" width="171" height="30"></td>
	</tr>
</table>

<table width="550" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="28"><span class="style12"> 이름, 생년월일, 휴대전화번호를 입력해 주세요. </span></td>
	</tr>
</table>

<table width="550" height="143" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#F7F7F7">
	<tr>
		<td height="1" bgcolor="#CBE091"></td>
	</tr>
	<tr>
		<td align="center" valign="middle">

			<form name="form1" method="post" ID="Form1">

			<table width="350" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="90" height="28" class="style15">&nbsp;&nbsp;이름</td>
					<td width="260"><input type="text" name="uname" size="20"></td>
				</tr>
				<tr>
					<td height="28" class="style15">&nbsp;&nbsp;생년월일</td>
					<td><input type="text" name="ussn1" ID="Text1" size="8" maxlength="8" onKeyPress="javascript:onlyNumber();"/>(예: 19800101과 같이 숫자만 입력)
						<!---
						<input type="text" name="ussn2" ID="Text2" size="8" maxlength="7"></td>-->
				</tr>
				<tr>
					<td width="90" height="28" class="style15">&nbsp;&nbsp;휴대전화번호</td>
					<td width="260"><input type="text" name="pers_hp" size="20" onKeyPress="javascript:onlyNumber();"/>("-" 없이 숫자만 입력)</td>
				</tr>
				<tr>
					<td height="10" colspan="2"></td>
				</tr>
				<tr align="center" valign="bottom" bgcolor="#CCCCCC">
					<td height="1" colspan="2" class="style15"></td>
				</tr>
				<tr align="center" valign="bottom">
					<td height="35" colspan="2" class="style15">
						<img src="/images/member/btn_id.gif" onclick="frmChk();" style="cursor:hand"> &nbsp;
						<a href="javascript:history.go(-1)"><img src="../images/member/btn_cancel.gif" width="30" height="18"></a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#CBE091"></td>
	</tr>
</table>
</form>

<form name="form2" action="member_03_05.asp" method="post" ID="Form1">

<table width="550" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><img src="../images/member/m3_img05.gif" width="168" height="28"></td>
	</tr>
</table>

<table width="550" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="28"><span class="style12"> <b><font color="#0099ff">비밀번호는 회원정보에 등록된 휴대전화번호로 초기화됩니다.</font></b><br>회원님의 아이디, 이름과 생년월일을 입력해 주십시오.</span></td>
	</tr>
</table>

<table width="550" height="160" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#F7F7F7">
	<tr>
		<td height="1" bgcolor="#CBE091"></td>
	</tr>
	<tr>
		<td align="center" valign="middle">

			<table width="350" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="28" class="style15">&nbsp;&nbsp;아이디</td>
					<td><input type="text" name="uid" ID="Text3" size="11"></td>
				</tr>
				<tr>
					<td width="90" height="28" class="style15">&nbsp;&nbsp;이름</td>
					<td width="260"><input type="text" name="uname" size="24"></td>
				</tr>
				<tr>
					<td height="28" class="style15">&nbsp;&nbsp;생년월일</td>
					<td><input type="text" name="ussn1" ID="Text1" size="10" maxlength="8">(예: 19800101과 같이 숫자만 입력) <!-- <input type="text" name="ussn2" ID="Text2" size="10" maxlength="7">--></td>
				</tr>
				<tr>
					<td height="10" colspan="2"></td>
				</tr>
				<tr align="center" valign="bottom" bgcolor="#CCCCCC">
					<td height="1" colspan="2" class="style15"></td>
				</tr>
				<tr align="center" valign="bottom">
					<td height="35" colspan="2" class="style15">
						<img src="/images/member/btn_ps.gif" onclick="frm2Chk();" style="cursor:hand"> &nbsp; <a href="javascript:history.go(-1)"><img src="../images/member/btn_cancel.gif" width="30" height="18"></a>
					</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#CBE091"></td>
	</tr>
</table>

</form>

<br>
<br>