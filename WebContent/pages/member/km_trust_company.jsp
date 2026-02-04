<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="kda.utils.ParamUtils"%>

<%

	String rt_code 	= "";
	String d_type	= "";
	

	String onloadStr	= "";
	String ser_keyword	= "";
	String trust_name	= "";
	String trust_post	= "";
	String trust_addr	= "";
	String trust_tel	= "";
	String addr			= "";
	String trust_code	= "";
	
	d_type 		= ParamUtils.getParameter(request, "d_type"); 
	ser_keyword = ParamUtils.getParameter(request, "ser_keyword");
	trust_name	= ParamUtils.getParameter(request, "trust_name");
	trust_post 	= ParamUtils.getParameter(request, "trust_post");
	trust_addr 	= ParamUtils.getParameter(request, "trust_addr");
	trust_tel 	= ParamUtils.getParameter(request, "trust_tel");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>위탁업체 찾기</title>
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/layout.css">
	<link rel="shortcut icon" href="/css/favicon.ico" />
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/dietitan.js"></script>
<script language="javascript">

$("document").ready(function(){
	$(".insert_zone").hide();
});

function deposit_ser(){	
	var f = document.forms["dform"];
	var searchKeyword = dform.ser_keyword.value;	
	if(searchKeyword.length < 2){
		alert("2자 이상 입력해 주세요");
		return;
	}
	dform.d_type.value = "1";
	
	f.action = "/getTrustCompanyList.do";
	f.submit();

}

function deposit_add_view(){
	$(".insert_zone").show();
}

function deposit_add(){

	if(dform.trust_name.value ==""){
		alert("업체명을 입력해주세요");
		return;
	}
	if(dform.trust_tel.value ==""){
		alert("전화번호를 입력해주세요");
		return;
	}
	if(dform.trust_post.value ==""){
		alert("우편번호를 입력해주세요");
		return;
	}
	if(dform.trust_addr.value ==""){
		alert("주소를 입력해주세요");
		return;
	}

	dform.d_type.value = "0";
	
	dform.action = "/insert_trust_company.do";
	dform.method ="post";
		
	dform.submit();
}


function ck_apply(str1,str2,str3,str4) {

	opener.document.join.trust_code.value=str1;
	opener.document.join.trust_name.value=str2;
	opener.document.join.trust_tel.value = str3;
	opener.document.join.trust_addr.value = str4;
	opener.document.join.company_meal.focus();
	window.selfclose();
}

</script>
</head>
<body>

<div id="popup">
	<form name="dform" method="post">
	<input type="hidden" name ="d_type" value="1">
	<div class="p_head">
		<h2 class="title t3 cw bold s1 i_b_t6">위탁업체 찾기</h2>
	</div>
		<fieldset>
			<legend><span class="ti">위탁없체 찾기</span></legend>
			<div class="box t3 p10 text">
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="ser_keyword" class="ff_title i_b"><strong>업체명</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" name="ser_keyword" class="fl input t1 w200" id="ser_keyword" value="${param.ser_keyword}" />
									<a href="javascript:deposit_ser();" class="btn form t1 fl ml5" type="button">검색<span class="icon search"></span></a>
									<a href="javascript:deposit_add_view()" class="btn form t4 fl ml5" type="button">업체추가</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8 insert_zone">
						<div class="f_field div3">
							<label for="trust_name" class="ff_title i_b"><strong>업체명</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" name="trust_name" class="input t1 fl w100" id="trust_name" />
								</div>
							</div>
						</div>
						<div class="f_field div3">
							<label for="trust_tel" class="ff_title i_b"><strong>전화번호</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" name="trust_tel" class="input t1 fl w100" id="trust_tel" onkeydown="checkDigit(this)" maxlength="15"/>
								</div>
							</div>
						</div>
						<div class="f_field div3">
							<label for="trust_post" class="ff_title i_b"><strong>우편번호</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" name="trust_post" class="input t1 fl w100" id="trust_post" onkeydown="checkDigit(this)" maxlength="6"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap p8 insert_zone">
						<div class="f_field div1">
							<label for="trust_addr" class="ff_title i_b"><strong>주소</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" name="trust_addr" class="input t1 fl w200" id="trust_addr" />
									<a href="javascript:deposit_add()" class="btn form t1 fl ml5" type="button">추가</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="area m5">
				<table class="table t2 text s1 ssmall ca center mt20 mb10">
					<colgroup>
						<col width="70">
						<col width="90">
						<col width="*">
						<col width="70">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="bold cm">업체명</th>
						<th scope="col" class="bold cm">전화번호</th>
						<th scope="col" class="bold cm">주소</th>
						<th scope="col" class="bold cm">선택</th>
					</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${list}" var="comp">
					<tr>
						<td>${comp.trust_name }</td>							
						<td>${comp.trust_tel}</td> 
						<td>${comp.trust_addr }</td>
						<td>
						<a href="javascript:ck_apply('${comp.trust_code }','${comp.trust_name }','${comp.trust_tel }','${comp.trust_addr }');"
							class="btn small t3">선택</a>						
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="p_foot line bt">
				<div class="btn_wrap mt20">
					<ul>
						<li><a href="javascript:window.close();" class="btn big">창닫기</a></li>
					</ul>
				</div>
			</div>
		</fieldset>
	</form>
