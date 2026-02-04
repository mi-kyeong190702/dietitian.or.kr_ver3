<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.MailBean"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>지로용지 발송 요청</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/layout.css">
<link rel="shortcut icon" href="/css/favicon.ico" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="/js/default.js" type="text/JavaScript"></script>
<script language="JavaScript">

	function openJusoPopup() 
	{
		var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack( roadFullAddr
						 , roadAddrPart1
						 , addrDetail
						 , roadAddrPart2
						 , engAddr
						 , jibunAddr
						 , zipNo
						 , admCd
						 , rnMgtSn
						 , bdMgtSn)
	{
		document.giroFrm.pers_add.value  = roadAddrPart1 + " " + addrDetail + " " + roadAddrPart2;		
		document.giroFrm.code_post.value = zipNo.substring(0, 3) + zipNo.substring(4, 7);
	}
	
	function send()
	{
		var f = document.forms["giroFrm"];		
		if (f.pers_name.value=="") {
			alert("이름을 입력하세요");
			f.pers_name.focus();
		} else if (f.code_post.value == "" ){
			alert("주소를 정확히 입력하세요");
		} else if (f.pers_tel.value==""){
			alert("연락 가능한 번호를 입력하세요");
			f.pers_tel.focus();
		} else  {
			f.method = "post";
			f.target = "proc";
			f.action = "/member_sendmail.do";
			f.submit();
		}
	}
	
	function sendMailOk()
	{
		window.returnValue = true;
		self.close();
	}

</script>
</head>

<body>
<form name="giroFrm">
<div id="popup">
	<div class="p_head">
		<h2 class="title t3 cw bold s1 i_b_t6">지로용지 발송 요청</h2>
	</div>
	<div class="p_body text ca small">
		<div class="p20">
			<div class="area">
				지로의 경우 , 회원 인증시까지 최소 2 주정도가 소요되므로 참고하시기 바랍니다. 
			</div>
			<div class="area mt10">
				<div class="form mt10 line bt bcm">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="pers_name" class="ff_title i_b"><strong>성명</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="pers_name"  name="pers_name"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="code_post" class="ff_title i_b"><strong>우편번호</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 fl w200" id="code_post" name="code_post" readonly/>
									<a href="javascript:openJusoPopup();" class="btn form t1 fl ml5">주소검색</a>
									<p class="fl text cp ml10">주소검색(우편번호) :  - 없이 한 칸으로 만들어주세요. </p>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="pers_add" class="ff_title i_b"><strong>받을주소</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1" id="pers_add" name="pers_add" readonly/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="pers_tel" class="ff_title i_b"><strong>연락처</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="pers_tel" name="pers_tel"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="requestMsg" class="ff_title i_b"><strong>기타 요청사항</strong></label>
							<div class="ff_wrap ml120">
								<div class="area mt5">
									<input type="text" class="input t1" id="requestMsg" name="requestMsg"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="area mt10">
				※ 접수된 요청서는 발송 요청한 주소로 3~4 일이내 발송하여 드리도록 하겠습니다.
			</div>
		</div>
	</div>
	<div class="p_foot line bt">
		<div class="btn_wrap mt20">
			<ul>
				<li><a href="javascript:send();" class="btn big t1">확인</a></li>
				<li><a href="#" onclick="window.close();" class="btn big">취소</a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<iframe width=0 height=0 name="proc"></iframe>
</body>
</html>