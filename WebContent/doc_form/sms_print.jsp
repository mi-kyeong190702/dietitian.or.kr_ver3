<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="kda.utils.ParamUtils,kda.utils.KdaStringUtil" %>
<%@ page import="kda.WorkData"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:choose>
	<c:when test="${!fn:contains( homepage_admin.progid, '908' ) }">
	<script>
	alert("사용권한이 없습니다.");
	lcation.href="/";
	</script>
	</c:when>
	<c:otherwise>
<%
	Map userMap = (Map)session.getAttribute("homepage_admin");

	String pt_name = "";
	String pt_id = "";
	
	String sendym = ParamUtils.getParameter(request, "sendym");
	if( KdaStringUtil.isEmpty(sendym)) {
		sendym= KdaStringUtil.getTodayString().substring(0,6);
	}
	request.setAttribute("sendym", sendym);
	
	String viewtype = ParamUtils.getParameter(request, "viewtype");
	if( KdaStringUtil.isEmpty(viewtype)) { 
		viewtype = "02";
	}
	request.setAttribute("viewtype", viewtype);
	
	String smsval1 =  ParamUtils.getParameter(request, "smsval1");
	if( KdaStringUtil.isEmpty(smsval1)) { 
		smsval1 = "00";				
	}
			
	String smsval2 =  ParamUtils.getParameter(request, "smsval2");
	if( KdaStringUtil.isEmpty(smsval2)) { 
		smsval2 = userMap.get("userid").toString();
		pt_name = userMap.get("username").toString();
		pt_id = userMap.get("userid").toString();
	} else {
		pt_id = smsval2;
		pt_name = ParamUtils.getParameter(request, "sms_name");
	}
	request.setAttribute("userid", userMap.get("userid").toString());
	request.setAttribute("smsval2", smsval2);
	
	String sttype =  ParamUtils.getParameter(request, "sttype");
	if( KdaStringUtil.isEmpty(sttype)) { 
		sttype = "01"; 
	}

	String userbran = userMap.get("userbran").toString();
	String userbran_name = userMap.get("code_bran_str").toString();
	request.setAttribute("userbran", userbran);
	
	String addwhere = "";
	
	
	String doc_name_str;
	String doc_param = "";
	
	if( viewtype.equals("01") ) {
		doc_name_str = "SMS사용비용";
		if( !userbran.equals("01") ) {
			addwhere = " AND etc2 = '"+ userbran +"' ";
		}
		
		if( smsval1.equals("00") ) {
			doc_param = " /rv wa[ AND substring(convert(char,report_time,112),1,6) IN ('" + sendym +"') " + addwhere + " ] ";
		} else {
			doc_param = " /rv wa[ AND substring(convert(char,report_time,112),1,6) IN ('" + sendym +"') AND etc2 = '" + smsval1 + "'  ] ";
		}
	} else {
		doc_name_str = "SMS발송내역";
		if( sttype.equals("02") ) {
			addwhere  = " AND (call_result = '4100' OR call_result = '6600') ";
		} else if( sttype.equals("03") )  {
			addwhere  = " AND (call_result <> '4100' AND call_result <> '6600') ";
		}
		
		if( smsval2.equals("00") ) {
			doc_param = " /rv wa[ WHERE substring(convert(char,report_time,112),1,6) IN ('"+ sendym + "') " +  addwhere + "] pname[전체사용자] pid[ALL] pdt[" + sendym + "]";
		} else if( smsval2.equals("0000") ) {
			doc_param = " /rv wa[ WHERE substring(convert(char,report_time,112),1,6) IN ('" + sendym + "')  AND (etc1 is null or etc1='' )" + addwhere + "]  pname[발신자 미등록] pid[--] pdt[" + sendym + "]";
		} else {
			doc_param = " /rv wa[ WHERE substring(convert(char,report_time,112),1,6) IN ('" + sendym + "')  AND etc1 = '" + smsval2+ "' " + addwhere +"]  pname[" + pt_name + "]  pid[" + pt_id + "] pdt[" + sendym +"]";
		}					
	}
	String zoomratio = "100";
	if( viewtype.equals("02") ) {
		zoomratio = "90";
	} 
%>		
<sql:setDataSource var="dataSource3" dataSource="jdbc/dataSource2" />
<sql:query dataSource="${dataSource3}" var="monthResult">
SELECT 
	substring(convert(char,report_time,112),1,6) as sendmonth  
FROM ums_log
WHERE  (call_result = '4100' OR call_result = '6600') 
	GROUP BY substring(convert(char,report_time,112),1,6) 
ORDER BY substring(convert(char,report_time,112),1,6) DESC 
</sql:query>

<c:if test="${ viewtype == '02' }">
<sql:query dataSource="${dataSource3}" var="userResult">
SELECT
	  DISTINCT ISNULL(etc1, '0000') AS etc1
	, ISNULL( UserName, '사용자미등록') AS username
	, ISNULL( b.UserBran, '0000') as userbran
	, ISNULL(dbo.GetCodeValue('007', b.UserBran), '')  as userbran_name   
