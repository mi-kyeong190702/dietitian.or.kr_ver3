<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function f_ajaxPeriod() {
	$.ajax({
		url : "/member/km_member_period_action.do"
		, type : 'POST'
		, data : $("#frmValid").serialize()
		, success : function(data) {
			$("#pop_text").html(data);
			$("#popup_result").bPopup();
		}
	});
}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
		<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">회원</mark>유효기간 확인</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
                <li><a href="/member/km_join.do" >회원가입</a></li>
				<li><a href="/member/km_member_period" class="cm">회원 유효기간 확인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // Contents Start -->	
		
		<div class="w550 ac mt40">
			<div class="box login mt10 p60 pt40 pb40">
				<div class="area mb25">
					<h4 class="title bold t2 s1 i_b_t3"><mark class="cm">회원</mark> 유효기간 확인 </h4>
					<p class="text bold cb si ml15"><mark class="cm">회원 유효기간</mark>을 확인하기 위해서 아이디/패스워드를 입력하세요</p>
				</div>
				<form name="frmValid" id="frmValid" method="post" action="km_member_period.do">
					<fieldset>
						<legend><span class="ti">유효기간 확인</span></legend>
						<div class="area">
							<ul class="fl w300">
								<li><label for="kda_user_id"><span class="ti">아이디</span></label><input type="text" class="input login" name="uid" id="uid" value="" placeholder="아이디"/></li>
								<li class="mt5"><label for="kda_user_pw"><span class="ti">비밀번호</span></label><input type="password" class="input login" name="compValue" id="compValue" value="" placeholder="비밀번호" name="passwd"/></li>
							</ul>
							<div class="fr">
								<button type="button" class="btn t1 login" onclick="javascript:f_ajaxPeriod()">확인</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	<!-- // Contents End -->
	</div>
</div>

<div id="popup_result" class="p_style"	style="width: 600px; height: 270px">
	<div id="popup">
		<div class="p_head" style="width: 570px;">
			<h2 class="title t3 cw bold s1 i_b_t6">회원 유효기간 확인</h2>
		</div>
		<div class="p_body text ca small center">
			<div class="p30">
				<div class="area mt20" id="pop_text">
					
				</div>
			</div>
		</div>
		<div class="p_foot line bt">
			<div class="btn_wrap mt20">
				<ul>
					<li><a href="#" class="bClose">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>     
