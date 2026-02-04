<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>
<!--#include virtual="/inc/Mass_InjectionFunction.asp"-->
<!--#include virtual="/inc/Mass_InjectionAction.asp"-->

<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%
	idx = request("idx")

	boardcode = request("boardcode")

	'response.write request("step_count")



	'response.write plusPoint & "<BR>"
	'response.end

	set rs = server.CreateObject("adodb.recordset")
	sql = "select bbs_user_id, bbs_file_url, bbs_re_count, bbs_re_number, bbs_pwd from "& bs_tableName &" where bbs_idx = "& idx
	rs.open sql,db,0

	if rs.EOF then
		rs.Close
		set rs = nothing
		error("잘못된 호출")
	end if



	pwd = Request("pwd")
	if (rs("bbs_user_id") = "" or user_id <> rs("bbs_user_id")) and UserLevel > 2 then
		if pwd = "" or rs("bbs_pwd") = "" or pwd <> rs("bbs_pwd") then
			rs.close
			set rs = nothing
			error("삭제하실수 있는 권한이 없습니다.")
		end if
	end if

	bbs_file_url = rs("bbs_file_url")

	if rs("bbs_re_count") = 0 then
		sql = "delete from "& bs_tableName &" where bbs_idx = "& idx
		db.execute(sql)

		sql = "update "& bs_tableName &" set bbs_re_count = bbs_re_count - 1 where bbs_idx = "& rs("bbs_re_number")
		db.execute(sql)

		user_ssn = trim(Request.Cookies("dietitian")("user_ssn"))


		'/*--------------------------------------------- 포인트 삭제 --------------------------------*/

		if (boardcode = 20 or boardcode = 88 or boardcode = 91 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87) and user_ssn <> "" then

			bbs_step = Cint(request("bbs_step"))

			if bbs_step > 1 then
				plusPoint = -100					' 답글일때 -100점 / 1->100 으로 수정 ksh 12.22
			else
				if boardcode = 20 then
					plusPoint =0				' 정보공유게시판의 일반 글 삭제는 -5점이 아니므로 감점은 0점
				else
					plusPoint = -500				' 정보공유게시판 이외의 회원자료실 게시물 삭제시에는 -500점 감점
				end if								' 5->500 으로 수정 ksh 12.22
			end if

			set oConn = Server.CreateObject("ADODB.Connection")
            'oConn.open Application("DSN_STR")
            oConn.open "provider=sqloledb;server=210.127.56.231,14533;database=kda_ver2;uid=kda_ver;pwd=!@#$%^!@#$%^;"
			Set point_rs = Server.CreateObject("ADODB.RecordSet")

			sql1 = "select *  from id_tbl where id='" & rs("bbs_user_id") & "'"
			point_rs.Open sql1,oConn


			if isnull(point_rs("point")) then
				point = 0
			else
				point	= Cint(point_rs("point"))	'글 작성 포인트
			End if

			point = point + plusPoint

			sql2 = "update id_tbl set point=" & point & " where id='" & rs("bbs_user_id") & "'"
			oConn.Execute(sql2)
			'response.write sql2
			'response.end
			point_rs.close
			set point_rs = nothing

		end If



		if (boardcode = 24 or boardcode = 25 or boardcode = 26 or boardcode = 27 or boardcode = 28 or boardcode = 29 or boardcode = 30 or boardcode = 31 or boardcode = 32 Or boardcode =33) and user_ssn <> "" Then

	bbs_step = Cint(request("bbs_step"))




			if bbs_step > 1 then
				plusPoint = -100		' 답글일때 -100점 ksh 12.22
			else

				plusPoint = -500		' 글쓰기삭제 -500점	 ksh 12.22

			end If


			set oConn = Server.CreateObject("ADODB.Connection")
            'oConn.open Application("DSN_STR")
            oConn.open "provider=sqloledb;server=210.127.56.231,14533;database=kda_ver2;uid=kda_ver;pwd=!@#$%^!@#$%^;"
			Set point_rs = Server.CreateObject("ADODB.RecordSet")

			sql1 = "select *  from id_tbl where id='" & rs("bbs_user_id") & "'"
			point_rs.Open sql1,oConn


			if isnull(point_rs("point")) then
				point = 0
			else
				point	= Cint(point_rs("point"))	'글 작성 포인트
			End if

			point = point + plusPoint

			sql2 = "update id_tbl set point=" & point & " where id='" & rs("bbs_user_id") & "'"
			oConn.Execute(sql2)
			'response.write sql2
			'response.end
			point_rs.close
			set point_rs = nothing


		End if

'/*--------------------------------------------- 포인트 삭제 --------------------------------*/


		idx = rs("bbs_re_number")


		do while idx > 0
			rs.close
			sql = "select bbs_idx, bbs_m_number, bbs_re_count, bbs_del_flag, bbs_re_number from "& bs_tableName &" where bbs_idx = "& idx
			rs.open sql,db,0
			if rs.eof = false then
				bbs_re_count = rs("bbs_re_count")
				bbs_del_flag = rs("bbs_del_flag")

				if bbs_re_count = 0 and bbs_del_flag then
					sql = "delete from "& bs_tableName &" where bbs_idx = "& rs("bbs_idx")
					db.execute(sql)

					sql = "update "& bs_tableName &" set bbs_re_count = bbs_re_count - 1 where bbs_idx = "& rs("bbs_re_number")
					db.execute(sql)
				end if

				idx = rs("bbs_re_number")
			else
				idx = 0
			end if

		loop
	else
		sql = "update "& Bs_TableName &" set bbs_del_flag = 1 where bbs_idx = "& idx
		db.execute(sql)
	end if

	sql = "delete from "& Bs_TableNameComments &" where bbs_idx = "& idx
	db.execute(sql)

	if trim(bbs_file_url) <> "" then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
		if fs.FileExists(server.MapPath(bbs_file_url)) = true then
			fs.DeleteFile(server.MapPath(bbs_file_url))
		end if
		set fs = nothing
	end if
	rs.close
	set rs = nothing
	db.close
	set db = nothing

	if Request("ListUrl") <> "" then
		ListUrl = Request("ListUrl")
	else
		ListUrl = "list.asp"
	end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="refresh" content="0;url=<%= ListUrl %>?boardcode=<%= boardcode %>">
<script language="javascript">
<!--
	alert("삭제가 완료되었습니다.");
//-->
</script>