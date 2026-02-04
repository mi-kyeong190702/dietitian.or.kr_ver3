<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>
<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->

<%
	function word(Str)		'따옴표 제거
		if xup.IsItem(Str) = 1 then
			Str = xup(Str)
			Str = replace(Str, "'", "''")
			word = Str
		else
			word = ""
		end if
	End function
	
	
	Server.ScriptTimeout = 3000
	set xup = Server.CreateObject("UpDownExpress.FileUpload")
	xup.InitControl
	boardcode = word("boardcode")
%>
<!--#include virtual="/board/_BoardSettings.asp" -->
<%	
	
	if Bs_Write = false then
		set xup = nothing
		error("글 작성권한이 없습니다.")
	end if
	
	ListUrl = word("ListUrl")
	
	
	
	function notag(Str)
		Str = replace(Str, "<","<X-")
		notag = Str
	end function
	
	Function notag2(Str)
		Str = replace(Str, "&lt;", "&lT;")
		Str = replace(Str,"<X-","&lt;")
		notag2 = Str
	end Function
	
	function lifetag(Str)
		Tag_temp = "a font center p b i u h img t div strong !-- embed"
		Tag_u = split(ucase(Tag_temp)," ")
		Tag_l = split(lcase(Tag_temp)," ")
		for i = 0 to ubound(Tag_u)
			Str = replace(Str,"<X-"&Tag_u(i),"<"&Tag_u(i))
			Str = replace(Str,"<X-"&Tag_l(i),"<"&Tag_l(i))
			Str = replace(Str,"<X-/"&Tag_u(i),"</"&Tag_u(i))
			Str = replace(Str,"<X-/"&Tag_l(i),"</"&Tag_l(i))
		next
		lifetag = Str
	end function
	
	idx				= word("idx")	
	bbs_Pwd		= word("bbs_pwd")
	bbs_name		= word("bbs_name")
	bbs_email		= word("bbs_email")
	bbs_category	= word("bbs_category")
	bbs_option		= word("bbs_option")
	bbs_subject	= word("bbs_subject")
	bbs_contents	= word("bbs_contents")
	
	
	bbs_subject	= notag(bbs_subject)
	bbs_contents	= notag(bbs_contents)
	bbs_user_ip	= Request.ServerVariables("REMOTE_ADDR")
	dietitian_ssn	= word("dietitian_ssn")
	
	
	if bbs_name = "" then
		bbs_name = User_name
	end if
	
	
	if word("bbs_tag") = "1" then
		if Bs_sTag then
			bbs_subject = lifetag(bbs_subject)
		end if
		if Bs_cTag then
			bbs_contents = lifetag(bbs_contents)
		end if
	else
		bbs_subject = notag2(bbs_subject)
		bbs_contents = notag2(bbs_contents)
	end if

	
	if trim(bbs_subject) = "" then
		bbs_subject = "- 제목이 없는 글입니다. -"
	end if
	
	
	
	mode = word("mode")
	if mode = "new" or mode = "" then
		set rs = server.CreateObject("adodb.recordset")
		sql = "select min(bbs_m_number) from "& Bs_TableName
		rs.open sql,db,0
		bbs_m_number_t = int(rs(0))
		bbs_m_number = bbs_m_number_t - 1
		bbs_step = 1
		bbs_re_number = 0
		rs.close
		set rs = nothing
	elseif mode = "reply" and idx <> "" then
		set rs = server.CreateObject("adodb.recordset")
		sql = "select bbs_m_number, bbs_step from "& Bs_TableName &" where bbs_idx = "& idx
		rs.open sql,db,0
		
		bbs_m_number_t = rs("bbs_m_number")
		bbs_m_number = bbs_m_number_t + 0.01
		bbs_step = rs("bbs_step") + 1
		bbs_re_number = idx
		
		sql = "update "& Bs_TableName &" set bbs_m_number = bbs_m_number + 0.01 where bbs_m_number > "& rs("bbs_m_number") &" and bbs_m_number < "& int(rs("bbs_m_number")) + 1
		db.execute(sql)

		sql = "update "& Bs_TableName &" set bbs_re_count = bbs_re_count + 1 where bbs_idx= "& idx
		db.execute(sql)
		
		rs.close
		set rs = nothing
	elseif mode = "modify" and idx <> "" then
		set rs = server.CreateObject("adodb.recordset")
		sql = "select bbs_user_id, bbs_file_name, bbs_file_url, bbs_file_type, bbs_file_size, bbs_file_down, bbs_pwd from "& Bs_TableName &" where bbs_idx = "& idx
		rs.open sql,db,0
		
		if rs.eof then
			rs.close
			set rs = nothing
			set xup = nothing
			error("잘못된 호출")
		end if
		
		
		
		pwd = word("bbs_pwd")
		
		if (rs("bbs_user_id") = "" or rs("bbs_user_id") <> user_id) and UserLevel > 2 then
			if pwd = "" or rs("bbs_pwd") = "" or pwd <> rs("bbs_pwd") then
				rs.close
				set rs = nothing
				set xup = nothing
				error("글 수정 권한이 없습니다.")
			end if
		end if

		
		file_name	= rs("bbs_file_name")
		file_url		= rs("bbs_file_url")
		file_type		= rs("bbs_file_type")
		file_size		= rs("bbs_file_size")
	
		
		if xup.IsItem("delfile") = 1 then
			if trim(file_url) <> "" then
				if xup.IsFileExist(file_url) = true then
					xup.DeleteFile(file_url)
				end if
				file_name	= ""
				file_url		= ""
				file_type		= ""
				file_size		= 0
				file_down	= 0
			end if
		end if
		
		rs.close
		set rs = nothing
	else
		set xup = nothing
		db.close
		set db = nothing
		response.Redirect("list.asp?boardcode="& boardcode )
		response.End()
	end if
	
	
	nowTime = year(now)&GetNumber(month(now))&GetNumber(day(now))&GetNumber(hour(now))&GetNumber(minute(now))&GetNumber(second(now)) 	' 현재시간..

	up_dir = "/board/file/"& boardcode &"/"
	
	
	set fs = Server.CreateObject("Scripting.FileSystemObject")
	if fs.FolderExists(Server.MapPath(up_dir)) = false then
		fs.CreateFolder(Server.MapPath(up_dir))
	end if
	set fs = nothing
	
	'if xup.IsFileExist(up_dir) = false then
	'	xup.MakeDir(up_dir)
	'end if

	if xup.IsItem("file_name") = 1 then
		if mode = "modify" then
			if trim(file_url) <> "" then
				if xup.IsFileExist(file_url) = true then
					xup.DeleteFile(file_url)
				end if
				file_name = ""
				file_url = ""
				file_type = ""
				file_size = 0
				file_down = 0
			end if
		end if
		
		if Bs_Pds = false then
			set xup = nothing
			error("현재 게시판은 자료실이 아닙니다. \n\n 파일 업로드를 하실수 없습니다.")
		end if
		
		file_name		= lcase(xup.Attachments("file_name").FileName)
		file_size			= xup.Attachments("file_name").size
		
		file_type0		= split(file_name,".")
		file_type			= file_type0(ubound(file_type0))
		file_life_type	= split("jpg,jpeg,gif,bmp,png,swf,tiff,tif,mpg,mpeg,avi,asf,wma,wmv,rm,ra,mp3",",")
		fileFlag			= "F"

		for i = 0 to ubound(file_life_type)
			if file_type = file_life_type(i) then
				fileFlag = "T"
			end if
		next

		if fileFlag = "T" then
			file_url = up_dir & session.SessionID & nowTime & "." & file_type
		else
			file_url = up_dir & session.SessionID & nowTime
		end if

		xup.Attachments("file_name").SaveFile file_url
	else
		if mode <> "modify" then
			file_name = ""
			file_url = ""
			file_type = ""
			file_size = 0
		end if
	end if


	
	

	if mode <> "modify" then
	
		sql = "insert into "& Bs_TableName &"("
		sql = sql & "bbs_user_id, "
		sql = sql & "bbs_board_code, "
		sql = sql & "bbs_m_number, "
		sql = sql & "bbs_step, "
		sql = sql & "bbs_file_name, "
		sql = sql & "bbs_file_url, "
		sql = sql & "bbs_file_type, "
		sql = sql & "bbs_file_size, "
		sql = sql & "bbs_pwd, "
		sql = sql & "bbs_category, "
		sql = sql & "bbs_name, "
		sql = sql & "bbs_email, "
		sql = sql & "bbs_option, "
		sql = sql & "bbs_subject, "
		sql = sql & "bbs_contents, "
		sql = sql & "bbs_user_ip, "
		sql = sql & "bbs_re_number"
		sql = sql & ") values('"
		sql = sql & user_id				&"', '"
		sql = sql & boardcode			&"', '"
		sql = sql & bbs_m_number	&"', '"
		sql = sql & bbs_step			&"', '"
		sql = sql & file_name			&"', '"
		sql = sql & file_url				&"', '"
		sql = sql & file_type				&"', '"
		sql = sql & file_size				&"', '"
		sql = sql & bbs_pwd			&"', '"
		sql = sql & bbs_category		&"', '"
		sql = sql & bbs_name			&"', '"
		sql = sql & bbs_email			&"', '"
		sql = sql & bbs_option			&"', '"
		sql = sql & bbs_subject		&"', '"
		sql = sql & bbs_contents		&"', '"
		sql = sql & bbs_user_ip		&"', '"
		sql = sql & bbs_re_number	&"')"
		db.execute(sql)

	else
		
		sql = "update "& Bs_TableName &" set "
		sql = sql & "bbs_file_name = '"		& file_name		&"', "
		sql = sql & "bbs_file_url = '"			& file_url			&"', "
		sql = sql & "bbs_file_type = '"		& file_type			&"', "
		sql = sql & "bbs_file_size = '"		& file_size			&"', "
		sql = sql & "bbs_file_down = '"		& file_down		&"', "
		sql = sql & "bbs_pwd = '"				& bbs_pwd			&"', "
		sql = sql & "bbs_category = '"		& bbs_category	&"', "
		sql = sql & "bbs_name = '"			& bbs_name		&"', "
		sql = sql & "bbs_email = '"			& bbs_email		&"', "
		sql = sql & "bbs_option = '"			& bbs_option		&"', "
		sql = sql & "bbs_subject = '"		& bbs_subject	&"', "
		sql = sql & "bbs_contents = '"		& bbs_contents	&"', "
		sql = sql & "bbs_edit_date_dt = getdate() ,"
		sql = sql & "bbs_user_ip = '"		& bbs_user_ip	&"' "
		sql = sql & " where bbs_idx = '"	& idx					&"'"
		db.execute(sql)
	end if

	set xup = nothing
	db.close
	set db = nothing


	'response.write sql & "<br>"

	
	if file_type = "jpg" or file_type="gif" then

		' 이미지 썸네일 생성 하는 부분 시작

		Dim FName
		Dim TestThumb

		temp_url = replace(file_url, "/", "\")

		FName = Server.MapPath (".\") & temp_url	'이미지 파일의 절대 경로


		Set TestThumb = Server.CreateObject("KMSThumb.Thumb")

			TestThumb.FileName	= FName				'절대경로를 넘겨줌
			TestThumb.Width			= 100						'생성될 썸네일의 가로 최대를 지정(default 100)
			TestThumb.Height		= 100						'생성될 썸네일의 세로 크기를 지정(default 100)
			TestThumb.Quality		= 100						'생성될 썸네일의 이미지 Quality(JPG로 생성시만 적용)(default 100)

			if file_type = "gif" then
				TestThumb.ImgGB = 2							'1이면 JPG, 2이면 GIF로 썸네일 생성(default 1)
			else
				TestThumb.ImgGB = 1
			end if

			TestThumb.ImgScale = 2
			TestThumb.SaveThumb							'썸네일 생성 메소드

		Set TestThumb = nothing

		' / 이미지 썸네일 생성 완료

		
		response.write "temp_URL : " & temp_url & "<br>"
		response.write "FName : " & FName


	end if
	
	'response.end


'----------------------------- 글쓰기 일 때 포인트 증가 시키는 부분 ---------------------------

	if mode <> "modify" and mode <> "reply" then


		if (boardcode = 88 or boardcode = 91 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87) and dietitian_ssn <> "" then

			plusPoint = 5

			set oConn = Server.CreateObject("ADODB.Connection")
			oConn.open "provider=sqloledb;server=210.124.177.231,14533;database=kda_db;uid=sa;pwd=dmlinedmpass;"			
			Set point_rs = Server.CreateObject("ADODB.RecordSet")

			sql1 = "select *  from id_tbl where pers_no='" & dietitian_ssn & "'"
			point_rs.Open sql1,oConn


			if isnull(point_rs("point")) then
				point = 0
			else
				point	= Cint(point_rs("point"))	'글 작성 포인트
			End if

			point = point + plusPoint

			sql2 = "update id_tbl set point=" & point & " where pers_no='" & dietitian_ssn & "'"
			oConn.Execute(sql2)
			'response.write sql2

			point_rs.close
			set point_rs = nothing

		end if
	
	end if
'-----------------------------------------------------------------------------------------------





'------------------------------ 답글일때 포인트 증가 하는 부분 ---------------------------------


	if mode = "reply" then
		
		if (boardcode = 20 or boardcode = 88 or boardcode = 91 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87) and dietitian_ssn <> "" then

			plusPoint = 1

			set oConn = Server.CreateObject("ADODB.Connection")
			oConn.open "provider=sqloledb;server=210.124.177.231,14533;database=kda_db;uid=sa;pwd=dmlinedmpass;"			
			Set point_rs = Server.CreateObject("ADODB.RecordSet")

			sql1 = "select *  from id_tbl where pers_no='" & dietitian_ssn & "'"
			point_rs.Open sql1,oConn


			if isnull(point_rs("point")) then
				point = 0
			else
				point	= Cint(point_rs("point"))	'글 작성 포인트
			End if

			point = point + plusPoint

			sql2 = "update id_tbl set point=" & point & " where pers_no='" & dietitian_ssn & "'"
			oConn.Execute(sql2)
			'response.write sql2

			point_rs.close
			set point_rs = nothing

		end if

	end if
'--------------------------------------------------------------------------------------------


	if ListUrl <> "" then
		response.Redirect(ListUrl & "?boardcode="&boardcode)
	else
		response.Redirect("index.asp?boardcode="&boardcode)
	end if
%>