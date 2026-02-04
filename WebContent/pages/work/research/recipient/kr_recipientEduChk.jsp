<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	var msg ='${msg}';
	if(msg !=""){
		alert(msg);
	}

	function doSearch(){
		
		var pers_name = $("#pers_name");
		var lic_no = $("#lic_no");
		
		if(pers_name.val() == ""){
			alert("성명을 입력하세요");
			pers_name.focus();
			return false;
		}
		if(lic_no.val() == ""){
			alert("면허번호를 입력하세요");
			lic_no.focus();
			return false;
		}
		/*
		var radio3 = $(':input[name=cs_con_education]:radio:checked').val();
		if(!radio3) {
			alert("미대상자 신청년도를 선택하세요.");
			cs_con_education.focus();
			
			return false;
		}
		*/
		
		recipientForm.method="POST";
		recipientForm.action = "recipientModifyForm.do";
		recipientForm.submit();
		
	}

	
	function doCancel(){
		location.href="/work/research/recipient/recipientModify.do";
	}
	
</script>
<form name="recipientForm">

<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">보수교육</mark> 미대상자 수정</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/recipient/recipient.do">보수교육 미대상자</a></li>
							<li><a href="/work/research/recipient/recipientModify.do" class="cm">보수교육 미대상자 수정</a></li>
						</ul>
					</div>
				</div>
				<hr />
	<div class="sp_body">
					<h4 class="title bold t2 cm s1 i_b_t2">보수교육 미대상자 수정</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="pers_name"  name="pers_name" value="${recipientVo.pers_name}" readonly="true"/>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="lic_no" name="lic_no" value="${recipientVo.lic_no}" readonly="true"/>
										<!-- <a href="http://lic.mw.go.kr/login/login.do" target="_blank" class="fr btn t2_1 form ml5" title="새창으로 열기">보건복지부 면허번호 확인하기</a> -->
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid3" class="ff_title i_b"><strong>미대상자 신청년도</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
									<select class="select t2 fl w100" name="cs_con_education" id="cs_con_education" title="년도" style="width: 20%;">
										<c:forEach items="${csConEduList}" var="eduList">
											<option value="${eduList.edu}">${eduList.edu }</option>			
										</c:forEach>
									</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap mt20">
						<ul>
							<li><a href="javascript:doSearch();" class="btn big t1">확인</a></li>
							<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
						</ul>
					</div>
	</div>
</div>
</form>