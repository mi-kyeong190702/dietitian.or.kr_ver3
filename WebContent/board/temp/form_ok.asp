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
	dim num,pin,mode
	num = Request.Form("num")
	page = Request.Form("page")
	mode = Request.Form("mode")
	pin = Request.Form("pin")
	

	if Trim(pin)="" then

		Response.Redirect "../inc/error.asp?no=11"

	else
%>
<script LANGUAGE="VBScript" RUNAT="Server">

Function CheckWord(CheckValue)

CheckValue = replace(CheckValue, "<", "&lt;")
CheckValue = replace(CheckValue, ">", "&gt;")
CheckValue = replace(CheckValue, "'", "''")

CheckWord=CheckValue

End Function

</script>

<%
	dim name,title,email,url,secret_pin,link_1,link_2,ip,notice,tag,secret,reply_mail,writeday,filename1,filesize1,filename2,filesize2,filename3,filesize3,filename4,filesize4,mem_auth
			
	name = Trim(request("name"))
	name = checkword(name)

	if name = "" then
		name = "none"
	end if
	
	title = Trim(request("title"))
	title = checkword(title)

	if title = "" then
		title = "제목이 없습니다."
	end if
	
	email = Trim(request("email"))
	email = CheckWord(email)
	
	url = Trim(request("url"))
	if left(url,7) = "http://" then
		url = mid(url,8)
	end if
	
	link_1 = Trim(request("link_1"))
	if left(link_1,7) = "http://" then
		link_1 = mid(link_1,8)
	end if
	link_2 = Trim(request("link_2"))
	if left(link_2,7) = "http://" then
		link_2 = mid(link_2,8)
	end if
		
	content = checkword(request("content"))
	
	ip = request.ServerVariables("REMOTE_HOST")
	
	notice = request("notice")
		
	if mode <> "edit" then
		if notice = "1" then
			SQL="SELECT MAX(num) FROM "&tb&" where num > 100000000"
			Set rs = db.Execute(SQL)
	
			if IsNULL(rs(0)) then
				num = 100000001
			else
				num = rs(0)+1
			end if

		else
		
			SQL="SELECT MAX(num) FROM "&tb&" where num < 100000000"
			Set rs = db.Execute(SQL)
	
			if IsNULL(rs(0)) then
				num = 1
			else
				num = rs(0)+1
			end if

		end if
		rs.close
		Set rs = nothing
	end if
	
	tag = request("tag")
	secret = request("secret")
	if secret = 1 then
		secret_pin = request("secret_pin")
	elseif secret = 2 then
		secret_pin = pin
	end if 
	
	reply_mail = request("reply_mail")
			
	if left(now,2) <> "20" then
		writeday = "20"&now
	else
		writeday = now
	end if
	
	filename1=""
	filesize1=""
	filename2=""
	filesize2=""
	filename3=""
	filesize3=""
	filename4=""
	filesize4=""
	i_w1 = 0
	i_h1 = 0
	i_w2 = 0
	i_h2 = 0
	i_w3 = 0
	i_h3 = 0
	i_w4 = 0
	i_h4 = 0			
	
		'답변처리부분
  	dim o_email,o_title,re,resame,reid,reid2,newreid,newresame
  	
  	if mode = "reply" then
		
	SQL = "SELECT email,title,re,resame,reid,reply_mail FROM "&tb&" where num="&Request.Form("num")
	Set rs = db.Execute(SQL)
	
	o_email = rs("email")
	o_title = rs("title")
	re = rs("re")
    resame = rs("resame")
    reid = rs("reid")
    reply_mail = rs("reply_mail")
    
	SQL = "SELECT * FROM "&tb&" where re="& re &" and reid>"& reid &" and resame <= "& resame &" order by reid"
	Set rs = db.Execute(SQL)
	
	if rs.BOF or rs.EOF then
		SQL = "SELECT * FROM "&tb&" where re="& re &" and reid > "& reid &" and resame > "& resame &" order by reid DESC"
	else
		reid2 = rs("reid")

		SQL = "SELECT * FROM "&tb&" where re="& re &" and reid > "& reid &" and reid< " & reid2 & " and resame > " & resame & " order by reid DESC"
    end if

	Set rs = db.Execute(SQL)

	if not (rs.BOF or rs.EOF) then
		reid= rs("reid")
    end if
    
    SQL="UPDATE "&tb&" SET reid = reid + 1 where re = "& re & " and reid > " & reid
	db.Execute(SQL)
	
	newreid = reid + 1
	newresame = resame + 1
	
	if reply_mail = 1 then
		call reply_email
	end if
	
	else
	
	re = num
	newresame = 0
	newreid = 0
	
	end if
	'답변처리부분 끝
	
	call process_write
		
	db.close
	Set db = nothing
	
	
	
	
	if Request.Form("sw") <> "" then
		Response.Redirect "list.asp?tb="&tb&"&page="&page&"&st="&Request.Form("st")&"&sc="&Request.Form("sc")&"&sn="&Request.Form("sn")&"&sw="&Request.Form("sw")
	else
		Response.Redirect "list.asp?tb="&tb&"&page="&page
	end if

end if
%>
