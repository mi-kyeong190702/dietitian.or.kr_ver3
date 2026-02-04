<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->

<%
	
	'response.write Bs_sTag & Bs_cTag

%>
<script language="JavaScript">
	function popup_print(bc, idx){
		window.open("/board/printForm.asp?boardcode=" + bc + "&idx=" + idx ,"_C__ddddadsa_AAAAaAPPP","scrollbars=1,width=640,height=700,left=50,top=50");
	}
	function goRecomm(num){
		var frm = document.recommForm;
		frm.target = "recomm";
		frm.action = "/board/recomm.asp";
		frm.submit();
	}
</script>
<%

		if Bs_View = false then
			error("로그인 후 이용하시기 바랍니다")
		end if
					

		idx = request("idx")
		sql = "update "& Bs_TableName &" set bbs_view = bbs_view + 1 where bbs_idx =" & idx
'		response.write sql
		db.execute(sql)

		set rs = server.CreateObject("adodb.recordset")
		
		if boardcode = "35" or boardcode = "20" then
			
			bbs_bc = "'35' or bbs_board_code='20')"
			
			sql = "select bbs_step, bbs_user_id, bbs_m_number, bbs_file_name, bbs_file_url, bbs_file_type, bbs_file_size, bbs_file_down, bbs_file_name2, bbs_file_url2, bbs_file_type2, bbs_file_size2, bbs_file_down2, bbs_file_name3, bbs_file_url3, bbs_file_type3, bbs_file_size3, bbs_file_down3, bbs_file_name4, bbs_file_url4, bbs_file_type4, bbs_file_size4, bbs_file_down4, bbs_file_name5, bbs_file_url5, bbs_file_type5, bbs_file_size5, bbs_file_down5, bbs_pwd, bbs_category, bbs_name, bbs_email, bbs_subject, bbs_contents, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag, bbs_re_count, bbs_re_number, isnull(bbs_recomm,0) bbs_recomm from "
			sql = sql & Bs_TableName &" where (bbs_board_code = " & bbs_bc & " and bbs_idx = '" & idx & "'"
			

		else
			
			sql = "select bbs_step, bbs_user_id, bbs_m_number, bbs_file_name, bbs_file_url, bbs_file_type, bbs_file_size, bbs_file_down, bbs_file_name2, bbs_file_url2, bbs_file_type2, bbs_file_size2, bbs_file_down2, bbs_file_name3, bbs_file_url3, bbs_file_type3, bbs_file_size3, bbs_file_down3, bbs_file_name4, bbs_file_url4, bbs_file_type4, bbs_file_size4, bbs_file_down4, bbs_file_name5, bbs_file_url5, bbs_file_type5, bbs_file_size5, bbs_file_down5, bbs_pwd, bbs_category, bbs_name, bbs_email, bbs_subject, bbs_contents, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag, bbs_re_count, bbs_re_number, isnull(bbs_recomm,0) bbs_recomm from "
			sql = sql & Bs_TableName &" where bbs_board_code = '" & boardcode & "' and bbs_idx = '" & idx & "'"
		end If
		

		'response.write sql


		rs.open sql,db,0
		
		if rs.eof then
			rs.close
			set rs = nothing
			error("해당글이 존재하지 않습니다.")
		end if
		
		keyword				= trim(request("keyword"))
		where				= request("where")

		
		'------ 답글 삭제시 -1 점 체크 하는 부분 -----		

		if boardcode = 35 or boardcode = 20 or boardcode = 88 or boardcode = 91 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87 then
			bbs_step = Cint(rs("bbs_step"))
			
			stepStr = "&bbs_step=" & bbs_step

			'response.write stepStr & "<br>"
		end if

		'---------------------------------------------



		bbs_m_number	= rs("bbs_m_number")
		bbs_subject		= rs("bbs_subject")
		content				= rs("bbs_contents")
		bbs_name			= rs("bbs_name")
		bbs_category		= rs("bbs_category")
		bbs_view			= rs("bbs_view")
		bbs_email			= rs("bbs_email")
		bbs_pwd			= rs("bbs_pwd")
		bbs_recomm	    = rs("bbs_recomm")
		
		
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

'<!--추가 S  KSH-->
		If InStr(content, "&lt;") > 0 Then 
			content = Replace(content, "&lt;", "<")
		End If 
