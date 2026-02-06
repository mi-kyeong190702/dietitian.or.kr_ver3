<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<style type="text/css">
.Pstyle { opacity: 0; display: none; background-color: #fff; }
.b-close { min-width: 68px; height: 38px;  padding: 0px 15px; font: 15px NanumGothic; line-height: 38px; border: #006ab6 solid 1px; background: #f5f6f8;  color: #006ab6; text-decoration: underline;
    vertical-align: middle; border-radius: 4px;text-align: center;cursr:pointer;display: inline-block; }
</style>


<script>
$(document).ready(function(){
	
});

function cancel_edu(examKey) {
	$("#edutest_name").val( $("#edutest_name_" + examKey ).val() );
	$("#oper_name").val( $("#oper_name_" + examKey ).val() );
	$("#oper_lic_no").val( $("#oper_lic_no_" + examKey ).val() );
	
	$("#edutest_name_txt").html( $("#edutest_name_" + examKey ).val() );
	$("#oper_name_txt").html( $("#oper_name_" + examKey ).val() );
	$("#oper_lic_no_txt").html( $("#oper_lic_no_" + examKey ).val() );
	
	
	$("#oper_hp").val( $("#oper_hp_" + examKey ).val() );
	$("#oper_email").val( $("#oper_email_" + examKey ).val() );
	$("#examKey").val( examKey );
	
	$('#popup_ipgumg_1').show();
	$('#popup_ipgumg_1').bPopup();
}

function f_Send(){
	 var frm = document.frmCancel;
 	if( $("#examKey").val() == '' ) {
 		alert("올바르지 않은 시도입니다");
 		return;
 	}
 	if( confirm("정말 자격시험을 취소하시겠습니까?") ) {
		document.frmCancel.action = "ke_exam_cancel_action.do";
		document.frmCancel.submit();
 	}
}

</script>	
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격시험</mark> 신청현황</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">등록민간자격</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격시험 신청현황</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // Contents Start -->
		<div class="area">
			<table class="table t1 text s1 ssmall ca center mt30 mb50">
				<colgroup>
					<col width="*">
					<col width="90">
					<col width="90">
					<col width="90">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">시험명</th>
					<th scope="col" class="bold cm">시행일</th>
					<th scope="col" class="bold cm">신청 현황</th>
					<th scope="col" class="bold cm">등록취소</th>
				</tr>
				</thead>
				<tbody>					
		<c:choose>
			<c:when test="${empty operList }">
				<TR>
					<TD  colspan="4">자료가 존재 하지 않습니다. </TD>
				</TR>	
			</c:when>
			<c:otherwise>
				<c:forEach items="${operList}" var="oper">
				<c:if test="${(  oper.oper_state == '01' || oper.oper_state == '09' || oper.oper_state == '11' )  }">
				<tr>
					<td>${oper.edutest_name}</td>
					<td>${kdaFunc:formatDay2(oper.oper_start_dt)}</td>
					<td>
					${oper.oper_state_txt }
					<%-- <c:if test="${ empty oper.result_state or oper.result_state == '' }">
						${oper.oper_state_txt }
					</c:if>
					<c:if test="${ oper.result_state != '' }">
						${oper.result_state_txt}
					</c:if> --%>
			 		</td>
			 		<td>
			 		<c:if test="${(  oper.oper_state == '01' || oper.oper_state == '02' || oper.oper_state == '03'  || oper.oper_state == '04') and today <= oper.oper_start_dt  }">
			 		<input type="hidden" id="edutest_name_${oper.examKey}" value="${oper.edutest_name}">
			 		<input type="hidden" id="oper_name_${oper.examKey}" value="${oper.oper_name}">
			 		<input type="hidden" id="oper_lic_no_${oper.examKey}" value="${oper.oper_lic_no}">
			 		<input type="hidden" id="oper_hp_${oper.examKey}" value="${oper.oper_hp}">
			 		<input type="hidden" id="oper_email_${oper.examKey}" value="${oper.oper_email}">
			 		<a href="javascript:cancel_edu('${oper.examKey}')" class="btn small t3">취소하기</a>
			 		</c:if>      
					</td>
				</tr>
				</c:if>
				</c:forEach>   
			</c:otherwise>
		</c:choose>	
				</tbody>
			</table>                   
		</div>        
		

<div id="popup_ipgumg_1" class="popup_box_1">
	<span class="popup_btn">X</span>
	
	<div id="popup" class="popup_wrap_1">
		<div class="p_head_1 p15">
			<h2 class="title t3 cw bold s1 i_b_t6">자격시험 취소를 위하여 응시자 정보를 입력해 주십시오.</h2>
		</div>
			
		
		
		<fieldset>
		<legend><span class="ti">무통장 지로입금 정보 입력</span></legend>
		<form name="frmCancel" method="post">
		<input type="hidden" id="examKey" name="examKey">
		
		
		<div class="area p10 w500 ml5">
			<table class="table t1 text s1 ssmall ca center mt5">
									
				<tr>
					<td scope="row" class="bold cm bgs_2">신청시험명</td>
					<td class="left">
						<span id="edutest_name_txt"></span>
						<input type="hidden" name="edutest_name" id="edutest_name"/>
					</td>
				</tr>
				<tr>
					<td scope="row" class="bold cm bgs_2">이름</td>
					<td class="left">
						<span id="oper_name_txt"></span>
						<input type="hidden" name="oper_name" id="oper_name"/>
					</td>
				</tr>
				<tr>
					<td scope="row" class="bold cm bgs_2">면허번호</td>
					<td class="left">
						<span id="oper_lic_no_txt"></span>
						<input type="hidden" name="oper_lic_no" id="oper_lic_no"/>
					</td>
				</tr>
				<tr>
					<td scope="row" class="bold cm bgs_2">휴대폰번호</td>
					<td class="left"><input type="text" id="oper_hp"  class="input t1 w200" name="oper_hp" size=20 value=""></td>
				</tr>
				<tr>
					<td scope="row" class="bold cm bgs_2">이메일</td>
					<td class="left"><input type="text" id="oper_email"  class="input t1 w200" name="oper_email" size=20 value=""></td>
				</tr>
			</table>
		</div>
		</form>
   
   		<div class="btn_wrap mt10 mb20">
			<ul>
				<li><a href="javascript:f_Send()" class="btn big t1 wide">신청취소</a></li>
				<li><a href="#" class="btn big bClose">닫기</a></li>
			</ul>
		</div>

        </fieldset>
    </div>
</div>
		        												
	<!-- // Contents End -->
	</div>
</div>


	</c:otherwise>
</c:choose>
