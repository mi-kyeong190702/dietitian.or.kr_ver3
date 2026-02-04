<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<script>
function showPopup(crud) {  	
		$("#crud").val(crud);
		$('#popup_pwd').bPopup();  		
}

function manage(kind) {
	if( kind == 'A' ) {
		document.frmPwd.action = "./${kind}_answer.do";
	}
	
	if( kind == 'U') {
		document.frmPwd.action = "./${kind}_form.do"
	}
	
	if( kind == 'D' ) {
		$("#crud").val("D");
		document.frmPwd.action = "./${kind}_action.do"
	}
	
	document.frmPwd.submit();
}


function f_pwdSubmit() {
	if( $("#bbs_pwd").val() == "" ) {
		alert("비밀번호를 입력해 주세요");
		return;
	}
	if( $("#crud").val() == "U" ) {
		document.frmPwd.action = "./${kind}_form.do"
	} else if( $("#crud").val() == "D" ) {
		document.frmPwd.action = "./${kind}_action.do"
	}
	document.frmPwd.submit();
}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양</mark>상담실</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_counsel_board.do" class="cm">영양상담실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height: 500px;">
	
		<div class="box t3 text small">
			<ul class="area">
				<li class="line bb bgs">
					<div class="p10 pl15">
						<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${qna.bbs_subject}</h4>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm">이름</strong>
						<span>${qna.bbs_name}</span>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm">등록일</strong>
						<span>${qna.bbs_date}</span>
					</div>
				</li>
				<li class="fl w33p bgw">
					<div class="p10 pl15">
						<strong class="ib w70 bold cm">조회</strong>
						<span>${qna.bbs_view}</span>
					</div>
				</li>
			
			</ul>
		</div>
		<c:if test="${ g_user_level <= 2 }">
		<div class="form">
			<form:form name="frm" modelAttribute="qna" method="post">
			<div class="f_wrap line bb p8">
				<div class="f_field div2">
					<label for="k_stature" class="ff_title i_b"><strong>신장</strong></label>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<c:choose>
								<c:when test="${qna.k_stature=='' or qna.k_stature eq null }">
									<span class="input t1 fl w80" >-</span>
									<span class="fl text ml10">Cm</span>
								</c:when>
								<c:otherwise>
									<span class="input t1 fl w80" >${qna.k_stature } </span>
									<span class="fl text ml10">Cm</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="f_field div2">
					<label for="k_weight" class="ff_title i_b"><strong>체중</strong></label>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<c:choose>
								<c:when test="${qna.k_weight=='' or qna.k_weight eq null }">
									<span class="input t1 fl w80" >-</span>
									<span class="fl text ml10">Kg</span>
								</c:when>
								<c:otherwise>
									<span class="input t1 fl w80" >${qna.k_weight } </span>
									<span class="fl text ml10">Kg</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div2">
					<div class="ff_title i_b"><strong>성별</strong></div>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<c:choose>
								<c:when test="${qna.k_sex=='남자' }">
									<label for="k_sex1" class="mr20">남자</label>
								</c:when>
								<c:otherwise>
									<label for="k_sex2" class="mr20">여자</label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="f_field div2">
					<label for="k_age" class="ff_title i_b"><strong>연령</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<c:choose>
								<c:when test="${qna.k_age=='' or qna.k_age eq null }">
									<span class="input t1 fl w80" >-</span>
									<span class="fl text ml10">세</span>
								</c:when>
								<c:otherwise>
									<span class="input t1 fl w80" >${qna.k_age }</span>
									<span class="fl text ml10">세</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title i_b"><strong>활동량</strong></div>
					<div class="ff_wrap ml120 text">
						<span class="area">${qna.k_activity }</span>
						<p class="text cp">
							<mark class="bold cp">※ 활동 정도</mark><br />
							가벼운 활동 : 거의 앉아서 일을 하는 경우<br />
							중등도 활동 : 걷기, 자전거타기 등 가벼운 운동을 정기적으로 하는 경우<br />
							심한 활동 : 달리기, 수영 등 강도있는 운동을 1주일에 4~5회 하는 경우
						</p>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="k_weightpercent" class="ff_title i_b"><strong>비만도</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<span class="input t1 fl w80 ml10" ><fmt:formatNumber value="${qna.k_weightpercent }" pattern=".00"/></span>
							<span class="fl text ml10">%</span>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="k_sportsweek" class="ff_title i_b"><strong>운동습관</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<span class="fl text">주</span>
							<span class="input t1 fl w80 ml10">${qna.k_sportsweek }</span>
							<span class="fl text ml10">회</span>
							<label for="inputid7" class="fl text w40 ml30">평균</label>
							<span class="input t1 fl w80 ml10">${qna.k_sportsminute }</span>
							<span class="fl text ml10">분</span>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="inputid8" class="ff_title i_b"><strong>음주습관</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<span class="fl text">주</span>
							<span class="input t1 fl w80 ml10" >${qna.k_drinkweek }</span>
							<span class="fl text ml10">회</span>
							<label for="k_drinkml" class="fl text w40 ml30">섭취량</label>
							<span class="input t1 fl w80 ml10" >${qna.k_drinkml }</span>
							<span class="fl text ml10">ml</span>
						</div>
						<p class="text cp"><mark class="bold cp">※ 술의 눈대중량</mark> : 소주 1잔 : 50ml, 맥주 1컵 : 200ml</p>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="k_weightmonth" class="ff_title i_b"><strong>한달체중변화</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<span class="input t1" >${qna.k_weightmonth }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="inputid11" class="ff_title i_b"><strong>병력 및 기타</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<span class="input t1" >${qna.k_etc }</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form:form>
	</div>
	</c:if>
		
		<div class="line bb p30 text" style="text-align: left;">
			<h4 class="ti">본문</h4>
			${kdaFunc:convHTML(qna.bbs_contents)}
		</div>
		
		<c:if test="${qna.k_isreply == '1'}">
		<div class="box t3 text small">
			<ul class="area">
				<li class="line bb bgs">
					<div class="p10 pl15">
						<h4 class="title i_b_t6"><strong class="ti">답변일 </strong>(${qna.k_replydate}) 답변</h4>
					</div>
				</li>
			</ul>
		</div>
		<div class="line bb p30 text" style="text-align: left;">
			<h4 class="ti">본문</h4>
			${kdaFunc:convHTML(qna.k_reply)}
		</div>
		</c:if>
		
		<div class="btn_wrap mt20">
			<ul class="fl">
				<li><a href="./${kind}.do?curPage=${param.curPage}&srchKind=${param.srchKind}&srchWord=${param.srchWord}" class="btn big">목록</a></li>
			</ul>
			<ul class="fr">
				<c:choose>
					<c:when test="${ g_user_level <= 2 }">
						<li><a href="javascript:manage('A')" class="btn big t1">답변</a></li>
						<li><a href="javascript:manage('U')" class="btn big t2">수정</a></li>
						<li><a href="javascript:manage('D')" class="btn big t3">삭제</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:showPopup('U')" class="btn big t2">수정</a></li>
						<li><a href="javascript:showPopup('D')" class="btn big t3">삭제</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>

<div id="popup_pwd" class="p_style"	style="width: 600px; height: 270px">
	<div id="popup">
		<div class="p_head" style="width: 570px;">
			<h2 class="title t3 cw bold s1 i_b_t6">비밀번호 확인</h2>
		</div>
		<div class="p_body text ca small center">
			<div class="p30">
				<form name="frmPwd" method="post" >
				<input type="hidden" name="bbs_idx" id="bbs_idx" value="${qna.bbs_idx }" />
				<input type="hidden" name="crud" id="crud" value="" /> 
				<div class="area">비밀번호를 입력하여 주십시요.</div>
				<div class="area mt20">
					<input type="password" class="input t1 w200" id="bbs_pwd" name="bbs_pwd"  onKeyPress="if(event.keyCode==13){ f_pwdSubmit()}"/> 
					<a href="javascript:f_pwdSubmit();" class="btn form p5 t1">확인</a> 
				</div>
				</form>
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