FROM ums_log a LEFT JOIN User_Master b ON a.etc1 = b.UserId
WHERE status = '2' 
	<c:if test="${userbran != '01' }">
	AND etc1 = '${userid}'
	</c:if>
	AND substring(convert(char,report_time,112),1,6) = '${sendym}' 
ORDER BY etc1 DESC 
</sql:query>
</c:if>

<!-- // Start // -->
<html>
<head>
	<title>sms사용</title>
	<script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
	<style type="text/css">
	td,select { font-size :12px; text-align:center; }
	</style>
	<script>
	function f_Change(){
		$("#view").val("0");
		<c:if test="${ viewtype == '02' }">
		
		if( $("#smsval2").val() != "" )  {
			var txt = $("#smsval2 option:selected").text();
			var ary = txt.split("(");
			alert(ary[0]);
			$("#sms_name").val(ary[0]);
		}
		</c:if>
		document.frm.submit();
	}
	
	function f_View() {
		if( $("#sendym" ).val() == "" ) {
			alert("발송일자를 선택하여 주십시요");
			$("#sendym").focus();
			return;
		}
		
		<c:if test="${ viewtype == '02' }">
		if( $("#smsval2" ).val() == "" ) {
			alert("발송일자를 선택하여 주십시요");
			$("#smsval2").focus();
			return;
		}
		</c:if>
		
		$("#view").val("1");
		document.frm.submit();
	}
	</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" <c:if test="${param.view == '1' }"> onload="ReportView()"</c:if>>
