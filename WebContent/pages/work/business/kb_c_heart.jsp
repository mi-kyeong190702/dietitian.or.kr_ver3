<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">심혈관계</mark>질환관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_heart.do" class="cm">심혈관계질환관리</a></li>
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
					<h4 class="title bold cm t2 i_b_t2 mt50">콜레스테롤과 지방</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">콜레스테롤이란?</h5>
							<p class="mt10 pl15"><mark class="cm">콜레스테롤이란 담즙산, 호르몬, 비타민 D를 합성하는데 쓰이는 지방의 일종이다.</mark> 
							콜레스테롤은 식사에서 뿐만 아니라 간에서도 만들어지며 우리 몸은 일정한 콜레스테롤 수준이 유지되도록 조절된다. 
							그러나 너무 많이 섭취하면 심혈관계 질환의 위험이 높아지므로, 비만이거나 심혈관질환이 있는 경우에는 콜레스테롤이 많은 식품을 자주 섭취하지 말아야 한다. 
							</p>
							<p class="mt10 pl15">콜레스테롤은 식물성 식품에는 없고, 동물성 식품에만 있으며 특히 간 및 내장고기, 달걀노른자, 오징어, 생선알, 굴, 새우 등에 많다.</p>
							<ul class="mt10 pl15">
								<li class="i_box_t1"><mark class="bold">식이 콜레스테롤과 혈액내 콜레스테롤과의 관계는?</mark> 
									지방이 포함된 모든 음식에는 스테롤이라는 성분이 있는데 특히 우리가 섭취하는 동물성지방 식품에 있는 것을 식이 콜레스테롤이라 한다. 이러한 식이 콜레스테롤을 다량 섭취하면 혈액 내 콜레스테롤치를 높인다
								</li>
								<li class="i_box_t1 mt10"><mark class="bold">식이콜레스테롤을 가지고 있으나 우리 몸에 좋은 기름을 가지고 있는 식품은?</mark> 
									생선류. 특히 꽁치, 고등어, 참치, 삼치, 정어리 등 등푸른 생선류
								</li>
								<li class="i_box_t1 mt10"><mark class="bold">식이콜레스테롤은 어느 정도 섭취해야 하나?</mark> 
									1일 콜레스테롤 섭취는 200mg 이하로 제한하는 것이 좋으며, 이를 위해서는 콜레스테롤이 다량 함유된 식품의 섭취를 줄이도록 한다. 
								</li>
								<li class="i_box_t1 mt10"><mark class="bold">식이콜레스테롤을 200mg 이하로 섭취하려면?</mark> 
									<ul class="small ">
										<li class="i_b_t7">콜레스테롤이 많이 함유된 식품은 주 2회 이하로 소량만 섭취한다.</li>
										<li class="i_b_t7">우유는 저지방 우유나 탈지우유로 섭취한다.</li>
										<li class="i_b_t7">콜레스테롤이 많이 함유된 식품은 1주일에 2-3회 정도 제한하여 섭취한다.</li>
									</ul>
								</li>
								<li class="i_box_t1 mt10"><mark class="bold">식이콜레스테롤을 200mg 이하로 섭취하려면?</mark> 
									<span class="small ">매끼 식사에서 주식은 곡류로 하고 국과 찬류는 콜레스테롤이 없는 식품 중에서 2가지 이상을 골고루 섭취하고, 하루에 1회 정도 콜레스테롤이 중정도 함유된 식품을 선택한다.</span>
									<ul class="small  mt5">
										<li class="i_b_t7">우유는 저지방 우유나 탈지분유를 섭취한다.</li>
										<li class="i_b_t7">콜레스테롤 함유가 중정도이하인 식품(살코기, 생선류)은 하루 150～200g이하로 섭취한다.</li>
										<li class="i_b_t7">유제품은 저지방 우유 또는 탈지우유, 두유로 섭취한다.</li>
										<li class="i_b_t7">간식은 콜레스테롤이 없는 식품 중에서 선택한다.</li>
										<li class="i_b_t7">포화지방산 섭취를 줄인다.</li>
									</ul>
								</li>
							</ul>
							<div class="w650 ac mt20"><span class="bold i_b_t6 mb10">콜레스테롤 함유 식품</span>
								<table class="table t3 text ssmall s1  center">
									<colgroup>
										<col width="100">
										<col width="200">
										<col width="200">
										<col width="200">
									</colgroup>
									<thead>
									<tr>
										<th scope="col" class="bold cm">구분</th>
										<th scope="col" class="bold cm">많은 식품</th>
										<th scope="col" class="bold cm">중정도 이하 식품</th>
										<th scope="col" class="bold cm">없는 식품</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td scope="row" class="bgf7 bold">곡류군</td>
										<td></td>
										<td>크림빵, 케이크류</td>
										<td>곡류, 기름기 적은 국수류</td>
									</tr>
									<tr>
										<td scope="row" class="bgf7 bold">어육류군</td>
										<td>간, 곱창 등 내장류, 생선알 및 내장류, 오징어, 전복, 새우, 장어, 미꾸라지, 달걀노른자, 메추리알</td>
										<td>살코기(소, 돼지, 닭 등) ,고등어, 명태 등 생선류, 조개류</td>
										<td>두부, 콩류</td>
									</tr>
									<tr>
										<td scope="row" class="bgf7 bold">채소군</td>
										<td></td>
										<td></td>
										<td>모든 채소류,해조류, 버섯류</td>
									</tr>
									<tr>
										<td scope="row" class="bgf7 bold">과일군</td>
										<td></td>
										<td></td>
										<td>모든 과일류</td>
									</tr>
									<tr>
										<td scope="row" class="bgf7 bold">지방군</td>
										<td>마요네즈, 버터</td>
										<td>쇼트닝</td>
										<td>식물성 기름</td>
									</tr>
									<tr>
										<td scope="row" class="bgf7 bold">우유군</td>
										<td>치즈</td>
										<td>우유(일반우유), 아이스크림</td>
										<td>두유</td>
									</tr>
									</tbody>
								</table>
							</div>
						<h5 class=" title bold t3 i_b_t3 mt40">지방</h5>
							<p class="mt10 pl15">지방이란 일반적으로 말하는 기름에 해당되며, 포화지방산과 불포화지방산으로 구성되어 있다. 포화지방산은 동물성 기름에 많으며 혈중 콜레스테롤을 높이므로 가급적 섭취를 제한해야 한다.<br>
							반면 불포화지방산은 식물성 기름에 많은데 혈중 콜레스테롤을 낮춰주는 효과가 있으므로 포화지방산보다는 불포화지방산을 이용하도록 한다.	<br>
							포화지방산은 동물성 기름에 많으며 혈중 콜레스테롤을 높이므로 가급적 섭취를 제한해야 한다. <br>
								반면 불포화지방산은 식물성 기름에 많은데 혈중 콜레스테롤을 낮춰주는 효과가 있으므로 포화지방산보다는 불포화지방산을 이용하도록 한다.
							</p>
							<ul class="mt10 pl15">
								<li class="i_box_t1"><mark class="bold">포화지방산이란?</mark>
									<ul class="small ">
										<li class="i_b_t7">상온에서 어느 정도 굳기를 나타내어 고체 또는 반고체상태의 기름</li>
										<li class="i_b_t7">포화지방산 함량이 높은 식품의 종류</li>
										<li class="i_b_t7">소기름, 돼지기름 등 모든 동물성 기름과 버터, 쇼트닝, 라아드, 식물성기름 중 코코넛 기름과 팜유 등에 다량 포함되어 있다.</li>
										<li class="i_b_t7">다량 섭취시 혈액 내의 콜레스테롤을 높여 심장질환의 발병율을 높일 수 있다.</li>
									</ul>
								</li>
								<li class="i_box_t1 mt10"><mark class="bold">불포화지방산이란?</mark>
									<ul class="small  mt5">
										<li class="i_b_t7">상온에서 흐름성이 있는 액체 상태의 기름</li>
										<li class="i_b_t7"><mark class="bold ">불포화지방산의 종류는?</mark>
											<span>불포화지방산 단일불포화지방산과 다불포화지방산으로 구분한다. 이중 다불포화지방은
												오메가-3계 지방산과 오메가-6계지방산으로 구분된다. 단일포화지방산에는 올리브기름,
												땅콩기름, 카놀라유 등에 많고 다불포화지방산 중 오메가-3계 지방산은 참치, 고등어 등의
												생선기름, 들깨기름, 콩류에 많으며, 오메가-6계 지방산은 옥수수기름, 면실유, 콩기름,
												해바라기씨 기름 등에 다량 포함되어 있다.
											</span>
										</li>
										<li class="i_b_t7"><mark class="bold ">불포화지방산의 역할은?</mark><br>
											
												· 단일불포화지방산 : 혈액 내의 콜레스테롤치를 낮추어 심장질환의 발병위험을 낮추게 된다.
												&nbsp;&nbsp;· 오메가-6계지방산 : 혈액 내의 콜레스테롤치를 낮추어 심장질환의 발병위험을 낮출 수 있으나, 과량 섭취시는 혈액내의 콜레스테롤을 <br>&nbsp;&nbsp;&nbsp;&nbsp;간으로 전달하여 혈액순환을 좋게 하는 콜레스테롤(일명 HDL-콜레스테롤)을 낮출 수 있다.<br>
												&nbsp;&nbsp;· 오메가-3계지방산 : 혈액 내의 중성지방을 감소시키는 효과가 있어 심장질환의 발병위험을 낮추게 한다. 일주일에 3~4회 정도 생선 <br>&nbsp;&nbsp;&nbsp;&nbsp;1토막씩 섭취하는 것이 도움이 된다.
													오메가-3계지방산을 많이 포함하는 생선은 주로 등푸른 생선으로 고등어, 꽁치, 방어, 연어,<br>&nbsp;&nbsp;&nbsp;&nbsp;삼치, 정어리 등을 들 수 있다.
												<p></p></li>					
									<table class="table t3 text ssmall s1  center">
									<colgroup>
										<col width="200">
										<col width="200">										
									</colgroup>
									<thead>
									<tr>
										<th scope="col" class="bold cm">포화지방산이 많이 포함된 식품</th>
										<th scope="col" class="bold cm">불포화지방산이 많이 포함된 식품</th>										
									</tr>
									</thead>
									<tbody>
									<tr>
										<td scope="row" class="bgf7">돼지고기나 소고기 등의 육류 기름기, 닭껍질, 버터, 마가린, 생크림, 치즈, 소세지, 햄, 베이컨, 초콜릿, 코코넛기름, 기름진 빵이나 과자류</td>
										<td scope="row" class="bgf7">등푸른 생선, 옥수수기름, 콩기름, 들기름, 참기름, 올리브기름</td>		
									</tr>										
									</tbody>
								</table>												
										
									</ul>
								</li>
							</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
