<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%

	if Bs_Write = false then
		error("글 작성권한이 없습니다.")
	end if
	
	bbs_name = user_name

	if request("mode") = "reply" then

		set rs = server.CreateObject("adodb.recordset")
		sql = "select bbs_subject, bbs_contents from "& Bs_TableName &" where bbs_idx="& request("idx")
		rs.open sql,db,0
		re_subject_vc = "답변: "&rs(0)

		re_content_t = "┼───────▽ 원본글 ─────────"&chr(13)&chr(10)&chr(13)&chr(10)&rs(1)&chr(13)&chr(10)&chr(13)&chr(10)&"─────────────────────┼"
		re_content_t = chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&chr(13)&chr(10)&re_content_t
		rs.close
		set rs = nothing
		
	elseif request("mode") = "modify" then
	
		set rs = server.CreateObject("adodb.recordset")
		sql = "select bbs_user_id, bbs_file_name, bbs_pwd, bbs_category, bbs_name, bbs_email, bbs_subject, bbs_contents from "& Bs_TableName &" where bbs_idx = "& request("idx")
		rs.open sql,db,0
		
		re_email_vc		= rs("bbs_email")
		re_subject_vc		= rs("bbs_subject")
		re_content_t		= rs("bbs_contents")
		bbs_file_name		= rs("bbs_file_name")
		bbs_pwd			= rs("bbs_pwd")
		bbs_category		= Rs("bbs_category")
		bbs_name			= rs("bbs_name")

		pwd					= Request.Form("pwd")
		if (rs("bbs_user_id") = "" or rs("bbs_user_id") <> user_id) and UserLevel > 2 then
			if pwd = "" or bbs_pwd = "" or pwd <> bbs_pwd then
				rs.close
				set rs = nothing
				error("글 수정 권한이 없습니다.")
			end if
		end if

		readonly = "readonly"
		re_content_t = replace(re_content_t,"<X-","<")
		re_subject_vc = replace(re_subject_vc,"<X-","<")
		re_subject_vc = replace(re_subject_vc, chr(34),"&#34;")
		
		if instr(re_content_t,"<") > 0 then
			tagChecked = "checked"
		end if
		rs.close
		set rs = nothing

	end if

	ListUrl = Request("listurl")
	if ListUrl = "" then
		ListUrl = "index.asp"
	end if

%>

<script language="JavaScript">
<!--

function start_upload() {
	var name		= document.inputForm.bbs_name;
	var subject		= document.inputForm.bbs_subject;
	var contents	= document.inputForm.bbs_contents;
	
	
	if(name.value.length == 0) {
		alert("이름을 꼭 써주셔야 합니다.");
		name.focus();
		return false;
	}
	
	if(subject.value.length == 0) {
		alert("제목을 꼭 써주셔야 합니다.");
		subject.focus();
		return false;
	}
	
	if(contents.value.length == 0) {
		alert("내용을 꼭 써주셔야 합니다.");
		contents.focus();
		return false;
	}
	
	st_upload.style.display = "block";
}

function popup_preview(){
	document.inputForm.action = "/board/preview.asp"
	document.inputForm.submit();
}

//-->
</script>



<div id="st_upload" style="display:none; position:absolute; left:30%; top:30%; width:434px; height:86px; z-index:1; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;">
	<p>자료를 UPLOAD 중입니다.</p>
	<p>첨부파일이 있을경우 시간이 오래걸릴수 있습니다.</p>
	<p>&nbsp;</p>
	<p align="center">대한 영양사 협회</p>
