<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양</mark>클리닉</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_tube_feeding.do" class="cm">경관급식</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<%@ include file="inc/tubefeeding.jsp" %>
		
	<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">경관급식의 공급경로</h4><br />
							<h5 class="title bold t3 i_b_t3 mt40">경관급식의 공급경로</h5><br />
								<p class="mt10 pl15">경관급식의 공급 경로는 환자의 상태(특히 흡인 위험의 여부), 그리고 경관 급식이 예상되는 기간 등에 따라 다음과 같이 결정된다.</p>
						<div class="area pr h700 kb_tube_bg mt30 mb3">
							<div>	
								<ul class="text bold s1">
									<li><span class="pa l260 t2 p8 w200 h25 box bw5 bcm center">위장관 기능이 가능한가? </span>
										<ul>
											<li><span class="pa l40 t100 p8 w144 h25 box bw5 bcg center">예</span>
												<ul>
													<li><span class="pa l40 t170 p8 pr9 pl9 w200 h22 box box0 bga1 small center">구강섭취가 필요량의 90%인가?</span>
														<ul>
															<li><span class="pa l40 t240 p8 w152 h22 box box0 bga1 small center">예</span></li>
															<li><span class="pa l286 t240 p8 w152 h22 box box0 bga1 small center">아니오</span>
																<ul>
																	<li><span class="pa l230 t300 p8 pr9 pl9 w260 h22 box bga small center">경관급식 사용예상기간이 4주 이상인가?</span>
																		<ul>
																			<li><span class="pa l60 t370 p8 pr9 pl9 w152 h22 box bga small center">예</span>
																				<ul>
																					<li><span class="pa l40 t430 p4 w200  box small center ca">관조루술<br />(Tube enterostomy)</span>
																						<ul>
																							<li><span class="pa l40 t500 p8 w200 h22 box small center ca">흡인폐렴의 위험이 있는가?</span>
																								<ul>
																									<li><span class="pa l40 t570 p8 w112 h22 box small center ca">예</span>
																										<ul>
																											<li><span class="pa l40 t630 p8 w112 h60 box small center ca">공장조루술<br />(Jejunostomy)</span></li>
																										</ul>
																									</li>
																									<li><span class="pa l200 t570 p8 w112 h22 box small center ca">아니오</span>
																										<ul>
																											<li><span class="pa l200 t630 p8 w112 h60 box small center ca">위조루술<br />(Gastrostomy)</span></li>
																										</ul>
																									</li>
																								</ul>
																							</li>
																						</ul>
																					</li>
																				</ul>	
																			</li>
																			<li><span class="pa l510 t370 p8 pr9 pl9 w152 h22 box bga small center">아니오</span>
																				<ul>
																					<li><span class="pa l490 t430 p4 w200  box small center ca">비장관 급식<br />(Naso enteric Tube enterostomy)</span>
																						<ul>
																							<li><span class="pa l490 t500 p8 w200 h22 box small center ca">흡인폐렴의 위험이 있는가?</span>
																								<ul>
																									<li><span class="pa l410 t570 p8 w112 h22 box small center ca">예</span>
																										<ul>
																											<li><span class="pa l410 t630 p8 w112 h60 box small center ca">비십이지장, 비공장(Nasoduodenal Nasojejunal)</span></li>
																										</ul>
																									</li>
																									<li><span class="pa l570 t570 p8 w112 h22 box small center ca">아니오</span>
																										<ul>
																											<li><span class="pa l570 t630 p8 w112 h60 box small center ca">비위관 경관급식(Nasogastric TF)</li></span></li>
																										</ul>
																									</li>
																								</ul>
																							</li>
																						</ul>
																					</li>
																				</ul>	
																			</li>
																		</ul>
																	</li>
																</ul>	
															</li>
														</ul>
													</li>
												</ul>	
											</li>
											<li><span class="pa l530 t100 p8 w144 h25 box bw5 bcg center">아니오</span>
												<ul>
													<li><span class="pa l530 t170 p8 w152 h22 box box0 bga1 small center">정맥영양</span></li>
												</ul>	
											</li>
										</ul>								
									</li>
								</ul>
							</div>
						</div>
						<div class="big bold cm m20 center">								
							<img src="/images/sub/kb_tube.png" alt="경관급식" />
						</div>
					</div>
		</div>
	</div>
</div>