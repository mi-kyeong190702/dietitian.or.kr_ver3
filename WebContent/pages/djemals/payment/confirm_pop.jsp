<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>*** KCP Online Payment System [ASP Version] ***</title>
<link href="/djemals/css/sample.css" rel="stylesheet" type="text/css">
<script>
function  jsf__go_mod( form )
{
    if ( form.mod_type.value != 'mod_type_not_sel' )
    {
        if ( form.tno.value.length < 14 )
        {
            alert( "KCP 거래 번호를 입력하세요" );
            form.tno.focus();
            form.tno.select();
        }
		else if (form.order_Cancel_Name.value == "")
		{	alert( "취소자명을 입력하세요" );
            form.order_Cancel_Name.focus();
            form.order_Cancel_Name.select();
		}
		else if (form.order_Cancel_Msg.value == "")
		{	alert( "취소사유를 입력하세요" );
            form.order_Cancel_Msg.focus();
            form.order_Cancel_Msg.select();
		}
        else
        {
            form.submit();
        }
    }
    else
    {
        alert( "거래 구분을 선택하여 주십시요." );
        form.mod_type.focus();
    }
}

</script>
<body>

<c:if test="${null ne msg && msg !=''}">
<script>
	alert('${msg}');
	top.opener.document.location.reload();
	self.close();
</script>
</c:if>

<c:choose>

<c:when test="${view.order_status != '00' }">
<h3>
현재 결제정보가 취소 상태에 있습니다.<br>
결제를 취소 할 수 없습니다. 
</h3>
</c:when>
<c:otherwise>

<form name="mod_form" action="confirmAction.do" method="post">

<c:set var ="site_cd" value=""/>
<c:set var ="site_key" value=""/>
<c:choose>
	<c:when test="${view.code_bran == '0' || view.code_bran == '1'}">
	<!-- 중앙 -->
	<c:set var ="site_cd" value="P3286"/>
	<c:set var ="site_key" value="3cyF-XEK0ro1JTG-xCCKxP6__"/>
	</c:when>
	<c:when test="${view.code_bran == '10'}">
	<!-- 서울-->
	<c:set var ="site_cd" value="P3300"/>
	<c:set var ="site_key" value="0mKBBU4vXhl0VszRQPWD3Jx__"/>
	</c:when>
	<c:when test="${view.code_bran == '20'}">
	<!-- 부산 -->
	<c:set var ="site_cd" value="P3290"/>
	<c:set var ="site_key" value="2n5lW8VZ1WfOePaSEhAdUS1__"/>
	</c:when>
	<c:when test="${view.code_bran == '30'}">
	<!-- 인천 -->
	<c:set var ="site_cd" value="P3291"/>
	<c:set var ="site_key" value="1bVE49GJeGZ--2r-Qwjkmhd__"/>
	</c:when>
	<c:when test="${view.code_bran == '40'}">
	<!-- 경기 -->
	<c:set var ="site_cd" value="P3299"/>
	<c:set var ="site_key" value="2dussbq0Xo-ZXMmr1wmXukf__"/>
	</c:when>
	<c:when test="${view.code_bran == '50'}">
	<!-- 강원 -->
	<c:set var ="site_cd" value="P3289"/>
	<c:set var ="site_key" value="11BAmy8G-TOf3wn4vpFAnyf__"/>
	</c:when>
	<c:when test="${view.code_bran == '60'}">
	<!-- 충북 -->
	<c:set var ="site_cd" value="P3297"/>
	<c:set var ="site_key" value="2.9YH2oi9tuX5RGcLG7B.Z1__"/>
	</c:when>
	<c:when test="${view.code_bran == '70'}">
	<!-- 대전충남 -->
	<c:set var ="site_cd" value="P3287"/>
	<c:set var ="site_key" value="2ZUIzQYDGW8.pQaywaBCnO4__"/>
	</c:when>
	<c:when test="${view.code_bran == '80'}">
	<!-- 전북 -->
	<c:set var ="site_cd" value="P3294"/>
	<c:set var ="site_key" value="15xXUF4Ho231oBdeZTaMkfN__"/>
	</c:when>
	<c:when test="${view.code_bran == '90'}">
	<!-- 광주전남 -->
	<c:set var ="site_cd" value="P3295"/>
	<c:set var ="site_key" value="2sZ-5Evz92oOafSb.6OBfj4__"/>
	</c:when>
	<c:when test="${view.code_bran == '100'}">
	<!-- 대구경북 -->
	<c:set var ="site_cd" value="P3292"/>
	<c:set var ="site_key" value="4ljgq3R60jgg6yL-2gR3MxY__"/>
	</c:when>
	<c:when test="${view.code_bran == '110'}">
	<!-- 경남 -->
	<c:set var ="site_cd" value="P3288"/>
	<c:set var ="site_key" value="3YbWQflZLwSy02nRLXYCKZF__"/>
	</c:when>
	<c:when test="${view.code_bran == '120'}">
	<!-- 울산 -->
	<c:set var ="site_cd" value="P3298"/>
	<c:set var ="site_key" value="45pL8rXMluvjoaSEFLarC0O__"/>
	</c:when>
	<c:when test="${view.code_bran == '130'}">
	<!-- 제주 -->
	<c:set var ="site_cd" value="P3293"/>
	<c:set var ="site_key" value="35XkN0I39DgVdAUK5v5ikY6__"/>
	</c:when>
	<c:otherwise>
	<!-- 모두 중앙으로 -->
	<c:set var ="site_cd" value="P3286"/>
	<c:set var ="site_key" value="3cyF-XEK0ro1JTG-xCCKxP6__"/>
	</c:otherwise>
