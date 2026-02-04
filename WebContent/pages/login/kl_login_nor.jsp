<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

	$(document).ready(function(){});
	
	function doLoginNor()
	{
		if ( $("#id").val() == "" ) 
		{
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return;
		}
		
		if ( $("#passwd").val() == "" ) 
		{
			alert("패스워드를 입력해 주세요.");
			$("#passwd").focus();
			return;
		}
		var f = document.forms["login"];
		f.method = "post";
		f.target = "work";
		f.action = "/login_doLoginNor.do";
		f.submit();
	}

</script>

<form name="login">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">로그인</mark></h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/main/main.do" class="icon_home" title=""><span class="ti">HOME</span></a></li>
				<li><a href="/login/kl_login.do" class="cm" title="">로그인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="w550 ac mt40">
			<div class="box login mt10 p60 pt40 pb40">
				<div class="area mb25">
					<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">회원</mark> 로그인</h4>
					<p class="text bold cb si ml15"><mark class="cm">대한영양사협회</mark>에 오신 것을 환영합니다.</p>
				</div>
				<form>
					<fieldset>
						<legend><span class="ti">LOGIN</span></legend>
						<div class="area">
							<ul class="fl w300">
								<li><label for="kda_user_id"><span class="ti">아이디</span></label><input type="text" class="input login" name="id" id="id" onkeypress="if( event.keyCode == 13 )doLoginNor();" placeholder="아이디"/></li>
								<li class="mt5"><label for="kda_user_pw"><span class="ti">비밀번호</span></label>
									<input type="password" class="input login" name="passwd" id="passwd" onkeypress="if( event.keyCode == 13 )doLoginNor();" placeholder="비밀번호" name="passwd"/>
								</li>
							</ul>
							<div class="fr">
								<button type="button" class="btn t1 login" onclick="javascript:doLoginNor()">로그인</button>
							</div>
						</div>
						<div class="mt10 pt10 line bt text ssmall s1">
							<ul>
								<li><span class="fl w250">회원 아이디/비밀번호를 잊으셨나요?</span><a href="/member/km_id_pw.do" class="btn t4" title="아이디 비밀번호 찾기">아이디 비밀번호 찾기</a></li>
								<li class="mt5"><span class="fl w250">아직 회원가입을 안하셨나요?</span><a href="/member/km_join.do" class="btn t4" title="회원가입">회원가입</a></li>
							</ul>
						</div>
					</fieldset>
				</form>
			</div>
			
			<div class="mt30">
				<a href="https://www.dietitian.or.kr/work/news/kn_notice.do?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_board_code=2&bbs_category=&bbs_idx=122142" target="_blank" title="새창으로 이동">
					<img src="/images/login_kakao_2022.png" alt="카카오톡채널" width="100%" />
				</a>
			</div>
			
		</div>
	</div>
</div>
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>