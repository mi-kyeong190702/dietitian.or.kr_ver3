<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%
	
	idx = trim(request("idx"))
	seq = trim(request("seq"))

		
	if idx = "" then
		Error("잘못된 호출입니다.")
	end if

	sql = "update "& Bs_TableName &" set bbs_file_down = bbs_file_down + 1 where bbs_idx = "& idx
	db.execute(sql)

	set rs = server.CreateObject("adodb.recordset")
	sql = "select bbs_file_name, bbs_file_url, bbs_file_name2, bbs_file_url2, bbs_file_name3, bbs_file_url3, bbs_file_name4, bbs_file_url4, bbs_file_name5, bbs_file_url5 from "& Bs_TableName &" where bbs_idx = "&idx
	rs.open sql,db,0
	
'response.write sql
'response.end
	if rs.eof then
		rs.close
		set rs = nothing
		error("해당 글이 존재하지 않습니다.")
	end if
	if trim(rs("bbs_file_url")) = "" then
		rs.close
		set rs = nothing
		error("해당 파일이 존재하지 않습니다.")
	end if

	
	
	if seq = "1" or seq = "" then
		bbs_file_name = rs("bbs_file_name")
		bbs_file_url = rs("bbs_file_url")
	elseif seq = "2" then
		bbs_file_name = rs("bbs_file_name2")
		bbs_file_url = rs("bbs_file_url2")
	elseif seq = "3" then
		bbs_file_name = rs("bbs_file_name3")
		bbs_file_url = rs("bbs_file_url3")
	elseif seq = "4" then
		bbs_file_name = rs("bbs_file_name4")
		bbs_file_url = rs("bbs_file_url4")
	elseif seq = "5" then
		bbs_file_name = rs("bbs_file_name5")
		bbs_file_url = rs("bbs_file_url5")
	end if

	'response.write bbs_file_name & "<BR>"
	'response.write bbs_file_url
	'response.end

	Response.ContentType = "file/unknown"
	Response.AddHeader "Content-disposition","attachment;filename="& bbs_file_name

	set xdn=Server.CreateObject("UpDownExpress.FileDownload")
	

	xdn.InitControl

	xdn.DownFromFile bbs_file_url
  
    'xdn.close
	set xdn = nothing
	rs.close
	set rs = nothing
  
	db.close
	set db = nothing
%>