</c:choose>

<input type='hidden' name='flag'  value='01' >
<input type='hidden' name='site_cd'  value='${site_cd }' >
<input type='hidden' name='site_key' value='${site_key }'>
<input type='hidden' name='req_tx'   value='mod'>
<input type='hidden' name='o_code'   value='${view.o_code }'>

<table border='0' cellpadding='0' cellspacing='1' width='500' align='center'>
    <tr>
        <td align="left" height="25"><img src="/djemals/css/images/KcpLogo.jpg" border="0" width="65" height="50"></td>
        <td align='right' class="txt_main">Dietitian 자체 취소</td>
    </tr>
    <tr>
        <td bgcolor="CFCFCF" height='3' colspan='2'></td>
    </tr>
    <tr>
        <td colspan="2">
            <br>
            <table width="90%" align="center">
                <tr>
                    <td bgcolor="CFCFCF" height='2'></td>
                </tr>
                <tr>
                    <td align="center"> 취소/매입 요청 </td>
                </tr>
                <tr>
                    <td bgcolor="CFCFCF" height='2'></td>
                </tr>
            </table>
            <table width="90%" align="center">
                <tr>
                    <td>구분</td>
                    <td>
						<select name='mod_type'>
                            <option value='mod_type_not_sel'>선택하십시오</option>
                            <option value='STSC'>취소</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>KCP 거래번호</td>
                    <td>
                        <input type='text' name='tno' value='${view.tno }' size='20' maxlength='14' >
                    </td>
                </tr>

                <tr>
                    <td>취소자명</td>
                    <td>
                        <input type='text' name='order_Cancel_Name' value='' size='20' maxlength='14'>
                    </td>
                </tr>

                <tr>
                    <td>취소사유</td>
                    <td>
                        <input type='text' name='order_Cancel_Msg' value='' size='20' maxlength='120'>
                    </td>
                </tr>

                <tr>
               <td colspan="2" align="center">
                        <input type="button" value="확 인" class="box" onclick='jsf__go_mod( this.form )'>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="CFCFCF" height='3' colspan='2'></td>
    </tr>
    
</table>

</form>


</c:otherwise>
</c:choose>
</body>
</html>

