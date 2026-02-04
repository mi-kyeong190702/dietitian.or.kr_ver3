<%@page import="kda.utils.KdaUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.net.URLDecoder" %>
<%@ page import="kda.utils.ParamUtils,kda.utils.KdaStringUtil" %>
<%@ page import="kda.WorkData"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%


	String strID	= ParamUtils.getParameter( request, "strID");
	String strPWD 	= ParamUtils.getParameter( request, "strPWD");

	request.setAttribute("strID", strID);
	request.setAttribute("strPWD", strPWD);
	
	String eduyear = ParamUtils.getParameter( request,  "eduyear");
	int now = KdaStringUtil.getYear();
	request.setAttribute("now", now);
	if( eduyear.equals("") ) {
		eduyear = Integer.toString(now);
	}
	
	String edubran  =  ParamUtils.getParameter( request, "edubran");
	String educode =  ParamUtils.getParameter( request, "educode");
	
	request.setAttribute("eduyear", eduyear);
	request.setAttribute("edubran", edubran);
	request.setAttribute("educode", educode);
	
	String doc_name_str = "";
	String doc_param = "";
	
	if( educode.equals("") ) {
		doc_name_str = "위생교육증서_null";
	} else {
		doc_param = "/rv code_seq[" + educode + "] "; 
		doc_name_str = "위생교육증서";
	}
%>
<sql:setDataSource var="dataSource2" dataSource="jdbc/dataSource2" />
<sql:query dataSource="${dataSource2}" var="adminResult">
SELECT 
	 A.UserId, A.UserName, A.UserBran, case when PWDCOMPARE('${strPWD}', A.UserPW) = 1 then 'Y' else 'N' end as PWCHK   
FROM User_Master A , user_power B
WHERE A.UserId='${strID}' 
	AND A.UserId= B.UserId 
	AND A.use_yn = 'Y' 
	AND A.use_yn = 'Y' 
	AND B.progid =  '907' 
</sql:query>
<c:set value="${adminResult.rows[0]}" var="admin" />
<c:choose>
	<c:when test="${ admin eq null || admin.PWCHK == 'N' }">
		<script>
			alert("사용권한이 없으십니다. 확인후 사용하여 주십시요");
			window.close();
		</script>
	</c:when>
	<c:otherwise>
	
		<c:if test="${ empty edubran }">
			<c:set value="${admin.UserBran}" var="edubran" />
		</c:if>