'<!--추가 E  KSH-->

		if instr(content,"<") = 0 then
			content = replace(content, chr(13)&chr(10),"<br>")
		end If
		
		If boardcode ="2" then
		'content = replace(content, chr(13)&chr(10),"<br>")
		End if
		
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

		if boardcode <> 93 then
			ViewUrl = replace(ListUrl, "index.asp", "view.asp")
		else
			ViewUrl = replace(ListUrl, "index2.asp", "view.asp")
		end if
		
		
		if request("WriteUrl") = "" then
			WriteUrl = "input.asp"
		else
			WriteUrl = request("WriteUrl")
		end if


%>
<br>
					<table width="583" border="0" cellspacing="0" cellpadding="0">
						<tr align="center" bgcolor="4AB2E7">
							<td height="2" colspan="8"></td>
						</tr>
						<tr bgcolor="#F7FBFF">
							<td height="28" class="board_04"><img src="/data/images/icon.gif" width="9" height="10">
								<strong><%= bbs_subject %></strong>
							</td>
							<%' If boardcode = "2" Then %>
							<td width="100" align="center" height="27" background="/images/board_bg01.gif"></td>
							<%' Else %>
							<!--<td width="100" align="center" height="27" background="/images/board_bg01.gif"><%= left(rs("bbs_reg_date_dt"),10) %></td>-->
							<%' End if %>
						</tr>
						<tr align="center" bgcolor="CAE6FC">
							<td height="2" colspan="8"></td>
						</tr>
					</table>
										


					<table cellpadding="0" cellspacing="0" width="583" border="0">
						<tr>
							<% If boardcode = "2" Then %>
								<% If ListUrl="/news/Notice2/index.asp" Then %>
								<td width="55" bgcolor="#F7FBFF" class="board_05">등록일</td>
								<td width="130" class="board_03"><%= left(rs("bbs_reg_date_dt"),10) %></td>					
								<td width="45" bgcolor="#F7FBFF" class="board_05">조회</td>
								<td width="70" class="board_03"><%= bbs_view %></td>
								<%else%>
								<td width="50" height="28" bgcolor="#F7FBFF" class="board_05">분류</td>
								<td width="75" class="board_03"><%= bbs_category %></td>
								<td width="55" bgcolor="#F7FBFF" class="board_05">등록일</td>
								<td width="130" class="board_03"><%= left(rs("bbs_reg_date_dt"),10) %></td>
								<td width="45" bgcolor="#F7FBFF" class="board_05">조회</td>
								<td width="70" class="board_03"><%= bbs_view %></td>
								<%End if%>
							<% ElseIf boardcode = "104" Then %>
							<form name=recommForm method=post>
								<input type=hidden name="ListUrl" value="<%=ListUrl%>">
								<input type=hidden name="page" value="<%=page%>">
								<input type=hidden name="boardcode" value="<%=boardcode%>">
								<input type=hidden name="idx" value="<%=idx%>">
							<td width="50" height="28" bgcolor="#F7FBFF" class="board_05">작성자</td>
							<td width="75" class="board_03"><%= bbs_name %></td>
							<td width="55" bgcolor="#F7FBFF" class="board_05">등록일</td>
							<td width="70" class="board_03"><%= left(rs("bbs_reg_date_dt"),10) %></td>						
							<td width="45" bgcolor="#F7FBFF" class="board_05">조회</td>
							<td width="70" class="board_03"><%= bbs_view %>&nbsp;&nbsp;
							<span style="align:right;" align="right"></td>
							<td width="45" bgcolor="#F7FBFF" class="board_05">추천수</td>
							<td width="130" class="board_03" valign=top><%= bbs_recomm %>&nbsp;&nbsp;
							<span style="align:right;" align="right"><input type="button" value="추천하기" onclick="goRecomm(<%=idx%>);"></span>
							</td>
							</form>
							<% Else %>
							<td width="50" height="28" bgcolor="#F7FBFF" class="board_05">작성자</td>
							<td width="75" class="board_03"><%= bbs_name %></td>
							<td width="55" bgcolor="#F7FBFF" class="board_05">등록일</td>
							<td width="130" class="board_03"><%= left(rs("bbs_reg_date_dt"),10) %></td>						
							<td width="45" bgcolor="#F7FBFF" class="board_05">조회</td>
							<td width="70" class="board_03"><%= bbs_view %></td>
							<% End if %>
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
											<% if isize(2) > 550 then %>
												<a href="<%= rs("bbs_file_url") %>" target="_blank"><img src="<%= rs("bbs_file_url") %>" alt="<%= rs("bbs_file_name") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
											<% else %>
												<img src="<%= rs("bbs_file_url") %>" alt="<%= rs("bbs_file_name") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
											<% end if %>
									<% end if %>
									
									<% 
										if rs("bbs_file_size") > 0 and instr("swf",rs("bbs_file_type")) > 0 then
											isize = image_size(rs("bbs_file_url"),500)
									%>
											<EMBED src="<%=rs("bbs_file_url") %>" loop="true" menu="false" quality="high" bgcolor="#FFFFFF" WIDTH="<%= isize(1) %>" HEIGHT="<%= isize(0) %>" NAME="File" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED><br>
									<% end if %>

							<!-- 첨부파일 2 -->

									<% 
										if rs("bbs_file_size2") > 0 and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type2")) > 0 then
											isize = image_size(rs("bbs_file_url2"),550)
									%>
											<% if isize(2) > 550 then %>
												<a href="<%= rs("bbs_file_url2") %>" target="_blank"><img src="<%= rs("bbs_file_url2") %>" alt="<%= rs("bbs_file_name2") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
											<% else %>
												<img src="<%= rs("bbs_file_url2") %>" alt="<%= rs("bbs_file_name2") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
											<% end if %>
									<% end if %>
									
									<% 
										if rs("bbs_file_size2") > 0 and instr("swf",rs("bbs_file_type2")) > 0 then
											isize = image_size(rs("bbs_file_url2"),500)
									%>
											<EMBED src="<%=rs("bbs_file_url2") %>" loop="true" menu="false" quality="high" bgcolor="#FFFFFF" WIDTH="<%= isize(1) %>" HEIGHT="<%= isize(0) %>" NAME="File" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED><br>

									<% end if %>

							<!-- 첨부파일 3 -->

									<% 
										if rs("bbs_file_size3") > 0 and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type3")) > 0 then
											isize = image_size(rs("bbs_file_url3"),550)
									%>
											<% if isize(2) > 550 then %>
												<a href="<%= rs("bbs_file_url3") %>" target="_blank"><img src="<%= rs("bbs_file_url3") %>" alt="<%= rs("bbs_file_name3") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
											<% else %>
												<img src="<%= rs("bbs_file_url3") %>" alt="<%= rs("bbs_file_name3") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
											<% end if %>
									<% end if %>
									
									<% 
										if rs("bbs_file_size3") > 0 and instr("swf",rs("bbs_file_type3")) > 0 then
											isize = image_size(rs("bbs_file_url3"),500)
									%>
											<EMBED src="<%=rs("bbs_file_url3") %>" loop="true" menu="false" quality="high" bgcolor="#FFFFFF" WIDTH="<%= isize(1) %>" HEIGHT="<%= isize(0) %>" NAME="File" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED><br>

									<% end if %>

							<!-- 첨부파일 4 -->

									<% 
										if rs("bbs_file_size4") > 0 and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type4")) > 0 then
											isize = image_size(rs("bbs_file_url4"),550)
									%>
											<% if isize(2) > 550 then %>
												<a href="<%= rs("bbs_file_url4") %>" target="_blank"><img src="<%= rs("bbs_file_url4") %>" alt="<%= rs("bbs_file_name4") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
											<% else %>
												<img src="<%= rs("bbs_file_url4") %>" alt="<%= rs("bbs_file_name4") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
											<% end if %>
									<% end if %>
									
									<% 
										if rs("bbs_file_size4") > 0 and instr("swf",rs("bbs_file_type4")) > 0 then
											isize = image_size(rs("bbs_file_url4"),500)
									%>
											<EMBED src="<%=rs("bbs_file_url4") %>" loop="true" menu="false" quality="high" bgcolor="#FFFFFF" WIDTH="<%= isize(1) %>" HEIGHT="<%= isize(0) %>" NAME="File" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED><br>

									<% end if %>

							<!-- 첨부파일 5 -->

									<% 
										if rs("bbs_file_size5") > 0 and instr("jpg,jpeg,gif,bmp,png,tiff,tif",rs("bbs_file_type5")) > 0 then
											isize = image_size(rs("bbs_file_url5"),550)
									%>
											<% if isize(2) > 550 then %>
												<a href="<%= rs("bbs_file_url5") %>" target="_blank"><img src="<%= rs("bbs_file_url5") %>" alt="<%= rs("bbs_file_name5") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"></a><br>
											<% else %>
												<img src="<%= rs("bbs_file_url5") %>" alt="<%= rs("bbs_file_name5") %>" height="<%= isize(0) %>" width="<%= isize(1) %>" border="0"><br>
											<% end if %>
									<% end if %>
									
									<% 
										if rs("bbs_file_size5") > 0 and instr("swf",rs("bbs_file_type5")) > 0 then
											isize = image_size(rs("bbs_file_url5"),500)
									%>
											<EMBED src="<%=rs("bbs_file_url5") %>" loop="true" menu="false" quality="high" bgcolor="#FFFFFF" WIDTH="<%= isize(1) %>" HEIGHT="<%= isize(0) %>" NAME="File" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED><br>

									<% end if %>
									<%= content %>
								</div>
							</td>
						</tr>
						<% 
							if rs("bbs_file_size") > 0 then
							
							
								select case rs("bbs_file_type")
									case "jpg"
										down="/board/pds_icon/jpg_w.gif"
									case "gif"  
										down="/board/pds_icon/gif_w.gif"
									case "txt"  
										down="/board/pds_icon/txt_w.gif"
									case "zip"  
										down="/board/pds_icon/zip_w.gif"
									case "rar"  
										down="/board/pds_icon/rar_w.gif"
									case "hwp"  
										down="/board/pds_icon/hwp_w.gif"
									case "exe"  
										down="/board/pds_icon/exe_w.gif"
									case "mp3"  
										down="/board/pds_icon/mp3_w.gif"
									case "doc"
										down="/board/pds_icon/doc_w.gif"
									case "ppt"
										down="/board/pds_icon/ppt_w.gif"
									case "xls" 
										down="/board/pds_icon/xls_w.gif"
									case "wav"  
										down="/board/pds_icon/wav_w.gif"
									case "htm"  
										down="/board/pds_icon/url_w.gif"
									case "html"  
										down="/board/pds_icon/url_w.gif"
									case else
										down="/board/pds_icon/default_w.gif"
								end select
						
						
						%>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 1</td>
							<td class="board_03" width="500">
								<a href="/board/download.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&seq=1">
								<img src="<%= down %>" height="16" width="16" border="0" align="absmiddle">
								<strong><%=rs("bbs_file_name")&"("& formatnumber(rs("bbs_file_size")/1024,0) & " KByte)"%></strong></a>
							</td>
						</tr>
						<% end if %>
						<%
							if rs("bbs_file_size2") > 0 then
							
							
								select case rs("bbs_file_type2")
									case "jpg"
										down="/board/pds_icon/jpg_w.gif"
									case "gif"  
										down="/board/pds_icon/gif_w.gif"
									case "txt"  
										down="/board/pds_icon/txt_w.gif"
									case "zip"  
										down="/board/pds_icon/zip_w.gif"
									case "rar"  
										down="/board/pds_icon/rar_w.gif"
									case "hwp"  
										down="/board/pds_icon/hwp_w.gif"
									case "exe"  
										down="/board/pds_icon/exe_w.gif"
									case "mp3"  
										down="/board/pds_icon/mp3_w.gif"
									case "doc"
										down="/board/pds_icon/doc_w.gif"
									case "ppt"
										down="/board/pds_icon/ppt_w.gif"
									case "xls" 
										down="/board/pds_icon/xls_w.gif"
									case "wav"  
										down="/board/pds_icon/wav_w.gif"
									case "htm"  
										down="/board/pds_icon/url_w.gif"
									case "html"  
										down="/board/pds_icon/url_w.gif"
									case else
										down="/board/pds_icon/default_w.gif"
								end select
						
						
						%>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 2</td>
							<td class="board_03" width="500">
								<a href="/board/download.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&seq=2">
								<img src="<%= down %>" height="16" width="16" border="0" align="absmiddle">
								<strong><%=rs("bbs_file_name2")&"("& formatnumber(rs("bbs_file_size2")/1024,0) & " KByte)"%></strong></a>
							</td>
						</tr>
						<% end if %>

						<%
							if rs("bbs_file_size3") > 0 then
							
							
								select case rs("bbs_file_type3")
									case "jpg"
										down="/board/pds_icon/jpg_w.gif"
									case "gif"  
										down="/board/pds_icon/gif_w.gif"
									case "txt"  
										down="/board/pds_icon/txt_w.gif"
									case "zip"  
										down="/board/pds_icon/zip_w.gif"
									case "rar"  
										down="/board/pds_icon/rar_w.gif"
									case "hwp"  
										down="/board/pds_icon/hwp_w.gif"
									case "exe"  
										down="/board/pds_icon/exe_w.gif"
									case "mp3"  
										down="/board/pds_icon/mp3_w.gif"
									case "doc"
										down="/board/pds_icon/doc_w.gif"
									case "ppt"
										down="/board/pds_icon/ppt_w.gif"
									case "xls" 
										down="/board/pds_icon/xls_w.gif"
									case "wav"  
										down="/board/pds_icon/wav_w.gif"
									case "htm"  
										down="/board/pds_icon/url_w.gif"
									case "html"  
										down="/board/pds_icon/url_w.gif"
									case else
										down="/board/pds_icon/default_w.gif"
								end select
						
						
						%>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 3</td>
							<td class="board_03" width="500">
								<a href="/board/download.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&seq=3">
								<img src="<%= down %>" height="16" width="16" border="0" align="absmiddle">
								<strong><%=rs("bbs_file_name3")&"("& formatnumber(rs("bbs_file_size3")/1024,0) & " KByte)"%></strong></a>
							</td>
						</tr>
						<% end if %>

						<%
							if rs("bbs_file_size4") > 0 then
							
							
								select case rs("bbs_file_type4")
									case "jpg"
										down="/board/pds_icon/jpg_w.gif"
									case "gif"  
										down="/board/pds_icon/gif_w.gif"
									case "txt"  
										down="/board/pds_icon/txt_w.gif"
									case "zip"  
										down="/board/pds_icon/zip_w.gif"
									case "rar"  
										down="/board/pds_icon/rar_w.gif"
									case "hwp"  
										down="/board/pds_icon/hwp_w.gif"
									case "exe"  
										down="/board/pds_icon/exe_w.gif"
									case "mp3"  
										down="/board/pds_icon/mp3_w.gif"
									case "doc"
										down="/board/pds_icon/doc_w.gif"
									case "ppt"
										down="/board/pds_icon/ppt_w.gif"
									case "xls" 
										down="/board/pds_icon/xls_w.gif"
									case "wav"  
										down="/board/pds_icon/wav_w.gif"
									case "htm"  
										down="/board/pds_icon/url_w.gif"
									case "html"  
										down="/board/pds_icon/url_w.gif"
									case else
										down="/board/pds_icon/default_w.gif"
								end select
						
						
						%>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 4</td>
							<td class="board_03" width="500">
								<a href="/board/download.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&seq=4">
								<img src="<%= down %>" height="16" width="16" border="0" align="absmiddle">
								<strong><%=rs("bbs_file_name4")&"("& formatnumber(rs("bbs_file_size4")/1024,0) & " KByte)"%></strong></a>
							</td>
						</tr>
						<% end if %>

						<%
							if rs("bbs_file_size5") > 0 then
							
							
								select case rs("bbs_file_type5")
									case "jpg"
										down="/board/pds_icon/jpg_w.gif"
									case "gif"  
										down="/board/pds_icon/gif_w.gif"
									case "txt"  
										down="/board/pds_icon/txt_w.gif"
									case "zip"  
										down="/board/pds_icon/zip_w.gif"
									case "rar"  
										down="/board/pds_icon/rar_w.gif"
									case "hwp"  
										down="/board/pds_icon/hwp_w.gif"
									case "exe"  
										down="/board/pds_icon/exe_w.gif"
									case "mp3"  
										down="/board/pds_icon/mp3_w.gif"
									case "doc"
										down="/board/pds_icon/doc_w.gif"
									case "ppt"
										down="/board/pds_icon/ppt_w.gif"
									case "xls" 
										down="/board/pds_icon/xls_w.gif"
									case "wav"  
										down="/board/pds_icon/wav_w.gif"
									case "htm"  
										down="/board/pds_icon/url_w.gif"
									case "html"  
										down="/board/pds_icon/url_w.gif"
									case else
										down="/board/pds_icon/default_w.gif"
								end select
						
						
						%>
						<tr>
							<td height="1" colspan="2" bgcolor="D6D7D6"></td>
						</tr>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_05">첨부파일 5</td>
							<td class="board_03" width="500">
								<a href="/board/download.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&seq=5">
								<img src="<%= down %>" height="16" width="16" border="0" align="absmiddle">
								<strong><%=rs("bbs_file_name5")&"("& formatnumber(rs("bbs_file_size5")/1024,0) & " KByte)"%></strong></a>
							</td>
						</tr>
						<% end if %>

						<tr>
							<td height="2" colspan="2" bgcolor="4AB2E7"></td>
						</tr>
					</table>
					
					<%
						if Bs_Comments And boardcode <>"83" And boardcode <>"4" And boardcode <>"6" then
					
								set rsc = server.CreateObject("adodb.recordset")
								sql = "select bbc_idx, bbc_user_id, bbc_name, bbc_contents, bbc_date from "& Bs_TableNameComments &" where bbs_idx = '"& idx &"' order by bbc_idx desc"
								rsc.Open sql,db,0
					%>		
					
					<table cellpadding="0" cellspacing="0" width="583" border="0" ID="Table2">
					<tr>
						<td width="83" height="28" bgcolor="#F7FBFF" class="board_03"><img src="/news/images/icon.gif" width="9" height="10"><span class="board_05"><strong> 의견쓰기 </strong></span></td>
						<td width="500" height="28" class="board_03 style5 style5 style5"> (100자 이내로 작성해주세요) </td>
					</tr>
					<tr align="center" bgcolor="CAE6FC">
						<td height="2" colspan="3"></td>
					</tr>
					<%
						do until rsc.EOF
					%>
					<tr>
						<td width="57" align="center"><%= rsc("bbc_name") %></td>
						<td width="449"><div style="word-break:break-all;padding:10"><%= replace(rsc("bbc_contents"),chr(13)&chr(10),"<br>") %></div></td>
						<td width="85">
										<%= left(rsc("bbc_date"),10) %>
										<% if (rsc("bbc_user_id") <> "" and rsc("bbc_user_id") = user_id) or UserLevel <= 2 then %>
										<a href="/board/cdel.asp?<%= request.QueryString %>&bbc_idx=<%= rsc("bbc_idx") %>&ViewUrl=<%=viewUrl%>"><img src="/images/butn_delete_s.gif" border="0"></a>
										<% end if %>
						</td>
					</tr>
					<tr>
						<td height="1" colspan="3" bgcolor="D6D7D6"></td>
					</tr>
					
					<%
							rsc.MoveNext
						loop
						rsc.close
						set rsc = nothing
					%>
					</table>
					

