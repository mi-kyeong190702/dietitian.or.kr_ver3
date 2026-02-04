<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function(){
		//180402 추가
		$("#lic_no").keyup(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});
   		$("#lic_no").focusout(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});

	});
	var msg ='${msg}';
	if(msg !=""){
		alert(msg);
	}

	function doSearch(){
		
		var pers_name = $("#pers_name");
		var lic_no = $("#lic_no");
		var edu = $("#cs_con_education");
		
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

		if(edu.val() == "0") {
			alert("미대상자 신청년도를 선택하세요.");
			cs_con_education.focus();
			
			return false;
		}
		
		recipientForm.method="POST";
		recipientForm.action = "recipientCheck.do";
		recipientForm.submit();

	}

	
	function doCancel(){
		$(".w150").val("");
	}
	
</script>
<form name="recipientForm">

			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">보수교육</mark> 미대상자 신청</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/recipient/recipient.do">보수교육 미대상자</a></li>
							<li><a href="/work/research/recipient/recipient.do" class="cm">보수교육 미대상자 신청</a></li>
						</ul>
					</div>
				</div>
				<hr />
				
				<div class="sp_body">
					<!-- 2022.12.29 신규 오픈으로 주석처리 및 이미지 디스플레이-->
					<!-- <img src="/assets/ver2/popup/images/popup_20221229.png" width="700" alt="" usemap="#imgmap" border="0"> -->
					<h4 class="title bold t2 cm s1 i_b_t2">보수교육 미대상자 면허신고 절차</h4>
					<div class="box t2 mt10 p20 text middle cb s1">
						<div class="area">
							<mark class="bold">보수교육 미대상자 신청(성명, 면허번호 입력) → 신청서 작성 후 증빙서류 첨부 → 신청서 제출 후 승인(1~2일 소요) → 면허신고 신청(성명, 면허번호 입력) → 절차에 따라 면허신고 신청서 작성 → 7일 후 마이페이지에서 확인 </mark>
						</div>
					</div>
					
					<h4 class="title bold t2 cm s1 i_b_t2 mt40">보수교육 미대상자 신청</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="pers_name"  name="pers_name"/>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="lic_no" name="lic_no"/>
										<span style="font-size: 15px; line-height: 30px; text-indent: 15px; color: red;" >&nbsp;&nbsp;(숫자만 입력)</span>
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
											<option value="0">------선택------</option>
											<option value="2013">2013</option>
											<option value="2015">2015</option>
											<option value="2017">2017</option>
											<option value="2019">2019</option>
											<option value="2021">2021</option>
										</select> 
										<span style="font-size: 15px; line-height: 30px; text-indent: 15px;" >&nbsp;&nbsp;(해당연도 각각 신청)</span>
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
					
					<div class="left" id="docu_view2">
							<h3 class="title bold t2 cm s1 i_b_t2 mt20">보수교육 미대상자 사유 및 증빙서류</h3>
							<div class="area">
								<table class="table t2 text small s1 cb center mt20">
									<colgroup>
										<col width="35" />
										<col width="*" />
										<col width="160" />
										<col width="265" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="col" class="bgs">구분</th>
											<th scope="col" class="bgs">미대상자 사유</th>
											<th scope="col" class="bgs">증빙서류</th>
											<th scope="col" class="bgs">비고</th>
										</tr>
										<tr>
											<td>1</td>
											<td class="left">2021년도에 국민영양관리법에 의한 영양사 보수교육 대상 근무처 외에 근무하고 있음.(공무원, 교수, 일반음식점, 조리사 등 타분야근무)<br />
											영양사 보수교육 대상 근무처 : 보건소, 보건지소, 의료기관, 집단급식소, 육아지원종합센터, 어린이급식지원센터, 건강기능식품판매업소
											<td class="center">2021년도<br /> 재직증명서 또는 경력증명서</td>
											<td class="center">국민연금가입자 가입증명서,</br>건강보험자격득실확인서는</br><strong class="bold">인정되지 않음</strong></td>
										</tr>
										<!-- <tr>
											<td>2</td>
											<td class="left">2021년도에 대학교 및 대학원 진학 등 학업 계속 상태로 미취업 상태임</td>
											<td class="center">2021년도<br />재학증명서 또는 졸업증명서</td>
											<td class="center"><strong class="bold">해당년도 1월~12월까지 기간이 명시</strong><br />되어야 승인됨</td>
										</tr> -->
										<tr>
											<td>2</td>
											<td class="left">2021년도에 미취업, 중도 퇴사, 취업경험 없음 등</td>
											<td class="center">2021년도<br />건강보험자격득실확인서</td>
											<td class="center">건강보험자격득실확인서는 <br /><strong class="bold">해당년도 1월~12월까지 기간이 명시</strong>되어야하고,<br /><strong class="bold">기관장 직인</strong>이 보이게 첨부되어야 승인됨.<br />(<a href="https://www.nhis.or.kr/nhis/index.do" target="_blank">국민건강보험 홈페이지</a>에서 발급 가능)</td>
										</tr>
										<tr>
											<td>3</td>
											<td class="left">기타(2021년도에 해외체류 등)</td>
											<td class="center">출입국 사실 증명서 등<br/>(사유에 따른 해당서류)</td>
											<td class="center">출산, 육아<strong class="bold">휴직</strong>의 경우,</br><strong class="bold">보수교육 면제</strong> 신청</br>(<a href="http://www.kdaedu.or.kr/Common.cmd?cmd=goAddPage&PageCode=100004" target="_blank">보수교육 면제신청 바로가기</a>)</td>
										</tr>
									</tbody>
								</table>
							</div>
							<ul class="text small mt20 ml10">
								<li class="i_box_t1">증빙서류는 <strong class="bold">기관장 직인을 포함</strong>하고 있어야 하며, 반드시 <strong class="bold">기간이 명시</strong>되어 있어야 승인됩니다.</li>
								<li class="i_box_t1 mt5">보수교육 미대상자 확인은 당해 연도에 한하므로, 동일한 사유에 해당하더라도 <strong class="bold">면허신고가 있는 해에 신고해야 하는 보수교육마다 미대상자 신청</strong>을 해야 합니다.</li>
								<li class="i_box_t1 mt5">보수교육 미대상자는 보수교육 미대상자를 신청하고 <strong class="bold">&quot;완료메일&quot;을 받은 후 초기화면으로 가서 면허신고 하시면 됩니다.</strong></li>
							</ul>
						</div>
	</div>
</div>
</form>