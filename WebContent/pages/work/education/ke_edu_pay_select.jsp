<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>		
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>


<script>
$(document).ready(function(){
		$("#win_deposit_due_date").datepicker();
});

function goPay()  {
	var ipgumg = C_getCheckVal("ipgumg");
	
	if( ipgumg == "10" ) {
		$('#popup_ipgumg_1').bPopup();
	}
	
	if( ipgumg == "20"  ) {
		document.frmCard.action = "./ke_edu_pay_card_action.do";
		document.frmCard.submit();
	}
	
	
	if( ipgumg == '40' ) {
		$('#popup_ipgumg_3').bPopup();
	}
	
	
	$("#code_pay_flag").val(ipgumg);
}

function f_ApplyBank() {
	if( $("#win_bank_name").val() == "" ) {
		alert("입금은행을 입력하여 주십시요");
		$("#win_bank_name").focus();
		return;
	}
	
	if( $("#win_oper_account").val() == "" ) {
		alert("입금자를 입력하여 주십시요");
		$("#win_oper_account").focus();
		return;
	}
	
	if( $("#win_deposit_due_date").val() == "" ) {
		alert("입금예정일를 선택하여 주십시요");
		return;
	}
	
	$("#bank_name").val( $("#win_bank_name").val() );
	$("#oper_account").val( $("#win_oper_account").val() );
	$("#deposit_due_date").val( $("#win_deposit_due_date").val() );
	           
	document.frmPay.action = "./ke_edu_pay_action.do";
	document.frmPay.submit();
}

function f_ApplyPlace() {	           
	document.frmPay.action = "./ke_edu_pay_action.do";
	document.frmPay.submit();
}