<!-- 댓글 달기 -->

<%If  boardcode ="4" then %>
					<script language="javascript">
					<!--
						function sendit() {
							var contents = document.inputForm.bbc_contents;
							if(contents.value.length == 0) {
								alert("내용을 꼭 쓰세요");
								contents.focus();
								return false;
							}
						}						
					//-->
					</script>
					<form action="/board/writeComments.asp" method="post" name="inputForm" onsubmit="return sendit();" ID="Form1">
						<input type="hidden" name="thisQuery" value="<%= request.QueryString %>" ID="Hidden1">
						<input type="hidden" name="idx" value="<%= idx %>" ID="Hidden7">
						<input type="hidden" name="ViewUrl" value="<%= request("url") %>" ID="Hidden2">
						<input type="hidden" name="boardcode" value="<%= boardcode %>">
					
					<table cellpadding="0" cellspacing="0" width="583" border="0" ID="Table5">
						
						<tr>
							<td width="61" class="board_02"><%= user_name %></td>
							<td width="406">
								<div style="padding:10">
									<textarea name="bbc_contents" rows="2" class="form1" style="width:90%;" ID="Textarea1"></textarea>
								</div>
							</td>
							<td width="88">
								<!--글입력버튼--><input type="image" SRC="/data/images/write1_btn.gif" ID="Image1" NAME="Image1">
							</td>
						</tr>
						<tr align="center" bgcolor="4AB2E7">
							<td height="2" colspan="3"></td>
						</tr>
					</table>
					
					</form>

