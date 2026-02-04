<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.util.Date date = calendar.getTime();

String today	= new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>
			
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">초록</mark>접수</h3>
					</div> 
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
							<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
							<li><a href="/work/education/ke_green.do" class="cm">초록접수</a></li>
						</ul>
					</div> 
				</div>
				<hr />
				  
				<div class="sp_body">
					<!-- <div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p><mark class="bold cm">내용 업데이트 중입니다.</mark></p>		
						</div>
					</div> -->
				   
					<div class="tab t2 div3 mb30">
						<ul>
							<!-- 2024.04.12  게시  -->
							<% if( yyyyMMdd >= 20250626 ) { %>
								<!-- 마감  -->
								<li><a href="./ke_green.do" class="on">접수안내</a></li>
								<li><a href="">온라인접수</a></li>
								<li><a href="./ke_green_verification.do">접수확인 및 심사결과</a></li>
							<% } else {%>
								<!-- 접수시작  -->
								<li><a href="./ke_green.do" class="on">접수안내</a></li>
								<li><a href="./ke_green_online.do">온라인접수</a></li>
								<li><a href="./ke_green_verification.do">접수확인 및 심사결과</a></li>
							<% } %>
							
							<!-- 
								온라인접수 시작/종료 처리시 3군데 수정
								ke_green_online.jsp
								ke_green_verification.jsp
								ke_green.jsp
							 -->
							
						</ul>
					</div>
					
					<% if( yyyyMMdd >= 20250626 ) { %>
						<h4 class="title bold t2 cm s1 mt50"><font style="bold" color="red">온라인 접수 마감되었습니다.</font></h4><br>
					<% } %>
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">2025년도 논문초록 접수 안내<mark class="cb">(Poster Presentation)</mark></h4>
					<div class="center mt10 mb20" style="height: 90px; border: solid 1px #006ab6;">
						<ul style="padding-left: 10px;">
							<!-- <li class="text" style="text-align: left;"><mark class="title bold t2 cm s1 mt10">논문초록 진행 절차</mark></li> -->
							<li class="text mt20" style="text-align: left;">논문초록 온라인 접수<mark class="bold"> → </mark>심사<mark class="bold"> → </mark>결과 통보<mark class="bold"> → </mark>개별 자료 준비(포스터 전시 또는 구연발표 자료)<mark class="bold"> → </mark><br>전국영양사학술대회 직무연수 시 포스터 전시 및 구연발표<mark class="bold"> → </mark>전국영양사학술대회 직무연수 시 시상</li>
						</ul>	
					</div>
					<div class="area text s1">
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 신청대상 : </mark> 대한영양사협회 회원*으로 2025년도 전국영양사학술대회 등록자**</li>
							<li class="text sm mt5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* 신청 및 제출은 협회 회원만 가능하나, 공동저자 중 비회원이 있어도 신청 가능합니다.</li>
							<li class="text sm mt5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;** 공동저자 중 최소 1인 이상은 학술대회 사전등록 후 신청 및 제출해야 합니다.</li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 발표형식 : </mark> 포스터 전시＊ 또는 구연발표**</li>
							<li class="text mt10 ml20"><mark class="bold">○ 논문초록 심사 결과 채택된 대상자 : 포스터 전시</mark></li>
							<li class="text mt10 ml20"><mark class="bold">○ 논문초록 심사 결과 선정된 우수상 수상자(10편) : 포스터 전시 + 구연발표</mark></li>
							<li class="text sm mt5">&emsp;&emsp;&emsp;* 학술대회 양일간 모두 전시(7월 24일(목) ~ 7월 25일(금))</li>
							<li class="text sm mt5">&emsp;&emsp;&emsp;** 학술대회 2일차에 진행 예정(7월 25일(금))</li>
							<li class="text mt10 ml20"><font color="blue">※ 자세한 내용은 “발표자료 제작방법”을 참고해주시기 바랍니다.</font></li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 발표내용 : </mark> 학술대회 시 발표되지 않은 영양사의 업무와 관련된 내용</li>
							<li class="text mt10 ml20">
								<div class="area mt5">
									<table class="table t3 text ssmall ca center mb10">
										<colgroup>
											<col width="*">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="left">&emsp;<mark class="title bold t3 s1 "><발표분야></mark><mark class="text sm mt10"><br>&emsp;급식경영/단체급식, 영양교육, 임상영양, 식품위생, 식품학/식품과학, 식품조리, 지역사회영양(영양조사/식습관),<br>&emsp;식생활 관리, 생애주기영양학, 기타 중 택1</mark></th>
												
											</tr>
										</thead>
									</table>
								</div>
							</li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 접수기한(연장) : </mark><font style="bold" color="blue"> <u>2025년 6월 25일(수)까지</u></font></li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 제출방법 : </mark> 홈페이지(www.dietitian.or.kr)<mark class="bold"> → </mark>KDA교육<mark class="bold"> → </mark>전국영양사학술대회<mark class="bold"> → </mark>초록접수<mark class="bold"> → </mark></br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;온라인접수(E-mail, 우편 접수 불가)</li>
							<li class="text ml20"><font color="blue">※ 논문초록 접수마감일까지 수정 및 취소 가능합니다.</font></li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text mt10"><mark class="title bold t3 s1 ">■ 논문초록 작성방법 : 반드시 첨부파일 양식으로 작성하여 제출<a href="/assets/ver2/edu/docu/2025/논문초록_작성예시.hwp" class="ml10 btn t3">논문초록 작성예시.hwp</a></mark> </li>
							<li class="text mt10 ml20"><mark class="bold">- 분량</mark>  : A4용지 1페이지</li>
							<li class="text ml20"><mark class="bold">- 용지종류(mm)</mark> : 사용자정의 - 폭 188.0, 길이 257.0</li>
							<li class="text ml20"><mark class="bold">- 여백(mm)</mark> : 위쪽 16, 아래쪽17.5, 머리말 13, 꼬리말 3, 왼쪽 17.5, 오른쪽 17.5</li>
							<li class="text ml20"><mark class="bold">- 글자모양</mark></li>
							<li class="text ml20">&emsp;① 제목 – 맑은 고딕(진하게), 12point, 장평100%</li>
							<li class="text ml20">&emsp;② 저자 – 맑은 고딕(진하게), 10point, 장평100%</li>
							<li class="text ml20">&emsp;③ 내용 – 맑은 고딕, 10point, 장평100%</li>
							<li class=" ml20"><mark class="bold">- 줄간격</mark> : 150%
							<li class=" ml20"><mark class="bold">- 구성</mark></li>
							<li class="text ml20">&emsp;① 구성 순서 - 제목, 저자 및 소속, 내용</li>
							<li class="text ml20">&emsp;② 내용 작성방법 - 연구목적, 방법, 결과, 결론을 각 한 문단으로 표나 그림을 사용하지  않고 작성</li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text mt10"><mark class="title bold t3 s1">■ 심사 결과통보 : <u>2025년 7월 중</u></mark></li>
							<li class="text ml20">※ 심사결과는 대한영양사협회 홈페이지 공지사항 및 신청자 개별 안내할 예정입니다.</li>
							<li class="text ml20">※ 제출된 논문초록(Poster)은 우리 협회 논문심사위원회의 심사를 거쳐 선정됩니다.</li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 시상내역 : </mark> 우수상 총 10편, 편당 소정의 상금 및 상장</li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text sm mt10"><mark class="title bold t3 s1 ">■ 심사 결과 채택된 논문초록은 전국영양사학술대회 직무연수 온라인 플랫폼에 탑재될 예정입니다.</mark></li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text mt10"><mark class="title bold t3 s1">■ 발표자료 제작방법</mark></li>
							<li class="text mt10 ml20"><mark class="bold">○ 논문초록 심사 결과 채택된 대상자 : 포스터 전시</mark></li>
							<li class="text mt10 ml20">
								<div class="area mt5">
									<table class="table t3 text ssmall ca center mb10">
										<colgroup>
											<col width="*">
											<col width="310">
											<col width="310">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="bold cb"></th>
												<th colspan="2" scope="col" class="bold cb">오프라인 전시용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td scope="row" class="bold bgf7">제작형식</td>
												<td colspan="2" class="left">포스터 (제작 후 전국영양사학술대회 직무연수 행사장 내 전시)</td>
											</tr>
											<tr>
												<td scope="row" class="bold bgf7">제작규격</td>
												<td colspan="2" class="left">90cm(가로) X 140cm(세로) 이내</td>
											</tr>
											<tr>
												<td scope="row" class="bold bgf7">내용구성</td>
												<td colspan="2" class="left">포스터 맨 위에 제목, 저자 및 소속을 작성하고, 서론, 연구목적, 방법, 결과, 요약, 결론의 순으로 제작 (양식 자유)</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
							
							<li class="text mt10 ml20"><mark class="bold">○ 논문초록 심사 결과 선정된 우수상 수상자(10편) : 포스터 전시 + 구연발표</mark></li>
							<li class="text mt10 ml20">
								<div class="area mt5">
									<table class="table t3 text ssmall ca center mb10">
										<colgroup>
											<col width="*">
											<col width="310">
											<col width="310">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="bold cb"></th>
												<th scope="col" class="bold cb">오프라인 전시용</th>
												<th scope="col" class="bold cb">오프라인 구연발표용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td scope="row" class="bold bgf7">제작형식</td>
												<td class="left">포스터<br>(제작 후 전국영양사학술대회 직무연수 행사장 내 전시)</td>
												<td class="left">PPT 파일<br>(전국영양사학술대회 직무연수 시 행사장 내 구연발표)</td>
											</tr>
											<tr>
												<td scope="row" class="bold bgf7">제작규격</td>
												<td class="left">90cm(가로) X 140cm(세로) 이내</td>
												<td class="left">· 규격 : PPT 와이드스크린 사이즈(16:9)<br>· 분량 : 15매 내외, 5분 이내 발표</td>
											</tr>
											<tr>
												<td scope="row" class="bold bgf7">내용구성</td>
												<td class="left">포스터 맨 위에 제목, 저자 및 소속을 작성하고, 서론, 연구목적, 방법, 결과, 요약, 결론의 순으로 제작 (양식 자유)</td>
												<td class="left">첫 페이지 표지에 제목, 저자 및 소속을 포함하고, 내용의 순(연구목적, 방법, 결과, 결론)으로 표나 그림을 사용하여 작성</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
							<li class="text ml20"><font color="blue">※ 구연발표는 전국영양사학술대회 직무연수 행사장에서 진행됩니다.</font></li>
						</ul>
						
						<ul class="mt30 ml10">
							<li class="text mt10"><mark class="title bold t3 s1">■ 문의처 : 대한영양사협회 교육국 kdabook@kdiet.or.kr</mark></li>
						</ul>
					</div>
				</div>
			</div>
