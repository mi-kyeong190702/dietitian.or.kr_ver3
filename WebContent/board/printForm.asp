<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%

		if Bs_View = false then
			error("글을 보실 권한이 없습니다.")
		end if

		idx = request("idx")

		set rs = server.CreateObject("adodb.recordset")
	'	sql = "select bbs_user_id, bbs_m_number, bbs_file_name, bbs_file_url, bbs_file_type, bbs_file_size, bbs_file_down, bbs_pwd, bbs_category, bbs_name, bbs_email, bbs_subject, bbs_contents, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag, bbs_re_count, bbs_re_number from "

			sql = "select bbs_step, bbs_user_id, bbs_m_number, bbs_file_name, bbs_file_url, bbs_file_type, bbs_file_size, bbs_file_down, bbs_file_name2, bbs_file_url2, bbs_file_type2, bbs_file_size2, bbs_file_down2, bbs_file_name3, bbs_file_url3, bbs_file_type3, bbs_file_size3, bbs_file_down3, bbs_pwd, bbs_category, bbs_name, bbs_email, bbs_subject, bbs_contents, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag, bbs_re_count, bbs_re_number from "

		sql = sql & Bs_TableName &" where bbs_board_code = '" & boardcode & "' and bbs_idx = '" & idx & "'"
		rs.open sql,db,0
		
		if rs.eof then
			rs.close
			set rs = nothing
			error("해당글이 존재하지 않습니다.")
		end if
		
		keyword				= trim(request("keyword"))
		where				= request("where")
		
		
		bbs_m_number	= rs("bbs_m_number")
		bbs_subject		= rs("bbs_subject")
		content				= rs("bbs_contents")
		bbs_name			= rs("bbs_name")
		bbs_category		= rs("bbs_category")
		bbs_view			= rs("bbs_view")
		bbs_email			= rs("bbs_email")
		bbs_pwd			= rs("bbs_pwd")
		
		
		if keyword <> "" then
			select case where
				case "name"
					bbs_name = replace(bbs_name,keyword,"<font color='red'>"& keyword &"</font>")
				case "subject"
					bbs_subject = replace(bbs_subject,keyword,"<font color='red'>"& keyword &"</font>")
				case "content"
					content = replace(content,keyword,"<font color='red'>"& keyword &"</font>")
				case "category"
					bbs_category = replace(bbs_category,keyword,"<font color='red'>"& keyword &"</font>")
			end select
		end if
		
		If InStr(content, "&lt;") > 0 Then 
			content = Replace(content, "&lt;", "<")
		End If 
		if instr(content,"<") = 0 then
			content = replace(content, chr(13)&chr(10),"<br>")
		end if
		
		if rs("bbs_del_flag") then
			rs.close
			set rs = nothing
			error("삭제된 글입니다.")
		end if
		
		if request("ListUrl") = "" then
			ListUrl = "index.asp"		
		else
			ListUrl = request("ListUrl")
		end if
		
		if request("WriteUrl") = "" then
			WriteUrl = "input.asp"
		else
			WriteUrl = request("WriteUrl")
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
<body onload="javascript:window.print();" topmargin=0>

<center>

<table width="583" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align=center><img src="/images/print_Header.gif" usemap="#Map"></td>
	</tr>
	<tr>
		<td height="30"></td>
	</tr>
</table>


<table width="583" border="0" cellspacing="0" cellpadding="0">
	<tr align="center" bgcolor="4AB2E7">
		<td height="2" colspan="8"></td>
	</tr>
	<tr bgcolor="#F7FBFF">
		<td height="28" class="board_04"><img src="/data/images/icon.gif" width="9" height="10">
			<strong><%= bbs_subject %></strong>
		</td>
		<td width="100" align="center" height="27" background="/images/board_bg01.gif"><%= left(rs("bbs_reg_date_dt"),10) %></td>
	</tr>
	<tr align="center" bgcolor="CAE6FC">
		<td height="2" colspan="8"></td>
	</tr>
</table>
					


<table cellpadding="0" cellspacing="0" width="583" border="0">
	<tr>
		<td width="50" height="28" bgcolor="#F7FBFF" class="board_05">작성자</td>
		<td width="75" class="board_03"><%= bbs_name %></td>
		<td width="45" bgcolor="#F7FBFF" class="board_05">조회</td>
		<td width="70" class="board_03"><%= bbs_view %></td>
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
			
				<% 
					if rs("bbs_file_size") > 0 and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type")) > 0 then
						isize = image_size(rs("bbs_file_url"),550)
				%>
						
						<% if isize(2) > 2000 then %>
							<a href="<%= rs("bbs_file_url") %>" target="_blank"><img src="<%= rs("bbs_file_url") %>" alt="<%= rs("bbs_file_name") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
						<% else %>
							<img src="<%= rs("bbs_file_url") %>" alt="<%= rs("bbs_file_name") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
						<% end if %>
						<BR>
				<% end if %>
				


		<%if rs("bbs_file_size2") > 0   and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type2")) > 0 then 

								isize = image_size(rs("bbs_file_url2"),550)
				%>
						
						<% if isize(2) > 2000 then %>
							<a href="<%= rs("bbs_file_url2") %>" target="_blank"><img src="<%= rs("bbs_file_url2") %>" alt="<%= rs("bbs_file_name2") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
						<% else %>
							<img src="<%= rs("bbs_file_url2") %>" alt="<%= rs("bbs_file_name2") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
						<% end if %>
						<BR>
		<%End if%>
		
		
		<%if rs("bbs_file_size3") > 0   and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type2")) > 0 then 

								isize = image_size(rs("bbs_file_url3"),550)
				%>
						
						<% if isize(2) > 2000 then %>
							<a href="<%= rs("bbs_file_url3") %>" target="_blank"><img src="<%= rs("bbs_file_url3") %>" alt="<%= rs("bbs_file_name3") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
						<% else %>
							<img src="<%= rs("bbs_file_url3") %>" alt="<%= rs("bbs_file_name3") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
						<% end if %>

						<BR>
		<%End if%>
		
		<br>
				<%= content %>
			</div>
		</td>
	</tr>						
	<tr>
		<td height="2" colspan="2" bgcolor="4AB2E7"></td>
	</tr>
	
</table>
</center>
<br>

<map name="Map">
	<area shape="rect" coords="550,26,562,38" href="javascript:window.close();">
</map>


</body>
</html>
<%
set rsup = nothing
set rsdown = nothing
rs.close
set rs = nothing
db.close
set db = nothing
%>