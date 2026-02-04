<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/placeholders.min.js"></script>
<script type="text/javascript">

	var msg = "<c:out value="${msg}" />";
	if(msg!=""){
		alert(msg);
	}

	function doCheck(nm,lic,pw){
		if(nm.val()==""){
			alert("성명을 입력하세요");
			nm.focus();
			return false;
		}
		if(lic.val()==""){
			alert("면허번호를 입력하세요");
			lic.focus();
			return false;
		}
		if(pw.val()==""){
			alert("비밀번호를 입력하세요");
			pw.focus();
			return false;
		}
		
		return true;
	}

	function doLogin(){
		
		var nm= $("#user_name");
		var lic = $("#user_lic");
		var pw = $("#user_pw");
		
		if(doCheck(nm,lic,pw)){
			
			var input1 = document.createElement("input");
			input1.type="hidden";
			input1.name="pers_name";
			input1.value=nm.val();
			var input2 = document.createElement("input");
			input2.type="hidden";
			input2.name="lic_no";
			input2.value=lic.val();
			var input3 = document.createElement("input");
			input3.type="hidden";
			input3.name="user_pw";
			input3.value=pw.val();
			
			var f = document.forms["report"];		
			f.insertBefore(input1,null);
			f.insertBefore(input2,null);
			f.insertBefore(input3,null);
			f.step.value= "step5";
			f.method = "POST";
			f.submit();
			
		}
	}

</script>


					<div class="w550 ac">
						<div class="box t2 mt10 p60 pt40 pb40">
							<div class="area mb25">
								<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">면허신고</mark> 들어가기</h4>
							</div>
							<form>
								<fieldset>
									<legend><span class="ti">LOGIN</span></legend>
									<div class="area">
										<ul class="fl w300">
											<li><label for="kda_user_id"><span class="ti2">성명</span></label>
<!--											<input type="text" class="input login" id="user_name" placeholder="성명" value="${actulpersonVo.pers_name }"/></li>-->
											<input type="text" class="input login2" id="user_name" placeholder="성명"/></li>
											<li class="mt5"><label for="kda_user_licence"><span class="ti2">면허번호</span></label>
<!--											<input type="text" class="input login" id="user_lic" placeholder="면허번호" value="${actulpersonVo.lic_no }"/></li>-->
											<input type="text" class="input login2" id="user_lic" placeholder="면허번호" /></li>
											<li class="mt5"><label for="kda_user_pw"><span class="ti2">비밀번호</span></label>
											<input type="password" class="input login2" id="user_pw" placeholder="비밀번호" /></li>
										</ul>
										<div class="fr">
											<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - start  -->
<!-- 											<button type="button" class="btn t1 login2"">로그인</button> -->
											<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - end  -->
											
											<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - start  -->
											<button type="button" class="btn t1 login2" onclick="doLogin()">로그인</button>
											<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - end  -->
										</div>
									</div>
									<!--<div class="mt10 pt10 line bt text ssmall s1">
										<ul>
											<li><span>비밀번호를 잊으셨나요?</span><a href="/work/research/mypage/km_pw_find.do" class="btn t4 ml10" title="아이디 비밀번호 찾기">비밀번호 찾기</a></li>
											 <li class="mt5"><span class="fl w250">아직 회원가입을 안하셨나요?</span><a href="/kda/research/views/layout.html?m=kda-member&f=km_join" class="btn t4" title="회원가입">회원가입</a></li> 
										</ul>
									</div> -->
								</fieldset>
							</form>
						</div>
					</div>


