

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>대한영양사협회 홈페이지에 오신것을 감사드립니다.</title>
<link href="/css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-size: 11px}
-->
</style>
<script src="/js/default.js" type="text/JavaScript"></script>
<link href="/css/board.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {color: #0033CC}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" onLoad="MM_preloadImages('/education/image/e_01over.jpg','/education/image/e_02over.jpg','/education/image/e_03over.jpg','/education/image/e_04over.jpg','image/p_01over.jpg','image/p_02over.jpg','image/p_03over.jpg','image/p_04over.jpg','image/p_05over.jpg','image/p_06over.jpg')">
<!-- 로고노출 및 플래시 메뉴단 / 서브에서는 크기가 달라짐. 항상 노출단 -->

<!--#include virtual="/data/inc/top.asp"-->

<!-- 카피라이트 시작 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="238" rowspan="3" align="left" valign="top" background="/images/info/leftbg03.jpg">

			<table width="238" height="244" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="15" height="230" align="left" valign="top"><img src="/images/info/sublog01_01.jpg" width="15" height="230"></td>
					<td width="210" height="230" align="left" valign="top" bgcolor="#FFFFFF">

						<!-- 로그인 -->
						<!--#include virtual = "/inc/inside_login.asp"-->
					
						<table width="210" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="30" align="center" bgcolor="#FFFFFF"><!--#include virtual="/inc/inside_cal.asp"--></td>
							</tr>
						</table>
					
						<!-- 관련 사이트 링크 -->
						<!--#include virtual = "/inc/inside_select.asp"-->					
					</td>
					<td width="13" height="230" align="left" valign="top"><img src="/images/info/sublog01_07.jpg" width="13" height="230"></td>
				</tr>
				<tr>
					<td height="14"><img src="/images/info/sublog01_04.jpg" width="15" height="14"></td>
					<td height="14" background="/images/info/sublog01_05.jpg"></td>
					<td width="13" height="14"><img src="/images/info/sublog01_06.jpg" width="13" height="14"></td>
				</tr>
			</table>
		
			<!-- 서브메뉴단-->
			<!--#include virtual = "/comm/inc/left_SubMenu.asp"-->

		</td>
		<td width="752" height="151" align="left" valign="top">
			
			<!-- 메인 플래시단 시작 -->
			<!--#include virtual = "/comm/inc/mainFlash.asp"-->

		</td>
		<td height="151" align="left" valign="top" background="/images/comm/leftbg02.jpg" bgcolor="ecb1e0">&nbsp;</td>
	</tr>
	<tr>
		<td width="752" height="48" align="left" valign="top">
		
			<!-- 서브 타이틀단 -->

			<table width="752" border="0" cellspacing="0" cellpadding="0">
				 <tr>
					<td width="9" height="6"><img src="/images/comm/info01_01.jpg" width="9" height="6"></td>
					<td width="151"><img src="/images/comm/info01_02.jpg" width="151" height="6"></td>
					<td width="505"><img src="/images/comm/info01_03.jpg" width="505" height="6"></td>
					<td width="10"><img src="/images/comm/info01_04.jpg" width="10" height="6"></td>
					<td bgcolor="a399e3"></td>
				</tr>
				<tr>
					<td width="9" height="49">&nbsp;</td>
					<td width="151" height="49" align="center" valign="bottom"><img src="/images/comm/news_0006.jpg" alt="회원게시판"></td>
					<td width="505" height="49" align="left" valign="bottom">
						
						<br>

						<table width="505" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="180"><img src="/images/info/info01_17.jpg" width="158" height="21"></td>
								<td align="right"><span class="style4">HOME &gt; KDA 카페 &gt; 회원게시판</span></td>
							</tr>
						</table>

					</td>
					<td width="10" height="49" background="/images/info/info01_09.jpg">&nbsp;</td>
					<td height="49" bgcolor="a399e3">&nbsp;</td>
				</tr>
				<tr>
					<td width="9" height="4"></td>
					<td width="151" height="4" bgcolor="a99ee3"></td>
					<td width="505" height="4" bgcolor="ededed"></td>
					<td width="10" height="4" background="/images/info/info01_09.jpg"></td>
					<td height="4" bgcolor="a399e3"></td>
				</tr>
			</table>

		</td>
		<td height="48" align="left" valign="top" bgcolor="a399e3">&nbsp;</td>
	</tr>
	<tr>
		<td align="left" valign="top">
			
			<table width="752" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="9" height="49">&nbsp;</td>
					<td width="656" height="703" align="center" valign="top">
						
						<br>
						<%
							boardcode=34
							listUrl = "/comm/MemberBoard/index.asp"


							
