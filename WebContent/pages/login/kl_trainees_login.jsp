<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ errorMsg != null }">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
	<c:otherwise>
<script type="text/javascript">

	$(document).ready(function(){});
	
	function doLoginEdu()
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
		var f = document.frmLogin;
		f.action = "/login_trainees_action.do";
		f.submit();
	}

</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1">교육생등록 <mark class="cm">로그인</mark></h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/main/main" class="icon_home" title=""><span class="ti">HOME</span></a></li>
				<li><a href="/login/kl_trainees_login.do" class="cm" title="">교육생등록 로그인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="w550 ac mt40">
			<div class="box login mt10 p60 pt40 pb40">
				<div class="area mb25">
					<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">교육생</mark> 로그인</h4>
					<p class="text bold cb si ml15"><mark class="cm">대한영양사협회</mark>에 오신 것을 환영합니다.</p>
					<c:if test="${kind == 1}">
					<p class="text middle">
					기존에 협회비를 납입한 적이 있는 회원은 등록계정에 	<br />
					기존 사용한 회원 ID를 입력하시고, 비밀번호를 입력해 주십시오.
					</p> 
					</c:if>
				</div>
				<form name="frmLogin" method="post">
					<fieldset>
						<legend><span class="ti">LOGIN</span></legend>
						<div class="area">
							<ul class="fl w300">
								<li><label for="kda_user_id"><span class="ti">등록계정</span></label><input type="text" id="id" name="id" class="input login" placeholder="등록계정" /></li>
								<li class="mt5"><label for="kda_user_pw"><span class="ti">비밀번호</span></label><input type="password" class="input login"  name="passwd" id="passwd" placeholder="비밀번호"  onkeypress="if( event.keyCode==13)doLoginEdu() "/></li>
							</ul>
							<div class="fr">
								<button type="button" class="btn t1 login" onclick="javascript:doLoginEdu()">로그인</button>
							</div>
						</div>
						
						<c:choose>
							<c:when test="${kind == 1 }">
						<div class="mt10 pt10 line bt text ssmall s1">
							<ul>
								<li><span class="fl w250">회원 아이디/비밀번호를 잊으셨나요?</span><a href="/member/km_id_pw.do" class="btn t4" title="아이디 비밀번호 찾기">아이디 비밀번호 찾기</a></li>
								<li class="mt5"><span class="fl w250">회원으로 재가입 하시겠어요?</span><a href="/member/km_deposit_manner.do" class="btn t1" title="가입안내">가입안내</a></li>
							</ul>
						</div>		
							</c:when>
							<c:otherwise>
						<div class="mt10 pt10 line bt text ssmall s1">
							<ul>
								<li><span class="fl w250">교육생 등록 아이디/비밀번호를 잊으셨나요?</span><a href="/work/education/ke_trainees_find.do" class="btn t4" title="아이디 비밀번호 찾기">아이디 비밀번호 찾기</a></li>
								<li class="mt5"><span class="fl w250 middle">교육생 등록하신 적이 없으신가요?</span><a href="/work/education/ke_trainees_join.do"   class="btn middle t1" title="교육생등록">교육생등록</a></li>
							</ul>
						</div>	
							</c:otherwise>
						</c:choose>						
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>


	</c:otherwise>
</c:choose>

