<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">입금</mark>방법</h3>
		</div>
		<div class="sp_navi">
	<!-- // Contents Start -->
		<ul>
			<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
			<li><a href="/member/km_join.do" >회원가입</a></li>
            <li><a href="/member/km_condition.do" >회원가입안내</a></li>
			<li><a href="/member/km_deposit_manner.do" class="cm">입금방법</a></li>
		</ul>
	</div>
	</div>
	<hr />
	<div class="sp_body">
		<h4 class="title bold t2 cm s1 i_b_t2 mt50">입금방법</h4>
		<div class="area">
			<ul class="mb50">
				<li>
					<h5 class="title bold t3 s1 i_b_t3 mt50">연회비</h5><br />
					<ul class="text s1 mt10 ">
						<li class="i_box_t1">CMS 출금이체 신청서 <a href="https://tnbsoft.co.kr/cert/client/application/user/dietitian" alt="새창으로 이동"><span class="small cm">(바로가기)</span></a> →
							회원이 신청한 은행 계좌에서 정해진 날짜에 협회 회비 자동이체 인출<br />
							<span class="small">※ 단, 학생회원, 미취업회원은 일시납만 가능</span>
						</li>
						<li class="i_box_t1 mt5">무통장 입금(인터넷뱅킹, 텔레뱅킹, 계좌이체포함) : 소속 시도영양사회로 계좌로 입금</li>
						<li class="i_box_t1 mt5">지로 입금
							<ul class="text small s1 mt5 ">
								<li class="i_b_t7">금융결제원에서 지로를 통한 입금을 받지 않으려는 추세이므로 가능한 무통장 입금(인터넷뱅킹, 텔레뱅킹, 계좌이체포함) 요망</li>
								<li class="i_b_t7">특히 입금 확인 후 회원 인증시까지 최소 2주정도가 소요됨.</li>
								<li class="i_b_t7">지로용지 : 시중은행 99번 창구에 비치 또는 신청(→ kdacenter@kdiet.or.kr로 수령)</li>
								<li class="i_b_t7">지로번호 : 7605071</li>
								<li class="i_b_t7">인터넷지로 납부 : <a href="www.giro.or.kr" alt="새창으로 이동">www.giro.or.kr</a> 접속 → 요청 절차에 따라 지로 납부
									<a href="javascript:showPopup();" class="btn t2 small ml5">지로용지 신청</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li><h5 class="title bold t3 s1 i_b_t3 mt30">평생회비 </h5><br />
					<ul class="text s1 mt10 ">
						<li class="i_box_t1">납부방법 : 중앙회(평생회비) 계좌로 입금 후 담당자에게 연락 (02-823-5680, 교 311∙312)<br />
						  &emsp;&emsp;&emsp;&emsp;&ensp;당해년도 11월까지 3회 분납 가능 (1차분은 총 평생회비의 1/3 이상 입금)
						</li>
					</ul>
				</li>
			</ul>

			<!-- // Contents End -->

		</div>
	</div>
</div>

<c:import url="/pages/member/inc/deposit_form.jsp">
	<c:param name="kind" value="1"></c:param>
</c:import>	