dbstr="provider=sqloledb;server=203.236.241.124,14533;database=dietitian;uid=sa;pwd=dmlinedmpass!@##@!~"
Set db=Server.CreateObject("ADODB.connection")
db.open dbstr


						%>
						<!--#include virtual = "/comm/MemberBoard/topinclude.asp"--><br>
					<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%
	
	where = request("where")
	keyword = replace(trim(request("keyword")),"'","&acute;")
	keyword = replace(keyword,chr(34),"&#34;")
	
	select case where
		case "name"
			name_check = "selected"
			whereQuery = "bbs_name"
		case "subject"
			subject_check = "selected"
			whereQuery = "bbs_subject"
		case "content"
			content_check = "selected"
			whereQuery = "bbs_contents"
		case "category"
			category_check = "selected"
			whereQuery = "bbs_category"
		case ""
			subject_check = "checked"
	end select
	
	if request("page")="" then   	' PAGE 값가져오기...
		page=1
	else 
		page=request("page")
	end if
	
	nextpage = Cint(page) + 1
	prevpage = Cint(page) - 1


' ------------------- 정보공유게시판 자유게시판 통합 체크 ------------------

	if boardcode = 35 or boardcode = 20 then
		sql = "select bbs_idx, bbs_step, bbs_file_type, bbs_comments_count, bbs_category, bbs_name, bbs_subject, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag from "& Bs_TableName &" where (bbs_board_code = '35' or bbs_board_code='20') "
	else	
		sql = "select bbs_idx, bbs_step, bbs_file_type, bbs_comments_count, bbs_category, bbs_name, bbs_subject, bbs_view, bbs_edit_date_dt, bbs_reg_date_dt, bbs_del_flag from "& Bs_TableName &" where bbs_board_code = '"& boardcode &"' "
	end if
'----------------------------------------------------------------------------


	'response.write  boardcode
	'response.end

	if keyword <> "" then
		sql = sql & " and "& whereQuery &" like '%"& keyword &"%'"
	end if
	sql = sql & " order by bbs_m_number"

	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.PageSize = 15
	
	'response.write sql
	'response.end

	rs.Open SQL,db,1,3,1
	totaltext = cint(rs.RecordCount)
	totalpage = cint(rs.PageCount)
	if totalpage = 0 then
		totalpage = 1
	end if
	if not rs.bof then
		rs.absolutepage = page
	end if


	SUB pagePrint() 
		if totalpage > 1 then

			if page mod 10 = 0 then
				startPage = int(page / 10) * 10 - 9
			else
				startPage = int(page / 10) * 10 + 1
			end if

			prevPagePart = cint(startPage - 10)
			nextPagePart = cint(startPage + 10)

			if prevPagePart < 1 then
				prevPagePart = 1
			end if
			if nextPagePart > totalpage then
				nextPagePart = totalpage
			end if
			prevPage = page - 1
			nextPage = page + 1
			if prevPage < 1 then
				prevPage = 1
				'prevDisable = "disabled"
			end if
			if nextPage > totalpage then
				nextPage = totalpage
				'nextDisable = "disabled"
			end If
			
			PRE=server.urlencode("boardcode="&boardcode&"&where="&where&"&keyword="&keyword&"&page="&prevPagePart)
			NEX=server.urlencode("boardcode="&boardcode&"&where="&where&"&keyword="&keyword&"&page="&prevPage)
			%>

		
		
		<a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= prevPagePart %>"><img src="/data/images/prev02.gif" border=0 alt="이전10개" align="absmiddle"></a>
		<a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= prevPage %>"><img src="/data/images/prev01.gif" border=0 alt="이전" align="absmiddle"></a>

		<!--	
		
				<a href="?<%=PRE%>"><img src="/data/images/prev02.gif" border=0 alt="이전10개" align="absmiddle"></a>
		<a href="?<%=NEX%>"><img src="/data/images/prev01.gif" border=0 alt="이전" align="absmiddle"></a>-->
			&nbsp;
			<%

			for i = startPage to startPage + 9
				if i > totalpage then
					i = totalpage
					exit for
				end if
				if i = cint(page) then
					response.write "&nbsp;<b><font color=#08748A>"& page &"</font></b>&nbsp;"
				else

				P=  server.urlencode(boardcode&"&where="&where&"&keyword="&keyword&"&page="&i)
					
			%>
				&nbsp;<a class="news1" href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= i %>"><%= i %>&nbsp;</a>
				<!--<a class="news1" href="?boardcode=<%=P%>"><%= i %>&nbsp;</a>-->
			<%
					

				end if
				response.write " / "
			next
			%>
			&nbsp;	
			
			<%
				PRES=server.urlencode("boardcode="&boardcode&"&where="&where&"&keyword="&keyword&"&page="&nextPage)
			NEXS=server.urlencode("boardcode="&boardcode&"&where="&where&"&keyword="&keyword&"&page="&nextPagePart)
	
			
			%>
	<a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= nextPage %>"><img src="/data/images/next01.gif" border=0 alt="다음" align="absmiddle"></a>
			<a href="?boardcode=<%= boardcode %>&where=<%= where %>&keyword=<%= keyword %>&page=<%= nextPagePart %>"><img src="/data/images/next02.gif" border=0 alt="다음10개" align="absmiddle"></a>
	
					<!--	<a href="?<%= PRES %>"><img src="/data/images/next01.gif" border=0 alt="다음" align="absmiddle"></a>
			<a href="?<%=NEXS%>"><img src="/data/images/next02.gif" border=0 alt="다음10개" align="absmiddle"></a>
			-->
