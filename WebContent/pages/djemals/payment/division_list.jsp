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

	document.frmdivision.submit();
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

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
		<form name="frmPayment">
		<input type="hidden" name="cPage" id="cPage" value="${listHelper.curPage}"/>
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
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
					<div class="f_wrap mt10">
						<div class="f_field div2">
							<label for="o_gubun" class="ff_title"><strong>결제구분</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w20p" id="o_gubun" name="o_gubun">
										<option value="">모두</option>
										<option value="MEMBER_UP" <c:if test="${param.o_gubun=='MEMBER_UP'}"> selected="selected"</c:if> >회원재가입</option>
										<option value="EDU_STUDY" <c:if test="${param.o_gubun=='EDU_STUDY'}"> selected="selected"</c:if> >홈페이지교육신청</option>
									<%-- <c:if test="${C_CENTER_FLAG == '1' }"> --%>
										<option value="EDU_RETEST" <c:if test="${param.o_gubun=='EDU_RETEST'}"> selected="selected"</c:if> >홈페이지재시험</option>
										<option value="STUDY_REA"  <c:if test="${param.o_gubun=='STUDY_REA'}"> selected="selected"</c:if> >학술대회</option>
										<option value="EDU-REAL"  <c:if test="${param.o_gubun=='EDU-REAL'}"> selected="selected"</c:if> >쇼핑몰-판매품</option>
									<%-- </c:if> --%>
									</select>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="code_bran" class="ff_title"><strong>지회선택</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<select class="select t2 fl w20p" id="code_bran" name="code_bran">
									<c:if test="${C_CENTER_FLAG == '0' }">
										<option value="C_CODE_BRAN?">code_bran_str?</option>
									</c:if>
									<%-- <c:if test="${C_CENTER_FLAG == '1' }"> --%>
										<option value="">모두</option>
										<option value="0"    <c:if test="${param.code_bran=='0'}"> selected="selected"</c:if>  >중앙회</option>
										<option value="10"   <c:if test="${param.code_bran=='10'}"> selected="selected"</c:if>  >서울지부</option>
										<option value="20"   <c:if test="${param.code_bran=='20'}"> selected="selected"</c:if>  >부산지부</option>
										<option value="30"   <c:if test="${param.code_bran=='30'}"> selected="selected"</c:if>  >인천지부</option>
										<option value="40"   <c:if test="${param.code_bran=='40'}"> selected="selected"</c:if>  >경기지부</option>
										<option value="50"   <c:if test="${param.code_bran=='50'}"> selected="selected"</c:if>  >강원지부</option>
										<option value="60"   <c:if test="${param.code_bran=='60'}"> selected="selected"</c:if>  >충북지부</option>
										<option value="70"   <c:if test="${param.code_bran=='70'}"> selected="selected"</c:if>  >대전충남지부</option>
										<option value="80"   <c:if test="${param.code_bran=='80'}"> selected="selected"</c:if>  >전북지부</option>
										<option value="90"   <c:if test="${param.code_bran=='90'}"> selected="selected"</c:if>  >광주전남지부</option>
										<option value="100"  <c:if test="${param.code_bran=='10'}"> selected="selected"</c:if>  >대구경북지부</option>
										<option value="110"  <c:if test="${param.code_bran=='110'}"> selected="selected"</c:if>  >경남지부</option>
										<option value="120"  <c:if test="${param.code_bran=='120'}"> selected="selected"</c:if>  >울산지부</option>
										<option value="130"  <c:if test="${param.code_bran=='130'}"> selected="selected"</c:if>  >제주지부</option>
									<%-- </c:if> --%>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">No</th>
					<th scope="col" class="bold cm">결제구분</th>
					<th scope="col" class="bold cm">해당지부</th>
					<th scope="col" class="bold cm">거래건수</th>
					<th scope="col" class="bold cm">결제금액</th>
					<th scope="col" class="bold cm">수수료</th>
					<th scope="col" class="bold cm">지급예정금액</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="ShopUrl" value="" />
				<c:set var="O_gubun_view" value="" />
				<c:forEach items="${listHelper.list}" var="division">
				<tr>
					<td>${division.num}</td>
					<td>
					<c:choose>
						<c:when test="${division.o_gubun == 'MEMBER'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${division.pers_birth }&buyr_name=${division.buyr_name}&id=${division.id }" />
						<c:set var="O_gubun_view" value="회원가입" />
						</c:when>
						<c:when test="${division.o_gubun == 'MEMBER_UP'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${division.pers_birth }&buyr_name=${division.buyr_name}&id=${division.id }" />
						<c:set var="O_gubun_view" value="회원재가입" />
						</c:when>
						<c:when test="${division.o_gubun == 'EDU-REAL'}">
						<c:set var="ShopUrl" value="?cd=card&goods_code_num=${division.goods_code_num }" />
						<c:set var="O_gubun_view" value="교육 - 판매품" />
						</c:when>
						<c:when test="${division.o_gubun == 'STUDY_REA'}">
						<c:set var="ShopUrl" value="?cd=tech&goods_code_num=${division.goods_code_num }" />
						<c:set var="O_gubun_view" value="학술대회" />
						</c:when>
						<c:when test="${division.o_gubun == 'EDU_STUDY'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${division.goods_code_num }&edu_kind=${division.edu_kind }" />
						<c:set var="O_gubun_view" value="홈페이지교육신청" />
						</c:when>
						<c:when test="${division.o_gubun == 'EDU_RETEST'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${division.goods_code_num }&edu_kind=${division.edu_kind }&edu_Flag=Y" />
						<c:set var="O_gubun_view" value="재시험교육신청" />
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					${O_gubun_view}
					</td>
					<td>
					<c:choose>
						<c:when test="${division.code_bran == '0'}">본회</c:when>
						<c:when test="${division.code_bran == '10' || division.code_bran == '2'}">서울지부</c:when>
						<c:when test="${division.code_bran == '20' || division.code_bran == '3'}">부산지부</c:when>
						<c:when test="${division.code_bran == '30' || division.code_bran == '4'}">인천지부</c:when>
						<c:when test="${division.code_bran == '40' || division.code_bran == '5'}">경기지부</c:when>
						<c:when test="${division.code_bran == '50' || division.code_bran == '6'}">강원지부</c:when>
						<c:when test="${division.code_bran == '60' || division.code_bran == '7'}">충북지부</c:when>
						<c:when test="${division.code_bran == '70' || division.code_bran == '8'}">대전충남지부</c:when>
						<c:when test="${division.code_bran == '80' || division.code_bran == '9'}">전북지부</c:when>
						<c:when test="${division.code_bran == '90' || division.code_bran == '10'}">광주전남지부</c:when>
						<c:when test="${division.code_bran == '100' || division.code_bran == '11'}">대구경북지부</c:when>
						<c:when test="${division.code_bran == '110' || division.code_bran == '12'}">경남지부</c:when>
						<c:when test="${division.code_bran == '120' || division.code_bran == '13'}">울산지부</c:when>
						<c:when test="${division.code_bran == '130' || division.code_bran == '14'}">제주지부</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
					<td>${division.count_M}</td>
					<td><fmt:formatNumber value="${division.good_mny}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${division.round_economent}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${(division.good_mny-division.round_economent)}" pattern="#,###.##"/></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">No</th>
					<th scope="col" class="bold cm">결제구분</th>
					<th scope="col" class="bold cm">해당지부</th>
					<th scope="col" class="bold cm">거래건수</th>
					<th scope="col" class="bold cm">결제금액</th>
					<th scope="col" class="bold cm">수수료</th>
					<th scope="col" class="bold cm">지급예정금액</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="ShopUrl" value="" />
				<c:set var="O_gubun_view" value="" />
				<c:forEach items="${listHelper.list}" var="division2">
				<tr>
					<td>${division2.num}</td>
					<td>
					<c:choose>
						<c:when test="${division2.o_gubun == 'MEMBER'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${division2.pers_birth }&buyr_name=${division2.buyr_name}&id=${division2.id }" />
						<c:set var="O_gubun_view" value="회원가입" />
						</c:when>
						<c:when test="${division2.o_gubun == 'MEMBER_UP'}">
						<c:set var="ShopUrl" value="?cd=member&pers_birth=${division2.pers_birth }&buyr_name=${division2.buyr_name}&id=${division2.id }" />
						<c:set var="O_gubun_view" value="회원재가입" />
						</c:when>
						<c:when test="${division2.o_gubun == 'EDU-REAL'}">
						<c:set var="ShopUrl" value="?cd=card&goods_code_num=${division2.goods_code_num }" />
						<c:set var="O_gubun_view" value="교육 - 판매품" />
						</c:when>
						<c:when test="${division2.o_gubun == 'STUDY_REA'}">
						<c:set var="ShopUrl" value="?cd=tech&goods_code_num=${division2.goods_code_num }" />
						<c:set var="O_gubun_view" value="학술대회" />
						</c:when>
						<c:when test="${division2.o_gubun == 'EDU_STUDY'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${division2.goods_code_num }&edu_kind=${division2.edu_kind }" />
						<c:set var="O_gubun_view" value="홈페이지교육신청" />
						</c:when>
						<c:when test="${division2.o_gubun == 'EDU_RETEST'}">
						<c:set var="ShopUrl" value="?cd=edu&goods_code_num=${division2.goods_code_num }&edu_kind=${division2.edu_kind }&edu_Flag=Y" />
						<c:set var="O_gubun_view" value="재시험교육신청" />
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					${O_gubun_view}
					</td>
					<td>
					<c:choose>
						<c:when test="${division2.code_bran == '0'}">본회</c:when>
						<c:when test="${division2.code_bran == '10' || division2.code_bran == '2'}">서울지부</c:when>
						<c:when test="${division2.code_bran == '20' || division2.code_bran == '3'}">부산지부</c:when>
						<c:when test="${division2.code_bran == '30' || division2.code_bran == '4'}">인천지부</c:when>
						<c:when test="${division2.code_bran == '40' || division2.code_bran == '5'}">경기지부</c:when>
						<c:when test="${division2.code_bran == '50' || division2.code_bran == '6'}">강원지부</c:when>
						<c:when test="${division2.code_bran == '60' || division2.code_bran == '7'}">충북지부</c:when>
						<c:when test="${division2.code_bran == '70' || division2.code_bran == '8'}">대전충남지부</c:when>
						<c:when test="${division2.code_bran == '80' || division2.code_bran == '9'}">전북지부</c:when>
						<c:when test="${division2.code_bran == '90' || division2.code_bran == '10'}">광주전남지부</c:when>
						<c:when test="${division2.code_bran == '100' || division2.code_bran == '11'}">대구경북지부</c:when>
						<c:when test="${division2.code_bran == '110' || division2.code_bran == '12'}">경남지부</c:when>
						<c:when test="${division2.code_bran == '120' || division2.code_bran == '13'}">울산지부</c:when>
						<c:when test="${division2.code_bran == '130' || division2.code_bran == '14'}">제주지부</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
					<td>${division2.count_M}</td>
					<td><fmt:formatNumber value="${division2.good_mny}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${division2.round_economent}" pattern="#,###.##"/></td>
					<td><fmt:formatNumber value="${(division2.good_mny-division2.round_economent)}" pattern="#,###.##"/></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="btn_wrap mt40">
			<ul class="fr">
				<li><a href="#" class="btn big">엑셀로 보기</a></li>
			</ul>
		</div>
			
		</div>

	</div>
</div>