</div>
					<form name="inputForm" method="post" action="/board/write_ok.asp" enctype="multipart/form-data" ID="Form2" onsubmit="return start_upload();">

						<input type="hidden" name="boardcode" value="<%= boardcode %>" ID="Hidden5">
						<input type="hidden" name="mode" value="<%=request("mode")%>" ID="Hidden6">
						<input type="hidden" name="idx" value="<%=request("idx")%>" ID="Hidden7">
						<input type="hidden" name="ListUrl" value="<%= request("listurl") %>" ID="Hidden9">
						<input type="hidden" name="dietitian_ssn" value="<%= Request.Cookies("dietitian")("user_ssn") %>">
					<br>
					<table cellpadding="0" cellspacing="0" width="583" border="0" ID="Table7">
						<tr align="center" bgcolor="4AB2E7">
							<td height="2" colspan="2"></td>
						</tr>
						<tr align="center" bgcolor="CAE6FC">
							<td height="2" colspan="2"></td>
						</tr>
						<tr>
							<td width="90" height="28" bgcolor="#F7FBFF" class="board_05">제 목</td>
							<td>
								<span class="board_03"><input type="text" name="bbs_subject" class="form1" style="width:90%;" value="<%= re_subject_vc %>" ID="Text1"></span>
							</td>
						</tr>
						<tr align="center" bgcolor="D6D7D6">
							<td height="1" colspan="2"></td>
						</tr>
						<tr>
							<td width="90" height="28" bgcolor="#F7FBFF" class="board_05">이 름</td>
							<td>
								<span class="board_03"><input type="text" name="bbs_name" value="<%= bbs_name %>" class="form1" style="width:50%;"></span>
							</td>
						</tr>
						<tr align="center" bgcolor="D6D7D6">
							<td height="1" colspan="2"></td>
						</tr>
						<tr>
							<td width="90" height="28" bgcolor="#F7FBFF" class="board_05">이메일</td>
							</td>
							<td>
								<span class="board_03"><input name="bbs_email" type="text" class="form1" style="width:50%;" value="<%= re_email_vc %>" ID="Text3"> <% if Bs_cTag then %>
								HTML<input name="bbs_tag" type="checkbox" value="1" style="cursor:hand;" <%= tagChecked %> />
								<% end if %></span>
							</td>
						</tr>
						<% if bs_category then %>
						<tr align="center" bgcolor="D6D7D6">
							<td height="1" colspan="2"></td>
						</tr>
						<tr>
							<td width="90" height="28" bgcolor="#F7FBFF" class="board_05">자료구분</td>
							</td>
							<td width="493" height="27">
								<span class="board_03">
								<select NAME="bbs_category">
								<% 
									for each b in Bs_CategoryType 
									if b = bbs_category then
										selected = "selected"
									else
										selected = ""
									end if
								%>
									<option value="<%= b %>" <%= selected %> ><%= b %></option>
								<% next %>
								</select>
								</span>
							</td>
						</tr>
						<% end if %>
						<tr align="center" bgcolor="D6D7D6">
							<td height="1" colspan="2"></td>
						</tr>
						<tr>
							<td width="90" height="28" bgcolor="#F7FBFF" class="board_05">내 용 </td>
							</td>
							<td class="board_03">
								<textarea name="bbs_contents" class="form1" rows="15" style="width:90%;" ID="Textarea1"><%= re_content_t %></textarea><BR>
								<BR>
							</td>
						</tr>
						
						<% if request("mode") = "modify" and bbs_file_name <> "" then %>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td height="32">&nbsp;&nbsp;&nbsp;<b>파일삭제</b></td>
							<td><font color="blue"><%= bbs_file_name %></font> 을 <font color="red"><b>삭제</b></font><input type="checkbox" name="delfile" value="T" onfocus="blur();" style="cursor:hand;" ID="Checkbox2"></td>
						</tr>
						<tr>
							<td height="32"></td>
							<td>파일 첨부가 있을경우 기존파일은 <font color="red">삭제</font>됩니다.</td>
						</tr>
						<% end if %>
						<% if Bs_Pds then %>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 1</td>
							<td><span class="board_03"><input name="file_name" type="file" ID="File1" class="form1" style="width:90%;"></span></td>
						</tr>
						<!--tr>
							<td height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 2</td>
							<td><span class="board_03"><input name="file_name2" type="file" ID="File1" class="form1" style="width:90%;"></span></td>
						</tr>
						<tr>
							<td height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 3</td>
							<td><span class="board_03"><input name="file_name3" type="file" ID="File1" class="form1" style="width:90%;"></span></td>
						</tr-->
						<% end if %>
						
						<% if UserLevel > 5 then %>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td height="28" bgcolor="#F7FBFF" class="board_05">비밀번호</td>
							<td><span class="board_03">
								<input type="password" ID="bbs_pwd" NAME="bbs_pwd" value="<%= bbs_pwd %>" <%= readonly %> class="form1" size="12"></span>
							</td>
						</tr>
						<% end if %>
						<tr>
							<td height="2" colspan="2" bgcolor="D6D7D6"></td>
						</tr>                
						<tr align="center" bgcolor="F7F7F7">
							<td height="10" colspan="2"></td>
						</tr>
					</table>
					<br>

					<table width="583" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="59" height="20"><!--a href="javascript:popup_preview()"--><img src="/news/images/view_btn.gif" width="70" height="20"><!--/a--></td>
							<td width="524" align="right">
								<input type="image" src="/news/images/ok_btn.gif" ID="Image1" NAME="Image1">
								<!--/기존
								<a href="<%= ListUrl %>?boardcode=<%=boardcode%>">
								-->
								<a href="javascript:history.back();"><img src="/news/images/cancel_btn.gif" width="50" height="20"></a>
							</td>
						</tr>
					</table>


					</form>
					<!--/board-->
					<!--/contents-->
					<BR>
					<BR>
					<BR>
					<BR>
					<BR>
					<BR>
					<BR>
<%
	db.close
	set db = nothing
%>