<%


		end if 

	END SUB
	
%>

<script>
function kk(){
	if (!document.frm.se2.value){
		alert("검색어를 입력하세요");
		frm.se2.focus();
		return;
	} else {
		document.frm.submit();
	}
 }
</script>



<table width="583" border="0" cellspacing="0" cellpadding="0" bgcolor="#f3f3f3">
  <tr>
	<td width="267" height="59"><img src="/images/data/search_img_01.gif" width="267" height="59"></td>
	<td width="301" align="right"><br>
		<table height="20" border="0" cellpadding="0" cellspacing="0">
		<form name="form1" method="post" action="index.asp" ID="Form1">
		<tr>
		  <td width="110" align="right" valign="bottom">
				<select ID="where" NAME="where" class="form">
					<option value="subject" <%= subject_check %> >제 목</option>
					<option value="content" <%= content_check %> >내 용</option>
					<option value="name" <%= name_check %> >작성자</option>

				<!-- 정보공유 게시판은 구분을 검색조건으로 사용하지 않습니다. -->

					<% If Bs_Category and boardcode <> "20" Then %>
					<option value="category" <%= category_check %> >구 분</option>
					<% End If %>
				</select>
		  </td>
		  <td>
			&nbsp;<input type="text" class="form1" ID="keyword" size="18" NAME="keyword" value="<%= keyword %>">
		  </td>
		  <td width="40">
			&nbsp;<input type="image" src="/images/data/search_btn_002.gif" align="absmiddle" ID="Image1" NAME="Image1">
		  </td>
		</tr>
		<input type="hidden" name="boardcode" value="<%=request("boardcode")%>">
		</form>
	</table>
	</td>
    <td width="14" align="left"><img src="/images/data/search_img_end.gif" width="14" height="59"></td>
  </tr>
</table><br>


<table width="583" border="0" cellspacing="0" cellpadding="0">
  <tr align="center" bgcolor="4AB2E7">
	<td height="2" colspan="6"></td>
  </tr>
  <tr align="center" bgcolor="#F7FBFF">
	<td width="50" height="28" class="board_01">번호</td>
	<% If Bs_Category THEN %>
	<td width="75" height="28" class="board_01">자료분류</td>
	<% End If %>
	<td width="248" class="board_01">제 목</td>
	<td width="70" class="board_01">작성자</td>
	<td width="75" class="board_01">등록일</td>
	<td width="50" class="board_01">조회</td>
  </tr>
  <tr align="center" bgcolor="CAE6FC">
	<td height="2" colspan="6"></td>
  </tr>
  <% If boardcode=63 then%>
	  <tr bgcolor="#F9FAEF">
								<td height="27" colspan="6" align="left" style="padding:0 0 0 52">식품정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://www.kamis.co.kr' target='_newddd'><strong>농수산물 유통정보 바로보기 </strong></a></td>
  </tr>

						  <tr>
								<td height="1" colspan="6" bgcolor="D6D7D6" class="board_02"></td>
						  </tr>
	<%End if%>

