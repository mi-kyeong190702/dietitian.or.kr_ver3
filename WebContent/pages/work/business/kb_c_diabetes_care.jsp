<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="h900 w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<%@ include file="inc/diabetes.jsp" %>
			
				<div class="text s1 mb50">
					<h4 class="title bold cm t2 i_b_t2 mt50">당뇨의 관리</h4><br>
					<p class="middle mt20"><mark class="cm">당뇨병의 관리방법으로는 식사요법, 약물요법, 운동요법이 있으며, 각 개인의 증세에 따라 적절한 방법은 주치의와 상의하여 결정해야 한다.</mark><br>
						이중 식사요법은 당뇨관리의 가장 기본적이고 중요한 치료법으로 운동요법이나 약물요법을 하는 경우라도 꼭 병행해서 실시해야 한다. 
					</p>
						<h5 class=" title bold t3 i_b_t3 mt40">정상 혈당치의 유지</h5>
							<p class="mt10 pl15">우선 식사, 운동, 인슐린, 약물 등과 혈당과의 관계를 알고 환자 자신이 요당이나 혈당을 측정해 보아서 자신의 몸 상태를 판정할 수 있어야 올바른 치료를 할 수 있다.</p>
								<div class="w700 ac mt20">
									<table class="table t3 text ssmall s1 ca center">
										<colgroup>
											<col width="100">
											<col width="100">
											<col width="100">
											<col width="100">
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">생화학적 지표</th>
											<th scope="col" class="bold cm">정상</th>
											<th scope="col" class="bold cm">목표</th>
											<th scope="col" class="bold cm">조절이 필요한 경우</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td scope="row" class="bgf7">공복/식전 혈당</td>
											<td>&lt; 110mg/㎗</td>
											<td>80∼120mg/㎗</td>
											<td>&lt; 80 또는 &gt; 140mg/㎗</td>
										</tr>
										<tr>
											<td scope="row" class="bgf7">취침 전 혈당</td>
											<td>&lt; 120mg/㎗</td>
											<td>100∼140mg/㎗</td>
											<td>&lt; 100 또는 &gt; 160mg/㎗ </td>
										</tr>
										<tr>
											<td scope="row" class="bgf7">당화혈색소(HbA1c)</td>
											<td>&lt; 6%</td>
											<td>&lt; 7%</td>
											<td>&gt; 8%</td>
										</tr>
										</tbody>
									</table>
								<span class="ssmall ca">(출처: Sandes P, et al. The Handbook of Medical Nutrition Therapy, Helm Seminurs &amp; Publishing,4:22, 1996)</span>
								</div>
						<h5 class=" title bold t3 i_b_t3 mt40">표준체중의 유지</h5>
							<p class="mt10 pl15">인슐린 비의존성 당뇨병에서는 흔히 표준체중이 유지되지 않아 효과적인 혈당조절에 실패하기 쉬우므로 자신의 표준체중을 계산해 보고 표준체중을 유지해야 된다.</p>
						<h5 class=" title bold t3 i_b_t3 mt40">혈중 정상지질(중성지방, 콜레스테롤) 및 정상혈압의 유지</h5>
							<p class="mt10 pl15">최근에는 제 2형 당뇨병환자에게서 고지질혈증, 고혈압 등이 같이 생기기 쉬우므로 고지질혈증을 예방하기 위해 정상지질(중성지방, 콜레스테롤)의 유지가 매우 중요하다. 
								또한 고혈압은 심장의 합병증을 악화시키기 쉬우므로 잘 조절해야 한다.
							</p>
							<div>
								<ul class="box bgs w300 ssmall p20 mt20 ml20">
									<li>혈중 콜레스테롤치 : 200mg/㎗ 이하</li>
									<li>L㎗ -콜레스테롤치 : 130mg/㎗ 이하</li>
									<li>H㎗ -콜레스테롤치 : 35mg/㎗ 이상</li>
									<li>중성지방 : 150mg/㎗ 이하</li>
									<li>혈압 : 130/85mmHg 이하</li>
								</ul>
							<span class="ssmall ca ml20">(출처: 당뇨병교육지침서 제1판, 대한당뇨병학회, 1999)</span>
							</div>
				</div>
			</c:otherwise>
	    </c:choose>			
						
	</div>
</div>
