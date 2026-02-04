<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_Save() {
	if( $("#bbs_subject").val() == "" ) {
		alert("제목을 입력하여 주십시요");
		$("#bbs_subject").focus();
		return;
	}
	
	if( $("#bbs_name").val() == "" ) {
		alert("이름을 입력하여 주십시요");
		$("#bbs_name").focus();
		return;
	}
	
	if( $("#bbs_contents").val() == "" ) {
		alert("내용을 입력하여 주십시요");
		$("#bbs_contents").focus();
		return;
	}
	
	if( $("#bbs_pwd").val() == "" ) {
		alert("비밀번호를 입력하여 주십시요");
		$("#bbs_pwd").focus();
		return;
	}
	
	document.frm.action = "./${kind}_action.do";
	document.frm.submit();
}

function f_Calculate() {
	var ki = $("#k_stature").val();
	var ag = $("#k_weight").val();
	
	var isg1 = document.frm.k_sex[0].checked;
	var isg2 = document.frm.k_sex[1].checked;
	
	if(ki == "") {
		alert("신장을 입력하여 주십시오.");
		return;
	}
	
	if(ag == "") {
		alert("몸무게를 입력하여 주십시오.");
		return;
	}
	
	if(!isg1 && !isg2) {
		alert("성별을 선택하여 주십시오.");
		return;
	}
	
	
	if(ki>=160)	jj = (ki-100) * 0.9
	else if(ki>150&&ki<=159) jj = ((ki-150) * 0.5) + 50
	else jj = ki-1
	j = (ag-jj)/jj*100
	
	$("#k_weightpercent").val(j);
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
	<div class="sp_body">
		<div class="box t3 bgs p10 pl15 text small">
			<div class="area">
				<h4 class="title i_b_t6">개인정보입력</h4>
				<span class="text ssmall ca s1">(기입해 주신 개인정보는 상담을 위해 상담영양사님께만 보이며 일반 공개되지 않습니다.)</span>
			</div>
		</div>
		<div class="form">
		
			<form:form name="frm" modelAttribute="qna" method="post">
			<form:hidden path="crud" />
			<form:hidden path="bbs_idx" />
			<div class="f_wrap line bb p8">
				<div class="f_field div2">
					<label for="k_stature" class="ff_title i_b"><strong>신장</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="k_stature" class="input t1 fl w80" />
							<span class="fl text ml10">Cm</span>
						</div>
					</div>
				</div>
				<div class="f_field div2">
					<label for="k_weight" class="ff_title i_b"><strong>체중</strong></label>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<form:input path="k_weight" class="input t1 fl w80" />
							<span class="fl text ml10">Cm</span>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div2">
					<div class="ff_title i_b"><strong>성별</strong></div>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<form:radiobutton path="k_sex" value="남" class="mr5"/>
							<label for="k_sex1" class="mr20">남자</label>
							<form:radiobutton path="k_sex" value="여" class="mr5"/>
							<label for="k_sex2" class="mr20">여자</label>
						</div>
					</div>
				</div>
				<div class="f_field div2">
					<label for="k_age" class="ff_title i_b"><strong>연령</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="k_age" class="input t1 fl w80" />
							<span class="fl text ml10">세</span>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title i_b"><strong>활동량</strong></div>
					<div class="ff_wrap ml120 text">
						
						<ul class="area">
							<li class="fl mr20 p3"><form:radiobutton path="k_activity" value="가벼운 활동"  class="mr5" /><label for="k_activity1">가벼운 활동</label></li>
							<li class="fl mr20 p3"><form:radiobutton path="k_activity" value="중등도 활동"  class="mr5"/><label for="k_activity2">중등도 활동</label></li>
							<li class="fl mr20 p3"><form:radiobutton path="k_activity" value="심한 활동" class="mr5" /><label for="k_activity3">심한 활동</label></li>
							<li class="fl w95p p3"><form:radiobutton path="k_activity" value="기타" class="fl mt10 mr5"/><label class="fl mt5 mr10" for="k_activity5">기타</label>
							<label class="ti" id="radio2_4">메모 </label>
							<input type="text" name="k_activity_etc"  class="input t1 fl w100 ml10" />
							
							</li>
						</ul>
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
							<a href="javascript:f_Calculate()" class="btn form t1 fl">계산하기</a>
							<span class="fl text ca ml10">-></span>
							<form:input path="k_weightpercent" class="input t1 fl w80 ml10" />
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
							<form:input path="k_sportsweek"  class="input t1 fl w80 ml10"/>
							<span class="fl text ml10">회</span>
							<label for="inputid7" class="fl text w40 ml30">평균</label>
							<form:input path="k_sportsminute" class="input t1 fl w80 ml10"/>
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
							<form:input path="k_drinkweek" class="input t1 fl w80 ml10" />
							<span class="fl text ml10">회</span>
							<label for="k_drinkml" class="fl text w40 ml30">섭취량</label>
							<form:input path="k_drinkml"  class="input t1 fl w80 ml10" />
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
							<form:input path="k_weightmonth"  class="input t1"  />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="inputid11" class="ff_title i_b"><strong>병력 및 기타</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="k_etc" class="input t1" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="box t3 bgs mt30 p10 pl15 text small">
			<div class="area">
				<h4 class="title i_b_t6">질문하기</h4>
			</div>
		</div>
		<div class="form">
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="inputid12" class="ff_title i_b"><strong>제목</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="bbs_subject"  class="input t1" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div2">
					<label for="inputid13" class="ff_title i_b"><strong>이름</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="bbs_name"  class="input t1 w200" />
						</div>
					</div>
				</div>
				<div class="f_field div2">
					<label for="inputid14" class="ff_title i_b"><strong>이메일</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="bbs_email" class="input t1 w200" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="bbs_contents" class="ff_title i_b"><strong>내용</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="bbs_contents" class="ti">기본주소</label>
							<form:textarea path="bbs_contents" class="textarea t1 h350"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title i_b"><strong>공개여부</strong></div>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<form:radiobutton path="bbs_pub" value="1"/>
							<label for="bbs_pub1" class="mr20">공개</label>
							<form:radiobutton path="bbs_pub" value="0"/>
							<label for="bbs_pub2" class="mr20">비공개</label>
						</div>
						<p class="text cp">(공개를 선택하면 개인정보를 제외한 질문내용이 보입니다.)</p>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="inputid15" class="ff_title"><strong>비밀번호</strong></label>
					 <div class="ff_wrap ml120">
						<div class="area">
							<form:password path="bbs_pwd"  class="input t1 fl w100 ml10"/>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
		<div class="btn_wrap mt40">
			<ul>
				<li><a href="javascript:f_Save()" class="btn big t1">완료</a></li>
				<li><a href="#" class="btn big">취소</a></li>
			</ul>
		</div>
		
		</form:form>
	</div>
</div>