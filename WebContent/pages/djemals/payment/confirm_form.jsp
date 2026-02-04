<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_list(id){
	
	var param="";
	
	if($("#curPage").val() != "") param +="?curPage="+$("#curPage").val();
	if($("#startm").val() != "") param +="&startm="+$("#startm").val();
	if($("#endm").val() != "") param +="&endm="+$("#endm").val();
	if($("#buyr_name").val() != "") param +="&buyr_name="+$("#buyr_name").val();
	if($("#o_gubun").val() != "") param +="&o_gubun="+$("#o_gubun").val();
	if($("#code_bran").val() != "") param +="&code_bran="+$("#code_bran").val();
	if($("#order_status").val() != "") param +="&order_status="+$("#order_status").val();
	if($("#good_name").val() != "") param +="&good_name="+$("#good_name").val();
	if($("#ordr_idxx").val() != "") param +="&ordr_idxx="+$("#ordr_idxx").val();
	if($("#tno").val() != "") param +="&tno="+$("#tno").val();
	if($("#good_mny").val() != "" && $("#good_mny").val() != 0) param +="&good_mny="+$("#good_mny").val();
	if($("#app_no").val() != "") param +="&app_no="+$("#app_no").val();
	if($("#pers_birth").val() != "") param +="&pers_birth="+$("#pers_birth").val();
	
	location.href="confirmList.do"+param;
}

