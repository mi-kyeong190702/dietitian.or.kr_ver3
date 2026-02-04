<!-- #include file=../include/h_dbopen.asp -->
<%

	    UpdateSQL = "Update diet_notice Set diet_read_no = diet_read_no+1 "
	    UpdateSQL = UpdateSQL & " where diet_Serial_no='"&request("idx")&"' "
	    dbconn.Execute UpdateSQL
	
	
	
	 sql = "select diet_Serial_no,diet_User_name,diet_wrt_date,diet_wrt_time, "
	 sql = sql & " diet_title,diet_content,diet_read_no,Status,filename "
	 sql = sql & " from diet_notice where diet_Serial_no='"&request("idx")&"' "
	 set rs = dbconn.Execute(sql)
   	 
		

		
		idx=rs("diet_Serial_no")
		
		name = rs("diet_User_name")
		title = rs("diet_title")
		content = rs("diet_content")
		content = replace(content,chr(13) & chr(10),"<br>") 
		read_no = rs("diet_read_no")
		
		writeday=left(rs("diet_wrt_date"),8)
		write_year = left(writeday ,4)
		write_month = mid(writeday , 5,2)
		write_day = mid(writeday , 7,2)
		file = rs("filename")
	rs.close
	set rs = nothing	



%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="../css/kda.css" type="text/css">

<link rel="stylesheet" href="../css/kda.css" type="text/css">
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="604" border="0" cellspacing="0" cellpadding="0" height="22" class="text">
  <tr> 
    <td width="19">&nbsp;</td>
    <td width="605" valign="bottom"><font color="727272">홈 &gt; 공지사항</font></td>
  </tr>
</table>
<table width="604" border="0" cellspacing="0" cellpadding="0" height="35">
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
<table width="588" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="19">&nbsp;</td>
    <td width="482" valign="bottom"><img src="images/news_subtitle1.gif" width="69" height="28"></td>
    <td width="87"> 
      <div align="right"><img src="images/news_icon1.gif" width="100" height="50"></div>
    </td>
  </tr>
</table>
<table width="604" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="19"></td>
    <td width="590" valign="bottom"> 
      <table width="585" border="0" cellspacing="0" cellpadding="0" bgcolor="D5D3D6" height="1">
        <tr> 
          <td valign="bottom"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="604" border="0" cellspacing="0" cellpadding="0" height="35">
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
<table width="600" border="0" cellspacing="0" cellpadding="0" height="35">
  <tr> 
    <td width="19">&nbsp;</td>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#CDCDCD"><img src="images/bbs_blank.gif" width="1" height="1"></td>
        </tr>
        <tr> 
          <td bgcolor="#FEFFEB"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="3" height="24">
              <tr> 
                <td width="73%"><font class="c3"><b>제목 : </b></font><font class="c"><%=title%></font></td>
                <td><font class="c3">등록일 : <%=write_year%>-<%=write_month%>-<%=write_day%></font><font class="c3"></font></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td bgcolor="#CDCDCD"><img src="images/bbs_blank.gif" width="1" height="1"></td>
        </tr>
        <tr> 
          <td> 
            <table width="100%" cellpadding="5">
              <tr> 
                <td><%=content%></td>
              </tr>
              <tr height="30"> 
                <td>첨부파일 : <a href="/admin/data1/<%=file%>"><%=file%></a></td>
              </tr>              
            </table>
            <br>
            <br>
          </td>
        </tr>
        <tr> 
          <td bgcolor="#CDCDCD"><img src="images/bbs_blank.gif" width="1" height="1"></td>
        </tr>
        <tr> 
          <td bgcolor="F3F2F2" align="right" height="30"> <a href="list.asp"><img src="images/list_button.gif" width="54" height="19" border="0"></a> 
          </td>
        </tr>
        <tr> 
          <td bgcolor="#CDCDCD"><img src="images/bbs_blank.gif" width="1" height="1"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="604" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="19">&nbsp;</td>
    <td width="590" valign="bottom"> 
      <table width="585" border="0" cellspacing="0" cellpadding="0" bgcolor="D5D3D6" height="1">
        <tr> 
          <td valign="bottom"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="604" height="25">
  <tr> 
    <td width="486"> 
      <div align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#666666">Copyright 
        (c) 2001 by <a href="mailto:dietitian@dietitian.or.kr"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#0066CC">KDA</font></a> 
        all rights reserved.<br>
        TEL : 02)842-2466 FAX : 02)848-7655, 848-2221 </font></div>
    </td>
    <td valign="bottom" width="106"><img src="../images/copy_logo_img01.gif" width="99" height="31"></td>
  </tr>
</table>
</body>
</html>
