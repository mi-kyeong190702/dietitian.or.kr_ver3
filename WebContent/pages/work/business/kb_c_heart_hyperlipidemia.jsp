<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">심혈계</mark>질환관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_heart.do" class="cm">심혈계질환관리</a></li>
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
				<%@ include file="inc/heart.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">고지혈</h4><br>
							<h5 class=" title bold t3 i_b_t3 mt40">고지혈증이란</h5>
								<p class="mt10 pl15 cm">고지혈증이란 체내 지질대사에 이상이 생겨 혈중의 지질이 한 가지라도 비정상적으로 높아진 상태를 말한다.</p>
								<p class="mt10 pl15">고지혈증은 고지방 및 고칼로리 식사, 음주, 유전, 간기능 장애, 당뇨 병, 피임약 복용, 갑상선기능 저하, 신증후군 등이 원인이며, 
								이러한 상태가 오래 지속되면 동맥경화, 심혈관계 질환 등의 성인병이 유발될 수 있으므로 지속적인 식사조절과 규칙적인 운동을 통한 철저한 관리가 필요하다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">진단기준</h5>
								<div class="w700 ac mt20">
									<table class="table t2 text small s1 ca center">
										<colgroup>
											<col width="350">
											<col width="350">
										</colgroup>
										<tbody>
										<tr>
											<td scope="row" class="bgs_2 bold">고콜레스테롤혈증<br>경계치<br>정상</td>
											<td>≥240mg/dl<br> 200~239mg/dl<br>200mg/dl</td>
										</tr>
										
										<tr>
											<td scope="row" class="bgs_2 bold">매우 높은 LDL 콜레스테롤혈증<br>고 LDL 콜레스테롤혈증<br>경계치<br>정상<br>적정</td>
											<td>≥190mg/dl<br>160~189mg/dl<br>130~159mg/dl<br>100~129mg/dl<br>100mg/dl </td>
										</tr>
										
										<tr>
											<td scope="row" class="bgs_2 bold">저 HDL 콜레스테롤혈증<br>고 HDL콜레스테롤혈증</td>
											<td>&lt; 40mg/dl <br>≥60mg/dl</td>
										</tr>
										
										<tr>
											<td scope="row" class="bgs_2 bold">고중성지방혈증<br>경계치<br>정상</td>
											<td>≥200mg/dl<br>150~199mg/dl<br> 150mg/dl</td>
										</tr>
										
										</tbody>
									</table>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">고지혈증 식사요법</h5>
								<div class="w700 ac mt20">
									<table class="table t2 text small s1  center">
										<colgroup>
											<col width="350">
											<col width="350">
										</colgroup>
										<thead>
										<tr>
											<th scope="col" class="bold cm">고콜레스테롤혈증시 식사요법</th>
											<th scope="col" class="bold cm">고중성지방혈증시 식사요법</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td class="left top">
												<ul>
													<li class="i_b_t7">총 열 량 : 정상체중을 유지할 수 있는 범위 → 과체중이거나 비만시 체중조절</li>
													<li class="i_b_t7">총지방량 : 총열량의 15～20% <br>포화지방산 총열량의 6% 미만 <br>다가불포화지방산 총열량의 6% 내외 <br>단일불포화지방산 총열량의 10% 이하</li>
													<li class="i_b_t7">당 질 : 총열량의 60～65%</li>
													<li class="i_b_t7">단 백 질 : 총열량의 15～20%</li>
													<li class="i_b_t7">콜레스테롤 : 100㎎/1000㎉ (200mg/day)</li>
												</ul>
											</td>
											<td class="left top">
												<ul>
													<li class="i_b_t7">총 열 량 : 정상체중을 유지할 수 있는 범위(25～30㎉/㎏) → 필요시 체중조절</li>
													<li class="i_b_t7">총지방량 : 총열량의 20～25%</li>
													<li class="i_b_t7">당 질 : 총열량의 50～55%(알코올 제한)</li>
												</ul>
											</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">(심혈관 질환의 영양 치료 지침 권고안 2009, 한국인의 고지혈증 치료지침 2003)</span>
								</div>
					</div>
			</c:otherwise>
    	</c:choose>		
					
	</div>
</div>