</div>
	
	<!-- 


		  <tr align="center" bgcolor="4AB2E7">
			<td height="2" colspan="4"></td>
		  </tr>
	<tr height = "40" >
		<td valign="middle" bgcolor="#F7FBFF" class="board_06">
             	  업체명 &nbsp;&nbsp;<input type="text" name="ser_keyword" size="13" value="<%=ser_keyword.replaceAll("<","&lt;").replaceAll(">","&gt;")%>"  class="form1"/>&nbsp; <a href="javascript:deposit_ser();"><img src="/member/images/new/join_btn_06.gif" alt="검색" align="absmiddle"></a>
				  <a href="javascript:deposit_add_view('1');"><img src="/member/images/new/ser_btn_05.gif" align="absmiddle" alt="업체추가"></a> 
		</td>
	</tr>

	<tr align="center" bgcolor="CAE6FC">
		<td height="2" colspan="6"></td>
	</tr>

	<tr height = "70" id="add" style="display:none;">
		<td valign="middle"  align="center">
          <table width="580" border="0" align="left">

				<tr>
                  <td width="70" bgcolor="#F7FBFF" class="board_06"><span class="style7">*</span> 업체명</td>
				  <td width="140" ><input type="text" name="trust_name" size="13" value=""  class="form1"/></td>
                  <td width="80" bgcolor="#F7FBFF" class="board_06"><span class="style7">*</span> 전화번호</td>
				  <td width="110" ><input type="text" name="trust_tel" size="11" value="" maxlength="9"  onKeyPress="onlyNumber()"  class="form1"/></td>
                  <td width="70" bgcolor="#F7FBFF" class="board_06">우편번호</td>
				  <td width="120"><input type="text" name="trust_post" size="8" value="" maxlength="6"  onKeyPress="onlyNumber()"  class="form1"/></td>
				</tr>
				<tr align="center" bgcolor="D6D7D6">
					<td height="1" colspan="6" class="board_06"></td>
				</tr>
                <tr>
                  <td bgcolor="#F7FBFF" class="board_06"><span class="style7">*</span> 주소</td>
				  <td  colspan="5"><input type="text" name="trust_addr" size="50" value="" class="form1" />&nbsp;<a href="javascript:deposit_add();"><img src="/member/images/new/ser_btn_07.gif" align="absmiddle"></a>				  
				  <input type="hidden" name="add_form_ck" value="1"> 
				  </td>
				</tr>
				<tr align="center" bgcolor="D6D7D6">
					<td height="1" colspan="6" class="board_06"></td>
				</tr>
		</table>
					  
		</td>
	</tr>
	<tr>
     <tr valign="top">
		<td height="5" ><img src="../images/member/space.gif" width="10" height="1"></td>
	 </tr>
		<td align="left" height = "30">

		<table width="560" border="0" cellspacing="0" cellpadding="0" align="left" >

		  <tr align="center" bgcolor="4AB2E7">
			<td height="2" colspan="4"></td>
		  </tr>		
		<tr height="30">
			<td width="150" style="table-layout:fixed" align="center" class="board_01">업체명</td>
			<td width="70" style="table-layout:fixed" align="center" class="board_01">전화번호</td>
			<td width="290" style="table-layout:fixed" align="center" class="board_01">주소</td>
			<td width="50" style="table-layout:fixed" align="center" class="board_01">선택</td>
		</tr>
	  <tr align="center" bgcolor="CAE6FC">
		<td height="2" colspan="4"></td>
	  </tr>
		</table>

	</td>
	</tr>
	<tr>
		<td align="left">


<div id="rttable" style="overflow-y:scroll;overflow-x:hidden;height:320px">

		<table width="560" border="0" cellspacing="0" cellpadding="0" align="left" bordercolorlight="a2a2a2" bordercolordark="#FFFFFF">

		<c:choose>
			<c:when test="${requestScope.list.size() > 0 }">
				<c:forEach var="i" begin="0" end="${requestScope.list.size()-1 }">
					<td>${requestScope.list[i].trust_name }</td>							
					<td>${requestScope.list[i].trust_tel}</td> 
					<td>${requestScope.list[i].trust_addr }</td>
					<td width="50" style="table-layout:fixed" align="center" class="news" >
					<a href="javascript:ck_apply('${requestScope.list[i].trust_code }'
												,'${requestScope.list[i].trust_name }'
												,'${requestScope.list[i].trust_tel }'
												,'${requestScope.list[i].trust_addr }');"><img src="/member/images/new/ser_btn_10.gif" border="0" align="absmiddle"></a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td class="text02" style="text-align:left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;등록된 업체가 없습니다 업체추가 후 등록해주세요 <br><br>
		 &nbsp;&nbsp;&nbsp;&nbsp;※ 위탁업체명은 본사기준입니다. <br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당 위탁업체명에 주소, 전화번호 오류가 있는 경우  <br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아래의 클릭하기를 눌러 이메일로 알려주시기 바랍니다. <br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;< 이메일보내기: <a href='mailto:center@dietitian.or.kr'>center@dietitian.or.kr</a> >
		
		</td></tr>
			</c:otherwise>
		</c:choose>
	
		</table>
</div>
		
		</td>
	</tr>
	<tr><td>
			<table width="560" border="0" cellspacing="0" cellpadding="0" align="left" >

		  <tr align="center" bgcolor="4AB2E7">
			<td height="2" colspan="4"></td>
		  </tr>
		  </table>
	</td></tr>

	<tr height="40"><td align="center" valign="middle">	<a href="javascript:;" onclick="window.close();"><img src="/member/images/new/join_btn_05.gif" border="0"></a></td></tr>


	</form>
	</table>
	</td>
</tr>
 -->
</table>
</body>
</html>