<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">우리가족</mark>영양관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_family_baby.do" class="cm">우리가족영양관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<%@ include file="inc/family.jsp" %>
		
			<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">유아기</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">유아기란</h5>
								<p class="mt10 pl15">젖을 완전히 뗀 1세경부터 초등학교에 입학하기 전까지 해당하는 시기이다.</p>
							<h5 class="title bold t3 i_b_t3 mt40">유아의 특성</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">1세경부터 초등학교에 입학하기 전까지 해당되는 시기</li>
									<li class="i_box_t1 mt10">두뇌 완성, 신체의 제반 조절기능, 사회 인지능력 발달</li>
									<li class="i_box_t1 mt10">영아기의 급성장 이후 이 시기에 완만한 성장을 함</li>
									<li class="i_box_t1 mt10">또래 집단과의 접촉이 많아져서 자신의 주장과 방식대로 하려는 정서적 특징</li>
									<li class="i_box_t1 mt10">음식에 대한 기호, 식사예절, 위생 습관 등이 형성되는 시기</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">유아의 신체적 특징</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1 mt20">신체적 성장
										<div class="area mt30 mb30">
											<img src="/images/sub/kb_family01.png" alt="소아표준성장도표" />
											<div class="link small ca mt10 mr150 fr">(출처 : 소아표준성장도표 2007년, 대한소아과학회)</div>
										</div>
										<ul class="small ca">
											<li class="i_b_t7">생후 12개월이 되었을 때의 체중은 출생 시의 3배, 신장은 거의 1.5배가 된다.</li>
											<li class="i_b_t7">12개월과 12개월 사이에는 성장속도가 많이 감소해서 평균 신장은 약 10cm 증가하고, 평균체중은 약 25% 증가하며, 그 이후에는 성장속도가 느려진다.</li>
											<li class="i_b_t7">2-5세 사이에는 1년에 약 2kg씩 체중이 증가하며, 약 4세에 출생 시 신장의 2배가 된다. </li>
											<li class="i_b_t7">6세에는 체격에 성별의 차이가 나타나서 6세의 남자아이는 같은 연령의 여자아이보다 약간 더 크고 무겁다.</li>
											<li class="i_b_t7">성장패턴을 한 눈에 파악하기 위해 소아표준성장도표를 이용한다.</li>
										</ul>
									</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">유아의 영양권장량</h5>
								<div class="w680 ac mt30 mb20"><span class="bold i_b_t6">영양소 섭취기준</span>
									<table class="table t2 mt10 text ssmall s1 ca center">
										<colgroup>
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
											<col width="50" />
										</colgroup>
										<thead>
										<tr>
											<th colspan="10" scope="col" class="bold cm">영양소 섭취기준</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td rowspan="2">연령(세)</td>
											<td rowspan="2">체중(kg)</td>
											<td rowspan="2">신장(cm)</td>
											<td>에너지(kcal)</td>
											<td>식이섬유(g)</td>
											<td colspan="2">단백질(g)</td>
											<td>수분(ml)</td>
											<td>칼슘(mg)</td>
											<td>철(mg)</td>
										</tr>
										<tr>
											<td>EAR</td>
											<td>AI</td>
											<td>EAR</td>
											<td>RI</td>
											<td>AI</td>
											<td>RI</td>
											<td>RI</td>
										</tr>
										<tr>
											<td>1~2</td>
											<td>12.2</td>
											<td>86.1</td>
											<td>1,000</td>
											<td>10</td>
											<td>12</td>
											<td>15 </td>
											<td>1,100</td>
											<td>500</td>
											<td>6</td>
										</tr>
										<tr>
											<td>3~5</td>
											<td>17.2</td>
											<td>107</td>
											<td>1,400</td>
											<td>15</td>
											<td>15</td>
											<td>20</td>
											<td>1,400</td>
											<td>600</td>
											<td>7</td>
										</tr>
										</tbody>
									</table>
									<span class="ssmall ca">EAR: 평균필요량, AI: 충분섭취량, RI: 권장섭취량, UL: 상한섭취량</span>
									<span class="ssmall ca fr">(출처 : 한국인영양섭취기준, 한국영양학회(2010))</span>
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">유아기의 영양관리</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">유아 간식의 양은 하루 에너지 필요량의 10-15%가 적합하다.</li>
									<li class="i_box_t1 mt10">유아에게 억지로 먹도록 강요하지 않는다.</li>
									<li class="i_box_t1 mt10">싫어하는 음식을 먹는 대가를 다른 음식으로 보상하지 않는다.</li>
									<li class="i_box_t1 mt10">음식을 기분전환이나 달래기 위한 수단, 다른 행동에 대한 보상으로 제공하지 않는다.</li>
									<li class="i_box_t1 mt10">유아에게 새로운 음식을 소개할 때에는 한 입은 최소한 먹도록 한다.<br/>특히 배가 고픈 시간에 새로운 음식을 소개한다. </li>
									<li class="i_box_t1 mt10">처음에 많은 양을 주지 말고 일상적으로 먹는 양보다 적게 주고, 더 요구하면 다시 더 주도록 한다.</li>
									<li class="i_box_t1 mt10">새로운 음식을 받아들이는 데는 같이 먹는 사람들의 역할이 중요하다.</li>
									<li class="i_box_t1 mt10">유아의 식품선택에는 부모의 음식 기호가 큰 영향을 미친다.</li>
									<li class="i_box_t1 mt10">새로운 음식을 만드는 데에 유아가 참여하도록 한다.</li>
									<li class="i_box_t1 mt10">유아는 음식의 온도, 맛, 질감, 외관에 대해 매우 까다롭다.</li>
									<li class="i_box_t1 mt10">유아가 채소 먹기를 싫어하면 좋아하는 음식과 섞거나 또는 향이 좋고 영양가가 있는 양념을 해서 제공한다.</li>
								</ul>
							<h5 class="title bold t3 i_b_t3 mt40">유아의 식사구성안</h5>
								<div class="area mt30">
									<img src="/images/sub/kb_family02.png" alt="유아의 식사구성안" />
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">영유아의 식생활지침</h5>
								<ul class="mt10 pl15">
									<li class="i_box_t1">생후 6개월까지는 반드시 모유를 먹이자.</li>
									<li class="i_box_t1 mt10">이유보충식은 성장단계에 맞추어 먹이자.</li>
									<li class="i_box_t1 mt10">유아의 성장과 식욕에 따라 알맞게 먹이자.</li>
									<li class="i_box_t1 mt10">곡류, 과일, 채소, 생선, 고기, 유제품 등 다양한 식품을 먹이자.</li>
								</ul>
					</div>
	</div>
</div>
