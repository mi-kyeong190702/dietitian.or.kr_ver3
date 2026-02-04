<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>
<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<%

	Server.ScriptTimeout = 3000
	set xup = Server.CreateObject("UpDownExpress.FileUpload")
	xup.InitControl

	function word(Str)		'따옴표 제거
		if xup.IsItem(Str) = 1 then
			Str = xup(Str)
			Str = replace(Str, "'", "''")
			word = Str
		else
			word = ""
		end if
	End function	

	idx				= word("idx")	
	bbs_Pwd		= word("bbs_pwd")
	bbs_name		= word("bbs_name")
	bbs_email		= word("bbs_email")
	bbs_category	= word("bbs_category")
	bbs_option		= word("bbs_option")
	bbs_subject	= word("bbs_subject")
	bbs_contents	= word("bbs_contents")

	if instr(contents,"<") = 0 then
		contents = replace(contents, chr(13)&chr(10),"<br>")
	end if	
%>
<html>
<head>
<link href="/css/style2.css" rel="stylesheet" type="text/css">
<link href="/css/board.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-size: 11px}
-->
</style>

<title><%= bbs_subject %></title>

</head>
<body>

<center>

<table width="583" border="0" cellspacing="0" cellpadding="0">
	<tr align="center" bgcolor="4AB2E7">
		<td height="2" colspan="8"></td>
	</tr>
	<tr bgcolor="#F7FBFF">
		<td height="28" class="board_04"><img src="/data/images/icon.gif" width="9" height="10">
			<strong><%= bbs_subject %></strong>
		</td>
		<td width="100" align="center" height="27" background="/images/board_bg01.gif"><%= left(now(),10) %></td>
	</tr>
	<tr align="center" bgcolor="CAE6FC">
		<td height="2" colspan="8"></td>
	</tr>
</table>
					


<table cellpadding="0" cellspacing="0" width="583" border="0">
	<tr>
		<td width="50" height="28" bgcolor="#F7FBFF" class="board_05">작성자</td>
		<td width="75" class="board_03"><%= bbs_name %></td>		
		<td width="55" bgcolor="#F7FBFF" class="board_05">이메일</td>
		<td width="130" class="board_03"><%= bbs_email %></td>
	</tr>
	<tr align="center" bgcolor="D6D7D6">
		<td height="1" colspan="8"></td>
	</tr>
</table>

<table cellpadding="0" cellspacing="0" width="583" border="0">
	<tr>
		<td colspan="2" height="250" valign="top" class="board_03">
			<div style="padding:10;word-break:break-all">			
				<%= content %>				
			</div>
		</td>
	</tr>						
	<tr>
		<td height="2" colspan="2" bgcolor="4AB2E7"></td>
	</tr>	
</table>


</center>

</body>
</html>