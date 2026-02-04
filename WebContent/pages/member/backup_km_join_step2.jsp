<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ errorKind ne null }">
		<c:if test="${ errorKind == '1' }">
			<script>
				alert("올바른 접속이 아닙니다.");
				location.href = "/";
			</script>
		</c:if>
		<c:if test="${ errorKind == '2' }">
			<script>
				alert('이미 등록된 회원이십니다.\n확인 후 등록하여 주십시요');
				location.href = "/member/km_join.do";
			</script>
		</c:if>
	</c:when>
	<c:otherwise>
	 // Contents Start -->	



<script type="text/javascript">

	function doCheck()
	{
		var ml_len = document.join.code_member.length;
		
		var code_member = "";
		for(var i = 0 ; i < ml_len ; i++)
		{
			if(document.join.code_member[i].checked)
			{
				code_member = document.join.code_member[i].value;
				break;
			}
		}
		
		
		if(	   code_member != "81" // 정회원>취업회원
			&& code_member != "82" // 정회원>미취업회원
			&& code_member != "88" // 특별회원
			&& code_member != "07" // 학생회원
			&& code_member != "90" // 평생회원>정회원
			&& code_member != "92" // 평생회원>특별회원 
			)	
		{
			alert("회원 종류를 정확히 선택하세요!!");
			return;
		}
		else
		{
			if(code_member == "001"){
				alert("회원 종류를 정회원으로 선택 하셨으면 \n취업구분을 선택하셔야 합니다.!!");
				return;
			}

			if(code_member == "002") {
				alert("회원 종류를 평생회원으로 선택 하셨으면 \n평생회원 구분을 선택하셔야 합니다.!!");
				return;
			}
		}
		
		return true;
	}
	
	function doPrev()
	{
		document.location.href = "/member/km_join.do";
	}

	function doNext()
	{
		if ( doCheck() ) {
			var f = document.forms["join"];
			f.action = "/member_join_step3.do";
			f.submit();
		}
	}

</script>

<form name="join">
			  
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신규</mark>회원가입</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/member/km_join.do">회원가입</a></li>
				<li><a href="/work/member/km_join.do" class="cm">신규회원 가입</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<h4 class="title bold t2 cm s1 i_b_t2">회원가입 절차</h4><span class="ib mt10 ml10 text small ca">회원가입은 다음과 같은 순서에 따라 진행됩니다.</span>
		</div>
		<ol class="step_join mt20">
			<li class="start"><span class="icon step1"></span><span class="txt">실명확인</span></li>
			<li class="on"><span class="icon step2"></span><span class="txt"><strong>회원종류 선택</strong></span></li>
			<li><span class="icon step3"></span><span class="txt">회원종류 입력</span></li>
			<li><span class="icon step4"></span><span class="txt">입금 및 확인</span></li>
			<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
		</ol>
		<div class="box t2 bgs mt50 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">회원</mark>종류 선택</h5>
				<div class="box t1 r5 mt10 p10">
					<p class="p10 ssmall">
						회원가입절차를 보다 편리하게 안내해 드릴 수 있도록, 회원님께서 다음 중 어디에 해당되는지 선택해 주시기 바랍니다.<br />
						우리 협회는 영양사의 권익옹호를 위한 단체이므로 일반개인은 회원가입을 하실 수 없습니다.<br />
						단, 일반개인 중 본 협회의 목적에 관련된 분야에서 종사하는 개인으로, 이사회의 승인을 얻어 특별회원으로 가입을 하실 수 있습니다.
					</p>
					<ul>
						<li class="box t1 r5 pr mt5 p20 ca">
							<%
							//	81 2015 신규취업회원 연회원 0 정회원 81 Y 
							//	82 2015 신규미취업회원 연회원 0 정회원 82 Y 
							//	88 2015 신규특별회원 연회원 0 특별회원 88 Y 
							//	90 2015 신규평생정회원 평생회원 1 평생정회원 90 Y 
							//	92 2015 신규평생특별회원 평생회원 1 평생특별회원 92 Y 
							%>
							<div class="area">
								<strong class="pa l30 t23 bold cm">
									<input type="radio" class="mr5" name="code_member" id="radio1_1" value="001" />
									<label for="radio1_1" class="mr20">정회원</label>
								</strong>
								<span class="ml120 small">영양사 면허증이 있는 개인</span>
							</div>
							<ul class="mt10 ml120 ssmall">
								<li class="pr pt10 pb10 ca line bt dot">
									<div class="area">
										<strong class="pa l5 t10 bold cb">
											<input type="radio" class="mr5" name="code_member" id="radio1_1_1" value="81" />
											<label for="radio1_1_1" class="mr20">취업회원</label>
										</strong>
										<span class="ml110">영양사 또는 그 외의 직업을 갖고 취업을 한 개인</span>
									</div>
								</li>
								<li class="pr pt10 ca line bt dot">
									<div class="area">
										<strong class="pa l5 t10 bold cb">
											<input type="radio" class="mr5" name="code_member" id="radio1_1_2" value="82" />
											<label for="radio1_1_2" class="mr20">미취업회원</label>
										</strong>
										<span class="ml110">영양사 면허를 갖고 있으니 미취업인 개인 (대학원생 포함)</span>
									</div>
								</li>
							</ul>
						</li>
						<li class="box t1 r5 pr mt5 p20 ca">
							<div class="area">
								<strong class="pa l30 t23 bold cm">
									<input type="radio" class="mr5" name="code_member" id="radio1_2" value="88" />
									<label for="radio1_2" class="mr20">특별회원</label>
								</strong>
								<span class="ml120 small"> 
									영양사 면허가 없는 자로서 식품영양학의 발전을 위해 상호협력이 필요한 연구
 									교육 기타 실무에 종사하는 자로서 중앙회 상임이사회의 승인을 얻은 자 
 								</span>
							</div>
						</li>
						<li class="box t1 r5 pr mt5 p20 ca">
							<div class="area">
								<strong class="pa l30 t23 bold cm">
									<input type="radio" class="mr5" name="code_member" id="radio1_3" value="07" />
									<label for="radio1_3" class="mr20">학생회원</label>
								</strong>
								<span class="ml120 small">식품영양관련학과 (전공) 재학생</span>
							</div>
						</li>
						<li class="box t1 r5 pr mt5 p20 ca">
							<div class="area">
								<strong class="pa l30 t23 bold cm">
									<input type="radio" class="mr5" name="code_member" id="radio1_4" value="002" />
									<label for="radio1_4" class="mr20">평생회원</label>
								</strong>
								<span class="ml120 small">평생회비를 납부하고자 하는 개인 정회원과 특별회원만 해당</span>
							</div>
							<ul class="mt10 ml120 ssmall">
								<li class="pr pt10 pb10 ca line bt dot">
									<div class="area">
										<strong class="pa l5 t10 bold cb">
											<input type="radio" class="mr5" name="code_member" id="radio1_4_1"  value="90" />
											<label for="radio1_4_1" class="mr20">정회원</label>
										</strong>
										<span class="ml110">영양사 면허증이 있는 개인</span>
									</div>
								</li>
								<li class="pr pt10 ca line bt dot">
									<div class="area">
										<strong class="pa l5 t10 bold cb">
											<input type="radio" class="mr5" name="code_member" id="radio1_4_2" value="92"/>
											<label for="radio1_4_2" class="mr20">특별회원</label>
										</strong>
										<span class="ml110">영양사 면허증이 없는 개인</span>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
				<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
			</ul>
		</div>
	</div>
</div>
</form>
	<!-- // End of Contents -->
	</c:otherwise>
</c:choose>