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
						<h4 class="title bold cm t2 i_b_t2 mt50">심장수술</h4><br />
							<h5 class=" title bold t3 i_b_t3 mt40">심장수술</h5>
								<p class="mt10 pl15">
								심장수술에는 관상동맥 우회로이식술(coronary artery bypass grafts:CABG), 죽종절제술(atherectomy), 인공판막대체술, 선천성 심장질환수술 등이 있다.
								</p>
							<h5 class=" title bold t3 i_b_t3 mt40">심장수술 받은 환자의 식사요법</h5>
								<p class="mt10 pl15">심장 수술을 받은 환자에 대한 영양관리는 심부전을 예방하면서 조속한 상처 회복을 도모하고 정상체중을 유지하는데 목적이 있다. 
								회복기 이후 관상동맥질환에 대한 위험인자가 높은 환자의 경우에는 고지혈증을 예방하기 위한 식사 조절을 유지하도록 한다.
								</p>
								<div class="mt10 pl15"><span class="title bold i_b_t6 cb mb10">수술직후 식사요법</span>
									<ul>
										<li class="i_box_t1">염분 섭취를 줄인다.</li>
										<li class="i_box_t1 mt5">복부 팽만감과 호흡곤란을 일으킬 수 있으므로 소량씩 잦은 식사를 한다.</li>
										<li class="i_box_t1 mt5">상처회복을 위해 적당량의 단백질과 열량을 섭취한다.</li>
										<li class="i_box_t1 mt5">수분 섭취량과 배설량을 측정하여 균형을 유지하도록 한다.</li>
									</ul>
								</div>
								<div class="mt15 pl15"><span class="title bold i_b_t6 cb mb10">퇴원 후 식사 요법</span>
									<ul>
										<li class="i_box_t1">정상 체중을 유지한다.</li>
										<li class="i_box_t1 mt5">관상동맥질환에 대한 위험인자가 높은 환자의 경우, 콜레스테롤 및 포화지방산 섭취를 줄인다.</li>
										<li class="i_box_t1 mt5">염분 섭취를 줄인다.</li>
										<li class="i_box_t1 mt5">쿠마딘 및 와파린등 항혈액응고제 복용시 비타민 K를 과다 섭취하지 않도록 한다.</li>
									</ul>
								</div>
							<h5 class=" title bold t3 i_b_t3 mt40">염분제한시 고려사항</h5>
								<p class="mt10 pl15">와파린 나트륨, 쿠마딘 등의 항혈액응고제를 사용하는 경우에는 비타민 K가 다량 함유된 식품을  과다하게 섭취하지 않도록 하는 것이 중요하다.
								비타민 K는 녹황색 채소와 기름에 많으나 이들 중 특정식품을 제한하는 것보다 평소 식사 섭취량을 유지하면서 녹즙과 같은 과량의 농축 형태의 즙류나 
								건강식품을 장기간 섭취하지 않도록 하는 것이 더 효과적이다. 또한 고용량의 비타민 C와 E, 그리고 비타민K가 함유된 영양제는 복용하지 않도록 한다.
								</p>
								<div class="box t2 mt10 ml15 p20 small">
									<p class="bold cm">비타민 K 함량이 높은 식품<br />
										<span class="text ssmall cm mt5">시금치, 상추, 배추, 양배추, 케일, 브로콜리 같은 푸른잎 채소와 콩기름 등의 기름</span>
									</p>
								</div>
					</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>
