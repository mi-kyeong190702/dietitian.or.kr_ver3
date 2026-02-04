<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<link href="/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
<script>

$(document).ready(function(){
	
	$("#startm").datepicker({
		dateFormat: "yymmdd"
		,changeMonth: true
        ,changeYear: true
        ,showButtonPanel: true
        ,yearRange: 'c-20:c+20'
	});
	$("#endm").datepicker({
		dateFormat: "yymmdd"
		,changeMonth: true
        ,changeYear: true
        ,showButtonPanel: true
        ,yearRange: 'c-20:c+20'
	});
	
	
	$('#startm').datepicker("option", "maxDate", $("#endm").val());
    $('#startm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#endm").datepicker( "option", "minDate", selectedDate );
    });
    
    $('#endm').datepicker("option", "minDate", $("#startm").val());
    $('#endm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#startm").datepicker( "option", "maxDate", selectedDate );
    });
});

function pick(id){
	$("#"+id).focus();
}

function f_search() {
	var startm = $("#startm").val();
	var endm = $("#endm").val();
	
	if(startm== ""){
		alert("검색 날짜를 선택하세요.");
		$("#startm").focus();
		return;
	}
	if(endm== ""){
		alert("검색 날짜를 선택하세요.");
		$("#endm").focus();
		return;
	}

	document.frmPayment.submit();
}

function f_form(id){
	
	var param="";
	
	param +="?o_code="+id;
	param +="&cd=";
	if($("#cPage").val() != "") param +="&curPage="+$("#cPage").val();
	if($("#startm").val() != "") param +="&startm="+$("#startm").val();
	if($("#endm").val() != "") param +="&endm="+$("#endm").val();
	if($("#buyr_name").val() != "") param +="&buyr_name="+$("#buyr_name").val();
	if($("#o_gubun").val() != "") param +="&o_gubun="+$("#o_gubun").val();
	if($("#code_bran").val() != "") param +="&code_bran="+$("#code_bran").val();
	if($("#order_status").val() != "") param +="&order_status="+$("#order_status").val();
	if($("#good_name").val() != "") param +="&good_name="+$("#good_name").val();
	if($("#ordr_idxx").val() != "") param +="&ordr_idxx="+$("#ordr_idxx").val();
	if($("#tno").val() != "") param +="&tno="+$("#tno").val();
	if($("#good_mny").val() != "") param +="&good_mny="+$("#good_mny").val();
	if($("#app_no").val() != "") param +="&app_no="+$("#app_no").val();
	if($("#pers_birth").val() != "") param +="&pers_birth="+$("#pers_birth").val();
	
	location.href="confirmForm.do"+param;
}

