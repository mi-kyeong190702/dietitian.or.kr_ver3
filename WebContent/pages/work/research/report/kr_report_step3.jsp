<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	function doCheck(pwd,pwd2){
		
		if(pwd.val()==""){
			alert("비밀번호를 입력하세요");
			pwd.focus();
			return false;
		}
		if(pwd2.val()==""){
			alert("비밀번호 확인을 입력하세요");
			pwd2.focus();
			return false;
		}
		if(pwd.val()!=pwd2.val()){
			alert("비밀번호가 일치 하지 않습니다.");
			return false;
		}
		if(!/^[a-zA-Z0-9]{8,12}$/.test(pwd.val())){
			 alert('비밀번호는 영문, 숫자 혼합 8자리~12자리이어야 합니다.\n(특수문자 사용불가)'); 
		     return false;
		}
		var chk_num = pwd.val().search(/[0-9]/g); 
		var chk_eng = pwd.val().search(/[a-z]/ig);
		 
		if(chk_num < 0 || chk_eng < 0){ 
		     alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.'); 
		     return false;
		}
		return true;
		
	}
	
	function doJoin(){
		var pwd = $("#inputid1");
		var pwd2 = $("#inputid2");
		
		if(doCheck(pwd,pwd2)){
			var pw = document.createElement("input");
			pw.type="hidden";
			pw.name="user_pw";
			pw.value=pwd.val();
			
			var f = document.forms["report"];		
			f.insertBefore(pw,null);
			f.step.value= "step4";
			f.method = "POST";
			f.submit();
		}
	}

</script>

					<h4 class="title bold t2 cm s1 i_b_t2">비밀번호 등록</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="kda_inputid1" class="ff_title i_b"><strong>비밀번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="password" class="input t1 w200" id="inputid1" maxlength="12" />
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="kda_inputid2" class="ff_title i_b"><strong>비밀번호 확인</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="password" class="input t1 w200" id="inputid2" maxlength="12" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box t1 bgs mt5 p10 pl15 text ssmall">
						<div class="area">
							※ 비밀번호는 <font color = "red">영문, 숫자 혼합 8자리~12자리</font>이어야 합니다.<font color = "red">(특수문자 사용불가)
						</div>
					</div>
					<div class="btn_wrap mt20">
						<ul>
							<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - start  -->
<!-- 							<li><a href="#" class="btn big t1">확인</a></li> -->
							<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - end  -->
							
							<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - start  -->
							<li><a href="javascript:doJoin();" class="btn big t1">확인</a></li>
							<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - end  -->
						</ul>
					</div>