<%
		if rs.EOF = true then
			if keyword <> "" then
		%>
			<tr><td colspan="6" align="center" height="100">검색결과가 없습니다.</td></tr>
		<%	else	%>
			<tr><td colspan="6" align="center" height="100">입력된 글이 없습니다.</td></tr>
		<%	
			end if
		end if
		
	
		do until rs.eof or j > 15
			
			ThisNumber = totaltext - (page * 15) - j + 15
			j = j + 1
			
			
			if rs("bbs_step") > 1 then
				re_width = rs("bbs_step") * 10
				reply = "<img src='space.gif' width="& re_width &" height='0'><img src='/news/images/reply.gif'>"
			else
				reply = ""
			end if
			bbs_name = rs("bbs_name")
			
			bbs_subject = rs("bbs_subject")

			if Len(bbs_subject) > 32 then
				bbs_subject = Left(bbs_subject, 30) &"..."
			end if
			
			if keyword <> "" then
				select case where
					case "name"	
						bbs_name = replace(bbs_name,keyword,"<font color='red'>"& keyword &"</font>")
					case "subject"
						bbs_subject = replace(bbs_subject,keyword,"<font color='red'>"& keyword &"</font>")
				end select
			end if
			
			
			if rs("bbs_edit_date_dt") <> "" then
				tempDate = rs("bbs_edit_date_dt")
			else
				tempDate = rs("bbs_reg_date_dt")
			end if
			
			if rs("bbs_comments_count") > 0 then
				bbs_subject = bbs_subject & "<b>("& rs("bbs_comments_count") &")</b>"
			end if
			if datediff("h",tempDate,now) < 48 then
				news_img = "&nbsp;<i><font color='red'>new</font></i>"
				bbs_subject = bbs_subject & news_img
			end if
			if rs("bbs_del_flag") then
				bbs_subject = "<font color='gray'><b>[ - - 해당글은 삭제된 글입니다. - - ]</b></font>"
			end if
			
			bbs_reg_date = left(rs("bbs_reg_date_dt"),10)
			
			bbs_category = rs("bbs_category")

			if bbs_category = "" then
				bbs_category = "기타"
			end if
				


			bbs_view = rs("bbs_view")
			idx = rs("bbs_idx")
			%>

						<tr align="center">
							<td width="47" height="27" class="board_02"><%= ThisNumber %></td>
							<% If Bs_Category Then %>
							<td height="27" class="board_02"><%= bbs_category %></td>
							<% End If %>
							<td width="338" align="left" class="board_03">

									<%= reply %>
									<% if rs("bbs_del_flag") = false and Bs_View then 
										C=server.urlencode("boardcode="&boardcode&"&where="&where&"&keyword="&keyword&"&page="&page&"&listUrl="&listUrl)
									%>
									<a  class="news" href="view.asp?boardcode=<%= boardcode %>&listUrl=<%=listUrl%>&where=<%= where %>&keyword=<%= keyword %>&page=<%= page %>&idx=<%= idx %>">
									<!--<a  class="news" href="view.asp?<%=C%>">-->

									<% end if %>
									<%= bbs_subject %>
									<% if rs("bbs_del_flag") = false and Bs_View then %>
									</a>
									<% end if %>
							
							</td>

							<td width="66" class="board_02"><%= bbs_name %></td>
							<td width="76" class="board_02"><%= bbs_reg_date %></td>
							<td width="51" class="board_02"><%= bbs_view %></td>
						</tr>
						  <tr>
								<td height="1" colspan="6" bgcolor="D6D7D6" class="board_02"></td>
						  </tr>
						
		<%
			rs.movenext
		loop
		rs.close
		set rs = nothing
		%>

  <tr align="center">
	<td height="40" colspan="6">
		<% pagePrint() %>
	</td>
  </tr>
  <tr>
	<td height="1" colspan="6" bgcolor="D6D7D6"></td>
  </tr>
  <tr align="center" bgcolor="F7F7F7">
	<td height="10" colspan="6"></td>
  </tr>
</table>     
<br>
<table width="583" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="20" align="right">
		<a href="index.asp"><img src="/data/images/list_btn.gif" width="50" height="20"></a> 
		<% if Bs_Write then %>
				<a href="input.asp?boardcode=<%= boardcode %>&listurl=<%=listurl%>"><img src="/data/images/write_btn.gif" width="58" height="20" border="0"></a>
		<% end if %>
	</td>
  </tr>
</table>
<br>
<br>


					</td>
					<td width="10" height="49" background="/images/info/info01_09.jpg">&nbsp;</td>
					<td height="49" bgcolor="ceebf1">&nbsp;</td>
				</tr>
			</table>

		</td>
		<td align="left" valign="top" bgcolor="ceebf1">&nbsp;</td>
	</tr>
</table>

<!-- 하단 카피라이트 -->
<!--#include virtual = "/inc/inside_copyright.asp"-->

</body>
</html>