function f_excel() {
	var startm = $("#startm").val();
	var endm = $("#endm").val();
	
	if(startm== ""){
		alert("검색 날짜를 선택하세요.");
		$("#startm").focus();
		return;
	}
	if(endm== ""){
		alert("검색 날짜를 선택하세요.");
		$("#endm").focus();
		return;
	}
	
	var param="";
	if($("#startm").val() != "") param +="&startm="+startm;
	if($("#endm").val() != "") param +="&endm="+endm;
	if($("#buyr_name").val() != "") param +="&buyr_name="+$("#buyr_name").val();
	if($("#o_gubun").val() != "") param +="&o_gubun="+$("#o_gubun").val();
	if($("#code_bran").val() != "") param +="&code_bran="+$("#code_bran").val();
	if($("#order_status").val() != "") param +="&order_status="+$("#order_status").val();
	if($("#good_name").val() != "") param +="&good_name="+$("#good_name").val();
	if($("#ordr_idxx").val() != "") param +="&ordr_idxx="+$("#ordr_idxx").val();
	if($("#tno").val() != "") param +="&tno="+$("#tno").val();
	if($("#good_mny").val() != "") param +="&good_mny="+$("#good_mny").val();
	if($("#app_no").val() != "") param +="&app_no="+$("#app_no").val();
	if($("#pers_birth").val() != "") param +="&pers_birth="+$("#pers_birth").val();

	location.href="confirmExcel.do?"+param;
	
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		<form name="frmPayment">
		<input type="hidden" name="cPage" id="cPage" value="${listHelper.curPage}"/>
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="startm" class="ff_title"><strong>거래일자</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w150" id="startm" name="startm" readonly="readonly" onclick="this.value='';" value="${param.startm }"/>
									<a href="#" onclick="pick('startm');return false;" class="btn form t1 fl ml5 p0" id="pick1">달력</a>
									<span class="fl text ml10 mr10">~</span>
									<input type="text" class="input t1 fl w150 ml5" id="endm" name="endm" readonly="readonly" onclick="this.value='';" value="${param.endm }"/>									
									<a href="#" onclick="pick('endm');return false;" class="btn form t1 fl ml5 p0" id="pick2">달력</a>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8 ">
						<div class="f_field div2">
							<label for="buyr_name" class="ff_title"><strong>결제자성명</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="buyr_name" name="buyr_name" value="${param.buyr_name}"/>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="o_gubun" class="ff_title"><strong>결제구분</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w20p" id="o_gubun" name="o_gubun">
										<option value="">모두</option>
										<option value="MEMBER_UP" <c:if test="${param.o_gubun=='MEMBER_UP'}"> selected="selected"</c:if> >회원재가입</option>
										<option value="EDU_STUDY" <c:if test="${param.o_gubun=='EDU_STUDY'}"> selected="selected"</c:if> >홈페이지교육신청</option>
									<c:if test="${user.center_flag== '1' }">
										<option value="EDU_RETEST" <c:if test="${param.o_gubun=='EDU_RETEST'}"> selected="selected"</c:if> >홈페이지재시험</option>
										<option value="STUDY_REA"  <c:if test="${param.o_gubun=='STUDY_REA'}"> selected="selected"</c:if> >학술대회</option>
										<option value="EDU-REAL"  <c:if test="${param.o_gubun=='EDU-REAL'}"> selected="selected"</c:if> >쇼핑몰-판매품</option>
									</c:if>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8 ">
						<div class="f_field div2">
							<label for="code_bran" class="ff_title"><strong>지회선택</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<c:if test="${user.center_flag == '0' }">
									<span class="fl text ml10 mr10">지회결제관리</span>
									</c:if>
									<select class="select t2 fl w20p" id="code_bran" name="code_bran">
									<c:if test="${user.center_flag == '0' }">
										<option value="${user.code_bran}">${user.code_bran_str}</option>
									</c:if>
									<c:if test="${user.center_flag== '1' }">
										<option value="">모두</option>
										<option value="0"    <c:if test="${param.code_bran=='0'}"> selected="selected"</c:if>  >중앙회</option>
										<option value="10"   <c:if test="${param.code_bran=='10'}"> selected="selected"</c:if>  >서울지부</option>
										<option value="20"   <c:if test="${param.code_bran=='20'}"> selected="selected"</c:if>  >부산지부</option>
										<option value="30"   <c:if test="${param.code_bran=='30'}"> selected="selected"</c:if>  >인천지부</option>
										<option value="40"   <c:if test="${param.code_bran=='40'}"> selected="selected"</c:if>  >경기지부</option>
										<option value="50"   <c:if test="${param.code_bran=='50'}"> selected="selected"</c:if>  >강원지부</option>
										<option value="60"   <c:if test="${param.code_bran=='60'}"> selected="selected"</c:if>  >충북지부</option>
										<option value="70"   <c:if test="${param.code_bran=='70'}"> selected="selected"</c:if>  >대전충남세종지부</option>
										<option value="80"   <c:if test="${param.code_bran=='80'}"> selected="selected"</c:if>  >전북지부</option>
										<option value="90"   <c:if test="${param.code_bran=='90'}"> selected="selected"</c:if>  >광주전남지부</option>
										<option value="100"  <c:if test="${param.code_bran=='10'}"> selected="selected"</c:if>  >대구경북지부</option>
										<option value="110"  <c:if test="${param.code_bran=='110'}"> selected="selected"</c:if>  >경남지부</option>
										<option value="120"  <c:if test="${param.code_bran=='120'}"> selected="selected"</c:if>  >울산지부</option>
										<option value="130"  <c:if test="${param.code_bran=='130'}"> selected="selected"</c:if>  >제주지부</option>
									</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="order_status" class="ff_title"><strong>결제상태</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w20p" id="order_status" name="order_status">
										<option value="">모두</option>
										<option value="00" <c:if test="${param.order_status=='00'}"> selected="selected"</c:if> >승인</option>
										<option value="01" <c:if test="${param.order_status=='01'}"> selected="selected"</c:if> >취소</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="good_name" class="ff_title"><strong>상품명</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="good_name" name="good_name" value="${param.good_name}"/>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="ordr_idxx" class="ff_title"><strong>주문번호</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="ordr_idxx" name="ordr_idxx" value="${param.ordr_idxx}"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="tno" class="ff_title"><strong>KCP 거래번호</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="tno" name="tno" value="${param.tno}"/>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="good_mny" class="ff_title"><strong>거래금액</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="good_mny" name="good_mny" value="${param.good_mny}"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap p8">
						<div class="f_field div2">
							<label for="app_no" class="ff_title"><strong>승인번호</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="app_no" name="app_no" value="${param.app_no}"/>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="pers_birth" class="ff_title"><strong>생년월일</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" class="input t1 fl w50p" id="pers_birth" name="pers_birth" value="${param.pers_birth}"/>
									<a href="javascript:f_search();" class="btn form t1 fl ml10">검색</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="40">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="120">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="50">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">No</th>
					<th scope="col" class="bold cm">상품명</th>
					<th scope="col" class="bold cm">연관고유번호</th>
					<th scope="col" class="bold cm">승인일자</th>
					<th scope="col" class="bold cm">승인번호</th>
					<th scope="col" class="bold cm">kcp 거래번호</th>
					<th scope="col" class="bold cm">주문번호</th>
					<th scope="col" class="bold cm">결제구분</th>
					<th scope="col" class="bold cm">지회구분</th>
					<th scope="col" class="bold cm">카드계열</th>
					<th scope="col" class="bold cm">할부구분</th>
					<th scope="col" class="bold cm">아이디(성명)</th>
					<th scope="col" class="bold cm">생년월일</th>
					<th scope="col" class="bold cm">전화번호</th>
					<th scope="col" class="bold cm">핸드폰</th>
					<th scope="col" class="bold cm">결과메세지</th>
					<th scope="col" class="bold cm">이메일</th>
					<th scope="col" class="bold cm">결제금액</th>
					<th scope="col" class="bold cm">수수료</th>
					<th scope="col" class="bold cm">지급예정금액</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="ShopUrl" value="" />
				<c:set var="O_gubun_view" value="" />
				<c:set var="bgcolor" value="" />
				<c:forEach items="${listHelper.list}" var="payment">
				<c:if test="${payment.order_status != '00'}">
					<c:set var="bgcolor" value="style='background-color:yellow;'" />	
				</c:if>
				<c:if test="${payment.order_status == '00'}">
				<c:set var="bgcolor" value="" />
				</c:if>
				<tr ${bgcolor}>
					<td>${payment.num}</td>
					<td class="link"><a href="javascript:f_form(${payment.o_code });">${payment.good_name}</a></td>
					<td class="link">
					<c:choose>
						<c:when test="${payment.o_gubun == 'MEMBER'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${payment.pers_birth }&buyr_name=${payment.buyr_name}&id=${payment.id }" />
						<c:set var="O_gubun_view" value="회원가입" />
						</c:when>
						<c:when test="${payment.o_gubun == 'MEMBER_UP'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${payment.pers_birth }&buyr_name=${payment.buyr_name}&id=${payment.id }" />
						<c:set var="O_gubun_view" value="회원재가입" />
						</c:when>
						<c:when test="${payment.o_gubun == 'EDU-REAL'}">
						<c:set var="ShopUrl" value="?cd=card&goods_code_num=${payment.goods_code_num }" />
						<c:set var="O_gubun_view" value="교육 - 판매품" />
						</c:when>
						<c:when test="${payment.o_gubun == 'STUDY_REA'}">
						<c:set var="ShopUrl" value="?cd=tech&goods_code_num=${payment.goods_code_num }" />
						<c:set var="O_gubun_view" value="학술대회" />
						</c:when>
						<c:when test="${payment.o_gubun == 'EDU_STUDY'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${payment.goods_code_num }&edu_kind=${payment.edu_kind }" />
						<c:set var="O_gubun_view" value="홈페이지교육신청" />
						</c:when>
						<c:when test="${payment.o_gubun == 'EDU_RETEST'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${payment.goods_code_num }&edu_kind=${payment.edu_kind }&edu_Flag=Y" />
						<c:set var="O_gubun_view" value="재시험교육신청" />
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<a href="confirmForm.do${ShopUrl }" target="_blank">
					${payment.goods_code_num}
					</a>					
					</td>
					<td>${payment.app_time}</td>
					<td>${payment.app_no}</td>
					<td>${payment.tno}</td>
					<td>${payment.ordr_idxx}</td>
					<td>${O_gubun_view }</td>
					<td>
					<c:choose>
						<c:when test="${payment.code_bran == '0'}">본회</c:when>
						<c:when test="${payment.code_bran == '10' || payment.code_bran == '2'}">서울지부</c:when>
						<c:when test="${payment.code_bran == '20' || payment.code_bran == '3'}">부산지부</c:when>
						<c:when test="${payment.code_bran == '30' || payment.code_bran == '4'}">인천지부</c:when>
						<c:when test="${payment.code_bran == '40' || payment.code_bran == '5'}">경기지부</c:when>
						<c:when test="${payment.code_bran == '50' || payment.code_bran == '6'}">강원지부</c:when>
						<c:when test="${payment.code_bran == '60' || payment.code_bran == '7'}">충북지부</c:when>
						<c:when test="${payment.code_bran == '70' || payment.code_bran == '8'}">대전충남지부</c:when>
						<c:when test="${payment.code_bran == '80' || payment.code_bran == '9'}">전북지부</c:when>
						<c:when test="${payment.code_bran == '90' || payment.code_bran == '10'}">광주전남지부</c:when>
						<c:when test="${payment.code_bran == '100' || payment.code_bran == '11'}">대구경북지부</c:when>
						<c:when test="${payment.code_bran == '110' || payment.code_bran == '12'}">경남지부</c:when>
						<c:when test="${payment.code_bran == '120' || payment.code_bran == '13'}">울산지부</c:when>
						<c:when test="${payment.code_bran == '130' || payment.code_bran == '14'}">제주지부</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
					<td>${payment.card_name}</td>
					<td>${payment.quota}</td>
					<td>${payment.id}(${payment.buyr_name})</td>
					<td>${payment.pers_birth}</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(payment.buyr_tel1) > 13}">
							${fn:substring(payment.buyr_tel1, 0, 12)}
						</c:when>
						<c:otherwise>
							${payment.buyr_tel1}
						</c:otherwise>
					</c:choose>
					</td>
					<td>${payment.buyr_tel2}</td>
					<td>
					<c:choose>
						<c:when test="${payment.order_status== '00' }">
							${payment.res_msg}
						</c:when>
						<c:otherwise>
							승인 -> 취소
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(payment.buyr_mail) > 13}">
							${fn:substring(payment.buyr_mail, 0, 12)}
						</c:when>
						<c:otherwise>
							${payment.buyr_mail}
						</c:otherwise>
					</c:choose>
					</td>
					<td><fmt:formatNumber value="${payment.good_mny}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${payment.round_economent}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${(payment.good_mny-payment.round_economent)}" pattern="#,###.##"/></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
			<ul class="fr">
				<li><a href="javascript:f_excel();" class="btn big t1">엑셀로 다운받기</a></li>
			</ul>
		</div>
			
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>

	</div>
</div>