<form name="frm" method="post" action="./sms_print.jsp">
<table width="1000" cellspacing="0" cellpadding="0" border="0" align="center" >
<tr>
	<td width="25%"></td>
	<td height="30"align="center" class="board_04" style="font-size: 16px;color:#004E9E;" width="50%"><b>SMS 사용</b></td>
	<td align="right" width="25%"><a href="http://www.dietitian.or.kr/CAB/CX60u_OCX_setup.exe" ><img src="/images/common/ser_btn_27.gif" border="0"  align="absmiddle"></a>&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
	<td colspan="3">
		<div style="margin: 10px 0 10px 0">* 조회 조건을 선택 후 검색을 실행하여 주십시요.</div>
		<table style="border-bottom: 2px solid #4AB2E7;border-top: 2px solid #4AB2E7;width:1000px;">
			<tr>
				<td width="100" style="table-layout:fixed;"  bgcolor="#F7FBFF">자료</td>
				<td width="150">
					<select name="viewtype" onchange="f_Change()">
						<option value="02" <% if( viewtype.equals("02") ) { %> selected <% } %> >사용자별 내역</option>
						<option value="01" <% if( viewtype.equals("01") ) { %> selected <% } %>>지부별 내역</option>
					</select>
				</td>
				<td width="100" style="table-layout:fixed"  bgcolor="#F7FBFF">발송일자</td>
				<td width="150">
					<input type="hidden" name="view" id="view" />
					<input type="hidden" name="sms_name" id="sms_name"  value="<%=pt_name%>"/>
					<select name="sendym" id="sendym" onchange="f_Change()">
						<option value="">--선택하세요---</option>
						<c:forEach items="${monthResult.rows}" var="row">
						<option vale="${row.sendmonth}" <c:if test="${ sendym == row.sendmonth }">selected</c:if> >${row.sendmonth}</option>
						</c:forEach>
					</select>
				</td>
				<c:if test="${ viewtype == '02' }">
				<td>발송자</td>
				<td width="150">
					<select name="smsval2" id="smsval2"  onchange="f_Change()">
						<option value="">--선택하세요---</option>
					<c:forEach items="${userResult.rows}" var="row" >
						<option value="${fn:trim(row.etc1)}" <c:if test="${ fn:trim(row.etc1) == smsval2 }">selected</c:if> > ${row.username} ( ${row.userbran_name} ) </option>
					</c:forEach>
					</select>
				</td>
				</c:if>
				<c:if test="${ viewtype == '01' }">
				<td>발송지부</td>
				<td width="150">
					<select name="smsval1" onchange="f_Change()">
						<% if( userbran.equals("01") )  { %>
						<option value="00" <% if( smsval1.equals("00") ) { %> selected <% } %> >전체</option>
						<option value="01" <% if( smsval1.equals("01") ) { %> selected <% } %>>중앙회</option>
						<option value="02" <% if( smsval1.equals("02") ) { %> selected <% } %>>서울특별시영양사회</option>
						<option value="03" <% if( smsval1.equals("03") ) { %> selected <% } %>>부산광역시영양사회</option>
						<option value="04" <% if( smsval1.equals("04") ) { %> selected <% } %>>인천광역시영양사회</option>
						<option value="05" <% if( smsval1.equals("05") ) { %> selected <% } %>>경기도영양사회</option>
						<option value="06" <% if( smsval1.equals("06") ) { %> selected <% } %>>강원도영양사회</option>
						<option value="07" <% if( smsval1.equals("07") ) { %> selected <% } %>>충청북도영양사회</option>
						<option value="08" <% if( smsval1.equals("08") ) { %> selected <% } %>>대전충남세종영양사회</option>
						<option value="09" <% if( smsval1.equals("09") ) { %> selected <% } %>>전라북도영양사회</option>
						<option value="10" <% if( smsval1.equals("10") ) { %> selected <% } %>>광주전남영양사회</option>
						<option value="11" <% if( smsval1.equals("11") ) { %> selected <% } %>>대구경북영양사회</option>
						<option value="12" <% if( smsval1.equals("12") ) { %> selected <% } %>>경상남도영양사회</option>
						<option value="13" <% if( smsval1.equals("13") ) { %> selected <% } %>>울산광역시영양사회</option>
						<option value="14" <% if( smsval1.equals("14") ) { %> selected <% } %>>제주특별자치도영양사회</option>
						<%  } else { %>
						<option value="<%=userbran%>" selected ><%=userbran_name%></option>
						<%  }  %>
					</select>
				</td>
				</c:if>
				<td width="60" bgcolor="#F7FBFF" >상태</td>
				<td>
					<select name="sttype" onchange="f_Change()">
						<option value="01" <% if(  sttype.equals("01") ) { %> selected <% } %>>전체</option>
						<c:if test="${ viewtype == '02' }">
						<option value="02" <% if(  sttype.equals("02") ) { %> selected <% } %>>성공</option>
						<option value="03" <% if(  sttype.equals("03") ) { %> selected <% } %>>실패</option>
						</c:if>
					</select>
					<a href="javascript:f_View()"><img src="/images/common/sms_print.png" align="absmiddle" /></a>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td colspan="3">
		<script type="text/javascript">
		function ReportView(){
			
				//0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기
			//        0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기
		
				//Cxviewer.HideToolBar();
				//Cxviewer.DisableToolbar(0);
				Cxviewer.DisableToolbar(2);
				Cxviewer.DisableToolbar(3);
				Cxviewer.DisableToolbar(12);
				Cxviewer.DisableToolbar(13);
				Cxviewer.DisableToolbar(14);
				Cxviewer.DisableToolbar(16);
				Cxviewer.DisableToolbar(17);
			
				Cxviewer.HidePopupMenu(4);		
				Cxviewer.HidePopupMenu(5);	
				Cxviewer.HidePopupMenu(6);		
				Cxviewer.HidePopupMenu(7);		
				Cxviewer.HidePopupMenu(9);
				Cxviewer.AutoAdjust = false;
				Cxviewer.ZoomRatio = <%=zoomratio%>;
				Cxviewer.SendMail(4);
		
				//Cxviewer.SetBackgroundColor(255,255,255); //테두리 흰색
				//Cxviewer.ShowPopupMenu(3);
				//Cxviewer.ShowPopupMenu(8);
			    Cxviewer. CertPrintDialog(1, "", "", "", "");
				Cxviewer.ApplyLicense ("http://210.127.55.231:8282/DataServer/rdagent.jsp");
				Cxviewer.FileOpen ("<%=WorkData.DOMAIN%>/doc_form/<%=doc_name_str%>.mrd",  "<%=doc_param%>");
		}
		</script>
		
			</td>
		</tr>
	</table>
</form>

<object id=rdpdf50 classid="clsid:0D0862D3-F678-48B5-876B-456457E668BC" width=0% height=0% codebase="http://www.dietitian.or.kr/CAB/rdpdf50.cab#version=2,1,0,73"></object>
<object id=Cxviewer name=Cxviewer width=960 height=84%   align=center classid="clsid:04931AA4-5D13-442f-AEE8-0F1184002BDD" 
	codebase="http://www.dietitian.or.kr/CAB/cxviewer60u.cab#version=6,2,0,35"></object>

</body>
</html>



<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>
		<td height="30"  align="left" class="board_04" >
	※ 증서 출력 프로그램이 실행이 안되실 경우 상단의 <font color="f5500d"><b>출력 프로그램 설치</b></font> 버튼을 클릭해 주세요<br>
	&nbsp;&nbsp;&nbsp;&nbsp;<font color="f5500d"><b>인쇄가 안 되실 경우 JPG 파일로 저장</b></font>  하신 후 <font color="f5500d"><b>저장파일을 열어 인쇄</b></font>하시기 바랍니다.
		</td>
	</tr>
	<tr height="30">
		<td align="center">	<a href="javascript:window.close();" class="btn small t1">닫기</a></td>
	</tr>
</table>					
					
	
	<!-- // END // -->
	</c:otherwise>
</c:choose>
