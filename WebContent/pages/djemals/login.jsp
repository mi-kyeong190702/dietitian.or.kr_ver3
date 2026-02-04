<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>관리자 로그인</title>
	<script language="javascript">
			function CheckForm()
			{
				var obj = document.inputForm;
				
				if(obj.strID.value == "")
				{
					alert('아이디를 입력하세요.');
					obj.strID.focus();
					return false;
				}
				
				if(obj.strPWD.value == "")
				{
					alert('암호를 입력하세요.');
					obj.strPWD.focus();
					return false;
				}
			}
		</script>

</head>
<body>
			<form name="inputForm" action="./loginAction.do" method="post" onsubmit="return CheckForm();">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<!--이 부분으로 해주세요...-->
			<table cellpadding="0" cellspacing="10" border="0" align="center" width="527">
				<tr>
					<td><img src="images/logo.gif"></td>
				<tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" align="center" width="527" height="207" background="/djemals/back/images/bg01.gif">
							<tr>
								<td height="81">&nbsp;</td>
							<tr>
							<tr>
								<td align="right" valign="top" height="126">
									<input type="text" name="strID" size="20" maxlength="12" ID="Text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<BR>
									<img src="../images/space.gif" width="1" height="30"> 
									<input type="password" name="strPWD" size="20" maxlength="12" ID="Password1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<BR>
									<img src="../images/space.gif" width="1" height="30"> 
									<!--로그인버튼--><input type="image" src="/djemals/back/images/butn_login.gif" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							<tr>
						</table>
					</td>
				<tr>
				<tr>
					<td></td>
				<tr>
			</table>
		</form>

</body>
</html>