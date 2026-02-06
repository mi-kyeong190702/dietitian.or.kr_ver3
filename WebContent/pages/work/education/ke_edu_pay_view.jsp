<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>		
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>

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
							<li><a href="./ke_situation.do" class="cm">교육과정 신청</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
				<!-- // Contents start -->
				<c:if test="${operator.code_pay_flag == '10' }">
				<h5 class="title i_b_t6 s1 mt30">무통장 입금을 선택 하셨습니다. 교육비 입금 정보는 아래와 같습니다.</h5>
				</c:if>
				
				<div class="area">
					<table class="table t1 text s1 ssmall ca center mt10">
						<colgroup>
							<col width="200">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<td scope="row" class="bold cm bgs">교육명</td>
							<td colspan="2" class="left">${operator.edutest_name}</td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs">결제방법</td>
							<td colspan="2" class="left">${operator.payname}</td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs">은행명</td>
							<td scope="row" class="left">${operator.test_bank_name}</td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs">계좌번호</td>
							<td scope="row" class="left">${operator.test_bank_acc}</td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs">예금주</td>
							<td colspan="3" class="left">${operator.test_bank_acc_owner}</td>
						</tr>
						<tr>
							<td scope="row" class="bold cm bgs">문의처</td>
							<td colspan="2" class="left">Tel. 02-823-5680(내선513,514)</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="text ssmall mt20"><p>교육과정 신청이 완료되었습니다. <br />교육과정 신청 확인 및 취소는 <mark class="bold cm">KDA 교육 &gt; 교육과정 신청 &gt; 교육과정 신청 현황</mark>에서 하실 수 있습니다.</p></div>
				<div class="btn_wrap mt30">
					<ul>
						<li><a href="./ke_situation.do" class="btn big t1 wide">확인</a></li>
					</ul>
				</div>

				<!-- // Contents end -->
				</div>
			</div>