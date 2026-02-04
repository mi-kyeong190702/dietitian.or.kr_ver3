<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
function f_send(){
	if( $("#name").val() == "" ) {
		alert("이름을 입력하여 주십시요");
		$("#name").focus();
		return;
	}	
	
	if( $("#tel_hp").val() == "" ) {
		alert("핸드폰 번호를 입력하여 주십시요");
		$("#tel_hp").focus();
		return;
	}
	
	if( $("#birth").val() == "" ) {
		alert("생년월일을 입력하여 주십시요");
		$("#birth").focus();
		return;
	}
	
	document.frm.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">e-Book</mark>보기</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_ebook.do" class="cm">e-Book보기</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="w400 ac mt40">
			<div class="box t2 mt10 p50 pt40 pb40">
				<div class="area mb25">
					<h4 class="title bold t2 s1 i_b_t3">e-Book보기</h4>
					<p class="text bold cb si ml15"><mark class="cm">입력</mark>하여 주세요.</p>
				</div>
				
				<form name="frm" method="post" action="./ke_ebook_action.do">
					<fieldset>
						<legend><span class="ti">e-Book보기</span></legend>
						<div class="area">
							<ul class="w300 ">
								<li><label for="kda_user_id"><span class="ti">이름</span></label><input type="text" name="name" id="name" class="input login" placeholder="이름" /></li>
								<li class="mt5"><label for=""><span class="ti">핸드폰번호</span></label><input type="text" name="tel_hp" class="input login" id="tel_hp" placeholder="핸드폰번호(“-” 없이)" /></li>
								<li class="mt5"><label for="kda_user_nb"><span class="ti">생년월일</span></label><input type="text" name="birth" class="input login" id="birth" placeholder="생년월일(yyyyMMdd)" /></li>
							</ul>
							<div class="center mt5">
								<a href="javascript:f_send();" class="btn t1 big w270">확인</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>	
		<!-- // Contents end  -->		
	</div>
</div>
