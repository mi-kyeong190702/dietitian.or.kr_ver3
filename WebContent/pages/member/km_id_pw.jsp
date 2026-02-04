<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String checkTitle="면허번호";
%>
<style type="text/css">
.Pstyle {
	opacity: 0;
	display: none;
	background-color: #fff;
}

.b-close {
	
	min-width: 68px;
	height: 38px;
    padding: 0px 15px;
    font: 15px NanumGothic;
    line-height: 38px;
    border: #006ab6 solid 1px;
    background: #f5f6f8;
    color: #006ab6;
    text-decoration: underline;
    vertical-align: middle; 
    border-radius: 4px;
    text-align: center;
    cursr:pointer;
     
	display: inline-block;
}

</style>


<script type="text/javascript">
	$(document).ready(function() {
		$("#popup").hide();

	});

	function frmChk() {

		f = document.form1;
		if (f.uname.value == "") {
			alert("이름을 입력하세요");
			f.uname.focus();
			return;
		} else if (f.pers_birth.value == "") {
			alert("생년월일을 입력하세요");
			f.pers_birth.focus();
			return;
		} else if (f.pers_birth.value.length != 8) {
			alert("생년월일을 정확하게 입력하세요.\n(예: 19800101과 같이 숫자만 입력)");
			f.pers_birth.focus();
			return;
		} else if (f.pers_hp.value == "") {
			alert("휴대전화번호를 입력하세요");
			f.pers_hp.focus();
			return;
		}

		findMemId();
	}

	function frm2Chk(gubun) {

		var f = document.forms["form2"];

		if (f.uid.value == "") {
			alert("아이디를 입력하세요");
			f.uid.focus();
			return;
		} else if (f.uname.value == "") {
			alert("이름을 입력하세요");
			f.uname.focus();
			return;
		} else if (f.pers_birth.value == "") {
			alert("생년월일을 입력하세요");
			f.pers_birth.focus();
			return;
		} else if (f.pers_birth.value.length != 8) {
			alert("생년월일을 정확하게 입력하세요.\n(예: 19800101과 같이 숫자만 입력)");
			f.pers_birth.focus();
			return;
		}
		
		initPw(gubun);
	}

	function findMemId() {
		var f = document.forms["form1"];

		var param = "";
		param += "uname=" + escape(encodeURIComponent(f.uname.value))
		param += "&pers_birth=" + f.pers_birth.value;
		param += "&pers_hp=" + f.pers_hp.value;
		
			$.ajax({
			type : "POST",
			url : "/member_doFindUserId.do",
			data : param,
			dataType : "html",
			cache : false,
			success : handleGetMemberId,
			error : handleGetMemberIdError
		});
	}

	function handleGetMemberId(data) {
		
		$('#popup').show();
		$('#popup').bPopup();
	
		var uname = document.form1.uname.value;
			
		if (data.indexOf("success") >= 0) {
			
			var userd = data.split("=")[1];				
			var viewId = userd.substring(0, 3); 			
		
			for(var i = 0; (userd.length) - 3 > i ; i++)
			{
				viewId = viewId + "*";
			}
			
			$('#popupMsg')[0].innerHTML = uname +"님의 아이디는 <strong class='bold cm'>"+viewId+"</strong> 입니다.<br/> 회원님의 정보 보안을 위해  아이디 3자리만 표기 하였습니다";				
		}else if(data.indexOf("multi") >= 0){ //다중아이디
			$('#popupMsg')[0].innerHTML = "관리자에게 02-823-5680(311)으로 문의주세요";
		}else if(data.indexOf("del") >= 0){ //사망,탈퇴,삭제
			$('#popupMsg')[0].innerHTML = "가입정보가 없습니다. 관리자(02-823-5680 내선 311)에게 문의해 주세요";
		}else{
			
			$('#popupMsg')[0].innerHTML = uname +"님의 가입 정보를 찾을수 없습니다.";
		}
	}

	function handleGetMemberIdError(data) {
		
		$('#popup').show();
		$('#popup').bPopup();
		
		$('#popupMsg')[0].innerHTML = document.form1.uname.value +"님의 가입 정보를 찾을수 없습니다.";
	}

	function doClosePopup() {
		//$('#popup').hide();
		//$('#popup').bClose();
		
		$('#popup').addClass("b-close");
	}

	function initPw(gubun) {
		var f = document.forms["form2"];

		var param = "";

		param += "uid=" + f.uid.value;
		param += "&uname=" + escape(encodeURIComponent(f.uname.value));
		param += "&pers_birth=" + f.pers_birth.value;
		param += "&gubun=" + gubun;
		
		$.ajax({
			type : "POST",
			url : "/member_doInitPw.do",
			data : param,
			dataType : "html",
			cache : false,
			success : handleGetInitPw,
			error : handleGetInitPwError
		});
	}
	
	function handleGetInitPw(data) {
		
		$('#popup').show();
		$('#popup').bPopup();
	
		var uname = document.form2.uname.value;
		
		if (data.indexOf("success") >= 0) {
			
			var hp = data.split("=")[1];
			var viewHp  = hp.substring(0, 5); 		
			
			for(var i = 0; (hp.length) - 5 > i ; i++)
			{
				viewHp = viewHp + "*";
			}
			
			
			if(hp.length > 10)
				viewHp = viewHp.substring(0,3) + "-" + viewHp.substring(3,7) + "-" + viewHp.substring(7,11);
			else 	viewHp =  viewHp.substring(0,3) + "-" + viewHp.substring(3,6) + "-" + viewHp.substring(6,10);
		
			$('#popupMsg')[0].innerHTML = uname +"님의 비밀번호는 등록하신 &nbsp;<br>휴대폰 번호 : <strong class='bold cm'>"+viewHp+"</strong>으로 초기화 하였습니다.<br/>휴대폰 번호가 변경되신 경우 02-823-5680(311)으로 문의주세요!";
			
		}else if(data.indexOf("tmpPwMsg") >= 0){
			
			var tmpPwMsg = data.split("=")[1];
			$('#popupMsg')[0].innerHTML = tmpPwMsg;
			
		}else{
			$('#popupMsg')[0].innerHTML = uname +"님의 가입 정보가 없거나 휴대폰 번호가 등록되어 있지 않습니다.";
		}
	}

	function handleGetInitPwError(data) {
		
		$('#popup').show();
		$('#popup').bPopup();
		
		$('#popupMsg')[0].innerHTML = document.form2.uname.value +"님의 가입 정보가 없거나 휴대폰 번호가 등록되어 있지 않습니다.";
	}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1">
				<mark class="cm">아이디</mark>
				/비밀번호 찾기
			</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
			    <li><a href="/member/km_join.do" >회원가입</a></li>
			    <li><a href="/member/km_id_pw.do" class="cm">아이디/비밀번호 찾기</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<form name="form1">
			<div class="box t3 bgs p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">아이디를 잊으셨나요?</h4>
					<span class="ml10 ssmall ca">(이름, 생년월일, 휴대전화번호를 입력해 주세요.)</span>
				</div>
			</div>
			<div class="form">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 w200" name="uname" size="20" id="uname" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>생년월일</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" name="pers_birth" maxlength="8" />
								<p class="fl text cp ml10">(예 : 19800101과 같이 숫자만 입력)</p>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>휴대전화번호</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" name="pers_hp" size="20" onKeyPress="javascript:onlyNumber();" />
								<p class="fl text cp ml10">(&quot;-&quot;없이 숫자만 입력)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt30">
				<ul>
					<li><a href="javascript:frmChk();" class="btn big t1">아이디(ID)찾기</a></li>
					<li><a href="javascript:history.go(-1)" class="btn big">취소</a></li>
				</ul>
			</div>
		</form>

		<form name="form2">
			<div class="box t3 bgs mt50 p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">비밀번호를 잊으셨나요?</h4>
					<span class="ml10 ssmall ca">(회원님의 아이디, 이름과 생년월일을 입력해 주세요.)</span>
				</div>
			</div>
			<div class="form">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>아이디</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 w200" name="uid" id="uid" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" name="uname" id="uname"
									size="24" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>생년월일</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" name="pers_birth" id="pers_birth"
									size="10" maxlength="8" />
								<p class="fl text cp ml10">(예: 19800101과 같이 숫자만 입력)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="box t1 bgs mt5 p10 pl15 text ssmall"> -->
<!-- 				<div class="area">비밀번호는 회원정보에 등록된 휴대전화번호로 초기화됩니다.</div> -->
<!-- 			</div> -->
			<div class="btn_wrap mt30">
				<ul>
					<li><a href="javascript:frm2Chk('1');" class="btn big t1">임시비밀번호 신청</a></li>
<!-- 					<li><a href="javascript:frm2Chk('0');" class="btn big t1">비밀번호 초기화</a></li> -->
					<li><a href="javascript:history.go(-1)" class="btn big">취소</a></li>
				</ul>
			</div>
		</form>
	</div>
</div>

<div id="popup" class="Pstyle" style="width:600px;height:270px">
	<div class="p_head" style="width:570px;">
		<h2 class="title t3 cw bold s1 i_b_t6">아이디 / 비밀번호 찾기</h2>
	</div>
	<div class="p_body text ca small">
		<div class="p30">
			<span id="popupMsg"></span>
		</div>
	</div>
	<div class="p_foot line bt">
		<div class="btn_wrap mt20">
			<a href="#" class="bClose" >이전으로</a>
		</div>
	</div>
</div>

</body>
</html>