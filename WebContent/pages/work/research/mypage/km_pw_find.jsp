<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	function doCancel(){
		$(".w200").val("");
	}
	
	function doChange(){
		var f = document.forms["login"];
		f.method = "post";
		f.target = "work";
		f.action = "/research_mypage_find.do";
		f.submit();
	}
	
	function doComplete(){
		//location.reload();
		location.href="/research_index.jsp";
	}

</script>

<form name="login">
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비밀번호</mark> 찾기</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/mypage/km_modify.do">마이페이지</a></li>
							<li><a href="/work/research/mypage/km_pw_find.do" class="cm">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t3 bgs p10 pl15 text small">
						<div class="area">
							<h4 class="title i_b_t6">비밀번호를 잊으셨나요?</h4><span class="ml10 ssmall ca">(이름과 면허번호를 입력해 주세요.)</span>
						</div>
					</div>
					<div class="form">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>이름</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w200" id="pers_name" name="pers_name" />
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 fl w200" id="lic_no" name="lic_no" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box t1 bgs mt5 p10 pl15 text ssmall">
						<div class="area">
							비밀번호가 면허신고 시 등록한 휴대폰번호로 변경됩니다.<font color = "red">(비밀번호 = 휴대폰번호)</font>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<ul>
							<li><a href="javascript:doChange();" class="btn big t1">비밀번호 초기화</a></li>
							<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
						</ul>
					</div>
				</div>
			</div>
</form>			
<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>