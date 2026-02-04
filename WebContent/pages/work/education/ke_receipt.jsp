<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.util.Date date = calendar.getTime();

String today	= new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>

<script>
	function showMsg() {
		alert("변경신청이 불가합니다.");
		return;	
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
		<!-- <div class="box t2 bgs mt30 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1"><mark class="cm">2022년도 전국영양사학술대회 사전등록은 <font color=red>4월 22일(금)</font>부터 신청 가능합니다.</h5>
		 		</div>
		</div> -->
		
		<%@include file="inc/receipt.jsp" %>
		 <!-- -->
		<div class="area text s1 mb50">
			<h4 class="title bold cm t2 s1 i_b_t2 mt20">학술대회 등록안내</h4><br />							
			<div class="area w720 ac ml20">
				<li class="text sm mt10">
					<li class="text sm mt10"><mark class="bold">■ 오프라인 등록</mark>
					    <ul class="ml10">
						<li class="i_b_t7">행사 종료 후 행사일 포함 3일간 교육내용 다시보기 가능</li>
						<li class="text ml10">※ 일부 프로그램은 다시보기가 제공되지 않습니다.</li>
						</ul>			
					</li>
					<li class="text sm mt10"><mark class="bold">■ 온라인 등록</mark>
					    <ul class="ml10">
						<li class="i_b_t7">온라인으로 오프라인에서 진행되는 교육 프로그램 실시간 시청 가능</li>
						<li class="i_b_t7">행사 종료 후 행사일 포함 3일간 교육내용 다시보기 가능</li>
						<li class="text ml10">※ 일부 프로그램은 실시간 시청 및 다시보기가 제공되지 않습니다.</li>
						</ul>			
					</li>
					<h5 class="title bold t3 s1 i_b_t3 mt40" style="color: white; background-color: #006ab6; width: 100%; height: 30px; padding-top: 10px;">등록비</h5>
					<p class="mt10" style="float:left; text-align: left; width: 50%"><mark class="bold">■ 등록비 안내</mark></p>
					<p class="mt10" style="float:left; text-align: right; width: 50%">(원)</p>
				</li>
				<table class="table t3 text small s1 ca center mt10 mb20">
					<colgroup>
						<col width="15%"/>
						<col width="3%"/>
						<col width="12%"/>
						<col width="12%"/>
						<col width="12%"/>
						<col width="12%"/>
						<col width="12%"/>
						<col width="12%"/>
					</colgroup>
					<thead style="background: #eee;">
						<style>
							.slash{ 
									background : url('http://cdn.zetawiki.com/png/backslash.png'); 
									background-size : 100% 100%; 
									text-align : left; 
								  }
							.slash div { text-align: right; }
						</style>
					<tr>
						<td class="slash bold" rowspan="2" colspan="3" style="padding-left: 20px;"><div class="bold" style="padding-right: 20px;"><mark class="bold">참가일수</mark></div><mark class="bold">구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</mark></td>
						<td colspan="2"><mark class="bold">1차 사전등록</mark><br /><p style="color: red;">(5월 12일 ~ 6월 30일)</p></td>
						<td colspan="2"><mark class="bold">2차 사전등록</mark><br /><p style="color: red;">(7월 1일 ~ 7월 17일)</p></td>
						<td colspan="2"><mark class="bold">사전등록 마감 이후</mark></td>
					</tr>
					<tr>
						<td><mark class="bold">1일 등록</mark></td>
						<td><mark class="bold">2일 등록</mark></td> 
						<td><mark class="bold">1일 등록</mark></td>
						<td><mark class="bold">2일 등록</mark></td>
						<td><mark class="bold">1일 등록</mark></td>
						<td><mark class="bold">2일 등록</mark></td>
					</tr>
					</thead>
					<tr>
						<td rowspan="2" colspan="2" class="bold">영양사,교수,대학원생</td>
						<td>회원</td>
						<td>50,000</td>
						<td>90,000</td>
						<td>70,000</td>
						<td>110,000</td>
						<td>80,000</td>
						<td>130,000</td>
					</tr>
					<tr>
						<td>비회원</td>
						<td>100,000</td>
						<td>180,000</td>
						<td>120,000</td>
						<td>200,000</td> 
						<td>130,000</td>
						<td>220,000</td>
					</tr>
					<tr>
						<td rowspan="2" colspan="2" class="bold">학생<sup>*</sup></td>
						<td>회원</td>
						<td>20,000</td>
						<td>35,000</td>
						<td>25,000</td>
						<td>40,000</td>
						<td>30,000</td>
						<td>45,000</td>
					</tr>
					<tr>
						<td>비회원</td>
						<td>30,000</td>
						<td>50,000</td>
						<td>30,000</td>
						<td>50,000</td>
						<td>35,000</td>
						<td>55,000</td>
					</tr>
				</table>
				<li class="text mt10" style="text-align: left;"><p style="color: blue;">※ 학술대회 오프라인 참석 시 점심식사는 제공되지 않으니 참고하여 주시기 바랍니다.</p></li>
				<tr>
					<td colspan="8">
						<div class="center mt10 mb20" style="height: 160px; border: solid 1px #006ab6;">
							<ul style="padding-left: 10px;">										
								<li class="text mt10" style="text-align: left;"><p style="color: blue;">* 학생</p></li>
								<li class="text mt10" style="text-align: left;">① 학생은 행사 당일 학생증을 반드시 지참하셔야 합니다(학생증 미소지자는 학생으로 처리 불가).</li>
								<li class="text mt5" style="text-align: left;">② 대학원생의 경우 <mark class="bold ca">미취업 full-time 대학원생</mark>에 한하여 <mark class="bold ca">일정 양식에 기재하여 지도교수의 확인을 받아 제출한 경우,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학생회원으로 등록이 가능합니다.</li>												
							</ul>	
						</div>
						
						<ul class="ssmall left ml10">
							<li class="mt10">
								<a href="/assets/ver2/edu/docu/2025/2025_전국영양사학술대회_직무연수_대학원생_신청명단(양식).xlsx" target="_blank" class="btn t2 middle">대학원생 신청서식 다운받기</a>&nbsp &nbsp
								<% if( yyyyMMdd < 20250724 ) { %>
									<a href="https://forms.gle/R8Qty3FzK9HkXH578" target="_blank" class="btn t2 middle">전국영양사학술대회 변경 신청</a><br />
								<% } %>
							</li>
						</ul>
					</td>
				</tr>
			</div>
			
			<!-- 주석 start 2022.04.22 오픈 이전 -->
			<!-- -->
			<h5 class="title bold t3 s1 i_b_t3 mt40" style="color: white; background-color: #006ab6; width: 100%; height: 30px; padding-top: 10px;">사전등록 안내</h5>
				<ul class="text s1 mt10 ml10">
					<li class="text sm mt10"><mark class="bold">■ 사전등록기간</mark>
						<ul class="text small s1 ml10">
							<li class="ml10">- 1차 사전 등록 : 5월 12일(월)~6월 30일(월)까지 신청 및 입금 완료</mark></li>
							<li class="ml10">- 2차 사전 등록 : 7월 1일(화)~7월 17일(목)까지 신청 및 입금 완료</mark></li>
							<li class="ml10">※ 사전등록 기간은 연장되지 않사오니 참고 부탁드립니다.</li>
							<li class="ml10">※ 이후 입금 시 사전등록에 포함되지 않으며, 현장등록으로 처리됩니다.</li>
						</ul>
					</li>
					<li class="text sm mt10"><mark class="bold">■ 사전등록방법</mark>
						<ul class="text small s1 ml10" >
							<li style="display: inline-block;">
								<ul>
									<li style="float:left; margin-right: 10px; margin-left: 50px;"><div class="box bcs bgs w150 bold mt10 mb10 p5 center">참가신청서 작성 및 제출</div></li>
									<li style="float:left; margin-right: 10px; margin-top: 15px;"><mark class="bold"> → </mark></li>
									<li style="float:left; margin-right: 10px;"><div class="box bcs bgs w100 bold mt10 mb10 p5 center">등록비 납부</div></li>
									<li style="float:left; margin-right: 10px; margin-top: 15px;"><mark class="bold"> → </mark></li>
									<li style="float:left; margin-right: 10px;"><div class="box bcs bgs w100 bold mt10 mb10 p5 center">등록확인</div></li>
									<li style="float:left; margin-right: 10px; margin-top: 15px;"><mark class="bold"> → </mark></li>
									<li style="float:left; margin-right: 10px;"><div class="box bcs bgs w100 bold mt10 mb10 p5 center">사전등록 완료</div></li>
								</ul>
							</li>
							<li class="text ml10">※ [대한영양사협회 홈페이지(www.dietitian.or.kr)]<mark class="bold"> → </mark>[KDA교육]<mark class="bold"> → </mark>[전국영양사학술대회]<mark class="bold"> → </mark>[등록]<mark class="bold"> → </mark>[등록신청]<mark class="bold"> →<br>&emsp;&nbsp;</mark>참가신청서 작성 후 [완료]<mark class="bold"> → </mark>등록비 입금</li>
							<li class="text ml10">※ 반드시 참가신청서를 작성·제출하고, 등록비 입금까지 완료해야 사전등록이 완료됩니다.</li>
						</ul>
					</li>
					<li class="text sm mt10"><mark class="bold">■ 등록비 납부 방법</mark>
						<ul class="text small s1 ml10">
							<li class="ml10"><mark class="bold">- 방법1. 무통장 입금</mark>
								<ul>
									<li class="ml20 ac">
										<div class="ac box bcs bgs w500 bold mt10 mb10 p5 center">
										<mark class="bold">입금계좌 : </mark>신한은행 140-006-740632, <mark class="bold">예금주 : </mark>(사)대한영양사협회<br>
										※ 입금 시 <font style="bold" color="red">입금자명, 근무처명 또는 면허번호</font> 기입(예, 김영양서울초, 김영양123)
										</div>
									</li>
								</ul>
							</li>
							<li class="ml10"><mark class="bold">- 방법2. 영양사카드 결제</mark>(대상 : 영양사카드 소지 회원만 가능, 타 카드 결제 불가)</li>
							<li class="ml20">※ 영양사카드로 결제 시 2~3개월 무이자 할부 가능</li>
						</ul>
					</li>
					<li class="text sm mt10"><mark class="bold">■ 사전등록 확인방법</mark>
						<ul class="text small s1 ml10">
							<li class="ml10">
								<ul>
									<li class="ml20 ac">
										<div class="ac box bcs bgs w600 bold mt10 mb10 p5 center">
										<mark class="bold">홈페이지(www.dietitian.or.kr) → KDA교육 → 전국영양사학술대회 → 등록 → 등록확인<br>※ 무통장입금 및 카드결제일로부터 2~3일 이후 확인 가능</mark>
										</div>
									</li>
								</ul>
							</li>
							<li class="ml10"><mark class="bold"><u>※ 참가신청서를 작성하지 않을 경우</u> </mark>‘등록비 납부 및 사전등록 확인’이 불가하므로 반드시 참가신청서 작성 후 송부해주시기 바랍니다.</li>
						</ul>
					</li>
					
					<li class="text sm mt10">■ 2025년 전국영양사학술대회 참가 영수증 및 확인증은 행사 종료(7월 29일(화)) 이후 홈페이지 “전국영양사학술대회” 페이지<br>&emsp;&nbsp;에서 출력 가능합니다.</li>
				</ul>
				
				<h5 class="title bold t3 s1 i_b_t3 mt40" style="color: white; background-color: #006ab6; width: 100%; height: 30px; padding-top: 10px;">문의처</h5>
				<ul class="text s1 mt10 ml10">
					<li class="text sm mt10"><mark class="bold">■ 등록 관련 문의처 : </mark>조직·홍보국 운영지원팀 02)823-5680(내선번호 321, 323)</li>
				</ul>
				<!--  --> 
				<!-- 주석 end -->
				
				 
		</div>
	</div>
</div>


