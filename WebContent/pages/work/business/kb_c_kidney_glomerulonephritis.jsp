<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신장</mark>질환관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_kidney.do" class="cm">신장질환관리</a></li>
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
				<%@include file="inc/kidney.jsp" %>
				
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">사구체신염</h4><br>
							<h5 class="title bold t3 i_b_t3 mt40">급성 사구체신염</h5>
								<p class="mt10 pl15">급성 사구체신염은 주로 세균이나 바이러스 감염으로 인하여 발병하며 혈뇨, 부종, 고혈압, 요독증의 증상이 나타난다.
								주로 소아에게 많이 발병되나 성인에서도 발병이 되고 이 중 약 10%정도는 완전히 치료되지 않고 만성사구체 신염으로 이행하여 만성신부전증을 
								유발시킬 수 있으므로 조기 발견하여 치료를 하는 것이 중요하다.
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">식사요법의 원칙</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">단백질은 환자의 상태에 따라 조절한다.
										<span class="small ">신장기능의 저하가 없는 경우에는 한국인 영양섭취기준의 성인의 1일 권장섭취량(Recommended Intake)인 0.83g/kg이 적절하다. 
										신장기능이 저하되어 있는 경우에는 신장기능 정도에 따라 30-40g/1일정도의 제한이 필요하나, 신장기능 회복정도에 따라 단백질 섭취량을 
										정상 성인의 1일 권장섭취량까지 점차 늘려 섭취하도록 한다.
										</span>
									</li>
									<li class="i_box_t1 mt10">열량을 충분히 섭취한다.
										<span class="small">단백질을 제한할 경우 열량이 부족될 수 있으므로 당질 및 식물성 기름 등을 사용하여 1일 필요열량을 충분히 섭취하도록 한다.</span>
									</li>
									<li class="i_box_t1 mt10">염분을 제한한다.
										<span class="small ">발병 후 초기에는 부종 및 고혈압의 악화를 방지하기 위해 염분섭취를 제한한다. 
										염분제한은 환자의 상태에 따라 정해지나 부종과 고혈압이 심한 환자의 경우에는 하루 소금5g(나트륨 2000mg)이하로 섭취를 줄이도록 한다.
										</span>
										<a href="#" class="btn t2 mt10">염분제한 시 고려사항 보기</a>
									</li>
									<li class="i_box_t1 mt10">증상에 따라 수분을 제한한다.
										<span class="small ">일반적으로 수분량을 제한하지는 않으나 부종 및 핍뇨(1일 소변량이 500ml 이하)가 있는 경우에는 섭취하는 수분량을
										전일 소변량 + 500ml로 제한한다.
										</span>
										<div class="box t2 mt10 p20 small">
											<p class="bold cm mb10">우리가 섭취하는 수분의 종류로는</p>
											<ul>
												<li>① 실온에서 액체 상태인 것(음료수, 우유, 국국물, 얼음, 아이스크림 등)</li>
												<li>② 과일이나 채소 등 식품자체에 들어있는 수분</li>
												<li>③ 식품이 체내에서 대사되면서 생성되는 수분 등 이다.</li>
												<li>②와 ③을 합한 수분의 양은 체내 불감수분 손실량(대변, 호흡, 땀 등으로 손실되는 수분량)과 거의 일치하므로 
												허용수분 섭취량(전일소변량+500ml)은 상온에서 액체상태인 수분으로 계산하면 된다.
													<span class="ssmall cm"> 예) 전일 소변량이 300cc 인 경우 허용수분섭취량은 800cc 가 되므로 이때 마실 수 있는 수분으로는
													우유 1컵 200cc, 약먹을 때 물 1회 100cc×3회(300cc), 국국물 1회 100cc×3회(300cc)이다. 
													</span>
												</li>
											</ul>
										</div>
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">만성사구체 신염</h5>
								<p class="mt10 pl15">만성 사구체 신염은 급성 사구체신염이 완전히 치유되지 않고 만성 사구체 신염으로 진행된 경우와 분명하게 발병시기를 모르고 
								단백뇨, 혈뇨, 고혈압, 부종 등의 신염 증상이 1년 이상 지속되는 경우가 있다.
								</p>
								<div class="mt10 pl15"><span class="title bold i_b_t6 cb mb10">만성신염은 증상에 따라 4가지로 다음과 같이 분류될 수 있다.</span><br>
									
										① 단백질이 소변으로 1일 1g 이하로 빠져 나오고, 혈압이 정상이며 자각증상이 없는 경우
										<li>② 혈뇨, 단백뇨와 함께 혈압이 상승되고, 혈압강하제를 사용해도 혈압이 잘 조절되지 않는 경우</li>
										<li>③ 단백질이 소변으로 1일 3g 이상 빠져 나오고 혈액 중의 단백질도 저하되며, 부종이 심하고, 고혈압이 합병된 경우</li>
										<li>④ 신장의 기능이 약 50%정도로 저하되고 만성신부전의 증상이 나타나는 경우</li>
									
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">치료방법</h5>
								<p class="mt10 pl15">만성사구체 신염의 치료방법으로는 안정요법, 식사요법, 약물요법이 있으며, 병의 상태에 따라 치료방법이 달라진다.</p>
								<p class="mt10 pl15"><mark class="bold">증상 분류 중 ①</mark> 에 해당하는 경우에는 테니스 및 등산 등과 같은 심한 운동이나 과로는 피하는 것이 좋지만,
								그외 일상생활을 규제할 필요는 없고 부종 및 고혈압이 있거나 신장기능이 떨어진 경우는 식사요법이 필요하나, 증상이 없는 잠재형의 경우에는 특별한 식사요법이 필요하지 않다. </p>
								<p class="mt10 pl15"><mark class="bold">증상 분류 중 ②,③,④</mark>  에 해당하는 신염의 경우 치료방법으로는 단백뇨 및 혈뇨를 줄이기 위한 치료제, 혈압강하제, 부종을 개선시키기 위한 이뇨제 등을 사용하지만 실제적으로 
								만성사구체 신염을 근본적으로 치료할 수2015-07-07 있는 약이 없기 때문에 식사요법이 가장 유력한 치료방법 중의 하나이다.</p>
								<p class="mt10 pl15">만성사구체 신염이라고 진단을 받으면 바로 염분 및 수분을 제한하는 등 식사요법을 실시하는 경우가 있는데, 환자의 상태에 따라서는 특별한 식사요법을 필요로 하지 않는 경우도 있다.</p>
							<h5 class="title bold t3 i_b_t3 mt40">식사요법의 원칙</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">단백질 섭취량을 환자의 신장기능에 따라 적절하게 조절한다.
										<div class="w700 ac mt20 mb20">
											<table class="table t2 text ssmall s1 ca center">
												<colgroup>
													<col width="200">
													<col width="250">
													<col width="250">
												</colgroup>
												<tbody>
												<tr>
													<td scope="row" class="bgs_2 bold cm">단백질 섭취량<br>60-70g/1일</td>
													<td rowspan="2" class="left">
														<ul>
															<li>고기 40g(탁구공 1개 크기</li>
															<li>생선 40g(소 1토막)</li>
															<li>두부 80g(1/6모)</li>
															<li>계란 50g(1개)</li>
														</ul>
													</td>
													<td class="left">한끼에 1-2가지 선택하여 섭취</td>
												</tr>
												<tr>
													<td scope="row" class="bgs_2 bold ">단백질 섭취량<br>30-40g/1일</td>
													<td class="left">하루 1-2가지 선택하여 섭취</td>
												</tr>
												</tbody>
											</table>
											<span class="ssmall ">※ 신장기능이 "정상"인 경우에는 성인의 영양권장량0.83g/kg + 소변으로 배설되는 단백질량 정도 섭취하는 것이 적절하나, 
											신장기능이 "정상 이하"로 떨어진 경우에는 신장기능에 따라 단백질을 제한한다(1일 30-40g).</span>
										</div>
									</li>
									<li class="i_box_t1 mt10">열량을 충분히 섭취한다.<br>

										<p class="mt10">정상적인 체중을 유지하고, 활력과 건강을 유지하기 위해 정상 성인에 필요한 만큼 섭취가 권장된다. 
										그러나 신장기능이 정상이하여서 단백질을 제한할 경우에는 체내 단백질이 분해되는 것을 막고 식사로 섭취한 단백질이 열량원으로 사용되는 것을 막기 위해 충분한 열량의 섭취가 권장된다.</p><p>
										
									</p></li>
									<li class="i_box_t1 mt10">증상에 따라 염분을 제한한다.<br>
										<p class="mt10">부종이 있거나 혈압이 높을 경우에는 하루 소금 5g(나트륨 2000mg)이하로 섭취를 줄이도록 한다.<br>
										<a href="#" class="btn t2 mt10">염분제한 시 고려사항 보기</a>
									</p></li>
									<li class="i_box_t1 mt10">증상에 따라 수분을 제한한다.<br>
									<p class="mt10">일반적으로 수분량을 제한하지는 않으나 부종 및 핍뇨(1일 소변량이 500ml 이하)가 있는 경우에는 섭취하는 수분량을 전일 소변량 + 500ml로 제한한다.
										</p><div class="mt10 mb10 pl15 small"><span class="bold">우리가 섭취하는 수분의 종류로는</span>
											<ul>
												&nbsp;① 실온에서 액체 상태인 것(음료수, 우유, 국국물, 얼음, 아이스크림 등)<br>
												&nbsp;② 과일이나 채소 등 식품자체에 들어있는 수분 <br>
												&nbsp;③ 식품이 체내에서 대사되면서 생성되는 수분 등 이다.<br>
											</ul>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;②와 ③을 합한 수분의 양은 체내 불감수분 손실량(대변, 호흡, 땀 등으로 손실되는 수분량)과 거의 일치하므로 허용수분 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;섭취량(전일소변량+500ml)은 
										상온에서 액체상태인 수분으로 계산하면 된다.
										<div class="box bga r5 m10 p10 ssmall ">예) 전일 소변량이 300cc 인 경우 (두 번 들어감) <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 허용수분섭취량은 800cc 가 되므로 이때 마실 수 있는 수분으로는 우유 1컵 200cc,   약먹을 때 물 1회 100cc×3회(300cc), 국국물 1회 <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100cc×3회(300cc)이다.</div>
									</li>
								</ul>
					</div>
			</c:otherwise>
    	</c:choose>	
					
	</div>
</div>