function f_action(id){
	if( confirm("선택한 정보를 승인 취소 하겠습니까?") ) {
		
		window.open("","confirmpop","width=740,height=740, scrollbars=yes, resizable=yes");
		
		var f = document.forms["frmPayment"];	
		
		$("#o_cd").val(id);
		
		f.method = "POST";
		f.target="confirmpop";
		f.action="confirmPop.do";
		f.submit();
	}
}
</script>
<form name="frmPayment">
<input type="hidden" id="startm" value="${srch.startm }"/>
<input type="hidden" id="endm" value="${srch.endm }"/>
<input type="hidden" id="buyr_name" value="${srch.buyr_name }"/>
<input type="hidden" id="o_gubun" value="${srch.o_gubun }"/>
<input type="hidden" id="code_bran" value="${srch.code_bran }"/>
<input type="hidden" id="order_status" value="${srch.order_status }"/>
<input type="hidden" id="good_name" value="${srch.good_name }"/>
<input type="hidden" id="ordr_idxx" value="${srch.ordr_idxx }"/>
<input type="hidden" id="tno" value="${srch.tno }"/>
<input type="hidden" id="good_mny" value="${srch.good_mny }"/>
<input type="hidden" id="app_no" value="${srch.app_no }"/>
<input type="hidden" id="pers_birth" value="${srch.pers_birth }"/>
<input type="hidden" id="curPage" value="${srch.curPage }"/>
<input type="hidden" id="o_cd" name="o_cd" value=""/>
</form>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="400">
					<col width="150">
					<col width="400">
				</colgroup>
				<thead>
				<tr>
					<th colspan="4"scope="col" class="bold cm">조회 결과</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">결제상태</td>
					<td class="left">
					<c:choose>
						<c:when test="${view.order_status == '00' }">
						승인
						</c:when>
						<c:otherwise>
						취소
						</c:otherwise>
					</c:choose>
					</td>
					<td class="bold">변경관련</td>
					<td class="left link">
					<c:choose>
						<c:when test="${view.order_status == '00' }">
						<a href="javascript:f_action(${view.o_code });">[DB-결제취소]</a>
						</c:when>
						<c:otherwise>
						[승인->취소]
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">상품명</td>
					<td class="left">${view.good_name }</td>
					<td class="bold">승인일자</td>
					<td class="left">${view.app_time}</td>
				</tr>
				<tr>
					<td class="bold">kcp 거래번호</td>
					<td class="left">${view.tno}</td>
					<td class="bold">결제구분</td>
					<td class="left">
					<c:choose>
						<c:when test="${view.o_gubun == 'MEMBER'}">
						회원가입>
						</c:when>
						<c:when test="${view.o_gubun == 'MEMBER_UP'}">
						회원재가입
						</c:when>
						<c:when test="${view.o_gubun == 'EDU-REAL'}">
						교육 - 판매품
						</c:when>
						<c:when test="${view.o_gubun == 'STUDY_REA'}">
						학술대회
						</c:when>
						<c:when test="${view.o_gubun == 'EDU_STUDY'}">
						홈페이지교육신청
						</c:when>
						<c:when test="${view.o_gubun == 'EDU_RETEST'}">
						재시험교육신청
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">카드계열</td>
					<td class="left">${view.card_name}</td>
					<td class="bold">아이디(성명)</td>
					<td class="left">${view.id}(${view.buyr_name})</td>
				</tr>
				<tr>
					<td class="bold">전화번호</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(view.buyr_tel1) > 13}">
							${fn:substring(view.buyr_tel1, 0, 12)}
						</c:when>
						<c:otherwise>
							${view.buyr_tel1}
						</c:otherwise>
					</c:choose>
					</td>
					<td class="bold">결과메세지</td>
					<td class="left">${view.res_msg}</td>
				</tr>
				<tr>
					<td class="bold">결제금액</td>
					<td class="left"><fmt:formatNumber value="${view.good_mny}" pattern="#,###.##"/></td>
					<td class="bold">지급예정금액</td>
					<td class="left"><fmt:formatNumber value="${(view.good_mny-view.round_economent)}" pattern="#,###.##"/></td>
				</tr>
				<tr>
					<td class="bold">연관고유번호</td>
					<td class="left">${view.goods_code_num}</td>
					<td class="bold">승인번호</td>
					<td class="left">${view.app_no}</td>
				</tr>
				<tr>
					<td class="bold">주문번호</td>
					<td class="left">${view.ordr_idxx}</td>
					<td class="bold">지회구분</td>
					<td class="left">
					<c:choose>
						<c:when test="${view.code_bran == '0'}">본회</c:when>
						<c:when test="${view.code_bran == '10' || view.code_bran == '2'}">서울지부</c:when>
						<c:when test="${view.code_bran == '20' || view.code_bran == '3'}">부산지부</c:when>
						<c:when test="${view.code_bran == '30' || view.code_bran == '4'}">인천지부</c:when>
						<c:when test="${view.code_bran == '40' || view.code_bran == '5'}">경기지부</c:when>
						<c:when test="${view.code_bran == '50' || view.code_bran == '6'}">강원지부</c:when>
						<c:when test="${view.code_bran == '60' || view.code_bran == '7'}">충북지부</c:when>
						<c:when test="${view.code_bran == '70' || view.code_bran == '8'}">대전충남지부</c:when>
						<c:when test="${view.code_bran == '80' || view.code_bran == '9'}">전북지부</c:when>
						<c:when test="${view.code_bran == '90' || view.code_bran == '10'}">광주전남지부</c:when>
						<c:when test="${view.code_bran == '100' || view.code_bran == '11'}">대구경북지부</c:when>
						<c:when test="${view.code_bran == '110' || view.code_bran == '12'}">경남지부</c:when>
						<c:when test="${view.code_bran == '120' || view.code_bran == '13'}">울산지부</c:when>
						<c:when test="${view.code_bran == '130' || view.code_bran == '14'}">제주지부</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td class="bold">할부구분</td>
					<td class="left">${view.quota }</td>
					<td class="bold">생년월일</td>
					<td class="left">${view.pers_birth }</td>
				</tr>
				<tr>
					<td class="bold">핸드폰</td>
					<td class="left">${view.buyr_tel2 }</td>
					<td class="bold">이메일</td>
					<td class="left">
					<c:choose>
						<c:when test="${fn:length(view.buyr_mail) > 13}">
							${fn:substring(view.buyr_mail, 0, 12)}
						</c:when>
						<c:otherwise>
							${view.buyr_mail }
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				</tbody>
			</table>

			<div class="btn_wrap mt40">
				<ul class="fr">
					<li><a href="javascript:f_action(${view.o_code });" class="btn big t1">승인취소</a></li>
					<li><a href="javascript:f_list();" class="btn big">목록</a></li>
				</ul>
			</div>
			

		</div>
	</div>
</div>
