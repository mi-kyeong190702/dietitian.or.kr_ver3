<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
			<c:when test="${null eq loginVo}">
				<script type="text/javascript"> 
					alert("로그인 후 이용해주세요.");
					location.href="/work/research/login/kl_login.do";
				</script>
			</c:when>
			<c:otherwise>
<script type="text/javascript">

	function doCheck(){
		
		 var old = $("#old_pass").val();
		 var new1 = $("#new_pass").val();
		 var new2 = $("#new_pass2").val();
		
		 if(old=="" || new1=="" || new2==""){
			 alert('모든 정보를 입력하세요');
			 return false;
		 }
		 
		 if(new1!=new2){
			 alert('비밀번호 재입력 정보가 다릅니다.');
			 return false;
		 }
		 
		 if(!/^[a-zA-Z0-9]{8,12}$/.test(new1)){
			 alert('비밀번호는 영문, 숫자 혼합 8자리~12자리이어야 합니다.\n(특수문자 사용불가)'); 
		     return false;
		 }
		 
		 var chk_num = new1.search(/[0-9]/g); 
		 var chk_eng = new1.search(/[a-z]/ig);
		 
		 if(chk_num < 0 || chk_eng < 0){ 
		     alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.'); 
		     return false;
		 }
		
		return true;
	}

	
	function doChange(){
		
		 if(doCheck()){
			 var f = document.forms["login"];
			 f.method = "post";
			 f.target = "work";
			 f.action = "/research_mypage_change.do";
			 f.submit();
		}
	}
	
	
	function doCancle(){
		$(".w200").val("");
	}
	
	
	function doComplete(){
		location.reload();
	}
	
</script>
<form name="login">
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비밀번호</mark> 변경</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/mypage/km_modify.do">마이페이지</a></li>
							<li><a href="/work/research/mypage/km_pw_change.do" class="cm">비밀번호 변경</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t3 bgs p10 pl15 text small">
						<div class="area">
							<h4 class="title i_b_t6">비밀번호 변경</h4>
						</div>
					</div>
					<div class="form">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>기존 비밀번호</strong></label>
								<div class="ff_wrap ml150">
									<div class="area">
										<input type="password" class="input t1 w200" id="old_pass" name="old_pass" maxlength="12" />
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>변경할 비밀번호 입력</strong></label>
								<div class="ff_wrap ml150">
									<div class="area">
										<input type="password" class="input t1 fl w200" id="new_pass" name="new_pass" maxlength="12" />
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>변경할 비밀번호 재입력</strong></label>
								<div class="ff_wrap ml150">
									<div class="area">
										<input type="password" class="input t1 fl w200" id="new_pass2" name="new_pass2" maxlength="12"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box t1 bgs mt5 p10 pl15 text ssmall">
						<div class="area">
							비밀번호는 <font color = "red">영문, 숫자 혼합 8자리~12자리</font>이어야 합니다.<font color = "red">(특수문자 사용불가)</font>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<ul>
							<li><a href="javascript:doChange();" class="btn big t1">확인</a></li>
							<li><a href="javascript:doCancle();" class="btn big">취소</a></li>
						</ul>
					</div>
				</div>
			</div>
</form>
<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
	</c:otherwise>
</c:choose>