<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>
<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%

	bbc_idx = Request("bbc_idx")
	
	if bbc_idx = "" then
		error("잘못된 호출")
	end if
	
	if instr(bbc_idx,",") > 0 then
		bbc_id = split(bbc_idx,",")
		bbc_idx = bbc_id(ubound(bbc_id))
	end if
	
	
	set rs = server.CreateObject("adodb.recordset")
	sql = "select bbc_user_id, bbs_idx from "& Bs_TableNameComments &" where bbc_idx = "& bbc_idx
	rs.open sql,db,0
	
	if rs.EOF then
		rs.Close
		set rs = nothing
		error("잘못된 호출")
	end if
	
	idx = Rs("bbs_idx")
	

	if (rs("bbc_user_id") = "" or user_id <> rs("bbc_user_id")) and UserLevel > 2 then
		rs.close
		set rs = nothing
		error("삭제하실수 있는 권한이 없습니다.")
	end if
	
	
	

	sql = "update "& Bs_TableName &" set bbs_Comments_count = bbs_Comments_count - 1 where bbs_idx = '"& idx &"'"
	db.execute(sql)

	sql = "delete from "& Bs_TableNameComments &" where bbc_idx = "& bbc_idx
	db.execute(sql)

	rs.close
	set rs = nothing
	db.close
	set db = nothing
	
	user_id=Request.Cookies("dietitian")("user_id")
	if (boardcode = 20 or boardcode = 88 or boardcode = 91 or boardcode = 92 or boardcode = 63 or boardcode = 86 or boardcode = 65 or boardcode = 64 or boardcode = 85 or boardcode = 66 or boardcode = 87 Or boardcode = 24 or boardcode = 25 or boardcode = 26 or boardcode = 27 or boardcode = 28 or boardcode = 29 or boardcode = 30 or boardcode = 31 or boardcode = 32 Or boardcode =33) and user_id <> "" then
			
			plusPoint = -100

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

	view_url = request("viewUrl")&"?boardcode=" & request("boardcode") & "&listUrl=" & request("listUrl") & "&where=" & request("where") & "&keyword=" & request("keyword") & "&page=" & request("page") & "&idx=" & request("idx")


%>



<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="refresh" content="0;url=<%=View_Url%>">
<script language="javascript">
<!--
	alert("삭제가 완료되었습니다.");
//-->
</script>