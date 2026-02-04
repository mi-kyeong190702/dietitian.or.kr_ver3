<%@LANGUAGE="VBSCRIPT" CODEPAGE="949"%>

<!--#include virtual="/inc/Mass_InjectionFunction.asp"-->
<!--#include virtual="/inc/Mass_InjectionAction.asp"-->

<!--#include virtual="/db/dbopen.inc" -->
<!--#include virtual="/inc/_function.asp" -->
<!--#include virtual="/board/_BoardSettings.asp" -->
<%

	idx				= request.Form("idx")
	set rs = server.CreateObject("adodb.recordset")
	sql = "select isnull(datediff(dd,max(regdate), GETDATE()),1) gap from chk_recomm where id = '"& user_id &"'"
	rs.open sql,db,0
	If rs.eof Then
		gap = 1
	Else
		gap = rs("gap")
	End if
	
	
	if gap = 0 then
%>
		<script language=javascript>
			alert("오늘은 이미 한번 추천하였습니다");
		</script>
<%
	else
		
		rs.close
		set rs = nothing
		sql = " insert into chk_recomm (id) values ('"&user_id&"') "
		'response.write sql
		db.execute(sql)
			
		sql = "update "& Bs_TableName &" set "
		sql = sql & " bbs_recomm = isnull(bbs_recomm,0) + 1"
		sql = sql & " where bbs_idx = '"	& idx					&"'"
		db.execute(sql)
		'response.write sql
	


%>
<script language=javascript>
	alert("추천하였습니다");
	parent.location.reload();
</script>
<%
End If
	db.close
	set db = nothing
	
	'response.end
%>
