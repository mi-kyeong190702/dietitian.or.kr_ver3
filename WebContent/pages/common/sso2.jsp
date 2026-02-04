<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>온라인 교육 - SSO</title>
</head>
<body>
<c:choose>
	<c:when test="${ not empty errorMsg  }">
<script>
	alert("${errorMsg}");
</script>
	</c:when>
	<c:otherwise>
<form name=form method=post>
<!-- 아래 파라미터 명은 변경이 되면 안됩니다. -->
<input type=hidden name="userId" value="${person.id}">
<input type=hidden name="passwd" value="${person.pers_hp}">
<input type=hidden name="ssoCd" value="90XMWD34RJMZIXJNJN2S9UGSUM4H26GI9Q0">


<!-- <input type=hidden name="juminUse" value="N">Y : 주민등록번호 사용 , N : 주민등록번호 비사용. -->
<!-- <input type=hidden name="juminNum" value="111111-1111111">juminUse가 'N'이거나 미입력시 '111111-1111111' 로 입력  -->
<input type=hidden name="phoneHome" value="${person.pers_tel}"><!-- 필수입력 -->
<input type=hidden name="phoneMobile" value="${person.pers_hp}"><!-- 필수입력 -->
<input type=hidden name="postCd" value="${person.code_post}"><!-- 필수입력 -->
<input type=hidden name="userNm" value="${person.pers_name}"><!-- 필수입력 -->
<input type=hidden name="address" value="${person.pers_add }"><!-- 필수입력 -->
<input type=hidden name="addressSub" value="${person.pers_add_detail }"><!-- 필수입력 -->
<input type=hidden name="email" value="${person.email}"><!-- 필수입력 -->
<input type=hidden name="sexType" value="${person.code_sex}"><!-- 1 : 납자 , 2 : 여자.  미 입력시 남자로 입력. -->
<!-- <input type=hidden name="recvMail" value="Y"> Y : 뉴스 메일 수신, N : 수신안함. 미입력시 수신 안함. -->
<input type=hidden name="groupCode" value="${person.groupcode}">
<input type=hidden name="birthday" value="${person.pers_birth}">
<input type=hidden name="addItem1" value="${person.lic_no}">
<input type=hidden name="recvSms" value="Y"> <!-- Y : SMS수신여부, N : 수신안함. 미입력시 수신 안함. -->
</form>


<Script Language="javascript">
/*
스크립트 양식은 변경하시면 안됩니다.
굳이 변경이 필요하시면 넘겨주는 변수를
encodeURIComponent() 함수에 변수를 넣어서
  넘겨주시기 바랍니다.
*/

var f = document.form;

document.form.phoneHome.value = (f.phoneHome.value).replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
document.form.phoneMobile.value = (f.phoneMobile.value).replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, "$1-$2-$3");
document.form.birthday.value = (f.birthday.value).replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');

// alert( f.phoneHome.value );
// alert( f.phoneMobile.value );
// alert( f.birthDay.value );

//action 주소는 고객사 주소로 변경바람..
var userid = encodeURIComponent(f.userId.value);
var passwd = encodeURIComponent(f.passwd.value);
var ssoCd = encodeURIComponent(f.ssoCd.value);
var userNm = encodeURIComponent(f.userNm.value);
var address = encodeURIComponent(f.address.value);

passwd = btoa(passwd)

f.userId.value = userid;
f.passwd.value = passwd;
f.ssoCd.value = ssoCd;
f.userNm.value = userNm;
f.address.value = address;

f.action = "https://kdaonline.hullaro.com/mediopia/ssoAutoLogin";
f.submit();
</Script>
	
	</c:otherwise>
</c:choose>


</body>
</html>