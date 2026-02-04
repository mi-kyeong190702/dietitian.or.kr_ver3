<!--#include virtual="/db/dbopen.inc"-->

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
			
			<br>

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
					<td width="151" height="49" align="center" valign="bottom"><img src="/images/comm/news_0007.jpg"></td>
					<td width="505" height="49" align="left" valign="bottom">
						
						<br>

						<table width="505" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="180"><img src="/images/info/info01_17.jpg" width="158" height="21"></td>
								<td align="right"><span class="style4">HOME &gt; KDA 카페 &gt; 정보공유게시판</span></td>
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
					<td width="656" height="694" align="center" valign="top">
						
						<br>
						<%boardcode=20%>
						<!--#include virtual = "/comm/ShareInfo/topinclude.asp"-->
						<!--contents-->
			<%
				if Request("WriteUrl") <> "" then
					WriteUrl = Request("WriteUrl")
				else
					WriteUrl = "Write.asp"
				end if
			%>
					<script language="javascript">
					<!--
					
						function CheckIt(frm) {
							if(frm.mode.value == "modify")
							{
								
								frm.action = "<%= WriteUrl %>";
								
							}
							else if(frm.mode.value == "del")
							{
								frm.action = "del.asp";
							}
							else return false;
							
							
							if( frm.Pwd.value == "") {
								alert("암호를 입력하여 주십시오.");
								frm.Pwd.focus();
								return false;
							}
						}
					
					//-->
					</script>
			<%= Bs_TopHtml %>
			<BR>
			<BR>
			<BR>
			<form action="" name="Form1" method="post" onsubmit="return CheckIt(this)">
				<input type="hidden" name="mode" value="<%= request("mode") %>" ID="Hidden1">
				<input type="hidden" name="boardcode" value="<%= request("boardcode") %>">
				<input type="hidden" name="idx" value="<%= request("idx") %>" ID="Hidden2">
				<input type="hidden" name="ListUrl" value="<%= request("ListUrl") %>" ID="Hidden3">
				<input type="hidden" name="WriteUrl" value="<%= WriteUrl %>" ID="Hidden4">
				<input type="hidden" name="ViewUrl" value="<%= request("ViewUrl") %>" ID="Hidden5">
				
				<table cellpadding="0" cellspacing="0" width="340" border="0" ID="Table3">
					<tr>
						<td bgcolor="#8F2348"><img src="../images/space.gif"></td>
					</tr>
					<tr>
						<td bgcolor="#F8F8F8" height="28"><IMG SRC="images/bull_board01.gif" hspace="10" align="absmiddle"><b>
								비밀번호 입력</b></td>
					</tr>
					<tr>
						<td bgcolor="#D8D8D8"><img src="../images/space.gif"></td>
					</tr>
					<tr>
						<td height="100" align="center">
							<input type="password" name="Pwd" style="width:100" class="box1" ID="Pwd" NAME="Text1"><!--확인버튼-->
							<input type="image" SRC="images/butn_confirm.gif" align="absmiddle" hspace="15">
						</td>
					</tr>
					<tr>
						<td bgcolor="#8F2348"><img src="../images/space.gif"></td>
					</tr>
				</table>
			</form>
			<!--/board-->
			<!--/contents-->
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