<% Else %>			
							
					<script language="javascript">
					<!--
						function sendit() {
							var contents = document.inputForm.bbc_contents;
							if(contents.value.length == 0) {
								alert("내용을 꼭 쓰세요");
								contents.focus();
								return false;
							}
						}						
					//-->
					</script>
					<form action="/board/writeComments.asp" method="post" name="inputForm" onsubmit="return sendit();" ID="Form1">
						<input type="hidden" name="thisQuery" value="<%= request.QueryString %>" ID="Hidden1">
						<input type="hidden" name="idx" value="<%= idx %>" ID="Hidden7">
						<input type="hidden" name="ViewUrl" value="<%= request("url") %>" ID="Hidden2">
						<input type="hidden" name="boardcode" value="<%= boardcode %>">
					
					<table cellpadding="0" cellspacing="0" width="583" border="0" ID="Table5">
						
						<tr>
							<td width="61" class="board_02"><%= user_name %></td>
							<td width="406">
								<div style="padding:10">
									<textarea name="bbc_contents" rows="2" class="form1" style="width:90%;" ID="Textarea1"></textarea>
								</div>
							</td>
							<td width="88">
								<!--글입력버튼--><input type="image" SRC="/data/images/write1_btn.gif" ID="Image1" NAME="Image1">
							</td>
						</tr>
						<tr align="center" bgcolor="4AB2E7">
							<td height="2" colspan="3"></td>
						</tr>
					</table>
					
					</form>
