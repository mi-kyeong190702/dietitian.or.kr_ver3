<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>
<!--#include virtual="/inc/Mass_InjectionFunction.asp"-->
<!--#include virtual="/inc/Mass_InjectionAction.asp"-->

<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%
	
	

	function word(Str)		'따옴표 제거
		Str = request.Form(Str)
		Str = replace(Str, "'", "''")
		word = Str
	End function
	

	Function notag2(Str)
		Str = replace(Str, "&lt;", "&lT;")
		Str = replace(Str,"<","&lt;")
		notag2 = Str
	end Function
	
	if Bs_View = false then
		error("의견글을 쓰실 권한이 없습니다.")
	end if
	
	idx = Request.Form("idx")
	set rs = server.CreateObject("adodb.recordset")
	if boardcode = "20" or boardcode = "35" then
		sql = "select count(*) from "& Bs_TableName &" where (bbs_board_code = '20' or bbs_board_code ='35') and bbs_idx = '"& idx &"'"
	else
		sql = "select count(*) from "& Bs_TableName &" where bbs_board_code = '"& boardcode &"' and bbs_idx = '"& idx &"'"
	end if
	rs.open sql,db,0
	
	if rs(0) = 0 then
		rs.close
		set rs = nothing
		error("글을 작성하실수 없습니다.")
	end if
	
	rs.close
	set rs = nothing
	
	
	bbc_name = user_name
	if bbc_name = "" then
		bbc_name = "손님"
	end if
	
	bbc_contents = word("bbc_contents")
	
	bbc_contents = notag2(bbc_contents)
	
	bbc_user_ip = Request.ServerVariables("REMOTE_ADDR")
	
	sql = "update "& Bs_TableName &" set bbs_Comments_count = bbs_Comments_count + 1 where bbs_idx = '"& idx &"'"
	db.execute(sql)
	
	sql = "insert into "& Bs_TableNameComments &"("
	sql = sql & "bbc_user_id, "
	sql = sql & "bbs_idx, "
	sql = sql & "bbc_name, "
	sql = sql & "bbc_contents, "
	sql = sql & "bbc_user_ip "
	sql = sql & ") values('"
	sql = sql & user_id						&"', '"
	sql = sql & idx							&"', '"
	sql = sql & bbc_name					&"', '"
	sql = sql & bbc_contents				&"', '"
	sql = sql & bbc_user_ip					&"')"
	db.execute(sql)
	
	db.close
	set db = nothing
	
	'2014.04.14 댓글 입력했을 때 포인트 추가
	user_id=Request.Cookies("dietitian")("user_id")
	if (boardcode = 20 or boardcode = 88 or boardcode = 91 or boardcode = 92 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87 Or boardcode = 24 or boardcode = 25 or boardcode = 26 or boardcode = 27 or boardcode = 28 or boardcode = 29 or boardcode = 30 or boardcode = 31 or boardcode = 32 Or boardcode =33) and user_id <> "" then
			
			plusPoint = 100

			set oConn = Server.CreateObject("ADODB.Connection")
			'oConn.open "provider=sqloledb;server=210.124.177.231,14533;database=kda_db;uid=sa;pwd=dmlinedmpass;"
            'oConn.open Application("DSN_STR")
            oConn.open "provider=sqloledb;server=210.127.56.231,14533;database=kda_ver2;uid=kda_ver;pwd=!@#$%^!@#$%^;"
			Set point_rs = Server.CreateObject("ADODB.RecordSet")

			sql1 = "select *  from id_tbl where id='" & user_id & "'"
			point_rs.Open sql1,oConn


			if isnull(point_rs("point")) then
				point = 0
			else
				point	= Cint(point_rs("point"))	'글 작성 포인트
			End if

			point = point + plusPoint

			sql2 = "update id_tbl set point=" & point & " where id='" & user_id & "'"
			oConn.Execute(sql2)
			'response.write sql2

			point_rs.close
			set point_rs = nothing

	end if

	ViewUrl = word("ViewUrl")
	if ViewUrl = "" then
		response.Redirect("view.asp?"& request.Form("thisQuery"))
	else
		Response.Redirect(ViewUrl &"?"& request.Form("thisQuery"))
	end if
%>