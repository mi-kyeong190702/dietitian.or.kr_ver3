<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%
String today	= new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>
<script>

$(function(){
	$("#in_paydate").datepicker();
});

function f_send(){
	//return;
	// 현재날짜 
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = Number(date.getMonth() + 1) > 9 ? Number(date.getMonth() + 1) : '0' + Number(date.getMonth() + 1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	var nowDt = yyyy+""+mm+""+dd;
	
	if(nowDt > 20250723){
		alert("환불기간이 지나 환불처리가 불가능합니다.");
		return;
	}
	
	if ($("#name").val() == ""){
		alert("성명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	
	document.frmCancel.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">등</mark>록</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_receipt.do" class="cm">등록</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	   <!-- // Contents Start -->
		<%@include file="inc/receipt.jsp" %>
		
		<% if( yyyyMMdd > 20250723 ) {%>
			<h5 class="title i_b_t6 bold s1" style="font-size:20px;"><mark class="cm">환불 및 등록취소가 불가능합니다.</h5>	
		<%} else {%>	
		
		<div class="area text s1 mb50">
			<h4 class="title bold cm t2 s1 i_b_t2 mt20">학술대회 등록취소</h4><br/><br/>
			<div >
<!-- 				<div style="border: solid 1px #5D5D5D;padding-top:2%;padding-bottom:2%;"> -->
<!-- 					<ul style="padding-left: 10px;"> -->
<!-- 						<li class="text" style="text-align: left;"> -->
<!-- 							우리 협회에서는 코로나19에 따른 국가 방역지침이 8월 16일부터 사회적 거리두기 2단계로 격상됨에 따라<br/> -->
<!-- 							학술대회를 전면 ‘온라인’으로 전환하여 운영합니다.<br/> -->
<!-- 							국가방역지침을 준수하고 모두의 건강과 안전을 위해 부득이하게 온라인으로 진행하게 된 점 넓은 양해를 부탁드리며,<br/> -->
<!-- 							전면 온라인 학술대회 실시에 따른 등록 취소 관련 사항은 별도로 환불을 안내드리고 있사오니,<br/> -->
<!-- 							02-823-5680(교 323, 321)으로 연락주시기 바랍니다.<br/><br/> -->

<!-- 							<font style="color:red;">※ 등록 취소 관련 문의 : 02-823-5680(교 323, 321)</font> -->
<!-- 						</li> -->
<!-- 					</ul>	 -->
<!-- 				</div> -->

				<ul class="text s1 mt10 ml10">
					<li class="text sm mt10"><mark class="bold">1. 사전등록자 중 부득이한 사정으로 등록을 취소할 경우에는 반드시 취소요청서를 제출하여 주시기 바랍니다.</mark></li>
					<li class="text sm mt10"><mark class="bold">2. 제출방법 :</mark> [대한영양사협회 홈페이지(www.dietitian.or.kr)] 접속<mark class="bold"> → </mark>[KDA교육]<mark class="bold"> → </mark>[전국영양사학술대회]<mark class="bold"> → </mark>[등록]<mark class="bold"> → </mark><br>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;[등록취소]<mark class="bold"> → </mark>등록취소요청서 작성 후 [완료]</li>
					<li class="text sm mt10">3. 취소요청서 신청 시 <font style = "bold" color ="red">전화로 신청 불가,</font> 예금주는 <font style = "bold" color ="red">본인명의 계좌로만 환불 가능</font>합니다.</li>
					<li class="text sm mt10">4. 취소요청서 신청 기간에 따른 환불기준(환불 시 천원 미만 절사)
						<div class="area w700 ac">
							<table class="table t3 text small s1 ca center mt20">
								<colgroup>
									<col width="300" />
									<col width="150" />
									<col width="250" />
								</colgroup>
								<thead>
								<tr>
									<th scope="col" class="bold cm">기간</th>
									<th scope="col" class="bold cm">환불기준</th>
									<th scope="col" class="bold cm">예)1차 사전등록 1일 등록시 50,000원</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td scope="row" class="left">7월 17일(목)까지 환불 요청시</td>
									<td>100% 환불</td>
									<td>50,000원</td>
								</tr>
								<tr>
									<td scope="row" class="left">7월 18일(금) ~ 7월 23일(수)까지 환불 요청 시</td>
									<td>50% 환불</td>
									<td>25,000원</td>
								</tr>
								<tr>
									<td scope="row" class="left">7월 24일(목)부터 환불 요청 시</td>
									<td><font color = "red">환불 불가</font></td>
									<td>-</td>
								</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul> 
			</div>						
		</div>
		
	 <form:form name="frmCancel" modelAttribute="meetingDel" method="post" action="./ke_receipt_cancel_action.do">
			<fieldset>
			<legend><span class="ti">사전등록 취소요청서</span></legend>
			<div class="box t2 bgs mt20 p20 text">
					<div class="area">
						<h5 class="title i_b_t6 bold s1"><mark class="cm">등록</mark> 취소요청서</h5>
						<div class="box t1 r5 mt10 p10">
							<div class="form">
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="name" class="ff_title i_b"><strong>성명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="name"  class="input t1 w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="lic_no" class="input t1 fl w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="office_name" class="ff_title i_b"><strong>근무처명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="office_name"  class="input t1 w200"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="tel_hp" class="ff_title i_b"><strong>연락처(핸드폰)</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="tel_hp" class="input t1 w200"/>
												<span class="text ml5 mr10">"-"없이</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid8" class="ff_title i_b"><strong>입금액</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="in_payprice" class="input t1 w100"/> <span class="text ml5 mr10">원</span>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="onlineYn" class="ff_title i_b"><strong>참여방법</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input type='radio' class="mr5" id="onLineN"  name='online_yn' value="N" checked/>
												<label for="offLine" class="mr20">오프라인</label>
												<input type='radio' class="mr5" id="onLineY"  name='online_yn' value="Y" />
												<label for="onLine" class="mr20">온라인</label>			
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid8" class="ff_title i_b"><strong>취소일자</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<input name="del_date01" id="del_date01" type="checkbox" value="1"> 
												<label for="del_date01" class="mr20">2025년 7월 24일(목)</label>
                                        		<input name="del_date02" id="del_date02" type="checkbox" value="1"> 
                                        		<label for="del_date02" class="mr20">2025년 7월 25일(금)</label>
											</div>
										</div>
									</div>
								</div>                               
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid8" class="ff_title i_b"><strong>취소금액</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="del_price" class="input t1 w100"/> <span class="text ml5 mr10">원</span>
											</div>
										</div>
									</div>
								</div>                               
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>환불계좌</strong></div>
										<div class="ff_wrap ml120">
											<ul>
												<li>
													<div class="area">
														<label for="inputid9" class="fl w80 text bold cm">은행명</label>
														<form:input path="bank_name"  class="input t1 fl w150"/>
													</div>
												</li>
												<li class="mt5">
													<div class="area">
														<label for="inputid10" class="fl w80 text bold cm">계좌번호</label>
														<form:input path="bank_num" class="input t1 fl w150"/>
													</div>
												</li>
												<li class="mt5">
													<div class="area">
														<label for="inputid11" class="fl w80 text bold cm">예금주</label>
														<form:input path="bank_username"  class="input t1 fl w150"/>
														<p class="fl text s1 ml10 mr20">( 본인명의  통장만 가능 )</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="inputid2" class="ff_title i_b"><strong>비고</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="lic_no" class="input t1 fl w400" />
											</div>
										</div>
									</div>
								</div> 
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="text ssmall">※ 연락처(핸드폰), 계좌번호 입력시 숫자로만 입력</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
 				<div class="btn_wrap mt30">
					<ul>
						<li><a href="javascript:f_send()" class="btn big t1 wide">완료</a></li>
					</ul>
				</div> 

			</fieldset>
		</form:form> 
	

 		<% } %>	
		<!--  // Contents End -->
	</div>
</div>

