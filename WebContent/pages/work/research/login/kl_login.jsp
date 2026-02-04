<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/js/placeholders.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		//180402 추가
		$("#lic_no").keyup(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});
   		$("#lic_no").focusout(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});

	});
	
	function research_login()
	{
		if ( $("#pers_name").val() == "" ) 
		{
			alert("성명을 입력해 주세요.");
			$("#pers_name").focus();
			return;
		}
		
		if ( $("#lic_no").val() == "" ) 
		{
			alert("면허번호를 입력해 주세요.");
			$("#lic_no").focus();
			return;
		}
		
		if ( $("#user_pw").val() == "" ) 
		{
			alert("비밀번호를 입력해 주세요.");
			$("#user_pw").focus();
			return;
		}
		
		var f = document.forms["login"];
		f.method = "post";
		f.target = "work";
		f.action = "/research_login.do";
		f.submit();
	}
	
	function doComplete(){
		location.reload();
	}

</script>

<form name="login">
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1">
					<mark class="cm">로그인</mark>
				</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start">
						<a href="#" class="icon_home" title=""><span class="ti">HOME</span></a>
					</li>
					<li><a href="#" 	class="cm" title="">로그인</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<div class="w550 ac mt40">
			<li ><span ><font color = "red" size = "5">* 로그인은 면허신고 신청을 하신 분만 가능합니다.</font></span></li>
				<div class="box t2 mt10 p60 pt40 pb40">
					<div class="area mb25">
						<!-- <h4 class="title bold t2 s1 i_b_t3"><mark class="cm">회원</mark> 로그인</h4>
<p class="text bold cb si ml15"><mark class="cm">대한영양사협회</mark>에 오신 것을 환영합니다.</p>  -->
					</div>
					<fieldset>
						<legend>
							<span class="ti">LOGIN</span>
						</legend>
						<div class="area">
							<ul class="fl w300">
								<li><label for="kda_user_id"><span class="ti2">성명</span></label>
								<input type="text" class="input login2" id="pers_name" name="pers_name" placeholder="성명" /></li>
								<li class="mt5"><label for="kda_user_licence"><span class="ti2">면허번호</span></label>
								<input type="text" class="input login2" id="lic_no" name="lic_no" placeholder="면허번호(숫자만 입력)" /></li>
								<li class="mt5"><label for="kda_user_pw"><span	class="ti2">비밀번호</span></label>
								<input type="password"	class="input login2" id="user_pw" name="user_pw" placeholder="비밀번호" /></li>
							</ul>
							<div class="fr">
							<button type="button" class="btn t1 login2" onclick="research_login()">로그인</button>

							</div>
						</div>
						<div class="mt10 pt10 line bt text ssmall s1">
							<ul>
								<li><span class="fl w250">비밀번호를 잊으셨나요?</span><a
									href="/work/research/mypage/km_pw_find.do" class="btn t4" title="아이디 비밀번호 찾기">비밀번호 찾기</a></li>
								<!-- <li class="mt5"><span class="fl w250">아직 회원가입을 안하셨나요?</span><a href="/kda/research/views/layout.html?m=kda-member&f=km_join" class="btn t4" title="회원가입">회원가입</a></li>  -->
							</ul>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>