</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육과정</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_curriculum.do" >교육과정 신청</a></li>
				<li><a href="/work/education/ke_curriculum.do" class="cm">교육과정 신청</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // Contents start -->
	<div class="area">
		<form name="frmList" method="get">
			<table class="table t1 text s1 ssmall ca center mt50">
				<colgroup>
					<col width="100">
					<col width="100">
					<col width="200">
					<col width="100">
					<col width="*">
				</colgroup>
				<tbody>
				<tr>
					<td scope="row" class="bold cm bgs">신청교육 확인</td>
					<td colspan="4" class="left">
					 ${testName.edutest_name} 
					 <c:if test="${not empty operator.btext }">( ${operator.btext} )</c:if>
					 - ${testName.instrument }	 
					</td>
				</tr>
				<tr>
					<td scope="row" rowspan="3" class="bold cm bgs">개인정보</td>
					<td scope="row" class="cb bga">성명</td>
					<td scope="row">${operator.oper_name}</td>
					<td scope="row" class="cb bga">면허번호</td>
					<td scope="row">${operator.oper_lic_no}</td>
				</tr>
				<tr>
					<td scope="row" class="cb bga">근무처명</td>
					<td scope="row">${operator.oper_comp_name1 }</td>
					<td scope="row" class="cb bga">근무처 연락처</td>
					<td scope="row">${operator.company_tel}</td>
				</tr>
				<tr>
					<td scope="row" class="cb bga">Mobile Phone</td>
					<td scope="row">${operator.oper_hp }</td>
					<td scope="row" class="cb bga">E-mail</td>
					<td scope="row">${operator.oper_email}</td>
				</tr>
				<tr>
					<td scope="row" class="bold cm bgs">유의사항</td>
					<td colspan="4" class="left">
					교육 확인, 결제 정보 확인 등을 위하여 개인정보에 변경사항이 있으신 분은 교육신청 후 수정해주시기 바랍니다.<br />
					※ 회원 개인정보 수정 : 홈페이지 로그인 → 마이페이지에서 확인 및 수정 <br />
					※ 교육생(비회원) 개인정보 수정 : 홈페이지 → KDA교육 → 교육과정 신청 → 교육생 등록 로그인 → 교육생 정보수정에서 확인 <br/><span class="ml10"></span> 및 수정
					</td>
				</tr>
				
				<c:set var="pay" value="0" />
				
				<tr>
					<td rowspan="2"  scope="row" class="bold cm bgs">결제정보</td>
					<td scope="row" class="cb bga">교육비</td>
					<td colspan="3" scope="row" class="left cp">
						<c:set var="cost" value="0" />
						<c:choose>
							<c:when test="${isMember}">
								회원 : <fmt:formatNumber value="${testName.new_cost}" type="number"/> 원
								<c:set var="cost" value="${testName.new_cost}" />
							</c:when>
							<c:otherwise>
								비회원 : <fmt:formatNumber value="${testName.new_cost_nomem}" type="number"/> 원
								<c:set var="cost" value="${testName.new_cost_nomem}" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<c:if test="${cost > 0 }">
				<tr>
					<td scope="row" class="cb bga">결제방법</td>
					<td colspan="3" scope="row" class="left">
						<div class="f_field div1">
							<div class="ff_wrap text ssmall">
								
								<div class="area">
								<c:if test="${fn:substring(testName.account_way, 0, 1 ) == '1' }">
								<input type=radio name='ipgumg' id="ipgumg_1" value='10' class="mr5" <c:if test="${operator.code_pay_flag == '10' }"> checked</c:if> >
								<label for="ipgumg_1" class="mr20">무통장</label>
								
								</c:if>
								<c:if test="${fn:substring(testName.account_way, 1, 2 ) == '1' }">
								<!-- input type=radio name='IPGUMG' value='15' >CMS&nbsp;&nbsp;&nbsp; -->
								</c:if>
 								
 								
 								<c:if test="${fn:substring(testName.account_way, 2, 3 ) == '1' and !isStudent }">
								<input type=radio name='ipgumg' id="ipgumg_2" value='20' class="mr5"  <c:if test="${operator.code_pay_flag == '20' }"> checked</c:if>> 
								<label for="ipgumg_2" class="mr20">영양사카드</label>
								</c:if>
							
								
								<c:if test="${fn:substring(testName.account_way, 3, 4 ) == '1' }">
								<!-- input type=radio name='IPGUMG' value='30' >계산서&nbsp;&nbsp;&nbsp; -->
								</c:if>
								
								<c:if test="${fn:substring(testName.account_way, 4, 5 ) == '1' }">
								<input type=radio name='ipgumg'  id="ipgumg_3" value='40'  class="mr5"  <c:if test="${operator.code_pay_flag == '40' }"> checked</c:if>>
								<label for="ipgumg_3" class="mr20">현장납부</label>
								</c:if>
 								
 								<c:if test="${fn:substring(testName.account_way, 5, 6 ) == '1' }">
 										<!-- input type=radio name='IPGUMG' value='60' >지로&nbsp;&nbsp;&nbsp; -->
								
								</c:if>	
 										<c:if test="${fn:substring(testName.account_way, 6, 7 ) == '1' }">
								 <!-- input type=radio name='IPGUMG' value='70' >기타&nbsp;&nbsp;&nbsp; -->  
								</c:if>
								
								</div>
							</div>
						</div>
						
					</td>
				</tr>
				</c:if>
				</tbody>
			</table>
			</form>
		</div>
		
		<c:if test="${cost == 0 }">
		<div class="cm center mt10">
			※ 결제가 필요없는 교육입니다.
		</div>
		
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="/work/education/ke_situation.do" class="btn big t1 wide">신청현황 바로가기</a></li>
			</ul>
		</div>
		</c:if>
		
		<c:if test="${ cost > 0 }">
		<div class="btn_wrap mt30">
			<ul>
				<li><a href="javascript:goPay();" class="btn big t1 wide">다음</a></li>
			</ul>
		</div>
		</c:if>
		
		<form name="frmPay" method="post">
			<input type="hidden" name="oper_key" value="${operator.operkey}${operator.receipt_no}" />
			<input type="hidden" name="test_bank_nm" value="${operator.test_bank_name}" />
			<input type="hidden" name="test_bank_acc" value="${operator.test_bank_acc}" />
			<input type="hidden" name="test_bank_acc" value="${operator.test_bank_acc_owner}" />
			<input type="hidden" name="update_kind" value="pay" />
			<input type="hidden" name="code_pay_flag" id="code_pay_flag" value="" />
			<input type="hidden" name="bank_name" id="bank_name" />
			<input type="hidden" name="oper_account" id="oper_account" />
			<input type="hidden" name="deposit_due_date" id="deposit_due_date" />
		</form>
		
		<c:set var="edu_kind" value="1" />
		<c:if test="${ fn:substring(operator.operkey, 0, 1) == '3'  }">
			<c:set var="edu_kind" value="2" />
		</c:if>
	 	
		<form name="frmCard" method="post">
			<input type='hidden' name='O_gubun' value='EDU_STUDY' />
            <input type='hidden' name='good_name' value=' ${testName.edutest_name}' />
            <input type="hidden" name="goods_code_num" value="${operator.operkey}${operator.receipt_no}" />
            <input type="hidden" name="good_mny" value="${cost}" />
            <input type="hidden" name="edu_kind" value="${edu_kind}" />
            <input type="hidden" name="code_bran" value="${cardBran}" />
            <input type="hidden" name="buyr_name" value="${operator.oper_name}" />
            <input type="hidden" name="buyr_tel1" value="${operator.company_tel}" />
            <input type="hidden" name="buyr_tel2" value="${operator.oper_hp}" />
            <input type="hidden" name="buyr_mail" value="${operator.oper_email}" />
            <input type="hidden" name="pers_birth" value="${operator.pers_birth}" />
		</form>
	
		
		<!-- // bank popup start -->
		
		<div id="popup_ipgumg_1" class="popup_box_1">
			<span class="popup_btn">X</span>
			<div id="popup" class="popup_wrap_1">
				<fieldset>						
					<div class="p_head_1 p15">
						<h2 class="title t3 cw bold s1 i_b_t6">무통장 입금을 선택하셨습니다.</h2>
					</div>
				
					<legend><span class="ti">무통장 지로입금 정보 입력</span></legend>
					<div class="area p10 w500 ml5">
						<span class="text s1 i_b_t6">교육비 입금 은행 정보는 아래와 같습니다.</span>
						<table class="table t1 text s1 ssmall ca center mt5">
							<colgroup>
								<col width="60">
								<col width="80">
								<col width="60">
								<col width="80">
							</colgroup>
							<tbody>
							<tr>
								<td scope="row" class="bold cm bgs_2">교육명</td>
								<td colspan="3" class="left">
 								 ${testName.edutest_name} 
								 <c:if test="${not empty operator.btext }">( ${operator.btext} )</c:if>
								 - ${testName.instrument }	 
								</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs_2">은행명</td>
								<td scope="row" class="left">${operator.test_bank_name}</td>
								<td scope="row" class="bold cm bgs_2">계좌번호</td>
								<td scope="row" class="left">${operator.test_bank_acc}</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs_2">예금주</td>
								<td colspan="3" class="left">${operator.test_bank_acc_owner}</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs_2">문의처</td>
								<td colspan="3" class="left">Tel. ${localAcc.tel} / Fax. ${localAcc.fax }</td>
							</tr>
							</tbody>
						</table>
					</div>
					
					<div class="area p10 w500 ml5">
						<span class="text s1 i_b_t6">교육비 입금 확인을 위하여 입금자 정보를 반드시 입력해 주십시오.</span>
						<table class="table t1 text s1 ssmall ca center mt5">
							<colgroup>
								<col width="60">
								<col width="80">
								<col width="60">
								<col width="80">
							</colgroup>
							<tbody>
							<tr>
								<td scope="row" class="bold cm bgs_2">입금액</td>
								<td colspan="3" class="left cp">${cost}원</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs_2"><label for="inputid1">입금은행명</label></td>
								<td scope="row" class="left" ><input type="text" class="input t1 w100" name="win_bank_name" id="win_bank_name" value="${operator.bank_name}"/></td>
								<td scope="row" class="bold cm bgs_2"><label for="inputid1">입금예정일</label></td>
								<td scope="row" class="left"><input type="text" class="input t1 w100" name="win_deposit_due_date" id="win_deposit_due_date" value="${operator.deposit_due_date}" readonly="readonly"  /></td>
								
							</tr>
							<!-- 
								<td scope="row" class="bold cm bgs_2"><label for="inputid2">계좌번호</label></td>
								<td scope="row" class="left"><input type="text" class="input t1 w120" id="inputid2" /></td>
								 -->
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap mt10 mb20">
						<ul>
							<li><a href="javascript:f_ApplyBank();" class="btn big t1 wide">신청</a></li>
							<li><a href="#" class="btn big bClose">닫기</a></li>
						</ul>
					</div>									
				</fieldset>
			</div>
		</div>                       
		<!-- // bank popup end -->
		
		<!-- // Place popup start -->
		<div id="popup_ipgumg_3"  class="popup_box_1">
			<span class="popup_btn">X</span>
			<div id="popup" class="popup_wrap_1">
				<fieldset>			
					<div class="p_head_1 p15">
						<h2 class="title t3 cw bold s1 i_b_t6">현장납부를 선택 하셨습니다.</h2>
					</div>
					<div class="area p10 w500 ml5">
						
						<span class="text s1 i_b_t6">현장 납부의 경우 교육일에 교육장소에 가셔서 직접 납부해 주시면 됩니다.</span>
						<table class="table t1 text s1 ssmall ca center mt5">
							<colgroup>
								<col width="100">
								<col width="*">
							</colgroup>
							<tbody>
							<tr>
								<td scope="row" class="bold cm bgs">교육명</td>
								<td class="left">
								${testName.edutest_name}<c:if test="${not empty operator.btext }">(${operator.btext})</c:if>
								 - ${testName.instrument }	 
								</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs">교육일</td>
								<td class="left">
								${kdaFunc:formatDayKo(testName.oper_start_dt)} ~ ${kdaFunc:formatDayKo(testName.oper_end_dt)}
								</td>
							</tr>
							<tr>
								<td scope="row" class="bold cm bgs">교육장소</td>
								<td class="left">${testName.operation_place}</td>
							</tr>
							</tbody>
						</table>
					</div>	
						
					<div class="btn_wrap mt10 mb20">
						<ul>
							<li><a href="javascript:f_ApplyPlace();" class="btn big t1 wide">신청</a></li>
							<li><a href="#" class="btn big bClose">닫기</a></li>
						</ul>
					</div>
				</fieldset>
			</div>
		</div>      
		
		
                 
	<!-- // Place popup end -->
	<!-- // Contents end -->
	</div>
</div>