<html>
	<head>
	<title></title>
	<link href="/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/layout.css" rel="stylesheet" type="text/css">
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" align="center"  style="text-align:center;" onLoad="onLoad()">
<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
	<tr>
		<td width="25%"></td>
		<td height="30"align="center" class="board_04" style="font-size: 16px;" width="50%">위생교육 영수증 출력</td>
		<td align="right" width="25%">
		<a href="/CAB/CX60u_OCX_setup.exe" class="btn small ">설치</a>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<form name="print" method="post" action="receipt_print.jsp">
			<input type="hidden" name="strID" value="<%=strID%>">
			<input type="hidden" name="strPWD" value="<%=strPWD%>">
				<table width="730" cellspacing="0" cellpadding="0" border="0" align="center" >
					<tr align="center" >
						<td height="5" colspan="6"></td>
					</tr>
					<tr align="center" bgcolor="4AB2E7">
						<td height="2" colspan="6"></td>
					</tr>	
					
					<tr height="30">
						<td width="80" style="table-layout:fixed"  bgcolor="#F7FBFF" class="board_05" >교육년도</td>
						<td width="80">
							<input type="hidden" name="strID" value="<%=strID%>">
							<input type="hidden" name="strPWD" value="<%=strPWD%>">
							<select name="eduyear" onchange="document.print.submit();">
							<c:forEach begin="2010" end="${now}" var="i">
								<option value="${i}"  <c:if test="${ i == eduyear }">selected</c:if> >${i}</option>
							</c:forEach>
							</select>	
						</td>
						<td>지부</td>
						<td>
							
							<select size="1" name="edubran"  onchange="document.print.submit();">
								<option value="0">-지부선택-</option>
								<option value="01" <c:if test="${ edubran == '01' }">selected</c:if>>중앙회</option>
								<option value="02" <c:if test="${ edubran == '02' }">selected</c:if>>서울지부</option>
								<option value="03" <c:if test="${ edubran == '03' }">selected</c:if>>부산지부</option>
								<option value="04" <c:if test="${ edubran == '04' }">selected</c:if>>인천지부</option>
								<option value="05" <c:if test="${ edubran == '05' }">selected</c:if>>경기지부</option>
								<option value="06" <c:if test="${ edubran == '06' }">selected</c:if>>강원지부</option>
								<option value="07" <c:if test="${ edubran == '07' }">selected</c:if>>충북지부</option>
								<option value="08" <c:if test="${ edubran == '08' }">selected</c:if>>대전충남세종지부</option>
								<option value="09" <c:if test="${ edubran == '09' }">selected</c:if>>전북지부</option>
								<option value="10" <c:if test="${ edubran == '10' }">selected</c:if>>광주전남지부</option>
								<option value="11" <c:if test="${ edubran == '11' }">selected</c:if>>대구경북지부</option>
								<option value="12" <c:if test="${ edubran == '12' }">selected</c:if>>경남지부</option>
								<option value="13" <c:if test="${ edubran == '13' }">selected</c:if>>울산지부</option>
								<option value="14" <c:if test="${ edubran == '14' }">selected</c:if>>제주지부</option>
							</select>
						</td>
						<td>
						<sql:query dataSource="${dataSource2}" var="eduResult">
						SELECT 
								  et.yyyy, et.code_kind + et.code_certifi + et.code_seq + et.code_bran + et.bran_seq oper_code 
								, etn.edutest_name
								,  et.operation_cnt
								, et.season
								, (SELECT cc.detcodename FROM com_code cc WHERE cc.groupcode='034' and cc.detcode = et.code_bran) As instrument
								, (SELECT cc.certifi_name FROM certifi cc WHERE cc.code_certifi = et.code_certifi) As certifi_name
								, et.oper_start_dt
								, SUBSTRING(oper_start_dt,1, 4) + '년 ' + SUBSTRING(oper_start_dt, 5, 2) + '월 ' + SUBSTRING(oper_start_dt, 7, 2) + '일' daystr 
								, case ( case isdate(oper_start_dt) when 1 then DATEPART(DW,CONVERT(DATETIME,oper_start_dt)) else '0' end ) 
								 	when 1 then '(일)'
									when 2 then '(월)'
									when 3 then '(화)'
									when 4 then '(수)'
									when 5 then '(목)'
									when 6 then '(금)'
				 					when 7 then '(토)'
									else ''
									end weekdaystr
								, et.receipt_pers_cnt
						FROM edu_test_name etn INNER JOIN edu_test et 
							ON etn.code_kind = et.code_kind and etn.code_certifi = et.code_certifi and etn.code_seq = et.code_seq 
						WHERE et.yyyy ='${eduyear}'
							and etn.code_kind = '4'
							and  et.code_bran = '${edubran}' order by daystr asc 
					</sql:query>
					<td>교육명</td>
					<td>
						<select name="educode"  onchange="document.print.submit();">
							<option value="">--교육선택--</option>	
							<c:forEach items="${eduResult.rows}" var="row"> 
							<option value="${row.oper_code}">${row.operation_cnt}회차 ${row.daystr}  ${row.weekdaystr}</option>
							</c:forEach>
						</select>		
					</td>	
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<script language="javascript">
			function onLoad() {
				// 0-파일저장,1-인쇄,2-찾기,3-목차만들기,4-화면확대,5-화면축소,12-리포팅중지, 13-엑셀로보기,14-아래아한글로보기, 15PDF로보기, 16-파워포인트로보기, 17-워드로보기
				// Cxviewer.HideToolBar();
				// Cxviewer.DisableToolbar(0);
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
				Cxviewer.ZoomRatio = 100;
				Cxviewer.SendMail(4);
			
				//Cxviewer.SetBackgroundColor(255,255,255); //테두리 흰색
				//0 : 팝업메뉴 전체, 1 : 다음/이전 페이지, 2 : 확대/축소, 3 : 인쇄, 4 : 파일저장, 5 : 차트바꾸기, 6 : 트리관리창 보이기, 7 : 이전/이후 문서, 8 : E-mail에 첨부하기, 9 : 일부페이지 저장
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

<object id=rdpdf50 classid="clsid:0D0862D3-F678-48B5-876B-456457E668BC" width=0% height=0% codebase="http://www.dietitian.or.kr/CAB/rdpdf50.cab#version=2,1,0,73"></object>
<object id=Cxviewer name=Cxviewer width=960 height=84% align=center classid="clsid:04931AA4-5D13-442f-AEE8-0F1184002BDD" codebase="http://www.dietitian.or.kr/CAB/cxviewer60u.cab#version=6,2,0,35"></object>
		
		

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
<br/><br/>
</body>
</html>

	</c:otherwise>
</c:choose>