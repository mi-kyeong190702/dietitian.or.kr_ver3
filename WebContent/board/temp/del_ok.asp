<% Option Explicit %>
<% response.buffer = true %>

<%'-----------------------------------------------------------------
'		개 발 자 : 이노(inno)
'		타 이 틀 : INNO BOARD Ver 2.0
'		전자우편 : info@innoya.com
'		홈페이지 : http://www.innoya.com/
'-------------------------------------------------------------------%>


<!-- #include file="../inc/license.inc" -->
<!-- #include file="../inc/dbinfo.asp" -->
<!-- #include file="../inc/info_tb.asp" -->
<!-- #include file="../inc/joint.asp" -->



<%
	
	dim num,mode,form_pin,id,re,resame,reid,updatesql,sql2,mem_auth,reply_ok
	dim filename1,filename2,filename3,filename4,fs,po_write,po_comment
	
	page = Request.QueryString("page")
	mode = Request.QueryString("mode")
	
	call f_member
			
	
	dim cart_num

	if mode="del_cart" and Request.Form("cart")="" then Response.Redirect "../inc/error.asp?no=3"
	if mode="del_cart" then
		if session("admin") <> admin_name then Response.Redirect "../inc/error.asp?no=4&h_url="&h_url
		cart_num = Request.Form("cart").count
	else
		cart_num = 1
	end if

	i=1
	Do until i > cart_num
	
	if mode="del_cart" then
		num = Request.Form("cart")(i)
		
		SQL="SELECT pin FROM "&tb&" where num="&num
		Set rs = db.Execute(SQL)
		
		form_pin = rs(0)
	else
		num = Request.QueryString("num")
		
		if session("id") <> "" and Request.QueryString("mem") = "ok" then
			SQL="SELECT id,pin FROM "&tb&" where num="&num
			Set rs = db.Execute(SQL)
		
			if session("id") <> rs(0) and session("admin") <> admin_name then Response.Redirect "../inc/error.asp?no=4&h_url="&h_url
			form_pin = rs(1)
		else
			form_pin = Request.Form("form_pin")
		end if
	end if
			

	SQL = "SELECT id,filename1,filename2,filename3,filename4,re,resame,reid,mem_auth FROM " & tb & " where num = " & num & " and pin = '"& form_pin &"'"
    Set rs = db.execute(SQL)
    
	if rs.EOF or rs.BOF then Response.Redirect "../inc/error.asp?no=2"
	
	id = rs("id")
	mem_auth = rs("mem_auth")

	filename1 = rs("filename1")
	If filename1 <> "" Then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
			filename1 = Server.MapPath("..")&"\files\"&tb&"\"&filename1		
			fs.DeleteFile(filename1)									
		set fs = Nothing
	End If
		
	filename2 = rs("filename2")
	If filename2 <> "" Then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
			filename2 = Server.MapPath("..")&"\files\"&tb&"\"&filename2		
			fs.DeleteFile(filename2)									
		set fs = Nothing
	End If
	
	filename3 = rs("filename3")
	If filename3 <> "" Then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
			filename3 = Server.MapPath("..")&"\files\"&tb&"\"&filename3		
			fs.DeleteFile(filename3)									
		set fs = Nothing
	End If
	
	filename4 = rs("filename4")
	If filename4 <> "" Then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
			filename4 = Server.MapPath("..")&"\files\"&tb&"\"&filename4		
			fs.DeleteFile(filename4)									
		set fs = Nothing
	End If
	
	re = rs("re")
    resame = rs("resame")
    reid = rs("reid")
    
	
	
	SQL="SELECT * FROM "&tb&" where re="&re&" and resame > "&resame&" and reid > "&reid
	Set rs = db.Execute(SQL)
	
	if not rs.EOF then '현재 지우려는 글에 답변글이 있을경우..

		SQL="SELECT * FROM "&tb&" where re="&re&" and resame > "&resame&" and reid = "&reid+1
		Set rs=db.Execute(SQL)

		if not rs.EOF then
		
			dim del_name
			
			if session("id")="admin" then
				del_name="관리자"
			else
				del_name="작성자"
			end if

			UPDATESQL = "UPDATE "&tb&" set email = ''"
			UPDATESQL = UPDATESQL & ", url = ''"
			UPDATESQL = UPDATESQL & ", title = '"&del_name&"에 의해 글이 삭제되었습니다.'"
			UPDATESQL = UPDATESQL & ", content = '이 글은 "&del_name&"에 의해 글이 삭제되었습니다.<br>&nbsp;<br>아래에 답변글이 있었기 때문에 완전삭제가 되지 않았음을 알려드립니다.'"
			UPDATESQL = UPDATESQL & ", filename1 = ''"
			UPDATESQL = UPDATESQL & ", filename2 = ''"
			UPDATESQL = UPDATESQL & ", filename3 = ''"
			UPDATESQL = UPDATESQL & ", filename4 = ''"
			UPDATESQL = UPDATESQL & ", filesize1 = ''"
			UPDATESQL = UPDATESQL & ", filesize2 = ''"
			UPDATESQL = UPDATESQL & ", filesize3 = ''"
			UPDATESQL = UPDATESQL & ", filesize4 = ''"
			UPDATESQL = UPDATESQL & ", i_width1 = 0"
			UPDATESQL = UPDATESQL & ", i_height1 = 0"
			UPDATESQL = UPDATESQL & ", i_width2 = 0"
			UPDATESQL = UPDATESQL & ", i_height2  = 0"
			UPDATESQL = UPDATESQL & ", i_width3 = 0"
			UPDATESQL = UPDATESQL & ", i_height3 = 0"
			UPDATESQL = UPDATESQL & ", i_width4 = 0"
			UPDATESQL = UPDATESQL & ", i_height4 = 0"
			UPDATESQL = UPDATESQL & " where num =  " & num

			db.Execute UPDATESQL
			
			reply_ok=1
	
		end if
	
	else '현재 지우려는 글에 답변글이 없을경우..
		
	reply_ok=0
	
	UPDATESQL = "Update " & tb & " Set reid = reid-1 where  re = " & re & " and reid > " & reid
	db.Execute UPDATESQL
	
	SQL2 = "DELETE FROM " & tb & " where num ="&num
	db.Execute SQL2
	
	end if

		
				
	if mem_auth > 0 then
		
		sql = "select po_write,po_comment from member where id='"&id&"'"
		Set rs= db.Execute(sql)
				
		po_write=rs(0)
		po_comment=rs(1)
		
		if reply_ok <> 1 and po_write > 0 then
		
		SQL2 = "Select reid from "&tb&" where num="&num
		set rs2=db.execute(sql2)
		
		if reid = 0 then		
			SQL = "Update member set po_write=po_write-1,point=point-"&w_point&" where id='"&id&"'"
		else
			SQL = "Update member set po_write=po_write-1,point=point-"&r_point&" where id='"&id&"'"
		end if
			db.execute SQL
			
		rs2.close
		set rs2=nothing
		
		end if
	end if
	
		dim j,com_count,com_name,rs2
		sql = "select count(com_num) from inno_comment where com_num=" & num
		Set rs= db.Execute(sql)
	
		com_count=rs(0)
		

		j=1
		Do until j > com_count
		
		SQL2 = "SELECT com_mem_id FROM inno_comment where com_num=" & num &" and com_id="&j
		Set rs2= db.Execute(sql2)
		
		if rs2(0) <> "" and po_comment > 0 then
			SQL = "Update member set po_comment=po_comment-1,point=point-"&c_point&" where id='"&rs2(0)&"'"
			db.execute SQL
		end if 
		
		j=j+1
		loop
		
		SQL2 = "DELETE FROM inno_comment where tb='"&tb&"' and com_num=" & num
		db.Execute SQL2
	

	i=i+1
	loop

	
	if level_select=1 then
		call point_up
	end if
	
	rs.Close
	db.Close
	Set rs = Nothing
	Set db = Nothing
	
	
	Response.Redirect "list.asp?tb="&tb
%>