<%End if%>
<!-- 댓글 달기 -->

					<%
								
						end if



						if boardcode = 67 then
							categoryStr = " and bbs_category = '" & category & "'"
						else
							categoryStr = ""
						end if




						
						keyword = replace(trim(request("keyword")),"'","''")
						
						sql = "select top 1 bbs_idx, bbs_name, bbs_subject from "& Bs_TableName &" where bbs_board_code = '"& boardcode &"' "
						
						if keyword <> "" then
							where = request("where")
							select case where
								case "name"
									whereQuery = "bbs_name"
								case "subject"
									whereQuery = "bbs_subject"
								case "content"
									whereQuery = "bbs_contents"
								case ""
									subject_check = "checked"
							end select
							sql = sql & " and "& whereQuery &" like '%"& keyword &"%'"
						end if

						'''''''''''''''''''''''''''''''''''''''' / 이전 글 / '''''''''''''''''''''''''''''''''''''''''''''

						sql = sql & categoryStr & " and bbs_m_number > "& bbs_m_number &" and bbs_del_flag = 0 order by bbs_m_number "
						set rsup = db.execute(sql)



						'''''''''''''''''''''''''''''''''''''''' / 다음 글 / '''''''''''''''''''''''''''''''''''''''''''''
						
						sql = "select top 1 bbs_idx, bbs_name, bbs_subject from "& Bs_TableName &" where bbs_board_code = '"& boardcode &"' "
						if keyword <> "" then
							sql = sql & " and "& whereQuery &" like '%"& keyword &"%' "
						end if
						sql = sql & categoryStr & " and bbs_m_number < "& bbs_m_number &" and bbs_del_flag = 0 order by bbs_m_number desc"
						set rsdown = db.execute(sql)
						
						
					%>
					<br>
					<table cellpadding="0" cellspacing="0" width="583" border="0">
						<tr>
							<td height="1" colspan="2" bgcolor="4AB2E7"></td>
						</tr>
					<% if rsdown.eof = false then %>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_03"><img src="/news/images/icon.gif" width="9" height="10"><span class="board_05"> 이전글 </span></td>
							<td width="500" height="28" class="board_03"><a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= request("page") %>&idx=<%= rsdown("bbs_idx") %>" class="board_03"><%= rsdown("bbs_subject") %></a></td>
						</tr>
						<tr>
							<td height="1" colspan="2" bgcolor="4AB2E7"></td>
						</tr>
					<% end if %>
					
					<% if rsup.eof = false then %>
						<tr>
							<td width="83" height="28" bgcolor="#F7FBFF" class="board_03"><img src="/news/images/icon.gif" width="9" height="10"><span class="board_05"> 다음글</span></td>
							<td width="500" height="28" class="board_03"><a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= request("page") %>&idx=<%= rsup("bbs_idx") %>" class="board_03"><%= rsup("bbs_subject") %></a></td>
						</tr>
						
					<% end if %>
						<tr>
							<td height="1" colspan="2" bgcolor="4AB2E7"></td>
						</tr>
						<tr align="center" bgcolor="F7F7F7">
							<td height="10" colspan="2"></td>
						</tr>
					</table>
					
					<table cellpadding="0" cellspacing="0" width="578" border="0">
						<tr>
							<td height="50">
								<!-- 인쇄버튼 -->
								<a href="javascript:popup_print('<%= boardcode %>','<%= idx %>')"><IMG SRC="/news/images/print_btn.gif"></a>
							</td>
							<td align="right">
							<% if boardcode=67 then %>
								<a href="<%= ListUrl %>?boardcode=<%= boardcode %>&category=<%=category%>&where=<%= request("where") %>&keyword=<%= request("keyword") %>&page=<%= request("page") %>"><IMG SRC="/news/images/list_btn.gif" BORDER="0"></a>
							<%else%>
								<a href="<%= ListUrl %>?boardcode=<%= boardcode %>&where=<%= request("where") %>&keyword=<%= request("keyword") %>&page=<%= request("page") %>"><IMG SRC="/news/images/list_btn.gif" BORDER="0"></a>
							<%end if%>
							<!-- 교육 공지사항view 에서는 글쓰기,답변,수정 안되도록 막음 KSH-->
							<%If ListUrl="/news/Notice2/index.asp" Then %>
							<%else%>
								<% if Bs_Write then %>
								<!-- 답변버튼 -->
								<a href="<%= WriteUrl %>?boardcode=<%= boardcode %>&ListUrl=<%= ListUrl %>"><IMG SRC="/news/images/write_btn.gif"></a>&nbsp;&nbsp;
								<a href="<%= WriteUrl %>?boardcode=<%= boardcode %>&mode=reply&idx=<%= idx %>&page=<%= request("page") %>&ListUrl=<%= ListUrl %>"><IMG SRC="/news/images/re_btn.gif" BORDER="0"></a>
								<% end if %>


								<% if (rs("bbs_user_id") <> "" and user_id = rs("bbs_user_id")) or UserLevel <= 2 then %>
								<a onfocus="blur();" href="<%= WriteUrl %>?boardcode=<%= boardcode %>&mode=modify&idx=<%= idx %>&ListUrl=<%= ListUrl %>&page=<%=request("page")%>"><IMG SRC="/news/images/edit_btn.gif" BORDER="0"></a>&nbsp;&nbsp;
								<a onfocus="blur();" href="/board/del.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&ListUrl=<%= ListUrl %><%=stepStr%>"><IMG SRC="/news/images/delete_btn.gif" BORDER="0"></a>
								<% elseif bbs_pwd <> "" and Bs_Write then %>
							
								<a onfocus="blur();" href="InputPassword.asp?WriteUrl=<%= WriteUrl %>&boardcode=<%= boardcode %>&mode=modify&idx=<%= idx %>&ListUrl=<%= ListUrl %>"><IMG SRC="/news/images/edit_btn.gif" BORDER="0"></a>&nbsp;&nbsp;
								<!--<a onfocus="blur();" href="/board/del.asp?boardcode=<%= boardcode %>&idx=<%= idx %>&ListUrl=<%= ListUrl %><%=stepStr%>"><IMG SRC="/news/images/delete_btn.gif" BORDER="0"></a>-->
									<a onfocus="blur();" href="InputPassword.asp?mode=del&boardcode=<%= boardcode %>&idx=<%= idx %>&ListUrl=<%= ListUrl %>"><IMG SRC="/news/images/delete_btn.gif" BORDER="0"></a>
								
								<% end if %>
							<%end if%>
							</td>
						</tr>
					</table>
					<iframe name="recomm" width=0 height=0></iframe>
					<br>
					<br>
					<br>
					
					
<%
set rsup = nothing
set rsdown = nothing
rs.close
set rs = nothing
db.close
set db = nothing
%>